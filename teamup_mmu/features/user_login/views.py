from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
import secrets
from django.contrib.auth.hashers import check_password

async def receive(request):
    if request.method == 'POST':
      email = request.POST.get('email')
      password = request.POST.get('password')
      pool = await Database.get_pool()
      async with pool.acquire() as conn:
         value = await conn.fetch("SELECT * FROM users WHERE email=$1",email)
         account_inactive = await conn.fetchval("SELECT inactive FROM users WHERE id=$1",value[0]['id'])
      response = HttpResponse("You logged in successfully.",status=200)
      if value and check_password(password, value[0]['password']) and not account_inactive:
         token=secrets.token_urlsafe(32)
         response.set_cookie(
            'access_token',token,
            max_age=3600,httponly=True
         )
         async with pool.acquire() as conn:
            id = await conn.fetchval("SELECT id FROM users WHERE email=$1",email)
            await conn.execute("INSERT INTO sessions(token,user_id) VALUES($1,$2)",token,id)
         return response

      return HttpResponse("Could not log in.",status=401)

def index(request):
   return render(request, 'user_login/templates/index.html')
