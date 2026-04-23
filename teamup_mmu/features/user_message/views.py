from ..user_access_check.views import *

async def index(request, another_user_id):
    if request.method == "GET":
        pool = await Database.get_pool()
        passed_login_check, status, email, id = await access_check(request)
        if not passed_login_check:
            print("Redirecting to index")
            return redirect("/")
        async with pool.acquire() as conn:
            user_x = min(id, another_user_id)
            user_y = max(id, another_user_id)
            chats = await conn.fetch("SELECT * FROM chats WHERE user_x_id=$1 AND user_y_id=$2",user_x,user_y)
            processed_messages = []
            if len(chats):
                messages = await conn.fetch("SELECT * FROM messages WHERE chat_id=$1",chats[0]['id'])
                for message in messages:
                    processed_messages.append({
                        'sender_id': 'You' if message['sender_id'] == id else await conn.fetchval("SELECT email FROM users WHERE id=$1", message['sender_id']),
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
        pool = await Database.get_pool()
        passed_login_check, status, email, id = await access_check(request)
        if not passed_login_check:
            print("Redirecting to index")
            return redirect("/")
        async with pool.acquire() as conn:
            user_x = min(id, another_user_id)
            user_y = max(id, another_user_id)
            chats = await conn.fetch("SELECT * FROM chats WHERE user_x_id=$1 AND user_y_id=$2",user_x,user_y)
            if not chats:
                chat_id = await conn.fetchval("INSERT INTO chats(id,user_x_id,user_y_id) VALUES(DEFAULT,$1,$2) RETURNING id",user_x,user_y)
            else:
                chat_id = chats[0]['id']
            await conn.execute("INSERT INTO messages(id,chat_id,sender_id,content) VALUES(DEFAULT,$1,$2,$3)",chat_id,id,content)
            return HttpResponse("Message sent successfully.", status=200)
    return HttpResponse("Invalid request", status=400)