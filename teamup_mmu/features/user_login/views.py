from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
import secrets

async def receive(request):
    if request.method == 'POST':
      email = request.POST.get('email')
      password = request.POST.get('password')
      pool = await Database.get_pool()
      async with pool.acquire() as conn:
         value = await conn.fetch("SELECT * FROM users WHERE email=$1 AND password=$2",email,password)
      response = JsonResponse({"response": [dict(r) for r in value]})
      if value:
         token=secrets.token_urlsafe(32)
         response.set_cookie(
            'access_token',token,
            max_age=3600,httponly=True
         )
         async with pool.acquire() as conn:
            id = await conn.fetchval("SELECT id FROM users WHERE email=$1",email)
            await conn.execute("INSERT INTO sessions(token,user_id) VALUES($1,$2)",token,id)

      return response

def index(request):
   return render(request, 'user_login/templates/index.html')
