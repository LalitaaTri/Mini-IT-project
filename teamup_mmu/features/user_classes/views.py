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
    code = request.GET.get('code', '')
    return render(request, 'user_classes/templates/create_class_modal.html', {'code': code})


# 12. Handle the submitted create class form
@csrf_exempt
async def create_class(request):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)
    
    course_code = request.POST.get('course_code')
    course_name = request.POST.get('course_name')
    section = request.POST.get('section')
    trimester_year = request.POST.get('trimester_year')
    trimester_num = request.POST.get('trimester_num')
    description = request.POST.get('description', '')
    token = request.COOKIES.get('access_token')
    
    if not token or not course_code or not course_name or not section or not trimester_year or not trimester_num:
        return render(request, 'user_classes/templates/create_class_modal.html', {'error_message': 'Missing required fields.'})
    
    trimester = f"{int(trimester_year) % 100:02d}{trimester_num}"
    
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
                "INSERT INTO classes(course_code, course_name, description, join_code, section, trimester) VALUES($1, $2, $3, $4, $5, $6) RETURNING id",
                course_code, course_name, description, join_code, section, trimester
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
            LEFT JOIN profiles p ON u.id = p.id
            WHERE uc.class_id = $1
            ORDER BY CASE WHEN uc.role = 'admin' THEN 0 ELSE 1 END, LOWER(COALESCE(p.username, u.email)) ASC
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
        # Return empty body so the card gets removed by outerHTML swap, with OOB update for the counter
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
                LEFT JOIN profiles p ON u.id = p.id
                WHERE uc.class_id = $1
                ORDER BY CASE WHEN uc.role = 'admin' THEN 0 ELSE 1 END, LOWER(COALESCE(p.username, u.email)) ASC
            """, class_id)
            context['class_students'] = class_students
        elif tab_name == 'groups':
            # Clean up any empty groups in DB that shouldn't be there
            await conn.execute("DELETE FROM groups WHERE class_id = $1 AND leader_id IS NULL", class_id)

            # 1. Query all coursework Teams that belong to this class by class_id
            class_groups = await conn.fetch("""
                SELECT g.id, g.name, g.description, g.whatsapp_link, g.max_members, g.join_code, g.leader_id,
                       p.username as leader_username,
                       (SELECT COUNT(*) FROM group_members gm WHERE gm.group_id = g.id) as current_members_count
                FROM groups g
                LEFT JOIN profiles p ON g.leader_id = p.id
                WHERE g.class_id = $1
                ORDER BY g.id ASC
            """, class_id)

            # 2. Get all members of all groups in this class
            group_members_rows = await conn.fetch("""
                SELECT gm.group_id, u.id as user_id, p.username, u.email
                FROM group_members gm
                JOIN users u ON gm.user_id = u.id
                LEFT JOIN profiles p ON u.id = p.id
                WHERE gm.group_id IN (
                    SELECT id FROM groups WHERE class_id = $1
                )
                ORDER BY gm.joined_at ASC
            """, class_id)

            # 3. Get pending requests for groups in this class
            requests_rows = await conn.fetch("""
                SELECT qr.id as request_id, qr.group_id, qr.student_id, p.username as student_username, u.email as student_email
                FROM group_requests qr
                JOIN users u ON qr.student_id = u.id
                LEFT JOIN profiles p ON u.id = p.id
                WHERE qr.status = 'pending' AND qr.group_id IN (
                    SELECT id FROM groups WHERE class_id = $1
                )
                ORDER BY qr.created_at ASC
            """, class_id)

            # 4. Map members & requests to their respective team dicts
            class_groups_list = []
            for g in class_groups:
                g_dict = dict(g)
                # Filter members belonging to this team
                g_members = []
                for row in group_members_rows:
                    if row['group_id'] == g['id']:
                        g_members.append({
                            'user_id': row['user_id'],
                            'username': row['username'] or row['email'].split('@')[0]
                        })
                g_dict['members'] = g_members
                
                # Filter requests (only visible to team leader or admin)
                g_requests = []
                if g['leader_id'] == user_id or is_admin:
                    for req in requests_rows:
                        if req['group_id'] == g['id']:
                            # A user cannot approve or decline their own request
                            if req['student_id'] != user_id:
                                g_requests.append({
                                    'request_id': req['request_id'],
                                    'student_id': req['student_id'],
                                    'username': req['student_username'] or req['student_email'].split('@')[0]
                                })
                g_dict['pending_requests'] = g_requests
                class_groups_list.append(g_dict)

            # Generate virtual / placeholder team dicts for unclaimed team numbers up to max_groups
            existing_names = {g['name'] for g in class_groups_list}
            max_groups_limit = class_details['max_groups'] or 10
            max_members_limit = class_details['max_members_per_group'] or 5
            for i in range(1, max_groups_limit + 1):
                t_name = f"Team {i}"
                if t_name not in existing_names:
                    class_groups_list.append({
                        'id': None,
                        'team_number': i,
                        'name': t_name,
                        'description': None,
                        'whatsapp_link': None,
                        'max_members': max_members_limit,
                        'join_code': None,
                        'leader_id': None,
                        'leader_username': None,
                        'current_members_count': 0,
                        'members': [],
                        'pending_requests': []
                    })

            def get_team_num(item):
                name = item.get('name', '')
                if name.startswith('Team '):
                    try:
                        return int(name.split('Team ')[1])
                    except ValueError:
                        return 9999
                return 9999
            class_groups_list.sort(key=get_team_num)

            # 5. Check if the logged-in user is already in a team in this class
            user_group_row = await conn.fetchrow("""
                SELECT gm.group_id, g.name 
                FROM group_members gm
                JOIN groups g ON gm.group_id = g.id
                WHERE gm.user_id = $1 AND g.class_id = $2
            """, user_id, class_id)
            user_group_id = user_group_row['group_id'] if user_group_row else None
            user_group_name = user_group_row['name'] if user_group_row else None

            # 6. Check if the logged-in user has a pending request in this class
            user_pending_row = await conn.fetchrow("""
                SELECT qr.group_id, g.name FROM group_requests qr
                JOIN groups g ON qr.group_id = g.id
                WHERE qr.student_id = $1 AND qr.status = 'pending' AND g.class_id = $2
            """, user_id, class_id)
            user_pending_request_group_id = user_pending_row['group_id'] if user_pending_row else None
            user_pending_request_group_name = user_pending_row['name'] if user_pending_row else None

            # 7. Check if the logged-in user has a declined request in this class
            user_declined_row = await conn.fetchrow("""
                SELECT qr.id as request_id, qr.group_id, g.name FROM group_requests qr
                JOIN groups g ON qr.group_id = g.id
                WHERE qr.student_id = $1 AND qr.status = 'declined' AND g.class_id = $2
            """, user_id, class_id)
            user_declined_request_id = user_declined_row['request_id'] if user_declined_row else None
            user_declined_group_name = user_declined_row['name'] if user_declined_row else None

            # 8. Load context values
            context['class_teams'] = class_groups_list
            context['user_team_id'] = user_group_id
            context['user_team_name'] = user_group_name
            context['user_pending_request_team_id'] = user_pending_request_group_id
            context['user_pending_request_team_name'] = user_pending_request_group_name
            context['user_declined_request_id'] = user_declined_request_id
            context['user_declined_team_name'] = user_declined_group_name
            context['started_teams_count'] = sum(1 for g in class_groups_list if g['leader_id'] is not None)

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
        
        students_to_enroll = []
        for row in csv_data:
            if not row or len(row) < 2:
                continue
            username = row[0].strip()
            email = row[1].strip().lower()
            if email and ('@mmu.edu.my' in email or '@student.mmu.edu.my' in email):
                students_to_enroll.append((username, email))

        success_count = 0
        skipped_count = 0
        failed_emails = []

        # 7. Enroll students from the parsed data
        for username, email in students_to_enroll:
            # Look up student by email
            student = await conn.fetchrow("SELECT id FROM users WHERE email=$1", email)
            
            if not student:
                # User does not exist, create a stub account for them
                student_id = await conn.fetchval(
                    "INSERT INTO users (email, password, email_verified, inactive) VALUES ($1, 'PENDING_INVITE', FALSE, TRUE) RETURNING id",
                    email
                )
                
                # Ensure unique username
                username_exists = await conn.fetchval("SELECT 1 FROM profiles WHERE username=$1", username)
                final_username = username
                if username_exists:
                    final_username = f"{username}_{random.randint(100, 999)}"
                
                # Create a profile matching their new user id
                await conn.execute("INSERT INTO profiles (id, username) VALUES ($1, $2)", student_id, final_username)
                
                # Print the simulated email invitation link to the console log
                invite_url = f"http://127.0.0.1:8000/signup/?email={email}"
                print(f"\n[EMAIL SIMULATION] Sent invite to {email}: {invite_url}\n")
            else:
                student_id = student['id']
                # Ensure existing student has a profile and username populated from CSV if missing
                profile_exists = await conn.fetchval("SELECT 1 FROM profiles WHERE id=$1", student_id)
                if not profile_exists:
                    username_exists = await conn.fetchval("SELECT 1 FROM profiles WHERE username=$1", username)
                    final_username = username
                    if username_exists:
                        final_username = f"{username}_{random.randint(100, 999)}"
                    await conn.execute("INSERT INTO profiles (id, username) VALUES ($1, $2)", student_id, final_username)
                else:
                    # Update username with CSV one if the student hasn't registered (unverified) yet
                    email_verified = await conn.fetchval("SELECT email_verified FROM users WHERE id=$1", student_id)
                    if not email_verified:
                        username_exists = await conn.fetchval("SELECT 1 FROM profiles WHERE username=$1 AND id!=$2", username, student_id)
                        final_username = username
                        if username_exists:
                            final_username = f"{username}_{random.randint(100, 999)}"
                        await conn.execute("UPDATE profiles SET username=$1 WHERE id=$2", final_username, student_id)

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



@csrf_exempt
async def teams_settings_modal(request, class_id):
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
        if user_role != 'admin':
            return HttpResponse("Forbidden: Only class admins can modify settings", status=403)

        target_class = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
        if not target_class:
            return HttpResponse("Class not found", status=404)

    return render(request, 'user_classes/templates/teams_settings_modal.html', {
        'class_id': class_id,
        'class_details': target_class,
    })
# when they save the teams settings
@csrf_exempt
async def save_group_settings(request, class_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    # Note: hx-post is sending teams_enabled checkbox
    groups_enabled = request.POST.get('teams_enabled') == 'on'
    max_groups = request.POST.get('max_teams')
    max_members = request.POST.get('max_members')
    teams_frozen = request.POST.get('teams_frozen') == 'on'

    if groups_enabled and (not max_groups or not max_members):
        return HttpResponse("<span style='color: red;'>Missing limits fields.</span>", status=400)

    try:
        max_groups = int(max_groups) if max_groups else 10
        max_members = int(max_members) if max_members else 5
    except ValueError:
        return HttpResponse("<span style='color: red;'>Values must be integers.</span>", status=400)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
        if user_role != 'admin':
            return HttpResponse("Forbidden", status=403)

        target_class = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
        if not target_class:
            return HttpResponse("Class not found", status=404)

        # Update limits in classes table
        await conn.execute("""
            UPDATE classes 
            SET groups_enabled = $1, max_groups = $2, max_members_per_group = $3, teams_frozen = $4
            WHERE id = $5
        """, groups_enabled, max_groups, max_members, teams_frozen, class_id)

        if groups_enabled:
            # Clean up any existing empty/unclaimed groups in the DB so they don't clutter the table
            await conn.execute("DELETE FROM groups WHERE class_id = $1 AND leader_id IS NULL", class_id)
        else:
            # Delete ALL teams for this class when team formation is disabled
            # CASCADE handles group_members and group_requests automatically
            await conn.execute("""
                DELETE FROM groups 
                WHERE class_id = $1
            """, class_id)

    # Return success HTML which HTMX will inject. 
    # It closes the modal after 1s and tells HTMX to refresh the groups/teams tab view
    response_html = (
        "<span style='color: green;'>Settings saved successfully!</span>"
        "<script>"
        "setTimeout(() => { document.getElementById('team-settings-modal').remove(); }, 1000);"
        "htmx.ajax('GET', '/classes/class_details/" + str(class_id) + "/tab/groups/', '#tabs-section');"
        "</script>"
    )
    return HttpResponse(response_html)

@csrf_exempt
async def handover_class(request, class_id):
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
        if user_role != 'admin':
            return HttpResponse("Forbidden: Only class admins can transfer ownership", status=403)

        # --- HANDLE GET REQUEST: OPEN THE MODAL ---
        if request.method == 'GET':
            target_class = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
            if not target_class:
                return HttpResponse("Class not found", status=404)

            class_students = await conn.fetch("""
                SELECT u.id as user_id, u.email, p.username
                FROM users u
                JOIN user_classes uc ON u.id = uc.user_id
                LEFT JOIN profiles p ON u.id = p.id
                WHERE uc.class_id = $1 AND uc.role = 'student'
                ORDER BY LOWER(COALESCE(p.username, u.email)) ASC
            """, class_id)

            return render(request, 'user_classes/templates/handover_modal.html', {
                'class_id': class_id,
                'class_details': target_class,
                'class_students': class_students
            })

        # --- HANDLE POST REQUEST: PROCESS THE HANDOVER ---
        elif request.method == 'POST':
            new_admin_id = request.POST.get('new_admin_id')
            if not new_admin_id:
                return HttpResponse("<span style='color: red;'>Please select a user to promote.</span>")

            try:
                new_admin_id = int(new_admin_id)
            except ValueError:
                return HttpResponse("<span style='color: red;'>Invalid user ID.</span>")

            if user_id == new_admin_id:
                return HttpResponse("<span style='color: red;'>You cannot hand over the class to yourself.</span>")

            target_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", new_admin_id, class_id)
            if target_role != 'student':
                return HttpResponse("<span style='color: red;'>Target user is not a student in this class.</span>")

            # Promote the selected student to admin
            await conn.execute("UPDATE user_classes SET role='admin' WHERE user_id=$1 AND class_id=$2", new_admin_id, class_id)
            
            # Demote current admin to student
            await conn.execute("UPDATE user_classes SET role='student' WHERE user_id=$1 AND class_id=$2", user_id, class_id)

            # Return success message and redirect after 1 second
            response_html = (
                "<span style='color: green; font-weight: bold;'>Ownership transferred! Redirecting...</span>"
                "<script>"
                f"setTimeout(() => {{ window.location.href = '/classes/class_details/{class_id}/'; }}, 1000);"
                "</script>"
            )
            return HttpResponse(response_html)

        return HttpResponse("Invalid method", status=400)



@csrf_exempt
async def lead_team_modal(request, team_id):
    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        team = await conn.fetchrow("SELECT * FROM groups WHERE id = $1", team_id)
        if not team:
            return HttpResponse("Team not found", status=404)

        if team['leader_id'] is not None:
            return HttpResponse("Team already has a leader", status=400)

    return render(request, 'user_classes/templates/lead_team_modal.html', {
        'team': team,
        'is_edit': False
    })


@csrf_exempt
async def edit_team_modal(request, team_id):
    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        team = await conn.fetchrow("SELECT * FROM groups WHERE id = $1", team_id)
        if not team:
            return HttpResponse("Team not found", status=404)

        if team['leader_id'] != user_id:
            return HttpResponse("Forbidden: Only the team leader can edit team info", status=403)

    return render(request, 'user_classes/templates/lead_team_modal.html', {
        'team': team,
        'is_edit': True
    })


@csrf_exempt
async def save_team_info(request, team_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    description = request.POST.get('description', '').strip()
    whatsapp_link = request.POST.get('whatsapp_link', '').strip()

    if whatsapp_link and not (whatsapp_link.startswith('http://') or whatsapp_link.startswith('https://')):
        return HttpResponse("<span style='color: red;'>WhatsApp link must be a valid URL starting with http:// or https://</span>", status=400)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        team = await conn.fetchrow("SELECT * FROM groups WHERE id = $1", team_id)
        if not team:
            return HttpResponse("Team not found", status=404)
        class_id = team['class_id']

        # Check if teams are frozen and user is not admin
        class_details = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
        is_admin = await conn.fetchval("SELECT 1 FROM user_classes WHERE user_id=$1 AND class_id=$2 AND role='admin'", user_id, class_id)
        if class_details and class_details['teams_frozen'] and not is_admin:
            return HttpResponse("<span style='color: red;'>Teams are frozen for this class. Changes are not allowed.</span>", status=403)

        # Case 1: Claiming an unclaimed team
        if team['leader_id'] is None:
            # Check if user is already in a team in this class
            in_team = await conn.fetchval("""
                SELECT COUNT(*) FROM group_members gm
                JOIN groups g ON gm.group_id = g.id
                WHERE gm.user_id = $1 AND g.class_id = $2
            """, user_id, class_id)
            if in_team > 0:
                return HttpResponse("<span style='color: red;'>You are already a member of a team in this class! Leave your team first.</span>", status=400)

            # Claim as leader and update details
            await conn.execute("""
                UPDATE groups 
                SET leader_id = $1, description = $2, whatsapp_link = $3, created_by = $1
                WHERE id = $4
            """, user_id, description, whatsapp_link or None, team_id)

            # Automatically join as first member
            await conn.execute("""
                INSERT INTO group_members (group_id, user_id, joined_at)
                VALUES ($1, $2, CURRENT_TIMESTAMP)
            """, team_id, user_id)
        
        # Case 2: Editing an existing team (only leader can do this)
        else:
            if team['leader_id'] != user_id:
                return HttpResponse("<span style='color: red;'>Forbidden: Only the team leader can modify team info.</span>", status=403)

            await conn.execute("""
                UPDATE groups 
                SET description = $1, whatsapp_link = $2
                WHERE id = $3
            """, description, whatsapp_link or None, team_id)

    # Return success HTML which HTMX will inject.
    # It closes the modal after 1s and tells HTMX to refresh the teams tab view
    response_html = (
        "<span style='color: green;'>Team info saved successfully!</span>"
        "<script>"
        "setTimeout(() => { document.getElementById('lead-team-modal').remove(); }, 1000);"
        "htmx.ajax('GET', '/classes/class_details/" + str(class_id) + "/tab/groups/', '#tabs-section');"
        "</script>"
    )
    return HttpResponse(response_html)


@csrf_exempt
async def claim_new_team_modal(request, class_id, team_number):
    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        target_class = await conn.fetchrow("SELECT * FROM classes WHERE id = $1", class_id)
        if not target_class:
            return HttpResponse("Class not found", status=404)

        # Check if user is already in a team in this class
        in_team = await conn.fetchval("""
            SELECT COUNT(*) FROM group_members gm
            JOIN groups g ON gm.group_id = g.id
            WHERE gm.user_id = $1 AND g.class_id = $2
        """, user_id, class_id)
        if in_team > 0:
            return HttpResponse("<div style='padding:20px; background:white; border-radius:12px; color:red; text-align:center;'>You are already in a team in this class! Leave your team first.</div>", status=400)

        team_name = f"Team {team_number}"
        # Check if this team name was already created by someone else
        existing_team = await conn.fetchrow("SELECT * FROM groups WHERE class_id = $1 AND name = $2", class_id, team_name)
        if existing_team:
            return HttpResponse("<div style='padding:20px; background:white; border-radius:12px; color:red; text-align:center;'>This team was just claimed by someone else!</div>", status=400)

        virtual_team = {
            'id': 0,
            'name': team_name,
            'description': f"Assignment team {team_number} for {target_class['course_code']}",
            'whatsapp_link': ''
        }

    return render(request, 'user_classes/templates/lead_team_modal.html', {
        'team': virtual_team,
        'is_edit': False,
        'is_new': True,
        'class_id': class_id,
        'team_number': team_number
    })


@csrf_exempt
async def create_new_team(request, class_id, team_number):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    description = request.POST.get('description', '').strip()
    whatsapp_link = request.POST.get('whatsapp_link', '').strip()

    if whatsapp_link and not (whatsapp_link.startswith('http://') or whatsapp_link.startswith('https://')):
        return HttpResponse("<span style='color: red;'>WhatsApp link must be a valid URL starting with http:// or https://</span>", status=400)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        target_class = await conn.fetchrow("SELECT * FROM classes WHERE id = $1", class_id)
        if not target_class:
            return HttpResponse("Class not found", status=404)

        if target_class['teams_frozen']:
            return HttpResponse("<span style='color: red;'>Teams are frozen for this class. Changes are not allowed.</span>", status=403)

        in_team = await conn.fetchval("""
            SELECT COUNT(*) FROM group_members gm
            JOIN groups g ON gm.group_id = g.id
            WHERE gm.user_id = $1 AND g.class_id = $2
        """, user_id, class_id)
        if in_team > 0:
            return HttpResponse("<span style='color: red;'>You are already a member of a team in this class! Leave your team first.</span>", status=400)

        team_name = f"Team {team_number}"
        existing_team = await conn.fetchrow("SELECT * FROM groups WHERE class_id = $1 AND name = $2", class_id, team_name)
        if existing_team:
            return HttpResponse("<span style='color: red;'>This team was just claimed by someone else!</span>", status=400)

        join_code = ''.join(random.choices(string.ascii_uppercase + string.digits, k=6))
        new_group_id = await conn.fetchval("""
            INSERT INTO groups (name, description, whatsapp_link, is_general, class_name, class_id, leader_id, created_by, max_members, join_code)
            VALUES ($1, $2, $3, FALSE, $4, $5, $6, $6, $7, $8)
            RETURNING id
        """, team_name, description, whatsapp_link or None, target_class['course_name'], class_id, user_id, target_class['max_members_per_group'], join_code)

        await conn.execute("""
            INSERT INTO group_members (group_id, user_id, joined_at)
            VALUES ($1, $2, CURRENT_TIMESTAMP)
        """, new_group_id, user_id)

    response_html = (
        "<span style='color: green;'>Team claimed and created successfully!</span>"
        "<script>"
        "setTimeout(() => { document.getElementById('lead-team-modal').remove(); }, 1000);"
        "htmx.ajax('GET', '/classes/class_details/" + str(class_id) + "/tab/groups/', '#tabs-section');"
        "</script>"
    )
    return HttpResponse(response_html)


@csrf_exempt
async def join_team(request, team_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        team = await conn.fetchrow("SELECT * FROM groups WHERE id = $1", team_id)
        if not team:
            return HttpResponse("Team not found", status=404)
        class_id = team['class_id']

        # Check if teams are frozen and user is not admin
        class_details = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
        is_admin = await conn.fetchval("SELECT 1 FROM user_classes WHERE user_id=$1 AND class_id=$2 AND role='admin'", user_id, class_id)
        if class_details and class_details['teams_frozen'] and not is_admin:
            return HttpResponse("Teams are frozen for this class. Join requests are not allowed.", status=403)

        # Check if already in a team in this class
        in_team = await conn.fetchval("""
            SELECT COUNT(*) FROM group_members gm
            JOIN groups g ON gm.group_id = g.id
            WHERE gm.user_id = $1 AND g.class_id = $2
        """, user_id, class_id)
        if in_team > 0:
            return HttpResponse("You are already in a team in this class", status=400)

        # Check if team is full
        current_members = await conn.fetchval("SELECT COUNT(*) FROM group_members WHERE group_id = $1", team_id)
        if current_members >= team['max_members']:
            return HttpResponse("Team is already full", status=400)

        # Clear any existing pending or declined requests for this student in this class
        await conn.execute("""
            DELETE FROM group_requests 
            WHERE student_id = $1 AND group_id IN (
                SELECT id FROM groups WHERE class_id = $2
            )
        """, user_id, class_id)

        # Create new pending request
        await conn.execute("""
            INSERT INTO group_requests (group_id, student_id, status, created_at)
            VALUES ($1, $2, 'pending', CURRENT_TIMESTAMP)
        """, team_id, user_id)

        return await class_tab(request, class_id, 'groups')


@csrf_exempt
async def leave_team(request, team_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        team = await conn.fetchrow("SELECT * FROM groups WHERE id = $1", team_id)
        if not team:
            return HttpResponse("Team not found", status=404)
        class_id = team['class_id']

        # Check if teams are frozen and user is not admin
        class_details = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
        is_admin = await conn.fetchval("SELECT 1 FROM user_classes WHERE user_id=$1 AND class_id=$2 AND role='admin'", user_id, class_id)
        if class_details and class_details['teams_frozen'] and not is_admin:
            return HttpResponse("Teams are frozen for this class. Leaving teams is not allowed.", status=403)

        # Check if user is actually a member of this team
        is_member = await conn.fetchval("SELECT COUNT(*) FROM group_members WHERE group_id = $1 AND user_id = $2", team_id, user_id)
        if is_member == 0:
            return HttpResponse("You are not a member of this team", status=400)

        # Remove member
        await conn.execute("DELETE FROM group_members WHERE group_id = $1 AND user_id = $2", team_id, user_id)
        
        # Delete any existing invites for this user to this group so they can be freshly re-invited later
        await conn.execute("DELETE FROM group_invites WHERE group_id = $1 AND receiver_id = $2", team_id, user_id)

        # If user was the leader
        if team['leader_id'] == user_id:
            # Check if there are other members left
            next_member = await conn.fetchrow("SELECT user_id FROM group_members WHERE group_id = $1 ORDER BY joined_at ASC LIMIT 1", team_id)
            if next_member:
                # Assign next member as leader
                await conn.execute("UPDATE groups SET leader_id = $1 WHERE id = $2", next_member['user_id'], team_id)
            else:
                # Revert team to empty/unclaimed state
                await conn.execute("""
                    UPDATE groups 
                    SET leader_id = NULL, description = NULL, whatsapp_link = NULL, created_by = NULL
                    WHERE id = $1
                """, team_id)

        return await class_tab(request, class_id, 'groups')


@csrf_exempt
async def cancel_request(request, team_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        team = await conn.fetchrow("SELECT * FROM groups WHERE id = $1", team_id)
        if not team:
            return HttpResponse("Team not found", status=404)
        class_id = team['class_id']

        # Check if teams are frozen and user is not admin
        class_details = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
        is_admin = await conn.fetchval("SELECT 1 FROM user_classes WHERE user_id=$1 AND class_id=$2 AND role='admin'", user_id, class_id)
        if class_details and class_details['teams_frozen'] and not is_admin:
            return HttpResponse("Teams are frozen for this class. Cancelling requests is not allowed.", status=403)

        # Delete pending request
        await conn.execute("DELETE FROM group_requests WHERE group_id = $1 AND student_id = $2 AND status = 'pending'", team_id, user_id)

        return await class_tab(request, class_id, 'groups')


@csrf_exempt
async def approve_request(request, request_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        # Fetch request details
        req = await conn.fetchrow("SELECT * FROM group_requests WHERE id = $1", request_id)
        if not req:
            return HttpResponse("Request not found", status=404)

        team_id = req['group_id']
        student_id = req['student_id']

        # Fetch team and verify leader / admin authority
        team = await conn.fetchrow("SELECT * FROM groups WHERE id = $1", team_id)
        if not team:
            return HttpResponse("Team not found", status=404)
        class_id = team['class_id']

        user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
        is_admin = user_role == 'admin'

        if team['leader_id'] != user_id and not is_admin:
            return HttpResponse("Forbidden", status=403)

        # Check if teams are frozen and user is not admin
        class_details = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
        if class_details and class_details['teams_frozen'] and not is_admin:
            return HttpResponse("Teams are frozen for this class. Approving requests is not allowed.", status=403)

        # Check if student is already in a team in this class
        in_team = await conn.fetchval("""
            SELECT COUNT(*) FROM group_members gm
            JOIN groups g ON gm.group_id = g.id
            WHERE gm.user_id = $1 AND g.class_id = $2
        """, student_id, class_id)
        if in_team > 0:
            # Clean up obsolete request
            await conn.execute("DELETE FROM group_requests WHERE id = $1", request_id)
            return HttpResponse("Student is already a member of a team in this class", status=400)

        # Check if team is full
        current_members = await conn.fetchval("SELECT COUNT(*) FROM group_members WHERE group_id = $1", team_id)
        if current_members >= team['max_members']:
            return HttpResponse("Team is already full", status=400)

        # Approve and insert student to team members
        await conn.execute("UPDATE group_requests SET status = 'approved' WHERE id = $1", request_id)
        await conn.execute("INSERT INTO group_members (group_id, user_id, joined_at) VALUES ($1, $2, CURRENT_TIMESTAMP)", team_id, student_id)

        # Delete any other requests for this student in this class
        await conn.execute("""
            DELETE FROM group_requests 
            WHERE student_id = $1 AND group_id IN (
                SELECT id FROM groups WHERE class_id = $2
            )
        """, student_id, class_id)

        return await class_tab(request, class_id, 'groups')


@csrf_exempt
async def decline_request(request, request_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        # Fetch request details
        req = await conn.fetchrow("SELECT * FROM group_requests WHERE id = $1", request_id)
        if not req:
            return HttpResponse("Request not found", status=404)

        team_id = req['group_id']

        # Fetch team and verify leader / admin authority
        team = await conn.fetchrow("SELECT * FROM groups WHERE id = $1", team_id)
        if not team:
            return HttpResponse("Team not found", status=404)
        class_id = team['class_id']

        user_role = await conn.fetchval("SELECT role FROM user_classes WHERE user_id=$1 AND class_id=$2", user_id, class_id)
        is_admin = user_role == 'admin'

        if team['leader_id'] != user_id and not is_admin:
            return HttpResponse("Forbidden", status=403)

        # Check if teams are frozen and user is not admin
        class_details = await conn.fetchrow("SELECT * FROM classes WHERE id=$1", class_id)
        if class_details and class_details['teams_frozen'] and not is_admin:
            return HttpResponse("Teams are frozen for this class. Declining requests is not allowed.", status=403)

        # Set status to declined
        await conn.execute("UPDATE group_requests SET status = 'declined' WHERE id = $1", request_id)

        return await class_tab(request, class_id, 'groups')


@csrf_exempt
async def dismiss_declined(request, request_id):
    if request.method != 'POST':
        return HttpResponse("Invalid method", status=400)

    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        # Fetch request details
        req = await conn.fetchrow("SELECT * FROM group_requests WHERE id = $1", request_id)
        if not req:
            return HttpResponse("Request not found", status=404)
        
        team_id = req['group_id']
        team = await conn.fetchrow("SELECT * FROM groups WHERE id = $1", team_id)
        class_id = team['class_id'] if team else None

        # Delete declined request row
        await conn.execute("DELETE FROM group_requests WHERE id = $1 AND student_id = $2 AND status = 'declined'", request_id, user_id)

        return await class_tab(request, class_id, 'groups')


@csrf_exempt
async def search_explore(request):
    # 1. Get the search query from the URL parameters
    query = request.GET.get('search_query', '').strip()

    # # 2. Verify user is logged in
    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)
        
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
            
        user_id = session['user_id']

        # 3. If query is empty, show guidance instead of querying all classes
        if not query:
            return render(request, 'user_classes/templates/explore_search_results.html', {
                'results': [],
                'query': '',
                'show_guide': True
            })

        else:
            # 4. If there is a query, search by course_code or course_name
            search_pattern = f"%{query}%"
            results = await conn.fetch("""
                SELECT * FROM classes 
                WHERE id NOT IN (
                    SELECT class_id FROM user_classes WHERE user_id = $1
                )
                AND (course_code ILIKE $2 OR course_name ILIKE $2)
            """, user_id, search_pattern)
            
    # 5. Return a partial template containing just the <li> elements
    return render(request, 'user_classes/templates/explore_search_results.html', {
        'results': results,
        'query': query
    })


@csrf_exempt
async def search_my_classes(request):
    query = request.GET.get('search_my_classes', '').strip()
    token = request.COOKIES.get('access_token')
    if not token:
        return HttpResponse("Unauthorized", status=401)
        
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        session = await conn.fetchrow("SELECT user_id FROM sessions WHERE token=$1 AND is_active=True", token)
        if not session:
            return HttpResponse("Unauthorized", status=401)
        user_id = session['user_id']

        if not query:
            my_classes = await conn.fetch("""
                SELECT c.*, uc.role as user_role FROM classes c
                JOIN user_classes uc ON c.id = uc.class_id
                WHERE uc.user_id = $1
            """, user_id)
        else:
            search_pattern = f"%{query}%"
            my_classes = await conn.fetch("""
                SELECT c.*, uc.role as user_role FROM classes c
                JOIN user_classes uc ON c.id = uc.class_id
                WHERE uc.user_id = $1
                AND (c.course_code ILIKE $2 OR c.course_name ILIKE $2 OR c.section ILIKE $2 OR c.trimester ILIKE $2)
            """, user_id, search_pattern)

    return render(request, 'user_classes/templates/my_classes_search_results.html', {
        'my_classes': my_classes,
        'query': query
    })