from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
import secrets
from django.contrib.auth.hashers import check_password
from django.core.mail import send_mail
from asgiref.sync import sync_to_async
from django.http import HttpResponse
from django.contrib.auth.hashers import make_password

async def send(request):
   if request.method == 'POST':
      code = secrets.token_urlsafe(6)
      pool = await Database.get_pool()
      async with pool.acquire() as conn:
          value = await conn.fetch("SELECT * FROM users WHERE email=$1",request.POST.get('email'))
          code_id = await conn.fetchval("SELECT id FROM reset_codes WHERE user_id=$1",value[0]['id'])
          if not code_id:
             await conn.execute("INSERT INTO reset_codes(code,user_id) VALUES($1,$2)",code,value[0]['id'])
          else:
             await conn.execute("UPDATE reset_codes SET code=$1 WHERE user_id=$2",code,value[0]['id']) 
      def dispatch_email():
         return send_mail(
            'Reset your password for TeamUp MMU',
            'Dear recipient,\nTo reset your password for TeamUp app, input this code on the website. ' + code + '\nThanks,\nTeamUp team',
            'noreply@teamupmmu.com',
            [request.POST.get('email')],
            fail_silently=False,
         )
      await sync_to_async(dispatch_email,thread_sensitive=False)()
      return HttpResponse("Email sent successfully.",status=200)

async def receive(request):
    if request.method == 'POST':
      code = request.POST.get('code')
      email = request.POST.get('email')
      password = make_password(request.POST.get('password'))
      pool = await Database.get_pool()
      async with pool.acquire() as conn:
         value = await conn.fetch("SELECT * FROM users WHERE email=$1",email)
         database_code = await conn.fetchval("SELECT code FROM reset_codes WHERE user_id=$1",value[0]['id'])
      response = HttpResponse("You reset the password successfully.",status=200)
      if value and code == database_code:
         async with pool.acquire() as conn:
            id = await conn.fetchval("SELECT id FROM users WHERE email=$1",email)
            await conn.execute("UPDATE users SET password=$1 WHERE id=$2", password, id)
         return response

      return HttpResponse("Could not reset the password.",status=401)

def index(request):
   return render(request, 'user_forgot_password/templates/index.html')
