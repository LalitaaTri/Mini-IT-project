from ..user_access_check.views import *
from django.shortcuts import render, redirect
from django.http import HttpResponse

async def index(request):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        print("Redirecting to index")
        return redirect("/")
        
    if request.method == "GET":
        pool = await Database.get_pool()
        
        # 1. Check if we were redirected from the Matches page
        chat_with = request.GET.get('chat_with')
        
        async with pool.acquire() as conn:
            
            # Fetch Invites
            invites_records = await conn.fetch("""
                SELECT gi.id as invite_id, g.id as group_id, g.name as group_name, p.username as sender_name, u.email as sender_email, gi.created_at
                FROM group_invites gi
                JOIN groups g ON gi.group_id = g.id
                JOIN users u ON gi.sender_id = u.id
                LEFT JOIN profiles p ON u.id = p.id
                WHERE gi.receiver_id = $1 AND gi.status = 'pending'
                ORDER BY gi.created_at DESC
            """, id)
            invites_l = [dict(record) for record in invites_records]

            # Fetch Requests
            requests_records = await conn.fetch("""
                SELECT gr.id as request_id, g.id as group_id, g.name as group_name, p.username as sender_name, u.email as sender_email, gr.created_at
                FROM group_requests gr
                JOIN groups g ON gr.group_id = g.id
                JOIN users u ON gr.sender_id = u.id
                LEFT JOIN profiles p ON u.id = p.id
                WHERE gr.admin_id = $1 AND gr.status = 'pending'
                ORDER BY gr.created_at DESC
            """, id)
            requests_l = [dict(record) for record in requests_records]

            # --- OPTIMIZED CHATS FETCH ---
            # Now only fetches users you actually share a chat row with
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
                    
                # Fetch only the absolute latest message
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
            # If we redirected here to message a new match, inject them at the top!
            if chat_with and not found_chat_with:
                target_email = await conn.fetchval("SELECT email FROM users WHERE id=$1", int(chat_with))
                if target_email:
                    chats_l.insert(0, {
                        'chat_id': None,
                        'another_user_id': int(chat_with),
                        'another_user_email': target_email,
                        'last_message': None
                    })

            # Sort chats by most recent message (putting new un-messaged ones at the top)
            chats_l.sort(key=lambda x: x['last_message']['created_at'] if x['last_message'] else '9999', reverse=True)

            context = {
                'invites_l': invites_l,
                'requests_l': requests_l,
                'chats_l': chats_l,
                'chat_with': chat_with # Send this to the template to auto-trigger the chat
            }
            return render(request, 'user_inbox/templates/index.html', {'context': context})
            
    return HttpResponse("Invalid request", status=400)