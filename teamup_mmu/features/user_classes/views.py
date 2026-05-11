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
            
            # Add the creator to the class as the ADMIN
            await conn.execute("INSERT INTO user_classes(user_id, class_id, role) VALUES($1, $2, 'admin')", user_id, class_id)
            
            response = HttpResponse("Class created successfully!")
            response['HX-Redirect'] = '/classes/'
            return response
        except Exception as e:
            return render(request, 'user_classes/templates/create_class_modal.html', {'error_message': 'Error creating class.'})

# Return the class details modal HTML when a user clicks on a class
async def class_details_modal(request, class_id):
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        target_class = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
        if not target_class:
            return HttpResponse("Class not found", status = 404)
            
        # --- Check if the logged-in user is an admin ---
        token = request.COOKIES.get('access_token')
        is_admin = False
        if token:
            session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
            if session:
                user_id = session['user_id']
                user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
                if user_role == 'admin':
                    is_admin = True
                    
        class_students = await conn.fetch("""
            SELECT u.id as user_id, u.email, p.username 
            FROM users u
            JOIN user_classes uc ON u.id = uc.user_id
            JOIN profiles p ON u.id = p.id
            WHERE uc.class_id = $1
        """, class_id)
        #do for number of groups here as well

        return render(request, 'user_classes/templates/class_details_modal.html', {
            'class_details': target_class,
            'class_students': class_students,
            'num_students': len(class_students), # for ttl number of students
            'is_admin': is_admin

        })


async def leave_class(request, class_id):
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        class_to_leave = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
        return render(request, 'user_classes/templates/leave_class.html', {
            'class_id' : class_id,
            'course_code' : class_to_leave['course_code'],
            'course_name' : class_to_leave['course_name']
        })

@csrf_exempt
async def leave_class_confirm(request):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)
    
    class_id = request.POST.get('class_id')
    token = request.COOKIES.get('access_token')
    
    if not token or not class_id:
        return HttpResponse("Missing info", status=400)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # 1. Figure out who is logged in
        session = await conn.fetchrow("SELECT * FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
            
        user_id = session['user_id']
        
        try: 
            await conn.execute("DELETE FROM user_classes WHERE user_id=$1 and class_id=$2", user_id, int(class_id))

            response = HttpResponse("Left successfully!")
            response['HX-Redirect'] = '/classes/'
            return response
        except Exception as e:
            return HttpResponse("Error leaving class", status=500)

@csrf_exempt
async def edit_class(request,class_id):
    if request.method != "POST":
        return HttpResponse("Invalid method", status=400)

    course_name = request.POST.get('course_name')
    course_code = request.POST.get('course_code')
    description = request.POST.get('description')

    if not course_code or not course_name:
        return HttpResponse("Missing Required Fields", status = 400)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        await conn.execute("""
            UPDATE classes 
            SET course_name = $1, course_code = $2, description = $3 
            WHERE id = $4
        """, course_name, course_code, description, class_id)
        return HttpResponse("Class Updated Successfully")
        
@csrf_exempt
async def remove_student(request,class_id,student_id):
    if request.method != "POST":
        return HttpResponse("Invalid method", status=400)
    
    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized. Please login to proceed ", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized. Please login to proceed ", status=401)
        
        user_id = session['user_id']

        user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
        # make sure the person removing the student is actually the class admin
        if user_role != 'admin':
            return HttpResponse("Forbidden", status=403)
        # admin cant remove themselves
        if str(user_id) == str(student_id):
            return HttpResponse("Cannot remove yourself ", status=400)
    
        # Delete the student from the class
        await conn.execute("DELETE FROM user_classes WHERE user_id=$1 and class_id=$2", student_id, class_id)
        # Calculate the new number of students
        new_count = await conn.fetchval("SELECT count(*) FROM user_classes WHERE class_id=$1", class_id)
        # Send back the updated counter with hx-swap-oob="true"
        response_html = f'<span id="num_students" hx-swap-oob="true">👤 {new_count} students</span>'

        return HttpResponse(response_html, status=200)