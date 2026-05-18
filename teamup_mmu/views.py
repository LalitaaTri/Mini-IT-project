from .features.user_access_check.views import *
from django.shortcuts import render, redirect

async def index(request):
   return render(request, 'index.html')

async def groups(request):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        print("Redirecting to index")
        return redirect("/")
    return render(request, 'groups.html')

def settings(request):
    return render(request, 'settings.html')

async def profile_setup(request):
    passed_login_check, status, email, id = await access_check(request)
    
    # NEW: Allow them in if their status is specifically "incomplete_profile"
    if not passed_login_check and status != "incomplete_profile":
        return redirect("/")

    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        profile = await conn.fetchrow("SELECT username, interests FROM profiles WHERE id=$1", id)

    setup_page = 1
    
    if profile and profile['username']:
        setup_page = 2
        
    if profile and profile['interests']:
        return redirect("/matching/")
        

    return render(request, 'profile_setup.html', {'setup_page': setup_page})

async def settings(request):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        print("Redirecting to index")
        return redirect("/")
    return render(request, 'settings.html')
