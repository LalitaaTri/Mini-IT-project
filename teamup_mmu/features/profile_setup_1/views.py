from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
import secrets
from django.contrib.auth.hashers import check_password
from ..user_access_check.views import *

async def receive(request):
   passed_login_check, status, email, id = await access_check(request)
   if not passed_login_check:
      print("Redirecting to index")
      return redirect("/")
   if request.method == 'POST':
      username = request.POST.get('username')
      pool = await Database.get_pool()
      async with pool.acquire() as conn:
         await conn.execute("UPDATE profiles SET username=$1 WHERE id=$2", username, id)
      return HttpResponse("Username updated successfully.")

def index(request):
   return render(request, 'profile_setup_1/templates/index.html')
