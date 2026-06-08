# profile_setup_2/views.py
from django.shortcuts import render, redirect
from django.http import HttpResponse
from teamup_mmu.db import Database
from ..user_access_check.views import *

# Define your categories here so the template can loop through them easily
INTEREST_CATEGORIES = {
    "💻 Tech & Skills": ["Web Development", "Game Development", "Machine Learning", "Cybersecurity", "Blockchain Technology", "Data Science"],
    "🎮 Gaming": ["FPS Games", "RPGs", "Tabletop & Board Games", "Valorant", "Roblox", "Minecraft"],
    "🌱 Life & Hobbies": ["Music Production", "Sports & Fitness", "Anime & Manga", "Arts and Crafts", "Cooking", "Traveling"]
}

async def index(request):
    passed_login_check, status, email, id = await access_check(request)
    
    # NEW EXCEPTION ADDED HERE
    if not passed_login_check and status != "incomplete_profile":
        return redirect("/")
        
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        classes_records = await conn.fetch("SELECT * FROM classes")
    # Initial load: 0 selected, nothing disabled, submit button invalid
    selected_classes = request.POST.getlist('classes_ids') 
    class_ids = [class_record['id'] for class_record in classes_records]
    class_codes = [class_record['course_code'] for class_record in classes_records]
    class_sections = [class_record['section'] for class_record in classes_records]
    class_trimesters = [class_record['trimester'] for class_record in classes_records]
    zipped_classes = list(zip(class_ids, class_codes, class_sections, class_trimesters))
    setup_page_val = int(request.GET.get('step', 2))
    context = {
        'categories': INTEREST_CATEGORIES,
        'zipped_classes': zipped_classes,
        'selected_classes': selected_classes,
        'selected': [],
        'count': 0,
        'at_limit': False,
        'is_valid': False,
        'setup_page': setup_page_val
    }
    return render(request, 'profile_setup_2/templates/index.html', context)

async def validate(request):
    passed_login_check, status, email, id = await access_check(request) 
    
    # NEW EXCEPTION ADDED HERE
    if not passed_login_check and status != "incomplete_profile":
        return HttpResponse("Unauthorized", status=401)

    if request.method == 'POST':
        selected = request.POST.getlist('interests')
        count = len(selected)

        selected_classes = request.POST.getlist('classes_ids') 
        # Convert them to integers so they match your database IDs easily in the template
        selected_classes = [int(cid) for cid in selected_classes if cid.isdigit()]

        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            classes_records = await conn.fetch("SELECT * FROM classes")
        # Initial load: 0 selected, nothing disabled, submit button invalid
        class_ids = [class_record['id'] for class_record in classes_records]
        class_codes = [class_record['course_code'] for class_record in classes_records]
        class_sections = [class_record['section'] for class_record in classes_records]
        class_trimesters = [class_record['trimester'] for class_record in classes_records]
        zipped_classes = list(zip(class_ids, class_codes, class_sections, class_trimesters))
        
        context = {
            'categories': INTEREST_CATEGORIES,
            'zipped_classes': zipped_classes,
            'selected_classes': selected_classes,
            'selected': selected,
            'count': count,
            'at_limit': count >= 5,           # True if they hit the max
            'is_valid': 2 <= count <= 5       # True if they are allowed to submit
        }
        return render(request, 'profile_setup_2/templates/index.html', context)

async def receive(request):
    passed_login_check, status, email, id = await access_check(request) 
    
    # NEW EXCEPTION ADDED HERE
    if not passed_login_check and status != "incomplete_profile":
        return redirect("/")
        
    if request.method == 'POST':
        classes_ids = request.POST.getlist('classes_ids')
        if len(classes_ids) > 8:
            return HttpResponse("Please select no more than 8 classes.")

        interests = request.POST.getlist('interests')
        if len(interests) < 2 or len(interests) > 5:
            return HttpResponse("Please select between 2 and 5 topics.")
            
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            await conn.execute("UPDATE profiles SET interests=$1, classes_ids=$2 WHERE id=$3", interests, classes_ids, id)
            for class_id in classes_ids:
                await conn.execute("""
                    INSERT INTO user_classes (user_id, class_id) 
                    VALUES ($1, $2)
                """, id, int(class_id))
        response = HttpResponse("Profile complete!")
        response['HX-Redirect'] = '/matching/'
        return response