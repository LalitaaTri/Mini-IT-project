from django.shortcuts import redirect
from django.http import JsonResponse
from teamup_mmu.db import Database
from datetime import timedelta, datetime

async def access_check(request):
    token = request.COOKIES.get('access_token')
    if not token:
        return False, "No token", None, None

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        value = await conn.fetchrow("SELECT * FROM sessions WHERE token=$1", token)

    if value and value['is_active']:
        # Check if session is expired (1 hour limit)
        if value['created_at'] + timedelta(hours=1) > datetime.now():
            async with pool.acquire() as conn:
                user = await conn.fetchrow("SELECT email, email_verified, inactive FROM users WHERE id=$1", value['user_id'])
                
                if user and not user['inactive']:
                    if user['email_verified']:
                        # Check if profile is setup (assuming empty username means incomplete)
                        profile = await conn.fetchrow("SELECT username FROM profiles WHERE id=$1", value['user_id'])
                        if not profile or not profile['username']:
                            return False, "incomplete_profile", user['email'], value['user_id']
                        
                        return True, "valid", user['email'], value['user_id']
                    else:
                        return False, "unverified_email", user['email'], value['user_id']
        else:
            # Session expired - invalidate it in the database
            async with pool.acquire() as conn:
                await conn.execute("UPDATE sessions SET is_active=FALSE WHERE token=$1", token)

    return False, "expired_or_invalid", None, None

async def access_check_endpoint(request):
    passed_login_check, status, email, user_id = await access_check(request)
    
    dicti = {
        "passed_login_check": passed_login_check,
        "status": str(status),
        "email": str(email) if email else None,
        "user_id": str(user_id) if user_id else None
    }
    
    if not passed_login_check:
        dicti["action"] = "redirect"
        # Route them based on exactly what they are missing
        if status == "unverified_email":
            dicti["target"] = "/verify_email_page/" # You will need to create this URL/Template
        elif status == "incomplete_profile":
            dicti["target"] = "/profile_setup/"
        else:
            dicti["target"] = "/user_login/" # New standalone login page
        
    return JsonResponse(dicti)