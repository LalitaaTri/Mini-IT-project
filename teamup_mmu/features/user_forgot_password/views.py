from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
import secrets
from django.contrib.auth.hashers import check_password

async def receive(request):
    if request.method == 'POST':
      email = request.POST.get('email')
      pool = await Database.get_pool()
      async with pool.acquire() as conn:
         value = await conn.fetch("SELECT * FROM users WHERE email=$1",email)
      response = HttpResponse("You reset the password successfully.",status=200)
      if value:
         code=secrets.token_urlsafe(6)
         async with pool.acquire() as conn:
            id = await conn.fetchval("SELECT id FROM users WHERE email=$1",email)
            await conn.execute("INSERT INTO sessions(token,user_id) VALUES($1,$2)",token,id)
         return response

      return HttpResponse("Could not reset the password.",status=401)

def index(request):
   return render(request, 'user_forgot_password/templates/index.html')
