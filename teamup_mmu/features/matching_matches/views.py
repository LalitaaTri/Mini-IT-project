from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
from datetime import timedelta, datetime

async def index(request):
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
                account_inactive = await conn.fetchval("SELECT inactive FROM users WHERE id=$1",value[0]['user_id'])
                if email_verified and not account_inactive:
                    email = await conn.fetch("SELECT email FROM users WHERE id=$1", value[0]['user_id'])
                    status = "Logged in as {}".format(email[0]['email'])
                    passed_login_check = True
    if not passed_login_check:
        print("Redirecting to index")
        return redirect("/")
    async with pool.acquire() as conn:
        other_users = await conn.fetch("SELECT * FROM users WHERE id!=$1 AND email_verified=$2 AND inactive=$3",value[0]['user_id'], True, False)
    matches = []
    for iter in range(len(other_users)):
        async with pool.acquire() as conn:
            like_one_way = await conn.fetch("SELECT * FROM likes WHERE user_id=$1 AND liked_user_id=$2",value[0]['user_id'],other_users[iter]['id'])
            like_another_way = await conn.fetch("SELECT * FROM likes WHERE user_id=$1 AND liked_user_id=$2",other_users[iter]['id'],value[0]['user_id'])
            if like_one_way and like_another_way:
                matches.append(other_users[iter])
    context = {
        'matches': matches
    }
    return render(request, 'matching_matches/templates/index.html',{'status':status,'context': context})