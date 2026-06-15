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
        # NEW: Added g.leader_id to the SELECT statement
        my_groups = await conn.fetch("""
            SELECT g.id, g.name, g.description, g.whatsapp_link, g.is_general, g.class_name, g.join_code, g.leader_id
            FROM groups g
            INNER JOIN group_members gm ON g.id = gm.group_id
            WHERE gm.user_id = $1
            ORDER BY g.created_at DESC
        """, id)

    context = {
        'my_groups': my_groups,
        'current_user_id': id # NEW: Pass this so HTML knows if you are the leader
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
        group = await conn.fetchrow("SELECT leader_id FROM groups WHERE id=$1", group_id)
        
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
        'group_id': group_id,
        'current_user_id': id # NEW: We need this to show the "Transfer Leadership" button
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

async def invite_accept(request, invite_id):
    """Handles accepting a group invite"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return HttpResponse("Unauthorized", status=401)

    if request.method == 'POST':
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            # 1. Verify the invite exists, is pending, and belongs to this user
            invite = await conn.fetchrow("SELECT group_id FROM group_invites WHERE id=$1 AND receiver_id=$2 AND status='pending'", invite_id, id)
            
            if not invite:
                return HttpResponse("<p style='color: red; text-align: center;'>Invite not found or already processed.</p>")
            
            group_id = invite['group_id']

            # 2. Check if the group is full
            group = await conn.fetchrow("SELECT max_members FROM groups WHERE id=$1", group_id)
            current_count = await conn.fetchval("SELECT COUNT(*) FROM group_members WHERE group_id=$1", group_id)
            
            if current_count >= group['max_members']:
                # Mark as failed if the group filled up before they clicked accept
                await conn.execute("UPDATE group_invites SET status='failed' WHERE id=$1", invite_id)
                return HttpResponse("<div style='background-color: #f8d7da; color: #721c24; padding: 15px; border-radius: 10px; text-align: center; width: 50%; margin: 0 auto 20px auto;'>This group is already full.</div>")

            # 3. Check if they are somehow already in the group
            already_in = await conn.fetchval("SELECT 1 FROM group_members WHERE group_id=$1 AND user_id=$2", group_id, id)
            
            if not already_in:
                # 4. Insert them into the group!
                await conn.execute("INSERT INTO group_members (group_id, user_id) VALUES ($1, $2)", group_id, id)

            # 5. Update the invite status so it doesn't show up in the inbox anymore
            await conn.execute("UPDATE group_invites SET status='accepted' WHERE id=$1", invite_id)

        # 6. Return a nice success message to replace the invite card
        return HttpResponse("""
            <div style='background-color: #d4edda; color: #155724; padding: 15px; border-radius: 10px; text-align: center; width: 50%; margin: 0 auto 20px auto; font-family: "Inter", sans-serif;'>
                <strong>Success!</strong> You have joined the group.
            </div>
        """)


async def invite_decline(request, invite_id):
    """Handles declining a group invite"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        return HttpResponse("Unauthorized", status=401)

    if request.method == 'POST':
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            # Update the invite status to declined
            await conn.execute("UPDATE group_invites SET status='declined' WHERE id=$1 AND receiver_id=$2", invite_id, id)

        # Returning an empty string with HTMX outerHTML swap completely deletes the card from the screen instantly!
        return HttpResponse("")
    

async def request_accept(request, req_id):
    """Handles an Admin approving someone's request to join their group"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check: return HttpResponse("Unauthorized", status=401)

    if request.method == 'POST':
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            # 1. Verify the request exists and this user is the admin
            join_req = await conn.fetchrow("SELECT group_id, sender_id FROM group_requests WHERE id=$1 AND admin_id=$2 AND status='pending'", req_id, id)
            
            if not join_req:
                return HttpResponse("<p style='color: red; text-align: center;'>Request not found.</p>")
            
            group_id = join_req['group_id']
            sender_id = join_req['sender_id']

            # 2. Check Capacity
            group = await conn.fetchrow("SELECT max_members FROM groups WHERE id=$1", group_id)
            current_count = await conn.fetchval("SELECT COUNT(*) FROM group_members WHERE group_id=$1", group_id)
            
            if current_count >= group['max_members']:
                await conn.execute("UPDATE group_requests SET status='failed' WHERE id=$1", req_id)
                return HttpResponse("<div style='background-color: #f8d7da; color: #721c24; padding: 15px; border-radius: 10px; text-align: center;'>Your group is full.</div>")

            # 3. Add them to the group
            already_in = await conn.fetchval("SELECT 1 FROM group_members WHERE group_id=$1 AND user_id=$2", group_id, sender_id)
            if not already_in:
                await conn.execute("INSERT INTO group_members (group_id, user_id) VALUES ($1, $2)", group_id, sender_id)

            # 4. Mark as Accepted
            await conn.execute("UPDATE group_requests SET status='accepted' WHERE id=$1", req_id)

        # Replace the card with a success message
        return HttpResponse("""
            <div style='background-color: #d4edda; color: #155724; padding: 15px; border-radius: 10px; text-align: center; width: 50%; margin: 0 auto 20px auto;'>
                <strong>Approved!</strong> They are now in the group.
            </div>
        """)

async def request_decline(request, req_id):
    """Handles denying a join request"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check: return HttpResponse("Unauthorized", status=401)

    if request.method == 'POST':
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            await conn.execute("UPDATE group_requests SET status='declined' WHERE id=$1 AND admin_id=$2", req_id, id)

        # Deletes the card from the screen
        return HttpResponse("")
    
async def group_edit_form(request, group_id):
    """Loads the edit form snippet for the leader"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check: return HttpResponse("Unauthorized", status=401)
        
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        group = await conn.fetchrow("SELECT * FROM groups WHERE id=$1 AND leader_id=$2", group_id, id)
        if not group: return HttpResponse("<span style='color:red;'>Not authorized.</span>")
            
    return render(request, 'groups/templates/edit_form.html', {'group': group})

async def group_edit_receive(request, group_id):
    """Processes the edit form submission"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check: return HttpResponse("Unauthorized", status=401)
        
    if request.method == 'POST':
        name = request.POST.get('name', '').strip()
        description = request.POST.get('description', '').strip()
        wa_link = request.POST.get('whatsapp_link', '').strip()
        class_name = request.POST.get('class_name', '').strip()
        is_general = request.POST.get('is_general') == 'on'
            
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            is_admin = await conn.fetchval("SELECT 1 FROM groups WHERE id=$1 AND leader_id=$2", group_id, id)
            if not is_admin: return HttpResponse("Unauthorized")
                
            await conn.execute("""
                UPDATE groups SET name=$1, description=$2, whatsapp_link=$3, is_general=$4, class_name=$5
                WHERE id=$6
            """, name, description, wa_link, is_general, class_name, group_id)
                
        # Refresh the page to show new data
        response = HttpResponse("Updated")
        response['HX-Refresh'] = "true"
        return response

async def group_transfer_leader(request, group_id, new_leader_id):
    """Transfers leadership to another member"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check: return HttpResponse("Unauthorized", status=401)
        
    if request.method == 'POST':
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            # 1. Verify current user is actually the leader
            is_admin = await conn.fetchval("SELECT 1 FROM groups WHERE id=$1 AND leader_id=$2", group_id, id)
            if is_admin:
                # 2. Verify new leader is actually in the group
                in_group = await conn.fetchval("SELECT 1 FROM group_members WHERE group_id=$1 AND user_id=$2", group_id, new_leader_id)
                if in_group:
                    await conn.execute("UPDATE groups SET leader_id=$1 WHERE id=$2", new_leader_id, group_id)
                        
        # Refresh the page to update permissions
        response = HttpResponse("Success")
        response['HX-Refresh'] = "true"
        return response
    
async def group_kick_member(request, group_id, target_user_id):
    """Allows the leader to remove a member from the group"""
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check: return HttpResponse("Unauthorized", status=401)

    if request.method == 'POST':
        pool = await Database.get_pool()
        async with pool.acquire() as conn:
            # 1. Verify current user is actually the leader
            is_admin = await conn.fetchval("SELECT 1 FROM groups WHERE id=$1 AND leader_id=$2", group_id, id)
            
            if is_admin:
                # 2. Prevent the leader from kicking themselves (they should use 'Leave Group' instead)
                if target_user_id == id:
                    return HttpResponse("<span style='color: red;'>You cannot kick yourself.</span>")

                # 3. Remove the user from the group
                await conn.execute("DELETE FROM group_members WHERE group_id=$1 AND user_id=$2", group_id, target_user_id)

        # Refresh the page to update the member list and group counts instantly
        response = HttpResponse("Kicked successfully")
        response['HX-Refresh'] = "true"
        return response