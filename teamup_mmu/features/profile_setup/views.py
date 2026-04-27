from urllib import response

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
            existing_user = await conn.fetchval("SELECT id FROM profiles WHERE username=$1", username)
            if existing_user:
                # If taken, it replaces the form with an error message, or you can return the form again with an error flag
               return HttpResponse("Username is already taken. Please try again.")
            await conn.execute("UPDATE profiles SET username=$1 WHERE id=$2", username, id)
        # HTMX intercepts this and seamlessly loads the Step 2 HTML
      return redirect("/profile_setup_2/")

def index(request):
   return render(request, 'profile_setup_1/templates/index.html')
