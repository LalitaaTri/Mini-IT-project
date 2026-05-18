from django.shortcuts import render, redirect
from django.http import HttpResponse
from teamup_mmu.db import Database
from ..user_access_check.views import *

async def receive(request):
    passed_login_check, status, email, id = await access_check(request)
    
    # NEW EXCEPTION ADDED HERE
    if not passed_login_check and status != "incomplete_profile":
        return redirect("/")
        
    if request.method == 'POST':
        # 1. Grab all the new data from the form
        username = request.POST.get('username')
        introduction = request.POST.get('introduction')
        descriptions = request.POST.get('descriptions')
        faculty = request.POST.get('faculty')
        program = request.POST.get('program')
        
        # Make sure year_of_study is an integer to match your schema CHECK constraint
        try:
            year_of_study = int(request.POST.get('year_of_study'))
        except (ValueError, TypeError):
            return HttpResponse("Invalid year of study.")

        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            # Check for unique username
            existing_user = await conn.fetchval("SELECT id FROM profiles WHERE username=$1", username)
            if existing_user:
                return HttpResponse("Username is already taken. Please try again.")
                
            # Execute the massive update query
            await conn.execute("""
                UPDATE profiles 
                SET username=$1, 
                    introduction=$2, 
                    descriptions=$3, 
                    year_of_study=$4, 
                    faculty=$5, 
                    program=$6
                WHERE id=$7
            """, username, introduction, descriptions, year_of_study, faculty, program, id)
            
        # Redirect to the main profile setup page to trigger step 2
        response = HttpResponse("Success")
        response['HX-Redirect'] = '/profile_setup/'
        return response

async def index(request):
    passed_login_check, status, email, id = await access_check(request)
    
    # NEW EXCEPTION ADDED HERE
    if not passed_login_check and status != "incomplete_profile":
        return redirect("/")
        
    return render(request, 'profile_setup_1/templates/index.html')