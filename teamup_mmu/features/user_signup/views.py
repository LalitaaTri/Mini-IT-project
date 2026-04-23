from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
from django.contrib.auth.hashers import make_password
from datetime import timedelta, datetime

async def receive(request):
    if request.method == 'POST':
      email = request.POST.get('email')
      if email.endswith("@mmu.edu.my") or email.endswith("@student.mmu.edu.my"):
         password = make_password(request.POST.get('password'))
         pool = await Database.get_pool()
         value = None
         async with pool.acquire() as conn:
            id = await conn.fetchval("SELECT id FROM users WHERE email=$1",email)
            if id:
                  inactive = await conn.fetchval("SELECT inactive FROM users WHERE id=$1",id)
                  if inactive:
                     await conn.execute("UPDATE users SET password=$1, inactive=FALSE WHERE id=$2", password, id)
                     return HttpResponse("You signed up successfully.")
                  return HttpResponse("Email already exists.")
            value = await conn.execute("INSERT INTO users(email,password) VALUES($1,$2)",email,password)
         
         if value == "INSERT 0 1":
            return HttpResponse("You signed up successfully.")
         return HttpResponse("Could not sign up.")
      return HttpResponse("Email must be a valid MMU email address.")

async def index(request):
   return render(request, 'user_signup/templates/index.html')
   
async def signup_page(request):
   token = request.COOKIES.get('access_token')
   pool = await Database.get_pool()
   async with pool.acquire() as conn:
       value = await conn.fetch("SELECT * FROM sessions WHERE token=$1", token)
   status = "Not logged in"
   show_form = False
   email = None
   if value and value[0]['is_active']:
       if value[0]['created_at'] + timedelta(hours=1) > datetime.now():
            async with pool.acquire() as conn:
                email_verified = await conn.fetchval("SELECT email_verified FROM users WHERE id=$1",value[0]['user_id'])
                account_inactive = await conn.fetchval("SELECT inactive FROM users WHERE id=$1",value[0]['user_id'])
                if email_verified and not account_inactive:
                    print("Redirecting to matching")
                    return redirect("/matching/")
                elif not account_inactive:
                    status = "Logged in but email not verified"
                    show_form = True
                    email = await conn.fetchval("SELECT email FROM users WHERE id=$1", value[0]['user_id'])
                else:
                    status = "Not logged in"
   return render(request, 'signup.html',{'status':status,'show_form':show_form,'email':email})
