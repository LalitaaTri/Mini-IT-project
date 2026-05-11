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

async def group_members_list(request, group_id):
    """Fetches the list of members for a specific group to display inside the card"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # 1. Figure out who the leader is
        group = await conn.fetchrow("SELECT leader_id FROM groups WHERE id=$1", group_id)
        
        # 2. Get all members joined with their profile data
        members = await conn.fetch("""
            SELECT u.id, u.email, p.username, p.program
            FROM group_members gm
            INNER JOIN users u ON gm.user_id = u.id
            LEFT JOIN profiles p ON u.id = p.id
            WHERE gm.group_id = $1
            ORDER BY gm.joined_at ASC
        """, group_id)

    context = {
        'members': members,
        'leader_id': group['leader_id'] if group else None,
        'group_id': group_id
    }
    return render(request, 'groups/templates/members_list.html', {'context': context})