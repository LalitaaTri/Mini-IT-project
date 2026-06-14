from django.shortcuts import render, redirect
from django.http import HttpResponse
from teamup_mmu.db import Database
from ..user_access_check.views import *

# Same categories as Profile Setup 2
INTEREST_CATEGORIES = {
    "💻 Tech & Skills": ["Web Development", "Game Development", "Machine Learning", "Cybersecurity", "Blockchain Technology", "Data Science"],
    "🎮 Gaming": ["FPS Games", "RPGs", "Tabletop & Board Games", "Valorant", "Roblox", "Minecraft"],
    "🌱 Life & Hobbies": ["Music Production", "Sports & Fitness", "Anime & Manga", "Arts and Crafts", "Cooking", "Traveling"]
}

async def index(request):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return redirect("/")

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        classes_records = await conn.fetch("SELECT * FROM classes")
    # Initial load: 0 selected, nothing disabled, submit button invalid
    class_ids = [class_record['id'] for class_record in classes_records]
    class_codes = [class_record['course_code'] for class_record in classes_records]
    class_sections = [class_record['section'] for class_record in classes_records]
    class_trimesters = [class_record['trimester'] for class_record in classes_records]
    zipped_classes = list(zip(class_ids, class_codes, class_sections, class_trimesters))
    async with pool.acquire() as conn:
        profile = await conn.fetchrow("""
            SELECT username, introduction, descriptions, year_of_study, faculty, program, cgpa, interests
            FROM profiles WHERE id=$1
        """, id)

    context = {
        'profile': profile,
        'email': email,
        'categories': INTEREST_CATEGORIES,
        'selected_interests': profile['interests'] if profile and profile['interests'] else [],
        'zipped_classes': zipped_classes
    }
    print("zipped_classes:", list(zipped_classes))
    return render(request, 'my_profile/templates/index.html', {'context': context})

async def edit(request):
    """Handles the form submission to save profile edits"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return HttpResponse("Unauthorized", status=401)

    if request.method == "POST":
        username = request.POST.get('username')
        intro = request.POST.get('introduction')
        desc = request.POST.get('descriptions')
        faculty = request.POST.get('faculty')
        program = request.POST.get('program')
        interests = request.POST.getlist('interests')

        raw_classes_ids = request.POST.getlist('classes_ids')
        
        # 2. Convert them to integers right away
        classes_ids = [int(cid) for cid in raw_classes_ids if cid.isdigit()]
        if len(classes_ids) > 8:
            return HttpResponse("Please select no more than 8 classes.")

        
        try:
            year = int(request.POST.get('year_of_study'))
            cgpa = float(request.POST.get('cgpa'))
        except (ValueError, TypeError):
            return HttpResponse("Invalid numbers provided.")

        if len(interests) < 2 or len(interests) > 5:
            return HttpResponse("Please select between 2 and 5 interests.")

        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            # Make sure the new username isn't taken by SOMEONE ELSE
            existing = await conn.fetchval("SELECT id FROM profiles WHERE username=$1 AND id!=$2", username, id)
            if existing:
                return HttpResponse("Username is already taken.")

            await conn.execute("""
                UPDATE profiles 
                SET username=$1, introduction=$2, descriptions=$3, 
                    year_of_study=$4, faculty=$5, program=$6, cgpa=$7, interests=$8, classes_ids=$9
                WHERE id=$10
            """, username, intro, desc, year, faculty, program, cgpa, interests, classes_ids, id)

        return HttpResponse("<span style='color: green;'>Profile updated successfully!</span>")

# Lalitaa added this for profile info pop-up

async def profile_modal(request, user_id):
    passed_login_check, status, email, my_id = await access_check(request)
    if not passed_login_check:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        profile = await conn.fetchrow("""
            SELECT p.username, p.introduction, p.descriptions, p.year_of_study, p.faculty, p.program, p.cgpa, p.interests, u.email
            FROM profiles p
            JOIN users u ON p.id = u.id
            WHERE p.id=$1
        """, user_id)

    if not profile:
        return HttpResponse("User not found", status=404)

    context = {
        'profile': profile,
    }
    return render(request, 'my_profile/templates/profile_modal.html', {'context': context})