from django.shortcuts import render, redirect
from teamup_mmu.db import Database
from ..user_access_check.views import *

async def index(request):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        print("Redirecting to index")
        return redirect("/")
        
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # ONE single query to grab mutual matches AND their profile data
        matches = await conn.fetch("""
            SELECT u.id, u.email, p.username, p.introduction, p.descriptions, 
                   p.year_of_study, p.faculty, p.program, p.interests, p.cgpa
            FROM users u
            INNER JOIN profiles p ON u.id = p.id
            WHERE u.id IN (
                -- Find users I liked
                SELECT liked_user_id FROM likes WHERE user_id = $1
                INTERSECT
                -- Find users who liked me
                SELECT user_id FROM likes WHERE liked_user_id = $1
            )
            AND u.email_verified = $2 AND u.inactive = $3
        """, id, True, False)
        
    context = {
        'matches': matches
    }
    return render(request, 'matching_matches/templates/index.html', {'status': status, 'context': context})