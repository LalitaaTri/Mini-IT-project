from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database

async def receive(request):
    if request.method == 'POST':
      email = request.POST.get('email')
      password = request.POST.get('password')
      pool = await Database.get_pool()
      async with pool.acquire() as conn:
         value = await conn.fetch("SELECT * FROM users WHERE email=$1 AND password=$2",email,password)
      
      return JsonResponse({"response": [dict(r) for r in value]})

def index(request):
   return render(request, 'user_login/templates/index.html')
