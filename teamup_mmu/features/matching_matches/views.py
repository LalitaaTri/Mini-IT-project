from ..user_access_check.views import *

async def index(request):
    passed_login_check, status, email, id = await access_check(request)
    pool = await Database.get_pool()
    if not passed_login_check:
        print("Redirecting to index")
        return redirect("/")
    async with pool.acquire() as conn:
        other_users = await conn.fetch("SELECT * FROM users WHERE id!=$1 AND email_verified=$2 AND inactive=$3",id, True, False)
    matches = []
    for iter in range(len(other_users)):
        async with pool.acquire() as conn:
            like_one_way = await conn.fetch("SELECT * FROM likes WHERE user_id=$1 AND liked_user_id=$2",id,other_users[iter]['id'])
            like_another_way = await conn.fetch("SELECT * FROM likes WHERE user_id=$1 AND liked_user_id=$2",other_users[iter]['id'],id)
            if like_one_way and like_another_way:
                matches.append(other_users[iter])
    context = {
        'matches': matches
    }
    return render(request, 'matching_matches/templates/index.html',{'status':status,'context': context})