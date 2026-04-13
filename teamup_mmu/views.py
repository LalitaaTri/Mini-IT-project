from django.shortcuts import render

def index(request):
   return render(request, 'index.html')

def matching(request):
    return render(request, 'matching.html')

def groups(request):
    return render(request, 'groups.html')

def settings(request):
    return render(request, 'settings.html')