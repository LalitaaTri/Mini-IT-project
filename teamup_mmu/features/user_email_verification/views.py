import secrets
from django.contrib.auth.hashers import check_password
from django.core.mail import send_mail
from asgiref.sync import sync_to_async
from django.http import HttpResponse
from ..user_access_check.views import *

async def send(request):
   passed_login_check, status, email, id = await access_check(request)
   if not passed_login_check:
      print("Redirecting to index")
      return redirect("/")
   if request.method == 'POST':
      code = secrets.token_urlsafe(6)
      pool = await Database.get_pool()
      async with pool.acquire() as conn:
          code_id = await conn.fetchval("SELECT id FROM codes WHERE user_id=$1",id)
          if not code_id:
             await conn.execute("INSERT INTO codes(code,user_id) VALUES($1,$2)",code,id)
          else:
             await conn.execute("UPDATE codes SET code=$1 WHERE user_id=$2",code,id) 
      def dispatch_email():
         return send_mail(
            'Verify your email for TeamUp MMU',
            'Dear recipient,\nTo activate your account for TeamUp app, input this code on the website. ' + code + '\nThanks,\nTeamUp team',
            'noreply@teamupmmu.com',
            [email],
            fail_silently=False,
         )
      await sync_to_async(dispatch_email,thread_sensitive=False)()
      return HttpResponse("Email sent successfully.",status=200)

async def receive(request):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
      print("Redirecting to index")
      return redirect("/")
    if request.method == 'POST':
      code = request.POST.get('code')
      pool = await Database.get_pool()
      async with pool.acquire() as conn:
         database_code = await conn.fetchval("SELECT code FROM codes WHERE user_id=$1",id)
      response = HttpResponse("You verified the account successfully.",status=200)
      if code == database_code:
         async with pool.acquire() as conn:
            await conn.execute("UPDATE users SET email_verified=$1 WHERE id=$2",True,id)
         return response

      return HttpResponse("Could not verify the account.",status=401)