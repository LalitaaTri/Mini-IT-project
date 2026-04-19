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
                if email_verified:
                    email = await conn.fetch("SELECT email FROM users WHERE id=$1", value[0]['user_id'])
                    status = "Logged in as {}".format(email[0]['email'])
                    passed_login_check = True
    if not passed_login_check:
        print("Redirecting to index")
        return redirect("/")
    async with pool.acquire() as conn:
        other_users = await conn.fetch("SELECT email FROM users WHERE id!=$1",value[0]['user_id'])
    return render(request, 'matching_view/templates/index.html',{'status':status,'other_users':other_users})
