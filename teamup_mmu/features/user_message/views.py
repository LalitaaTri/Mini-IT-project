from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
from datetime import timedelta, datetime

async def index(request, another_user_id):
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
                        user_x = min(value[0]['user_id'], another_user_id)
                        user_y = max(value[0]['user_id'], another_user_id)
                        chats = await conn.fetch("SELECT * FROM chats WHERE user_x_id=$1 AND user_y_id=$2",user_x,user_y)
                        processed_messages = []
                        if len(chats):
                            messages = await conn.fetch("SELECT * FROM messages WHERE chat_id=$1",chats[0]['id'])
                            for message in messages:
                                processed_messages.append({
                                    'sender_id': 'You' if message['sender_id'] == value[0]['user_id'] else await conn.fetchval("SELECT email FROM users WHERE id=$1", message['sender_id']),
                                    'content': message['content'],
                                    'created_at': message['created_at']
                                })
                        context = {
                            'chats': chats,
                            'another_user_id': another_user_id,
                            'another_user_email': await conn.fetchval("SELECT email FROM users WHERE id=$1", another_user_id),
                            'messages': processed_messages
                        }
                        return render(request, 'user_message/templates/index.html', {'context':context})
    return HttpResponse("Invalid request", status=400)

async def message(request):
    if request.method == "POST":
        another_user_id = int(request.POST.get('another_user_id'))
        content = request.POST.get('content')
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
                        user_x = min(value[0]['user_id'], another_user_id)
                        user_y = max(value[0]['user_id'], another_user_id)
                        chats = await conn.fetch("SELECT * FROM chats WHERE user_x_id=$1 AND user_y_id=$2",user_x,user_y)
                        if not chats:
                            id = await conn.fetchval("INSERT INTO chats(id,user_x_id,user_y_id) VALUES(DEFAULT,$1,$2) RETURNING id",user_x,user_y)
                        else:
                            id = chats[0]['id']
                        await conn.execute("INSERT INTO messages(id,chat_id,sender_id,content) VALUES(DEFAULT,$1,$2,$3)",id,value[0]['user_id'],content)
                        return HttpResponse("Message sent successfully.", status=200)
    return HttpResponse("Invalid request", status=400)