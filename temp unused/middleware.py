from django.shortcuts import redirect
from datetime import timedelta, datetime
from teamup_mmu.db import Database
from asgiref.sync import iscoroutinefunction, sync_to_async

class ProfileSetupMiddleware:
    sync_capable = False
    async_capable = True

    def __init__(self, get_response):
        self.get_response = get_response
        
        # FIX: If the next view/middleware is sync, convert it to async automatically
        if not iscoroutinefunction(self.get_response):
            self.get_response = sync_to_async(self.get_response)

    async def __call__(self, request):
        public_paths = ['/', '/login', '/signup_page'] 
        
        if request.path in public_paths or request.path.startswith('/static/') or request.path.startswith('/admin/'):
            return await self.get_response(request)

        token = request.COOKIES.get('access_token')
        passed_login_check = False
        is_profile_setup = False

        if token:
            pool = await Database.get_pool()
            async with pool.acquire() as conn:
                session = await conn.fetchrow("SELECT * FROM sessions WHERE token=$1", token)
                
                if session and session['is_active'] and (session['created_at'] + timedelta(hours=1) > datetime.now()):
                    user = await conn.fetchrow("SELECT email_verified, is_profile_setup FROM users WHERE id=$1", session['user_id'])
                    
                    if user and user['email_verified']:
                        passed_login_check = True
                        is_profile_setup = user['is_profile_setup']

        if not passed_login_check:
            return redirect("/")

        if not is_profile_setup and request.path not in ['/profile_setup', '/profile_setup/']:
            return redirect('/profile_setup')

        return await self.get_response(request)