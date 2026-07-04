from ..user_access_check.views import *
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

async def index(request):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        print("Redirecting to index")
        return redirect("/")
        
    if request.method == "GET":
        pool = await Database.get_pool()
        chat_with = request.GET.get('chat_with')
        
        async with pool.acquire() as conn:
            # 1. FETCH GROUP INVITES
            invites_records = await conn.fetch("""
                SELECT 
                    gi.id as invite_id,
                    g.id as group_id,
                    g.name as group_name,
                    c.course_code,
                    c.course_name,
                    p.username as sender_name,
                    u.email as sender_email,
                    gi.created_at
                FROM group_invites gi
                JOIN groups g ON gi.group_id = g.id
                LEFT JOIN classes c ON g.class_id = c.id
                JOIN users u ON gi.sender_id = u.id
                LEFT JOIN profiles p ON u.id = p.id
                WHERE gi.receiver_id = $1 AND gi.status = 'pending'
                ORDER BY gi.created_at DESC
            """, id)
            invites_l = [dict(record) for record in invites_records]

            # 2. FETCH JOIN REQUESTS (Changed gr.student_id to gr.sender_id)
            requests_records = await conn.fetch("""
                SELECT 
                    gr.id as request_id,
                    g.id as group_id,
                    g.name as group_name,
                    c.course_code,
                    c.course_name,
                    p.username as student_name,
                    u.email as student_email,
                    gr.created_at
                FROM group_requests gr
                JOIN groups g ON gr.group_id = g.id
                LEFT JOIN classes c ON g.class_id = c.id
                JOIN users u ON gr.sender_id = u.id 
                LEFT JOIN profiles p ON u.id = p.id
                WHERE g.leader_id = $1 AND gr.status = 'pending'
                ORDER BY gr.created_at DESC
            """, id)
            requests_l = [dict(record) for record in requests_records]

            # 3. FETCH OUTGOING INVITES
            outgoing_invites_records = await conn.fetch("""
                SELECT 
                    gi.id as invite_id,
                    g.id as group_id,
                    g.name as group_name,
                    c.course_code,
                    c.course_name,
                    p.username as receiver_name,
                    u.email as receiver_email,
                    gi.created_at
                FROM group_invites gi
                JOIN groups g ON gi.group_id = g.id
                LEFT JOIN classes c ON g.class_id = c.id
                JOIN users u ON gi.receiver_id = u.id
                LEFT JOIN profiles p ON u.id = p.id
                WHERE gi.sender_id = $1 AND gi.status = 'pending'
                ORDER BY gi.created_at DESC
            """, id)
            outgoing_invites_l = [dict(record) for record in outgoing_invites_records]

            # 4. FETCH OUTGOING REQUESTS (Changed gr.student_id to gr.sender_id)
            outgoing_requests_records = await conn.fetch("""
                SELECT 
                    gr.id as request_id,
                    g.id as group_id,
                    g.name as group_name,
                    c.course_code,
                    c.course_name,
                    p.username as leader_name,
                    u.email as leader_email,
                    gr.created_at
                FROM group_requests gr
                JOIN groups g ON gr.group_id = g.id
                LEFT JOIN classes c ON g.class_id = c.id
                JOIN users u ON g.leader_id = u.id
                LEFT JOIN profiles p ON u.id = p.id
                WHERE gr.sender_id = $1 AND gr.status = 'pending'
                ORDER BY gr.created_at DESC
            """, id)
            outgoing_requests_l = [dict(record) for record in outgoing_requests_records]

            # --- OPTIMIZED CHATS FETCH (Retained from HEAD) ---
            chats_records = await conn.fetch("""
                SELECT c.id as chat_id, u.id as another_user_id, u.email as another_user_email
                FROM chats c
                JOIN users u ON (u.id = c.user_x_id OR u.id = c.user_y_id) AND u.id != $1
                WHERE c.user_x_id = $1 OR c.user_y_id = $1
            """, id)
            
            chats_l = []
            found_chat_with = False
            
            for c in chats_records:
                if str(c['another_user_id']) == str(chat_with):
                    found_chat_with = True
                    
                last_msg = await conn.fetchrow("SELECT sender_id, content, created_at FROM messages WHERE chat_id=$1 ORDER BY created_at DESC LIMIT 1", c['chat_id'])
                
                last_message = None
                if last_msg:
                    last_message = {
                        'sender_id': 'You' if last_msg['sender_id'] == id else c['another_user_email'],
                        'content': last_msg['content'],
                        'created_at': last_msg['created_at']
                    }
                    
                chats_l.append({
                    'chat_id': c['chat_id'],
                    'another_user_id': c['another_user_id'],
                    'another_user_email': c['another_user_email'],
                    'last_message': last_message
                })
            
            # --- THE MAGIC INJECTION ---
            if chat_with and not found_chat_with:
                target_email = await conn.fetchval("SELECT email FROM users WHERE id=$1", int(chat_with))
                if target_email:
                    chats_l.insert(0, {
                        'chat_id': None,
                        'another_user_id': int(chat_with),
                        'another_user_email': target_email,
                        'last_message': None
                    })

            chats_l.sort(key=lambda x: x['last_message']['created_at'] if x['last_message'] else '9999', reverse=True)

            context = {
                'invites_l': invites_l,
                'requests_l': requests_l,
                'outgoing_invites_l': outgoing_invites_l,
                'outgoing_requests_l': outgoing_requests_l,
                'chats_l': chats_l,
                'chat_with': chat_with
            }
            return render(request, 'user_inbox/templates/index.html', {'context': context})
            
    return HttpResponse("Invalid request", status=400)


