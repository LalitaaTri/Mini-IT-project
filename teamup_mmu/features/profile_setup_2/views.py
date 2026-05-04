# profile_setup_2/views.py
from django.shortcuts import render, redirect
from django.http import HttpResponse
from teamup_mmu.db import Database
from ..user_access_check.views import *

# Define your categories here so the template can loop through them easily
INTEREST_CATEGORIES = {
    "💻 Tech & Skills": ["Web Development", "Game Development", "Machine Learning", "Cybersecurity", "Blockchain Technology", "Data Science"],
    "🎮 Gaming": ["FPS Games", "RPGs", "Tabletop & Board Games", "Valorant", "Roblox", "Minecraft", ],
    "🌱 Life & Hobbies": ["Music Production", "Sports & Fitness", "Anime & Manga", "Arts and Crafts", "Cooking", "Traveling"]
}

async def index(request):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return redirect("/")
        
    # Initial load: 0 selected, nothing disabled, submit button invalid
    context = {
        'categories': INTEREST_CATEGORIES,
        'selected': [],
        'count': 0,
        'at_limit': False,
        'is_valid': False
    }
    return render(request, 'profile_setup_2/templates/index.html', context)

async def validate(request):
    """This is triggered by HTMX every time a checkbox is clicked"""
    passed_login_check, status, email, id = await access_check(request) 
    if not passed_login_check:
        return HttpResponse("Unauthorized", status=401)

    if request.method == 'POST':
        selected = request.POST.getlist('interests')
        count = len(selected)
        
        context = {
            'categories': INTEREST_CATEGORIES,
            'selected': selected,
            'count': count,
            'at_limit': count >= 5,           # True if they hit the max
            'is_valid': 2 <= count <= 5       # True if they are allowed to submit
        }
        return render(request, 'profile_setup_2/templates/index.html', context)

async def receive(request):
    """This handles the final database save when they click Submit"""
    passed_login_check, status, email, id = await access_check(request) 
    if not passed_login_check:
        return redirect("/")
        
    if request.method == 'POST':
        interests = request.POST.getlist('interests')
        if len(interests) < 2 or len(interests) > 5:
            return HttpResponse("Please select between 2 and 5 topics.")
            
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            await conn.execute("UPDATE profiles SET interests=$1 WHERE id=$2", interests, id)
            
        response = HttpResponse("Profile complete!")
        response['HX-Redirect'] = '/matching/'
        return response