from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
from django.contrib.auth.hashers import make_password

async def receive(request):
    if request.method == 'POST':
      email = request.POST.get('email')
      if email.endswith("@mmu.edu.my") or email.endswith("@student.mmu.edu.my"):
         password = make_password(request.POST.get('password'))
         pool = await Database.get_pool()
         async with pool.acquire() as conn:
            value = await conn.execute("INSERT INTO users(email,password) VALUES($1,$2)",email,password)
         
         if value == "INSERT 0 1":
            return HttpResponse("You signed up successfully.",status=200)
         return HttpResponse("Could not sign up.",status=401)
      return HttpResponse("Email must be a valid MMU email address.",status=400)

async def index(request):
   pool = await Database.get_pool()
   async with pool.acquire() as conn:
      value = await conn.fetch("SELECT * FROM users")
      return render(request, 'user_signup/templates/index.html')