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
from .features.matching_view.views import like as matching_like_view
from .features.matching_matches.views import index as matching_matches_view
from .features.user_message.views import message as user_message_view
from .features.user_message.views import index as user_message_index_view
from .features.user_inbox.views import index as user_inbox_index_view
from .features.user_signup.views import signup_page as signup_page
from .features.user_forgot_password.views import index as user_forgot_password_index_view
from .features.user_forgot_password.views import send as user_forgot_password_send
from .features.user_forgot_password.views import receive as user_forgot_password_receive
from .features.user_delete_account.views import send as user_delete_account_send
from .features.user_delete_account.views import receive as user_delete_account_receive

urlpatterns = [
    path('', views.index, name='index'),
    path('user_signup/', user_signup, name='user_signup'),
    path('user_signup/receive/', user_signup_receive, name='user_signup_receive'),
    path('signup_page/', signup_page, name='signup_page'),
    path('user_login/', user_login, name='user_login'),
    path('user_login/receive/', user_login_receive, name='user_login_receive'),
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
    path('inbox/', user_inbox_index_view, name='user_inbox_index_view'),
    path('user_forgot_password/', user_forgot_password_index_view, name='user_forgot_password_index_view'),
    path('user_forgot_password/send/', user_forgot_password_send, name='user_forgot_password_send'),
    path('user_forgot_password/receive/', user_forgot_password_receive, name='user_forgot_password_receive'),
    path('user_delete_account/send/', user_delete_account_send, name='user_delete_account_send'),
    path('user_delete_account/receive/', user_delete_account_receive, name='user_delete_account_receive'),
    path('admin/', admin.site.urls)
]


from django.contrib.staticfiles.urls import staticfiles_urlpatterns
urlpatterns += staticfiles_urlpatterns()