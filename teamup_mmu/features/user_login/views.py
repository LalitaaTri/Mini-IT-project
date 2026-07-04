from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
import secrets
from django.contrib.auth.hashers import check_password
from django.views.decorators.csrf import csrf_exempt
import json

@csrf_exempt
async def receive(request):
    is_htmx = request.headers.get('HX-Request')
    
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        
        if not email and request.body:
            try:
                data = json.loads(request.body)
                email = data.get('email')
                password = data.get('password')
            except json.JSONDecodeError:
                pass

        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            user = await conn.fetchrow("SELECT id, password, inactive, email_verified FROM users WHERE email=$1", email)
            
            if not user or user['inactive'] or not check_password(password, user['password']):
                if is_htmx:
                    return HttpResponse("Could not log in.", status=200)
                return JsonResponse({"status": "error", "message": "Could not log in."})

            # Create Session
            token = secrets.token_urlsafe(32)
            await conn.execute("INSERT INTO sessions(token, user_id) VALUES($1, $2)", token, user['id'])
            
            # Check Profile Status
            profile = await conn.fetchrow("SELECT username FROM profiles WHERE id=$1", user['id'])

            # ... token creation logic ...
            
            # --- ONBOARDING ENFORCEMENT ROUTING ---
            if not user['email_verified']:
                # Return the verification module directly into the login page
                response = render(request, 'user_email_verification/templates/verify_module.html', {'email': email})
                response.set_cookie('access_token', token, max_age=3600, httponly=True)
                
                # THE MAGIC FIX: Tell HTMX to override the target and replace the whole card!
                response['HX-Retarget'] = '#auth-box' 
                
                return response
                
            elif not profile or not profile['username']:
                target_url = "/profile_setup/" 
            else:
                target_url = "/matching/"
            
            # Send standard redirect Response if they ARE verified
            response = HttpResponse("Success") if is_htmx else JsonResponse({"status": "success", "action": "redirect", "target": target_url})
            response.set_cookie('access_token', token, max_age=3600, httponly=True)
            
            if is_htmx:
                response['HX-Redirect'] = target_url
                
            return response

def index(request):
    # This should now render JUST the login form
    return render(request, 'user_login/templates/index.html')