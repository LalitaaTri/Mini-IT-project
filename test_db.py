import asyncio
import random
import string
from teamup_mmu.db import Database

async def test_create():
    pool = await Database.get_pool()
    async with pool.acquire() as conn:
        try:
            # Let's get a valid user_id
            user_id_row = await conn.fetchrow("SELECT id FROM users LIMIT 1")
            if not user_id_row:
                print("No users found in the database.")
                return
            user_id = user_id_row['id']
            
            course_code = 'TEST101'
            course_name = 'Test Course'
            description = 'Test Description'
            join_code = ''.join(random.choices(string.ascii_uppercase + string.digits, k=6))
            
            # Create the class
            class_id = await conn.fetchval(
                "INSERT INTO classes(course_code, course_name, description, join_code) VALUES($1, $2, $3, $4) RETURNING id",
                course_code, course_name, description, join_code
            )
            print(f"Class created with ID: {class_id}")
            
            # Add the creator to the class as the ADMIN
            await conn.execute("INSERT INTO user_classes(user_id, class_id, role) VALUES($1, $2, 'admin')", user_id, class_id)
            print("User added to user_classes as admin.")
            
        except Exception as e:
            print(f"EXCEPTION: {type(e).__name__}: {e}")

asyncio.run(test_create())
