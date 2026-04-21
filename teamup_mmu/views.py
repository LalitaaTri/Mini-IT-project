from django.shortcuts import render, redirect
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
   return render(request, 'index.html')

def matching(request):
    return render(request, 'matching.html')

def groups(request):
    return render(request, 'groups.html')

def settings(request):
    return render(request, 'settings.html')