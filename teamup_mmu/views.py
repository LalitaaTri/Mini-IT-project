from django.shortcuts import render 
from django.http import HttpResponse, JsonResponse
from .db import Database

async def test_db_view(request):
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # Fetching data directly via asyncpg
        value = await conn.fetchval("SELECT 'Connection Successful!'")
    
    return JsonResponse({"status": value})

def index(request):
   return render(request, 'index.html')

def matching(request):
    return render(request, 'matching.html')

def groups(request):
    return render(request, 'groups.html')

def settings(request):
    return render(request, 'settings.html')