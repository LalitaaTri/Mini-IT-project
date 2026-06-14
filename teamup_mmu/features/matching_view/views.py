from ..user_access_check.views import *
from django.shortcuts import render, redirect
from django.http import HttpResponse

async def index(request, iter=-1):
    pool = await Database.get_pool()
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return redirect("/")
        
    async with pool.acquire() as conn:
        # NEW: Join users and profiles tables together to get all the data
# In matching_view/views.py index()
        my_user = await conn.fetchrow("SELECT * FROM profiles WHERE id=$1", id)
        other_users = await conn.fetch("""
            SELECT u.id, u.email, p.username, p.introduction, p.descriptions, 
                   p.year_of_study, p.faculty, p.program, p.interests, p.cgpa, p.classes_ids
            FROM users u
            INNER JOIN profiles p ON u.id = p.id
            WHERE u.id != $1 AND u.email_verified = $2 AND u.inactive = $3
            ORDER BY
                cardinality(
                    ARRAY(
                        SELECT DISTINCT UNNEST(p.classes_ids) 
                        INTERSECT 
                        SELECT DISTINCT UNNEST($4::integer[])
                    )
                ) DESC;
        """, id, True, False, my_user['classes_ids'] if my_user and my_user['classes_ids'] else [])
        print("other_users:", list(other_users))

    like_status = 'Not liked yet'
    if len(other_users):
        iter = (iter + 1) % len(other_users)
        async with pool.acquire() as conn:
            likes = await conn.fetch("SELECT * FROM likes WHERE user_id=$1 AND liked_user_id=$2", id, other_users[iter]['id'])
            if likes:
                like_status = 'Liked'
                
    context = {
        'user_obj': [] if not other_users else other_users[iter],
        'next_iter': iter,
        'like_status': like_status,
        'my_user': my_user
    }
    
    if request.headers.get('HX-Request'):
        return render(request, 'matching_view/templates/card.html', {'status': status, 'context': context})
    return render(request, 'matching_view/templates/index.html', {'status': status, 'context': context})

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