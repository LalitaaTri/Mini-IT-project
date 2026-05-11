from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
from datetime import timedelta, datetime
from ..user_access_check.views import *

async def access_check(request):
    token = request.COOKIES.get('access_token')
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        value = await conn.fetch("SELECT * FROM sessions WHERE token=$1", token)
    status = "Not logged in"
    passed_login_check = False
    email = None
    if value and value[0]['is_active']:
        if value[0]['created_at'] + timedelta(hours=1) > datetime.now():
            async with pool.acquire() as conn:
                email_verified = await conn.fetchval("SELECT email_verified FROM users WHERE id=$1",value[0]['user_id'])
                account_inactive = await conn.fetchval("SELECT inactive FROM users WHERE id=$1",value[0]['user_id'])
                if email_verified and not account_inactive:
                    email = await conn.fetch("SELECT email FROM users WHERE id=$1", value[0]['user_id'])
                    status = "Logged in as {}".format(email[0]['email'])
                    passed_login_check = True
    return passed_login_check, status, email, value[0]['user_id'] if value else None

async def access_check_endpoint(request):
    passed_login_check, status, email, user_id = await access_check(request)
    
    dicti = {
        "passed_login_check": passed_login_check,
        "status": str(status), # Safety cast
        "email": str(email) if email else None, # Cast Record to string
        "user_id": str(user_id) if user_id else None # Safety cast
    }
    
    if not passed_login_check:
        dicti["action"] = "redirect"
        dicti["target"] = "/signup_page/"
        
    return JsonResponse(dicti)