from django.shortcuts import render
from django.http import HttpResponse

def index(request):
   return render(request, 'user_signup/templates/index.html', {'data':'data from signup endpoint'})

def receive(request):
   if request.method == 'POST':
      username = request.POST.get('username')
      # After the user is created/logged in successfully:
      response = HttpResponse()
      response["HX-Redirect"] = "/matching/" # This tells HTMX to redirect the WHOLE page
      return response