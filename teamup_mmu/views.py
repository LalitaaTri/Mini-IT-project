from .features.access_check.views import *

async def index(request):
   return render(request, 'index.html')

async def groups(request):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        print("Redirecting to index")
        return redirect("/")
    return render(request, 'groups.html')

async def settings(request):
    passed_login_check, status, email, id = await access_check(request)
    if not passed_login_check:
        print("Redirecting to index")
        return redirect("/")
    return render(request, 'settings.html')