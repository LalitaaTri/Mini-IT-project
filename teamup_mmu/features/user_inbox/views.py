from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
from datetime import timedelta, datetime

async def index(request):
    if request.method == "GET":
        token = request.COOKIES.get('access_token')
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            value = await conn.fetch("SELECT * FROM sessions WHERE token=$1", token)
        if value and value[0]['is_active']:
            if value[0]['created_at'] + timedelta(hours=1) > datetime.now():
                async with pool.acquire() as conn:
                    email_verified = await conn.fetchval("SELECT email_verified FROM users WHERE id=$1",value[0]['user_id'])
                    account_inactive = await conn.fetchval("SELECT inactive FROM users WHERE id=$1",value[0]['user_id'])
                    if email_verified and not account_inactive:
                        l = await conn.fetch("SELECT * FROM users WHERE id!=$1",value[0]['user_id'])
                        chats_l = []
                        for another_user in l:
                            another_user_id = another_user['id']
                            user_x = min(value[0]['user_id'], another_user_id)
                            user_y = max(value[0]['user_id'], another_user_id)
                            chats = await conn.fetch("SELECT * FROM chats WHERE user_x_id=$1 AND user_y_id=$2",user_x,user_y)
                            last_message = {}
                            if len(chats):
                                messages = await conn.fetch("SELECT * FROM messages WHERE chat_id=$1",chats[0]['id'])
                                for message in messages:
                                    if last_message == {} or last_message['created_at'] < message['created_at']:
                                        last_message = {
                                            'sender_id': 'You' if message['sender_id'] == value[0]['user_id'] else await conn.fetchval("SELECT email FROM users WHERE id=$1", message['sender_id']),
                                            'content': message['content'],
                                            'created_at': message['created_at']
                                        }
                                chats_l.append({
                                    'chat_id': chats[0]['id'],
                                    'another_user_id': another_user_id,
                                    'another_user_email': another_user['email'],
                                    'last_message': last_message
                                })
                        context = {
                            'chats_l': chats_l
                        }
                        return render(request, 'user_inbox/templates/index.html', {'context':context})
    return HttpResponse("Invalid request", status=400)