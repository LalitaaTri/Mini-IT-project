from django.shortcuts import render, redirect
from django.http import HttpResponse
from teamup_mmu.db import Database
from django.contrib.auth.hashers import make_password
from django.core.mail import send_mail
from asgiref.sync import sync_to_async
import secrets

async def receive(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        if email.endswith("@mmu.edu.my") or email.endswith("@student.mmu.edu.my"):
            password = make_password(request.POST.get('password'))
            pool = await Database.get_pool()
            
            async with pool.acquire() as conn:
                # 1. Check if user exists
                existing_user = await conn.fetchrow("SELECT id, inactive FROM users WHERE email=$1", email)
                
                if existing_user:
                    if existing_user['inactive']:
                        await conn.execute("UPDATE users SET password=$1, inactive=FALSE WHERE id=$2", password, existing_user['id'])
                        user_id = existing_user['id']
                    else:
                        return HttpResponse("Email already exists.")
                else:
                    # Insert new user
                    user_id = await conn.fetchval("INSERT INTO users(email, password) VALUES($1, $2) RETURNING id", email, password)
                    await conn.execute("INSERT INTO profiles(id) VALUES($1)", user_id)

                # 2. Generate and save verification code instantly
                code = secrets.token_urlsafe(6)
                await conn.execute("""
                    INSERT INTO codes (code, user_id, sent_at) VALUES ($1, $2, CURRENT_TIMESTAMP)
                    ON CONFLICT (user_id) DO UPDATE SET code = $1, sent_at = CURRENT_TIMESTAMP
                """, code, user_id)

                # 3. Auto-send the email
                def dispatch_email():
                    send_mail(
                        'Verify your email for TeamUp MMU',
                        f'Dear recipient,\nTo activate your account for TeamUp app, input this code on the website: {code}\nThanks,\nTeamUp team',
                        'noreply@teamupmmu.com',
                        [email],
                        fail_silently=False,
                    )
                await sync_to_async(dispatch_email, thread_sensitive=False)()

                # ... code sending logic ...
                # 4. Create an instant session so they don't have to log in
                token = secrets.token_urlsafe(32)
                await conn.execute("INSERT INTO sessions(token, user_id) VALUES($1, $2)", token, user_id)

                # 5. Return the Verification HTML Module directly!
                response = render(request, 'user_email_verification/templates/verify_module.html', {'email': email})
                response.set_cookie('access_token', token, max_age=3600, httponly=True)
                return response
                
        return HttpResponse("Email must be a valid MMU email address.")

async def index(request):
    email = request.GET.get('email', '')
    # This should now render JUST the signup form
    return render(request, 'user_signup/templates/index.html', {'email': email})