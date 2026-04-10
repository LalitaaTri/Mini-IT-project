from django.shortcuts import render
from django.http import HttpResponse

def index(request):
   return render(request, 'user_signup/templates/index.html', {'data':'data from signup endpoint'})

def receive(request):
   if request.method == 'POST':
       username = request.POST.get('username')
       return HttpResponse(f'received username: {username}')
