from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
from datetime import timedelta, datetime

async def index(request, iter=0):
    token = request.COOKIES.get('access_token')
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        value = await conn.fetch("SELECT * FROM sessions WHERE token=$1", token)
    status = "Not logged in"
    passed_login_check = False
    if value and value[0]['is_active']:
        if value[0]['created_at'] + timedelta(hours=1) > datetime.now():
            async with pool.acquire() as conn:
                email_verified = await conn.fetchval("SELECT email_verified FROM users WHERE id=$1",value[0]['user_id'])
                if email_verified:
                    email = await conn.fetch("SELECT email FROM users WHERE id=$1", value[0]['user_id'])
                    status = "Logged in as {}".format(email[0]['email'])
                    passed_login_check = True
    if not passed_login_check:
        print("Redirecting to index")
        return redirect("/")
    async with pool.acquire() as conn:
        other_users = await conn.fetch("SELECT email FROM users WHERE id!=$1",value[0]['user_id'])
    like_status = 'Not liked yet'
    if len(other_users):
        iter=(iter+1)%len(other_users)
        async with pool.acquire() as conn:
            pass
    context = {
        'user_obj': other_users[iter],
        'next_iter': iter,
        'like_status': like_status
    }
    if request.headers.get('HX-Request'):
        return render(request, 'matching_view/templates/card.html',{'status':status,'context': context})
    return render(request, 'matching_view/templates/index.html',{'status':status,'context': context})

async def like(request):
    if request.method == "POST":
        liked_user_id = request.POST.get('liked_user_id')
        token = request.COOKIES.get('access_token')
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            value = await conn.fetch("SELECT * FROM sessions WHERE token=$1", token)
        if value and value[0]['is_active']:
            if value[0]['created_at'] + timedelta(hours=1) > datetime.now():
                async with pool.acquire() as conn:
                    email_verified = await conn.fetchval("SELECT email_verified FROM users WHERE id=$1",value[0]['user_id'])
                    if email_verified:
                        likes = await conn.fetch("SELECT * FROM likes WHERE user_id=$1 AND liked_user_id=$2",value[0]['user_id'],liked_user_id)
                        if not likes:
                            await conn.execute("INSERT INTO likes(id,user_id,liked_user_id) VALUES(DEFAULT,$1,$2)",value[0]['user_id'],liked_user_id)
                            return render(request, 'matching_view/templates/like_status.html')
    return HttpResponse("Invalid request", status=400)