from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
import secrets
from django.contrib.auth.hashers import check_password
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
import json

@csrf_exempt
async def receive(request):
    is_htmx = request.headers.get('HX-Request')
    is_mobile = 'application/json' in request.headers.get('Accept','')
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
      print("email,password",email,password)
      pool = await Database.get_pool()
      async with pool.acquire() as conn:
         value = await conn.fetch("SELECT * FROM users WHERE email=$1",email)
         if not value:
            if is_htmx:
               return HttpResponse("Could not log in.",status=200)
            return JsonResponse({"status": "error", "message": "Could not log in."})
         account_inactive = await conn.fetchval("SELECT inactive FROM users WHERE id=$1",value[0]['id'])
      response = JsonResponse({"status": "success", "message": "You logged in successfully.",
      "action":"redirect","target":"/index/"})
      if is_htmx:
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
         if is_htmx:
            response['HX-Redirect'] = "/signup_page/"
         return response
      if is_htmx:
         return HttpResponse("Could not log in.",status=200)
      return JsonResponse({"status": "error", "message": "Could not log in."})

def index(request):
   return render(request, 'user_login/templates/index.html')
