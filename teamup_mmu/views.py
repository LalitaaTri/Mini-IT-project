from django.shortcuts import render 
from django.http import HttpResponse, JsonResponse
from .db import Database
from datetime import timedelta, datetime

async def test_db_view(request):
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # Fetching data directly via asyncpg
        value = await conn.fetchval("SELECT 'Connection Successful!'")
    
    return JsonResponse({"status": value})

async def index(request):
   token = request.COOKIES.get('access_token')
   pool = await Database.get_pool()
   async with pool.acquire() as conn:
       value = await conn.fetch("SELECT * FROM sessions WHERE token=$1", token)
   status = "Not logged in"
   if value:
       if value[0]['created_at'] + timedelta(hours=1) > datetime.now():
            response = HttpResponse(status=200)
            print("Redirecting to matching")
            response["HX-Redirect"] = "/matching/" # This tells HTMX to redirect the WHOLE page
            return response
   return render(request, 'index.html',{'status':status})

def matching(request):
    return render(request, 'matching.html')

def groups(request):
    return render(request, 'groups.html')

def settings(request):
    return render(request, 'settings.html')