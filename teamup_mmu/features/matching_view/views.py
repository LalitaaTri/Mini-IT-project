import json
from ..user_access_check.views import *
from django.shortcuts import render, redirect
from django.http import HttpResponse

async def index(request, iter=0):
    pool = await Database.get_pool()
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return redirect("/")

    async with pool.acquire() as conn:
        # 1. Get MY Profile for defaults, interest comparison, and my classes
        my_profile = await conn.fetchrow("SELECT faculty, year_of_study, interests, classes_ids FROM profiles WHERE id=$1", id)
        my_interests = my_profile['interests'] or []
        my_classes_ids = my_profile['classes_ids'] or []

        # 2. Determine Filters (GET overrides Cookie overrides Default)
        # Checking if 'faculty' is in GET confirms the form was submitted
        is_filter_submit = 'faculty' in request.GET 

        if is_filter_submit:
            filters = {
                'faculty': request.GET.get('faculty', ''),
                'year': request.GET.get('year', ''),
                'min_cgpa': request.GET.get('min_cgpa', ''),
                'max_cgpa': request.GET.get('max_cgpa', ''), # NEW Max Range
                'class_id': request.GET.get('class_id', ''),
                'min_common': request.GET.get('min_common', '')
            }
        else:
            cookie_data = request.COOKIES.get('matching_filters')
            if cookie_data:
                try:
                    filters = json.loads(cookie_data)
                except json.JSONDecodeError:
                    filters = None
            else:
                filters = None
            
            if not filters:
                # AUTO-SET DEFAULTS to the user's own profile!
                filters = {
                    'faculty': my_profile['faculty'] or '',
                    'year': str(my_profile['year_of_study']) if my_profile['year_of_study'] else '',
                    'min_cgpa': '',
                    'max_cgpa': '',
                    'class_id': 'all_my_classes' if my_classes_ids else 'any',
                    'min_common': ''
                }

        # 3. Build highly optimized SQL query
        query = """
            SELECT u.id, u.email, p.username, p.introduction, p.descriptions, 
                   p.year_of_study, p.faculty, p.program, p.interests, p.cgpa
            FROM users u
            INNER JOIN profiles p ON u.id = p.id
            WHERE u.id != $1 AND u.email_verified = $2 AND u.inactive = $3
        """
        params = [id, True, False]
        param_idx = 4

        if filters['faculty']:
            query += f" AND p.faculty = ${param_idx}"
            params.append(filters['faculty'])
            param_idx += 1
        if filters['min_cgpa']:
            query += f" AND p.cgpa >= ${param_idx}"
            params.append(float(filters['min_cgpa']))
            param_idx += 1
        if filters['max_cgpa']:
            query += f" AND p.cgpa <= ${param_idx}"
            params.append(float(filters['max_cgpa']))
            param_idx += 1
        if filters['year']:
            query += f" AND p.year_of_study = ${param_idx}"
            params.append(int(filters['year']))
            param_idx += 1
            
        # Class Logic
        if filters['class_id'] == 'all_my_classes' and my_classes_ids:
            # Must share AT LEAST ONE class with me
            query += f" AND COALESCE(p.classes_ids, '{{}}'::int[]) && ${param_idx}::int[]"
            params.append(my_classes_ids)
            param_idx += 1
        elif filters['class_id'] and filters['class_id'] not in ['any', 'all_my_classes']:
            query += f" AND ${param_idx} = ANY(COALESCE(p.classes_ids, '{{}}'::int[]))"
            params.append(int(filters['class_id']))
            param_idx += 1

        # Shared Interests calculated entirely in Postgres for extreme speed
        if filters['min_common'] and my_interests:
            query += f" AND (SELECT count(*) FROM unnest(COALESCE(p.interests, '{{}}'::text[])) i WHERE i = ANY(${param_idx}::text[])) >= ${param_idx+1}"
            params.extend([my_interests, int(filters['min_common'])])
            param_idx += 2
            
        # Limits the fetch block to 200 users max to save massive RAM loads
        query += " ORDER BY u.id ASC LIMIT 200"

        other_users = await conn.fetch(query, *params)
        
        # 4. Fetch ONLY the classes the current user is enrolled in
        my_classes = []
        if my_classes_ids:
            my_classes = await conn.fetch("SELECT id, course_code, section FROM classes WHERE id = ANY($1::int[]) ORDER BY course_code", my_classes_ids)

        like_status = 'Not liked yet'
        if len(other_users):
            iter = (iter + 1) % len(other_users)
            likes = await conn.fetch("SELECT * FROM likes WHERE user_id=$1 AND liked_user_id=$2", id, other_users[iter]['id'])
            if likes:
                like_status = 'Liked'
                
    context = {
        'user_obj': [] if not other_users else other_users[iter],
        'next_iter': iter,
        'like_status': like_status,
        'my_classes': my_classes,
        'filters': filters
    }
    
    # 5. Render & Attach Persistent Cookie (expires in 30 days)
    if request.headers.get('HX-Request'):
        response = render(request, 'matching_view/templates/card.html', {'status': status, 'context': context})
    else:
        response = render(request, 'matching_view/templates/index.html', {'status': status, 'context': context})
        
    response.set_cookie('matching_filters', json.dumps(filters), max_age=2592000)
    return response

async def like(request):
    if request.method == "POST":
        liked_user_id = int(request.POST.get('liked_user_id'))
        pool = await Database.get_pool()
        passed_login_check, status, email, id = await access_check(request)
        if not passed_login_check:
            print("Redirecting to index")
            return redirect("/")
        async with pool.acquire() as conn:
            likes = await conn.fetch("SELECT * FROM likes WHERE user_id=$1 AND liked_user_id=$2",id,liked_user_id)
            if not likes:
                await conn.execute("INSERT INTO likes(id,user_id,liked_user_id) VALUES(DEFAULT,$1,$2)",id,liked_user_id)
                return render(request, 'matching_view/templates/like_status.html')
    return HttpResponse("Invalid request", status=400)