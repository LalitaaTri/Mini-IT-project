from django.shortcuts import render, redirect
from django.http import HttpResponse
from teamup_mmu.db import Database
from datetime import timedelta, datetime
from django.views.decorators.csrf import csrf_exempt
import random
import string


async def index(request):
    # 1. Check if the browser sent an access_token cookie
    token = request.COOKIES.get('access_token')
    if not token:
        return redirect('/user_login/')

    # 2. Connect to the database
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        
        # 3. Verify the token actually exists in the database and hasn't expired
        session = await conn.fetchrow("SELECT * FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session or session['created_at'] + timedelta(hours=1) < datetime.now():
            return redirect('/user_login/')

        # 4. Save the user's ID for the next step
        user_id = session['user_id']

        # 5. Get classes the user is ALREADY enrolled in
        my_classes = await conn.fetch("""
            SELECT c.* FROM classes c
            JOIN user_classes uc ON c.id = uc.class_id
            WHERE uc.user_id = $1
        """, user_id)

        # 6. Get classes the user is NOT enrolled in yet (Explore section/ Might not add it)
        explore_classes = await conn.fetch("""
            SELECT * FROM classes 
            WHERE id NOT IN (
                SELECT class_id FROM user_classes WHERE user_id = $1
            )
        """, user_id)

    # 7. Send this data to the frontend HTML template (notice this line is indented LESS, it's outside the database connection)
    return render(request, 'user_classes/templates/index.html', {
        'my_classes': my_classes,
        'explore_classes': explore_classes
    })


# 9. Return the modal HTML when the user clicks "Join Class"
async def join_modal(request):
    return render(request, 'user_classes/templates/join_modal.html')

# 10. Handle the submitted class code
@csrf_exempt
async def join_by_code(request):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)
    
    class_code = request.POST.get('class_code')
    token = request.COOKIES.get('access_token')
    
    if not token or not class_code:
        return render(request, 'user_classes/templates/join_modal.html', {'error_message': 'Missing code or unauthorized.'})
        
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # Check user session
        session = await conn.fetchrow("SELECT * FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return render(request, 'user_classes/templates/join_modal.html', {'error_message': 'Unauthorized.'})
            
        user_id = session['user_id']
        
        # Check if the class exists by code
        target_class = await conn.fetchrow("SELECT id FROM classes WHERE join_code=$1", class_code)
        if not target_class:
            return render(request, 'user_classes/templates/join_modal.html', {'error_message': 'Invalid class code.'})
            
        class_id = target_class['id']
        
        # Check if user already joined this class
        already_joined = await conn.fetchrow("SELECT id FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
        if already_joined:
            return render(request, 'user_classes/templates/join_modal.html', {'error_message': 'You are already in this class.'})
        
        try:
            # Add user to the class!
            await conn.execute("INSERT INTO user_classes(user_id, class_id) VALUES($1, $2)", user_id, class_id)
            

            response = HttpResponse("Joined successfully!")
            response['HX-Redirect'] = '/classes/'
            return response
        except Exception as e:
            return render(request, 'user_classes/templates/join_modal.html', {'error_message': 'Error joining class.'})


# 11. Return the create class modal HTML when user clicks the + button
async def create_modal(request):
    return render(request, 'user_classes/templates/create_class_modal.html')


# 12. Handle the submitted create class form
@csrf_exempt
async def create_class(request):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)
    
    course_code = request.POST.get('course_code')
    course_name = request.POST.get('course_name')
    description = request.POST.get('description', '')
    token = request.COOKIES.get('access_token')
    
    if not token or not course_code or not course_name:
        return render(request, 'user_classes/templates/create_class_modal.html', {'error_message': 'Missing required fields.'})
    
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # Check user session
        session = await conn.fetchrow("SELECT * FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return render(request, 'user_classes/templates/create_class_modal.html', {'error_message': 'Unauthorized.'})
        
        user_id = session['user_id']
        
        try:
            # Generate a unique join code
            join_code = ''.join(random.choices(string.ascii_uppercase + string.digits, k=6))
            
            # Create the class
            class_id = await conn.fetchval(
                "INSERT INTO classes(course_code, course_name, description, join_code) VALUES($1, $2, $3, $4) RETURNING id",
                course_code, course_name, description, join_code
            )
            
            # Add the creator to the class
            await conn.execute("INSERT INTO user_classes(user_id, class_id) VALUES($1, $2)", user_id, class_id)
            
            response = HttpResponse("Class created successfully!")
            response['HX-Redirect'] = '/classes/'
            return response
        except Exception as e:
            return render(request, 'user_classes/templates/create_class_modal.html', {'error_message': 'Error creating class.'})
