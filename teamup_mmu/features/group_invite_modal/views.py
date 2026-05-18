from django.shortcuts import render
from django.http import HttpResponse
from teamup_mmu.db import Database
from ..user_access_check.views import access_check

async def load_modal(request, target_user_id):
    """Loads the popup modal with groups you lead"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return HttpResponse("Unauthorized", status=401)
        
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # Fetch only groups where the current user is the leader
        my_admin_groups = await conn.fetch("SELECT id, name FROM groups WHERE leader_id=$1", id)
        
    context = {
        'groups': my_admin_groups,
        'target_user_id': target_user_id
    }
    return render(request, 'group_invite_modal/templates/modal.html', {'context': context})


async def send_invite(request):
    """Saves the invites and automatically 'likes' the user, then closes smoothly"""
    if request.method == "POST":
        passed_login_check, status, email, id = await access_check(request)
        if not passed_login_check:
            return HttpResponse("Unauthorized", status=401)
            
        target_user_id = int(request.POST.get('target_user_id'))
        
        # NEW: getlist() grabs ALL checked boxes
        group_ids = request.POST.getlist('group_ids') 
        
        if not group_ids:
            # If they clicked send without checking any boxes, just close the modal
            return HttpResponse("")

        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            
            # Loop through every checked group
            for gid in group_ids:
                group_id = int(gid)
                
                # 1. Security Check: Are they actually the leader?
                is_admin = await conn.fetchval("SELECT 1 FROM groups WHERE id=$1 AND leader_id=$2", group_id, id)
                if not is_admin:
                    continue # Skip this one if they are hacking the form
                    
                # 2. Check if an invite already exists
                existing_invite = await conn.fetchval("SELECT 1 FROM group_invites WHERE group_id=$1 AND receiver_id=$2", group_id, target_user_id)
                
                if not existing_invite:
                    # 3. Create the Invite
                    await conn.execute("""
                        INSERT INTO group_invites (group_id, sender_id, receiver_id, status) 
                        VALUES ($1, $2, $3, 'pending')
                    """, group_id, id, target_user_id)
                    
            # 4. AUTOMATIC LIKE FEATURE (Only needs to happen once!)
            already_liked = await conn.fetchval("SELECT 1 FROM likes WHERE user_id=$1 AND liked_user_id=$2", id, target_user_id)
            if not already_liked:
                await conn.execute("INSERT INTO likes(user_id, liked_user_id) VALUES($1, $2)", id, target_user_id)
                
        # Returning an empty string tells HTMX to completely empty the #modal-container
        # This smoothly closes the popup without breaking your page layout!
        return HttpResponse("")