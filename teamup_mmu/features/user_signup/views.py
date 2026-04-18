from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database

async def receive(request):
    if request.method == 'POST':
      email = request.POST.get('email')
      password = request.POST.get('password')
      # After the user is created/logged in successfully:
      # response = HttpResponse()
      # response["HX-Redirect"] = "/matching/" # This tells HTMX to redirect the WHOLE page
      # return response
      pool = await Database.get_pool()
      async with pool.acquire() as conn:
         value = await conn.execute("INSERT INTO users(email,password) VALUES($1,$2)",email,password)
      
      return JsonResponse({"status": value})

async def index(request):
   pool = await Database.get_pool()
   async with pool.acquire() as conn:
      value = await conn.fetch("SELECT * FROM users")
      return render(request, 'user_signup/templates/index.html', {'data':value})