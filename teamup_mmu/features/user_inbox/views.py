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
        async with pool.acquire() as conn:
            # 1. FETCH GROUP INVITES (New Feature)
            # We join the groups and profiles tables to get readable names instead of just IDs
            invites_records = await conn.fetch("""
                SELECT 
                    gi.id as invite_id,
                    g.id as group_id,
                    g.name as group_name,
                    p.username as sender_name,
                    u.email as sender_email,
                    gi.created_at
                FROM group_invites gi
                JOIN groups g ON gi.group_id = g.id
                JOIN users u ON gi.sender_id = u.id
                LEFT JOIN profiles p ON u.id = p.id
                WHERE gi.receiver_id = $1 AND gi.status = 'pending'
                ORDER BY gi.created_at DESC
            """, id)
            
            # Convert records to a list of dicts for the template
            invites_l = [dict(record) for record in invites_records]

            # 2. FETCH CHATS (Your existing logic)
            l = await conn.fetch("SELECT * FROM users WHERE id!=$1 AND inactive=False", id)
            chats_l = []
            
            for another_user in l:
                another_user_id = another_user['id']
                user_x = min(id, another_user_id)
                user_y = max(id, another_user_id)
                
                chats = await conn.fetch("SELECT * FROM chats WHERE user_x_id=$1 AND user_y_id=$2", user_x, user_y)
                last_message = {}
                
                if len(chats):
                    messages = await conn.fetch("SELECT * FROM messages WHERE chat_id=$1", chats[0]['id'])
                    for message in messages:
                        if last_message == {} or last_message['created_at'] < message['created_at']:
                            last_message = {
                                'sender_id': 'You' if message['sender_id'] == id else await conn.fetchval("SELECT email FROM users WHERE id=$1", message['sender_id']),
                                'content': message['content'],
                                'created_at': message['created_at']
                            }
                    chats_l.append({
                        'chat_id': chats[0]['id'],
                        'another_user_id': another_user_id,
                        'another_user_email': another_user['email'],
                        'last_message': last_message
                    })

            # 3. PASS TO CONTEXT
            context = {
                'invites_l': invites_l,
                'chats_l': chats_l
            }
            return render(request, 'user_inbox/templates/index.html', {'context': context})
            
    return HttpResponse("Invalid request", status=400)