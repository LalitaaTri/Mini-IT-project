from teamup_mmu.features.user_classes.views import leave_class
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

from .features.user_classes.views import index as user_classes_index
from .features.user_classes.views import join_modal
from .features.user_classes.views import join_by_code
from .features.user_classes.views import create_modal
from .features.user_classes.views import create_class
from .features.user_classes.views import class_details_modal
from .features.user_classes.views import leave_class
from .features.user_classes.views import leave_class_confirm

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
from .features.profile_setup_1.views import index as profile_setup_1
from .features.profile_setup_1.views import receive as profile_setup_1_receive
from .features.profile_setup_2.views import index as profile_setup_2
from .features.profile_setup_2.views import receive as profile_setup_2_receive
from .features.profile_setup_2.views import validate as profile_setup_2_validate

from django.views.decorators.csrf import csrf_exempt
from .features.user_access_check.views import access_check_endpoint as access_check_endpoint

urlpatterns = [
    path('', views.index, name='index'),
    path('user_signup/', user_signup, name='user_signup'),
    path('user_signup/receive/', user_signup_receive, name='user_signup_receive'),
    path('signup_page/', signup_page, name='signup_page'),
    path('user_login/', user_login, name='user_login'),
    path('user_login/receive/', csrf_exempt(user_login_receive), name='user_login_receive'),
    path('matching/', matching_view, name='matching'),
    path('matching/<int:iter>/', matching_view, name='matching_with_iter'),
    path('matching/like/', matching_like_view, name='matching_like_view'),
    path('groups/', views.groups, name='groups'),
    path('settings/', views.settings, name='settings'),
    path('logout/', user_logout, name='user_logout'),
    path('email_verification/send/', user_email_verification_send, name='user_email_verification_send'),
    path('email_verification/receive/', user_email_verification_receive, name='user_email_verification_receive'),
    path('classes/', user_classes_index, name='user_classes_index'),
    path('matches/', matching_matches_view, name='matching_matches'),
    path('message/', user_message_view, name='user_message'),
    path('chat/<int:another_user_id>/', user_message_index_view, name='user_message_index_view'),
    path('inbox/', user_inbox_index_view, name='user_inbox_index_view'),
    path('profile_setup/', views.profile_setup, name='profile_setup'),
    path('profile_setup_1/', profile_setup_1, name='profile_setup_1'),
    path('profile_setup_1/receive/', profile_setup_1_receive, name='profile_setup_1_receive'),
    path('profile_setup_2/', profile_setup_2, name='profile_setup_2'),
    path('profile_setup_2/validate/', profile_setup_2_validate, name='profile_setup_2_validate'),
    path('profile_setup_2/receive/', profile_setup_2_receive, name='profile_setup_2_receive'),
    path('user_forgot_password/', user_forgot_password_index_view, name='user_forgot_password_index_view'),
    path('user_forgot_password/send/', user_forgot_password_send, name='user_forgot_password_send'),
    path('user_forgot_password/receive/', user_forgot_password_receive, name='user_forgot_password_receive'),
    path('user_delete_account/send/', user_delete_account_send, name='user_delete_account_send'),
    path('user_delete_account/receive/', user_delete_account_receive, name='user_delete_account_receive'),
    path('access_check/', access_check_endpoint, name='access_check_endpoint'),
    
    path('classes/join_modal/', join_modal, name='join_modal'),
    path('classes/join_by_code/', join_by_code, name='join_by_code'),
    path('classes/create_modal/', create_modal, name='create_modal'),
    path('classes/create_class/', create_class, name='create_class'),
    path('classes/class_details_modal/<int:class_id>/', class_details_modal, name='class_details_modal'),
    path('classes/leave_class/<int:class_id>/', leave_class, name='leave_modal'),
    path('classes/leave_class_confirm/', leave_class_confirm, name='leave_class_confirm'),


    path('admin/', admin.site.urls)
]

from django.contrib.staticfiles.urls import staticfiles_urlpatterns
urlpatterns += staticfiles_urlpatterns()