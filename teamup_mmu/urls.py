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
from .features.user_login.views import receive as user_login_receive
from .features.matching_view.views import index as matching_view
from .features.user_logout.views import index as user_logout
from .features.user_email_verification.views import send as user_email_verification_send
from .features.user_email_verification.views import receive as user_email_verification_receive
from .views import test_db_view
from .features.matching_view.views import like as matching_like_view
from .features.matching_matches.views import index as matching_matches_view
from .features.user_message.views import message as user_message_view
from .features.user_message.views import index as user_message_index_view
from .features.user_inbox.views import index as user_inbox_index_view

urlpatterns = [
    path('', views.index, name='index'),
    path('user_signup/', user_signup, name='user_signup'),
    path('user_signup/receive/', user_signup_receive, name='user_signup_receive'),
    path('user_login/', user_login, name='user_login'),
    path('user_login/receive/', user_login_receive, name='user_login_receive'),
    path('admin/', admin.site.urls),
    path('test-db/', test_db_view),
    path('matching/', matching_view, name='matching'),
    path('matching/<int:iter>/', matching_view, name='matching_with_iter'),
    path('matching/like/', matching_like_view, name='matching_like_view'),
    path('groups/', views.groups, name='groups'),
    path('settings/', views.settings, name='settings'),
    path('logout/', user_logout, name='user_logout'),
    path('email_verification/send/', user_email_verification_send, name='user_email_verification_send'),
    path('email_verification/receive/', user_email_verification_receive, name='user_email_verification_receive'),
    path('matches/', matching_matches_view, name='matching_matches'),
    path('message/', user_message_view, name='user_message'),
    path('chat/<int:another_user_id>/', user_message_index_view, name='user_message_index_view'),
    path('inbox/', user_inbox_index_view, name='user_inbox_index_view')
]


from django.contrib.staticfiles.urls import staticfiles_urlpatterns
urlpatterns += staticfiles_urlpatterns()