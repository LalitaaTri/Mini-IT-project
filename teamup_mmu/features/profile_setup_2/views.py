# profile_setup_2/views.py
from django.shortcuts import render, redirect
from django.http import HttpResponse
from teamup_mmu.db import Database
from ..user_access_check.views import *

async def index(request):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return redirect("/")
    return render(request, 'profile_setup_2/templates/index.html')

async def receive(request):
    passed_login_check, status, email, id = await access_check(request) 
    if not passed_login_check:
        return redirect("/")
        
    if request.method == 'POST':
        # getlist() grabs all checked boxes as a Python list
        interests = request.POST.getlist('interests')
        
        # Enforce the 2 to 5 limit
        if len(interests) < 2 or len(interests) > 5:
            return HttpResponse("Please select between 2 and 5 topics.")
            
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            # asyncpg handles converting the Python list directly into a PostgreSQL array
            await conn.execute("UPDATE profiles SET interests=$1 WHERE id=$2", interests, id)
            
        # Redirect to the main dashboard or matching page when finished
        response = HttpResponse("Profile complete!")
        response['HX-Redirect'] = '/matching/'
        return response