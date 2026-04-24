from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from teamup_mmu.db import Database
from datetime import timedelta, datetime

async def index(request):
   token = request.COOKIES.get('access_token')
   pool = await Database.get_pool()
   async with pool.acquire() as conn:
       await conn.execute("UPDATE sessions SET is_active=FALSE WHERE token=$1", token)
<<<<<<< HEAD
   return redirect("/")
=======
       return redirect("/")
   return HttpResponse(status=204)
>>>>>>> 30a3027a56e1ec0eff4debe9c0fd2acbc9f6d340
