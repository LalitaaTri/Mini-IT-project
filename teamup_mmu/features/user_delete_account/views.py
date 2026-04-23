from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
import secrets
from django.contrib.auth.hashers import check_password
from django.core.mail import send_mail
from asgiref.sync import sync_to_async
from django.http import HttpResponse
from datetime import timedelta, datetime

async def send(request):
   token = request.COOKIES.get('access_token')
   pool = await Database.get_pool()
   async with pool.acquire() as conn:
       value = await conn.fetch("SELECT * FROM sessions WHERE token=$1", token)
   email = None
   not_logged_in = False
   if value and value[0]['is_active']:
       if value[0]['created_at'] + timedelta(hours=1) > datetime.now():
            async with pool.acquire() as conn:
                email_verified = await conn.fetchval("SELECT email_verified FROM users WHERE id=$1",value[0]['user_id'])
                account_inactive = await conn.fetchval("SELECT inactive FROM users WHERE id=$1",value[0]['user_id'])
                if email_verified and not account_inactive:
                    email = await conn.fetchval("SELECT email FROM users WHERE id=$1", value[0]['user_id'])
                else:
                    not_logged_in = True
   if not_logged_in:
      return HttpResponse(status=401)
   if request.method == 'POST':
      code = secrets.token_urlsafe(6)
      pool = await Database.get_pool()
      async with pool.acquire() as conn:
          value = await conn.fetch("SELECT * FROM users WHERE email=$1",email)
          code_id = await conn.fetchval("SELECT id FROM delete_codes WHERE user_id=$1",value[0]['id'])
          if not code_id:
             await conn.execute("INSERT INTO delete_codes(code,user_id) VALUES($1,$2)",code,value[0]['id'])
          else:
             await conn.execute("UPDATE delete_codes SET code=$1 WHERE user_id=$2",code,value[0]['id']) 
      def dispatch_email():
         return send_mail(
            'Delete your account for TeamUp MMU',
            'Dear recipient,\nTo delete your account for TeamUp app, input this code on the website. ' + code + '\nThanks,\nTeamUp team',
            'noreply@teamupmmu.com',
            [email],
            fail_silently=False,
         )
      await sync_to_async(dispatch_email,thread_sensitive=False)()
      return HttpResponse("Email sent successfully.",status=200)

async def receive(request):
    token = request.COOKIES.get('access_token')
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
       value = await conn.fetch("SELECT * FROM sessions WHERE token=$1", token)
    email = None
    not_logged_in = False
    if value and value[0]['is_active']:
       if value[0]['created_at'] + timedelta(hours=1) > datetime.now():
            async with pool.acquire() as conn:
                email_verified = await conn.fetchval("SELECT email_verified FROM users WHERE id=$1",value[0]['user_id'])
                account_inactive = await conn.fetchval("SELECT inactive FROM users WHERE id=$1",value[0]['user_id'])
                if email_verified and not account_inactive:
                    email = await conn.fetchval("SELECT email FROM users WHERE id=$1", value[0]['user_id'])
                else:
                    not_logged_in = True
    if not_logged_in:
      return HttpResponse(status=401)
    if request.method == 'POST':
      code = request.POST.get('code')
      pool = await Database.get_pool()
      async with pool.acquire() as conn:
         value = await conn.fetch("SELECT * FROM users WHERE email=$1",email)
         database_code = await conn.fetchval("SELECT code FROM delete_codes WHERE user_id=$1",value[0]['id'])
      response = HttpResponse("You deleted the account successfully.",status=200)
      if value and code == database_code:
         async with pool.acquire() as conn:
            id = await conn.fetchval("SELECT id FROM users WHERE email=$1",email)
            await conn.execute("UPDATE users SET inactive=$1 WHERE id=$2",True,id)
         return response

      return HttpResponse("Could not delete the account.",status=401)
