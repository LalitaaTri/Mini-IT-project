from django.shortcuts import render
from django.http import HttpResponse
from teamup_mmu.db import Database
from ..user_access_check.views import access_check

# --- 1. LOAD MODALS ---

async def load_invite_modal(request, target_user_id):
    """Loads the modal showing groups YOU lead (to invite them)"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check: return HttpResponse("Unauthorized", status=401)
        
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        groups = await conn.fetch("SELECT id, name FROM groups WHERE leader_id=$1", id)
        
    context = {'groups': groups, 'target_user_id': target_user_id, 'mode': 'invite'}
    return render(request, 'group_invite_modal/templates/modal.html', {'context': context})


async def load_request_modal(request, target_user_id):
    """Loads the modal showing groups THEY are in (to request to join)"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check: return HttpResponse("Unauthorized", status=401)
        
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        groups = await conn.fetch("""
            SELECT g.id, g.name 
            FROM groups g 
            INNER JOIN group_members gm ON g.id = gm.group_id 
            WHERE gm.user_id=$1 AND g.id NOT IN (SELECT group_id FROM group_members WHERE user_id=$2)
        """, target_user_id, id)
        
    context = {'groups': groups, 'target_user_id': target_user_id, 'mode': 'request'}
    return render(request, 'group_invite_modal/templates/modal.html', {'context': context})


# --- 2. SEND DATA ---

async def send_invite(request):
    """Handles submitting the Invite form"""
    if request.method == "POST":
        passed_login_check, status, email, id = await access_check(request)
        if not passed_login_check: return HttpResponse("Unauthorized", status=401)
            
        target_user_id = int(request.POST.get('target_user_id'))
        group_ids = request.POST.getlist('group_ids') 
        
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            for gid in group_ids:
                group_id = int(gid)
                
                # 1. Security Check
                is_admin = await conn.fetchval("SELECT 1 FROM groups WHERE id=$1 AND leader_id=$2", group_id, id)
                if not is_admin: continue 
                    
                # 2. Check if they are already in the group
                is_member = await conn.fetchval("SELECT 1 FROM group_members WHERE group_id=$1 AND user_id=$2", group_id, target_user_id)
                
                if not is_member:
                    # 3. Create or Reset the Invite using ON CONFLICT Upsert
                    await conn.execute("""
                        INSERT INTO group_invites (group_id, sender_id, receiver_id, status) 
                        VALUES ($1, $2, $3, 'pending')
                        ON CONFLICT (group_id, receiver_id) 
                        DO UPDATE SET status = 'pending', sender_id = EXCLUDED.sender_id, created_at = CURRENT_TIMESTAMP
                    """, group_id, id, target_user_id)
                    
            if group_ids:
                already_liked = await conn.fetchval("SELECT 1 FROM likes WHERE user_id=$1 AND liked_user_id=$2", id, target_user_id)
                if not already_liked:
                    await conn.execute("INSERT INTO likes(user_id, liked_user_id) VALUES($1, $2)", id, target_user_id)
                
        return HttpResponse("")


async def send_request(request):
    """Handles submitting the Request to Join form"""
    if request.method == "POST":
        passed_login_check, status, email, id = await access_check(request)
        if not passed_login_check: return HttpResponse("Unauthorized", status=401)
            
        target_user_id = int(request.POST.get('target_user_id'))
        group_ids = request.POST.getlist('group_ids') 
        
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            for gid in group_ids:
                group_id = int(gid)
                admin_id = await conn.fetchval("SELECT leader_id FROM groups WHERE id=$1", group_id)
                
                if admin_id:
                    # Create or Reset the Request using ON CONFLICT Upsert
                    await conn.execute("""
                        INSERT INTO group_requests (group_id, sender_id, admin_id, status) 
                        VALUES ($1, $2, $3, 'pending')
                        ON CONFLICT (group_id, sender_id)
                        DO UPDATE SET status = 'pending', admin_id = EXCLUDED.admin_id, created_at = CURRENT_TIMESTAMP
                    """, group_id, id, admin_id)
                    
            if group_ids:
                already_liked = await conn.fetchval("SELECT 1 FROM likes WHERE user_id=$1 AND liked_user_id=$2", id, target_user_id)
                if not already_liked:
                    await conn.execute("INSERT INTO likes(user_id, liked_user_id) VALUES($1, $2)", id, target_user_id)
                
        return HttpResponse("")