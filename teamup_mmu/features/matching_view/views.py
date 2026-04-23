from ..access_check.views import *

async def index(request, iter=0):
    pool = await Database.get_pool()
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        print("Redirecting to index")
        return redirect("/")
    async with pool.acquire() as conn:
        other_users = await conn.fetch("SELECT * FROM users WHERE id!=$1 AND email_verified=$2 AND inactive=$3",id, True, False)
    like_status = 'Not liked yet'
    if len(other_users):
        iter=(iter+1)%len(other_users)
        async with pool.acquire() as conn:
            likes = await conn.fetch("SELECT * FROM likes WHERE user_id=$1 AND liked_user_id=$2",id,other_users[iter]['id'])
            if likes:
                like_status = 'Liked'
    context = {
        'user_obj': [] if not other_users else other_users[iter],
        'next_iter': iter,
        'like_status': like_status
    }
    if request.headers.get('HX-Request'):
        return render(request, 'matching_view/templates/card.html',{'status':status,'context': context})
    return render(request, 'matching_view/templates/index.html',{'status':status,'context': context})

async def like(request):
    if request.method == "POST":
        liked_user_id = int(request.POST.get('liked_user_id'))
        pool = await Database.get_pool()
        passed_login_check, status, email, id = await access_check(request)
        if not passed_login_check:
            print("Redirecting to index")
            return redirect("/")
        async with pool.acquire() as conn:
            likes = await conn.fetch("SELECT * FROM likes WHERE user_id=$1 AND liked_user_id=$2",id,liked_user_id)
            if not likes:
                await conn.execute("INSERT INTO likes(id,user_id,liked_user_id) VALUES(DEFAULT,$1,$2)",id,liked_user_id)
                return render(request, 'matching_view/templates/like_status.html')
    return HttpResponse("Invalid request", status=400)