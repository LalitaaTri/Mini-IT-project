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
            SELECT c.*, uc.role as user_role FROM classes c
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
            return render(request, 'user_classes/templates/create_class_modal.html', {'error_message': f'Error creating class: {str(e)}'})

# Return the class details modal HTML when a user clicks on a class
async def class_details(request, class_id):
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
        
        class_admin = await conn.fetchval("SELECT username FROM profiles WHERE id=(SELECT user_id FROM user_classes WHERE class_id=$1 AND role='admin')", class_id)
        class_admin_email = await conn.fetchval("SELECT email FROM users WHERE id=(SELECT user_id FROM user_classes WHERE class_id=$1 AND role='admin')", class_id)

        class_students = await conn.fetch("""
            SELECT u.id as user_id, u.email, p.username, uc.role as user_role, u.email_verified
            FROM users u
            JOIN user_classes uc ON u.id = uc.user_id
            JOIN profiles p ON u.id = p.id
            WHERE uc.class_id = $1
            ORDER BY CASE WHEN uc.role = 'admin' THEN 0 ELSE 1 END, LOWER(p.username) ASC
        """, class_id)

        return render(request, 'user_classes/templates/class_details.html', {
            'class_details': target_class,
            'class_students': class_students,
            'num_students': len(class_students), # for ttl number of students
            'class_admin_name' : class_admin,
            'class_admin_email' : class_admin_email,
            'is_admin': is_admin,
            'current_user_id': user_id if 'user_id' in locals() else None,
            'active_tab': 'students'
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
            user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, int(class_id))
            if user_role == 'admin':
                return HttpResponse("Creator cannot leave the class. You must delete the class instead.", status=403)

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

async def share_code_modal(request, class_id):
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # Fetch the join code for this specific class
        join_code = await conn.fetchval("SELECT join_code FROM classes WHERE id=$1", class_id)
    return render(request, 'user_classes/templates/share_code_modal.html', {
        'join_code' : join_code
    })

async def delete_class_modal(request, class_id):
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # Fetch the class details to show the name in the modal
        target_class = await conn.fetchrow("SELECT course_name, course_code FROM classes WHERE id=$1", class_id)
        
    return render(request, 'user_classes/templates/delete_class_modal.html', {
        'class_id': class_id,
        'course_name': target_class['course_name'],
        'course_code': target_class['course_code']
    })

@csrf_exempt
async def delete_class_confirm(request):
    if request.method != "POST":
        return HttpResponse("Invalid method", status=400)
    
    # Grab the hidden input value from your HTML form
    class_id = int(request.POST.get('class_id'))
    
    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        
        user_id = session['user_id']
        user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
        
        # Make sure only the admin can delete the class
        if user_role != 'admin':
            return HttpResponse("Forbidden: Only the class admin can delete this class.", status=403)

        # 1. Delete all student connections to this class
        await conn.execute("DELETE FROM user_classes WHERE class_id=$1", class_id)
        
        # 2. Delete the actual class
        await conn.execute("DELETE FROM classes WHERE id=$1", class_id)

    # Tell HTMX to redirect the user back to the classes dashboard
    response = HttpResponse()
    response['HX-Redirect'] = "/classes/"
    return response

@csrf_exempt
async def class_tab(request, class_id, tab_name):
    # 1. Verify user's session token
    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        target_class = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
        if not target_class:
            return HttpResponse("Class not found", status=404)

        # 2. Verify that the user is actually enrolled in this class
        user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
        if not user_role:
            return HttpResponse("Forbidden: You are not in this class", status=403)
        is_admin = (user_role == 'admin')

        # 3. Build context for rendering
        context = {
            'class_details': target_class,
            'active_tab': tab_name,
            'is_admin': is_admin,
            'current_user_id': user_id,
        }

        # 4. Fetch the specific data needed for the requested tab
        if tab_name == 'students':
            class_students = await conn.fetch("""
                SELECT u.id as user_id, u.email, p.username, uc.role as user_role, u.email_verified
                FROM users u
                JOIN user_classes uc ON u.id = uc.user_id
                JOIN profiles p ON u.id = p.id
                WHERE uc.class_id = $1
                ORDER BY CASE WHEN uc.role = 'admin' THEN 0 ELSE 1 END, LOWER(p.username) ASC
            """, class_id)
            context['class_students'] = class_students
        elif tab_name == 'groups':
            context['class_groups'] = []
        elif tab_name == 'announcements':
            announcements = await conn.fetch("""
                SELECT ca.*, p.username as sender_name, u.email as sender_email
                FROM class_announcements ca
                JOIN users u ON ca.sender_id = u.id
                LEFT JOIN profiles p ON u.id = p.id
                WHERE ca.class_id = $1
                ORDER BY ca.created_at ASC
            """, class_id)
            context['announcements'] = announcements

        # 5. Render and return the partial tab container template
        return render(request, 'user_classes/templates/tabs_section.html', context)


@csrf_exempt
async def send_announcement(request, class_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    content = request.POST.get('content', '').strip()
    if not content:
        return HttpResponse("Content cannot be empty", status=400)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        target_class = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
        if not target_class:
            return HttpResponse("Class not found", status=404)

        # Only class admins can post announcements
        user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
        if user_role != 'admin':
            return HttpResponse("Forbidden: Only admin can post announcements", status=403)

        # Insert new announcement
        await conn.execute("""
            INSERT INTO class_announcements (class_id, sender_id, content)
            VALUES ($1, $2, $3)
        """, class_id, user_id, content)

        # Fetch the updated list of announcements to reload the feed
        announcements = await conn.fetch("""
            SELECT ca.*, p.username as sender_name, u.email as sender_email
            FROM class_announcements ca
            JOIN users u ON ca.sender_id = u.id
            LEFT JOIN profiles p ON u.id = p.id
            WHERE ca.class_id = $1
            ORDER BY ca.created_at ASC
        """, class_id)

        context = {
            'class_details': target_class,
            'active_tab': 'announcements',
            'is_admin': True,
            'current_user_id': user_id,
            'announcements': announcements
        }
        return render(request, 'user_classes/templates/tabs_section.html', context)

@csrf_exempt
async def add_students_modal(request, class_id):
    # 1. Verify the user has a session token
    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # 2. Check if session is active
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        # 3. Check if the current user is an admin of the class
        user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
        if user_role != 'admin':
            return HttpResponse("Forbidden: Only class admins can invite students", status=403)

        # 4. Fetch 5 suggested students who are NOT in the class yet
        suggestions = await conn.fetch("""
            SELECT u.id, u.email, p.username, p.program
            FROM users u
            JOIN profiles p ON u.id = p.id
            WHERE u.id NOT IN (
                SELECT user_id FROM user_classes WHERE class_id = $1
            ) AND u.inactive = FALSE
              AND u.email_verified = TRUE
            LIMIT 5
        """, class_id)

    # 5. Render the modal template with the Suggestions context
    return render(request, 'user_classes/templates/add_students_modal.html', {
        'class_id': class_id,
        'suggestions': suggestions
    })

@csrf_exempt
async def add_students_search(request, class_id):
    # 1. Verify the user has a session token
    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    # 2. Get the search input from GET params (HTMX sends this in query param)
    query = request.GET.get('search_query', '').strip()
    if not query:
        # If the input is empty, return an empty results list
        return render(request, 'user_classes/templates/search_results.html', {
            'class_id': class_id,
            'results': []
        })

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # 3. Perform a case-insensitive search by username or email
        search_pattern = f"%{query}%"
        results = await conn.fetch("""
            SELECT u.id, u.email, p.username, p.program
            FROM users u
            JOIN profiles p ON u.id = p.id
            WHERE u.id NOT IN (
                SELECT user_id FROM user_classes WHERE class_id = $1
            ) AND u.inactive = FALSE
              AND u.email_verified = TRUE
              AND (p.username ILIKE $2 OR u.email ILIKE $2)
            LIMIT 10
        """, class_id, search_pattern)

    # 4. Render the search results cards partial template
    return render(request, 'user_classes/templates/search_results.html', {
        'class_id': class_id,
        'results': results
    })

@csrf_exempt
async def add_student_direct(request, class_id, student_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    # 1. Verify the user has a session token
    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # 2. Check session is active
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        # 3. Check if the current user is an admin of the class
        user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
        if user_role != 'admin':
            return HttpResponse("Forbidden", status=403)

        # 4. Enroll the student with role='student'
        await conn.execute("INSERT INTO user_classes (user_id, class_id, role) VALUES ($1, $2, 'student')", student_id, class_id)

        # 5. Get the updated total count of students in the class
        new_count = await conn.fetchval("SELECT count(*) FROM user_classes WHERE class_id=$1", class_id)

    # 6. Return the direct HTML response (with OOB swap)
    response_html = (
        f'<button disabled style="background: #e2fce6; color: #1e7e34; border: 1px solid #c2e4c3; '
        f'padding: 6px 12px; border-radius: 6px; font-weight: 600; cursor: not-allowed;">Added</button>'
        f'<span id="num_students" hx-swap-oob="true">👤 {new_count} students</span>'
    )
    return HttpResponse(response_html, status=200)

@csrf_exempt
async def upload_csv(request, class_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    # 1. Verify the user has a session token
    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    # 2. Get the uploaded file
    csv_file = request.FILES.get('csv_file')
    if not csv_file:
        return HttpResponse("<span style='color: red;'>Please choose a CSV file first.</span>", status=200)

    # 3. Basic extension verification
    if not csv_file.name.endswith('.csv'):
        return HttpResponse("<span style='color: red;'>Invalid file format. Please upload a .csv file.</span>", status=200)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # 4. Check session is active
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        # 5. Check if the current user is an admin of the class
        user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
        if user_role != 'admin':
            return HttpResponse("Forbidden", status=403)

        # 6. Parse the CSV file contents
        import csv
        import io
        
        file_data = csv_file.read().decode('utf-8')
        csv_data = csv.reader(io.StringIO(file_data))
        
        emails_to_enroll = []
        for row in csv_data:
            if not row:
                continue
            # Trim whitespace and convert to lowercase for matching. Only allows @mmu.edu.my emails
            email = row[0].strip().lower()
            if email and ('@mmu.edu.my' in email):
                emails_to_enroll.append(email)

        success_count = 0
        skipped_count = 0
        failed_emails = []

        # 7. Enroll students from the emails parsed
        for email in emails_to_enroll:
            # Look up student by email
            student = await conn.fetchrow("SELECT id FROM users WHERE email=$1", email)
            
            if not student:
                # User does not exist, create a stub account for them
                student_id = await conn.fetchval(
                    "INSERT INTO users (email, password, email_verified) VALUES ($1, 'PENDING_INVITE', FALSE) RETURNING id",
                    email
                )
                # Create a blank profile matching their new user id
                await conn.execute("INSERT INTO profiles (id, username) VALUES ($1, $2)", student_id, None)
                
                # Print the simulated email invitation link to the console log
                invite_url = f"http://127.0.0.1:8000/signup/?email={email}"
                print(f"\n[EMAIL SIMULATION] Sent invite to {email}: {invite_url}\n")
            else:
                student_id = student['id']

            # Check if student is already in the class
            already_in = await conn.fetchval("SELECT 1 FROM user_classes WHERE user_id=$1 AND class_id=$2", student_id, class_id)
            if already_in:
                skipped_count += 1
                continue

            # Enroll student in the class
            await conn.execute("INSERT INTO user_classes (user_id, class_id, role) VALUES ($1, $2, 'student')", student_id, class_id)
            success_count += 1


        # 8. Fetch the new student count
        new_count = await conn.fetchval("SELECT count(*) FROM user_classes WHERE class_id=$1", class_id)

    # 9. Return status response (with OOB swap)
    if success_count > 0:
        msg = f"<span style='color: green;'>Successfully added {success_count} students!</span>"
    else:
        msg = "<span style='color: #4a5568;'>No new students were added.</span>"

    if failed_emails:
        msg += f" <span style='color: #ef4444; font-size: 0.85rem;' title='{', '.join(failed_emails)}'>({len(failed_emails)} emails not found)</span>"

    response_html = f"{msg}<span id='num_students' hx-swap-oob='true'>👤 {new_count} students</span>"
    return HttpResponse(response_html, status=200)
