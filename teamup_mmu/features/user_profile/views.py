from django.shortcuts import render
from django.http import HttpResponse
from teamup_mmu.db import Database
from ..user_access_check.views import access_check

async def load_profile_modal(request, target_user_id):
    """Loads the profile modal for a specific user"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return HttpResponse("Unauthorized", status=401)

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # Fetch target user's profile data
        user_data = await conn.fetchrow("""
            SELECT u.email, p.username, p.introduction, p.descriptions, 
                   p.year_of_study, p.faculty, p.program, p.interests
            FROM users u
            LEFT JOIN profiles p ON u.id = p.id
            WHERE u.id = $1
        """, target_user_id)

        if not user_data:
            return HttpResponse("<p>User not found.</p>")

    context = {
        'target_user': user_data,
        'target_user_id': target_user_id
    }

    return render(request, 'user_profile/templates/modal.html', {'context': context})