@csrf_exempt
async def inbox_approve_request(request, request_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        req = await conn.fetchrow("SELECT * FROM group_requests WHERE id = $1", request_id)
        if not req:
            return HttpResponse("")

        team_id = req['group_id']
        # Changed student_id to sender_id here as well
        student_id = req.get('sender_id') or req.get('student_id') 

        team = await conn.fetchrow("SELECT * FROM groups WHERE id = $1", team_id)
        if not team:
            return HttpResponse("")
        class_id = team['class_id']

        user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
        is_admin = user_role == 'admin'

        if team['leader_id'] != user_id and not is_admin:
            return HttpResponse("Forbidden", status=403)

        class_details = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
        if class_details and class_details['teams_frozen'] and not is_admin:
            return HttpResponse("<div style='color: red; padding: 0.5rem;'>Teams are frozen for this class.</div>")

        in_team = await conn.fetchval("""
            SELECT COUNT(*) FROM group_members gm
            JOIN groups g ON gm.group_id = g.id
            WHERE gm.user_id = $1 AND g.class_id = $2
        """, student_id, class_id)
        
        if in_team > 0:
            await conn.execute("DELETE FROM group_requests WHERE id = $1", request_id)
            return HttpResponse("")

        current_members = await conn.fetchval("SELECT COUNT(*) FROM group_members WHERE group_id = $1", team_id)
        if current_members >= team['max_members']:
            return HttpResponse("<div style='color: red; padding: 0.5rem;'>Team is already full!</div>")

        await conn.execute("UPDATE group_requests SET status = 'approved' WHERE id = $1", request_id)
        await conn.execute("INSERT INTO group_members (group_id, user_id, joined_at) VALUES ($1, $2, CURRENT_TIMESTAMP)", team_id, student_id)

        # Updated to check sender_id
        await conn.execute("""
            DELETE FROM group_requests 
            WHERE sender_id = $1 AND group_id IN (
                SELECT id FROM groups WHERE class_id = $2
            )
        """, student_id, class_id)

        return HttpResponse("")


@csrf_exempt
async def inbox_decline_request(request, request_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        req = await conn.fetchrow("SELECT * FROM group_requests WHERE id = $1", request_id)
        if not req:
            return HttpResponse("")

        team_id = req['group_id']
        team = await conn.fetchrow("SELECT * FROM groups WHERE id = $1", team_id)
        if not team:
            return HttpResponse("")
        class_id = team['class_id']

        user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
        is_admin = user_role == 'admin'

        if team['leader_id'] != user_id and not is_admin:
            return HttpResponse("Forbidden", status=403)

        await conn.execute("DELETE FROM group_requests WHERE id = $1", request_id)
        return HttpResponse("")


@csrf_exempt
async def cancel_outgoing_invite(request, invite_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        
        await conn.execute("DELETE FROM group_invites WHERE id = $1 AND sender_id = $2", invite_id, session['user_id'])
        return HttpResponse("")


@csrf_exempt
async def cancel_outgoing_request(request, request_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        
        # Changed student_id to sender_id
        await conn.execute("DELETE FROM group_requests WHERE id = $1 AND sender_id = $2", request_id, session['user_id'])
        return HttpResponse("")