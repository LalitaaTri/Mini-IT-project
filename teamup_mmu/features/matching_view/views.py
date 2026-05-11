from ..user_access_check.views import *

async def index(request, iter=0):
    pool = await Database.get_pool()
    passed_login_check, status, email, id = await access_check(request)
    print("passed_login_check",passed_login_check)
    if not passed_login_check:
        return redirect("/")
        
    async with pool.acquire() as conn:
        # NEW: Join users and profiles tables together to get all the data
# In matching_view/views.py index()
        other_users = await conn.fetch("""
            SELECT u.id, u.email, p.username, p.introduction, p.descriptions, 
                   p.year_of_study, p.faculty, p.program, p.interests, p.cgpa
            FROM users u
            INNER JOIN profiles p ON u.id = p.id
            WHERE u.id != $1 AND u.email_verified = $2 AND u.inactive = $3
        """, id, True, False)
        
    like_status = 'Not liked yet'
    if len(other_users):
        iter = (iter + 1) % len(other_users)
        async with pool.acquire() as conn:
            likes = await conn.fetch("SELECT * FROM likes WHERE user_id=$1 AND liked_user_id=$2", id, other_users[iter]['id'])
            if likes:
                like_status = 'Liked'
    is_htmx = request.headers.get('HX-Request')
    accept_header = request.headers.get('Accept', '').lower()
    is_mobile = 'application/json' in accept_header or request.headers.get('X-Mobile-App') == 'true'

    context = {
        # Convert the asyncpg Record to a standard dict
        'user_obj': dict(other_users[iter]) if other_users else None,
        'next_iter': iter,
        'like_status': like_status
    }
    
    if is_htmx:
        print("it's htmx")
        return render(request, 'matching_view/templates/card.html', {'status': status, 'context': context})
    if is_mobile:
        print("it's mobile")
        return JsonResponse({"status": status, "context": context})
    print(f"DEBUG: Accept Header was: {accept_header}") # This will tell us the truth
    print("passed both ifs")
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