from django.shortcuts import render, redirect
from teamup_mmu.db import Database
from ..user_access_check.views import *
from django.http import HttpResponse
import random
import string

# Add this to your views
async def clear(request):
    """Returns an empty response to clear out HTML elements via HTMX"""
    return HttpResponse("")

async def groups(request):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        print("Redirecting to index")
        return redirect("/")
        
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        # NEW: Added g.join_code to the SELECT statement!
        my_groups = await conn.fetch("""
            SELECT g.id, g.name, g.description, g.whatsapp_link, g.is_general, g.class_name, g.join_code
            FROM groups g
            INNER JOIN group_members gm ON g.id = gm.group_id
            WHERE gm.user_id = $1
            ORDER BY g.created_at DESC
        """, id)

    context = {
        'my_groups': my_groups
    }
    return render(request, 'groups.html', {'context': context})


async def group_create_form(request):
    """Just returns the HTML snippet for the HTMX form"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return HttpResponse("Unauthorized", status=401)
    return render(request, 'groups/templates/create_form.html')

async def group_create_receive(request):
    """Handles the actual saving of the group to the database with validation"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return HttpResponse("<span style='color: red;'>Unauthorized. Please log in.</span>")

    if request.method == 'POST':
        name = request.POST.get('name', '').strip()
        description = request.POST.get('description', '').strip()
        wa_link = request.POST.get('whatsapp_link', '').strip()
        class_name = request.POST.get('class_name', '').strip()
        is_general = request.POST.get('is_general') == 'on' 
        
        # --- 1. BACKEND VALIDATION ---
        
        if not name:
            return HttpResponse("<span style='color: red;'>Group name is required.</span>")
            
        if len(name) > 100:
            return HttpResponse("<span style='color: red;'>Group name is too long (max 100 chars).</span>")
            
        if wa_link and not (wa_link.startswith('http://') or wa_link.startswith('https://')):
            return HttpResponse("<span style='color: red;'>WhatsApp link must be a valid URL starting with http:// or https://</span>")

        try:
            max_members = int(request.POST.get('max_members', 20))
            if max_members < 2 or max_members > 50:
                return HttpResponse("<span style='color: red;'>Max members must be between 2 and 50.</span>")
        except (ValueError, TypeError):
            return HttpResponse("<span style='color: red;'>Max members must be a valid number.</span>")

        # --- 2. DATABASE INSERTION ---
        
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            # Check if user already created a group with this exact name
            existing_group = await conn.fetchval("SELECT id FROM groups WHERE name=$1 AND created_by=$2", name, id)
            if existing_group:
                return HttpResponse("<span style='color: red;'>You already have a group with this name.</span>")

# --- 2. DATABASE INSERTION ---
        
        # Generate a random 6-character code (e.g., "X9K2PA")
        join_code = ''.join(random.choices(string.ascii_uppercase + string.digits, k=6))
        
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            # ... existing unique name check ...

            # Insert new group WITH the join code
            group_id = await conn.fetchval("""
                INSERT INTO groups (name, description, whatsapp_link, is_general, class_name, leader_id, created_by, max_members, join_code)
                VALUES ($1, $2, $3, $4, $5, $6, $6, $7, $8)
                RETURNING id
            """, name, description, wa_link, is_general, class_name, id, max_members, join_code)
            
            # ... existing group_members insert ...

            # Add creator to group_members
            await conn.execute("""
                INSERT INTO group_members (group_id, user_id) VALUES ($1, $2)
            """, group_id, id)

        # 3. SUCCESS REDIRECT
        response = HttpResponse("Success")
        response['HX-Redirect'] = '/groups/'
        return response
    
async def group_leave(request, group_id):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return HttpResponse("Unauthorized", status=401)

    if request.method == 'POST':
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            # 1. Check if the user is the leader of this group
            group = await conn.fetchrow("SELECT leader_id FROM groups WHERE id=$1", group_id)
            
            if group and group['leader_id'] == id:
                # 2. They are the leader. Check how many people are in the group.
                member_count = await conn.fetchval("SELECT COUNT(*) FROM group_members WHERE group_id=$1", group_id)
                
                if member_count > 1:
                    # Block them from leaving
                    return HttpResponse(
                        "<span style='color: red; font-size: 0.85rem;'>"
                        "You are the Leader! You must transfer leadership or kick everyone before leaving."
                        "</span>"
                    )
                else:
                    # They are the leader AND the only member. Delete the whole group.
                    await conn.execute("DELETE FROM groups WHERE id=$1", group_id)
            else:
                # 3. They are a normal member. Just remove them from the group_members table.
                await conn.execute("DELETE FROM group_members WHERE group_id=$1 AND user_id=$2", group_id, id)

        # Tell HTMX to instantly refresh the page to update the group list
        response = HttpResponse("Left successfully")
        response['HX-Refresh'] = "true"
        return response
    
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

async def group_join_by_code(request):
    """Allows a user to join a group using a 6-character code"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return HttpResponse("Unauthorized", status=401)

    if request.method == 'POST':
        join_code = request.POST.get('join_code', '').strip().upper()
        
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            # 1. Find the group by code
            group = await conn.fetchrow("SELECT id, max_members FROM groups WHERE join_code=$1", join_code)
            
            if not group:
                return HttpResponse("Invalid Group Code.")
                
            group_id = group['id']

            # 2. Check if they are already in it
            already_in = await conn.fetchval("SELECT 1 FROM group_members WHERE group_id=$1 AND user_id=$2", group_id, id)
            if already_in:
                return HttpResponse("You are already in this group.")

            # 3. Check capacity limit
            current_count = await conn.fetchval("SELECT COUNT(*) FROM group_members WHERE group_id=$1", group_id)
            if current_count >= group['max_members']:
                return HttpResponse("This group is full.")
                
            # 4. Success! Add them.
            await conn.execute("INSERT INTO group_members (group_id, user_id) VALUES ($1, $2)", group_id, id)
            
        # Refresh the page so the new group card appears on their dashboard
        response = HttpResponse("Joined successfully!")
        response['HX-Refresh'] = "true"
        return response