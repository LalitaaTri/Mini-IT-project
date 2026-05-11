from ..user_access_check.views import *

async def index(request):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
      print("Redirecting to index")
      return redirect("/")
    if request.method == "GET":
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            l = await conn.fetch("SELECT * FROM users WHERE id!=$1 AND inactive=False",id)
            chats_l = []
            for another_user in l:
                another_user_id = another_user['id']
                user_x = min(id, another_user_id)
                user_y = max(id, another_user_id)
                chats = await conn.fetch("SELECT * FROM chats WHERE user_x_id=$1 AND user_y_id=$2",user_x,user_y)
                last_message = {}
                if len(chats):
                    messages = await conn.fetch("SELECT * FROM messages WHERE chat_id=$1",chats[0]['id'])
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
            context = {
                'chats_l': chats_l
            }
            return render(request, 'user_inbox/templates/index.html', {'context':context})
    return HttpResponse("Invalid request", status=400)