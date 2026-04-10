"""
URL configuration for teamup_mmu project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/6.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from teamup_mmu import views
from .features.user_signup.views import index as user_signup
from .features.user_signup.views import receive as user_signup_receive
from .features.user_login.views import index as user_login



urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name='index'),
    path('user_signup/', user_signup, name='user_signup'),
    path('user_signup/receive/', user_signup_receive, name='user_signup_receive'),
    path('user_login/', user_login, name='user_login'),
]
