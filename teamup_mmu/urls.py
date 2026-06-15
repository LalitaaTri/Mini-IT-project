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
from .features.user_classes.views import class_details
from .features.user_classes.views import leave_class
from .features.user_classes.views import leave_class_confirm
from .features.user_classes.views import edit_class
from .features.user_classes.views import remove_student 
from .features.user_classes.views import share_code_modal
from .features.user_classes.views import delete_class_modal
from .features.user_classes.views import delete_class_confirm





from .features.matching_matches.views import index as matching_matches_view
from .features.user_message.views import message as user_message_view
from .features.user_message.views import index as user_message_index_view
from .features.user_inbox.views import index as user_inbox_index_view
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

from .features.my_profile.views import index as my_profile_index
from .features.my_profile.views import edit as my_profile_edit
from .features.groups import views as group_views
from .features.group_invite_modal import views as group_invite_modal_views
from .features.user_profile import views as user_profile_views





urlpatterns = [
    path('', views.index, name='index'),
    
    path('signup/', user_signup, name='user_signup'),
    path('signup/receive/', user_signup_receive, name='user_signup_receive'),
    path('login/', user_login, name='user_login'),
    path('login/receive/', csrf_exempt(user_login_receive), name='user_login_receive'),

    path('matching/', matching_view, name='matching'),
    path('matching/<int:iter>/', matching_view, name='matching_with_iter'),
    path('matching/like/', matching_like_view, name='matching_like_view'),

    path('groups/', group_views.groups, name='groups'),
    path('groups/clear/', group_views.clear, name='clear'),
    path('groups/create/', group_views.group_create_form, name='group_create_form'),
    path('groups/create/receive/', group_views.group_create_receive, name='group_create_receive'),
    path('groups/leave/<int:group_id>/', group_views.group_leave, name='group_leave'),
    path('groups/<int:group_id>/members/', group_views.group_members_list, name='group_members_list'),
    path('groups/join_by_code/', group_views.group_join_by_code, name='group_join_by_code'),
    path('groups/invites/<int:invite_id>/accept/', group_views.invite_accept, name='invite_accept'),
    path('groups/invites/<int:invite_id>/decline/', group_views.invite_decline, name='invite_decline'),
    path('groups/edit/<int:group_id>/', group_views.group_edit_form, name='group_edit_form'),
    path('groups/edit/<int:group_id>/', group_views.group_edit_receive, name='group_edit_receive'), # Note: HTMX POST hits the same URL but different request.method logic
    path('groups/transfer/<int:group_id>/<int:new_leader_id>/', group_views.group_transfer_leader, name='group_transfer_leader'),
    path('groups/kick/<int:group_id>/<int:target_user_id>/', group_views.group_kick_member, name='group_kick_member'),

    path('connect_modal/invite/<int:target_user_id>/', group_invite_modal_views.load_invite_modal, name='load_invite_modal'),
    path('connect_modal/request/<int:target_user_id>/', group_invite_modal_views.load_request_modal, name='load_request_modal'),
    path('connect_modal/send_invite/', group_invite_modal_views.send_invite, name='send_invite_modal'),
    path('connect_modal/send_request/', group_invite_modal_views.send_request, name='send_request_modal'),
    path('groups/requests/<int:req_id>/accept/', group_views.request_accept, name='request_accept'),
    path('groups/requests/<int:req_id>/decline/', group_views.request_decline, name='request_decline'),

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

    path('my_profile/', my_profile_index, name='my_profile'),
    path('my_profile/edit/', my_profile_edit, name='my_profile_edit'),
    path('user_profile/<int:target_user_id>/', user_profile_views.load_profile_modal, name='user_profile_modal'),

    path('classes/join_modal/', join_modal, name='join_modal'),
    path('classes/join_by_code/', join_by_code, name='join_by_code'),

    path('classes/create_modal/', create_modal, name='create_modal'),
    path('classes/create_class/', create_class, name='create_class'),

    path('classes/class_details/<int:class_id>/', class_details, name='class_details'),
    path('classes/leave_class/<int:class_id>/', leave_class, name='leave_modal'),
    path('classes/leave_class_confirm/', leave_class_confirm, name='leave_class_confirm'),
    path('classes/edit_class/<int:class_id>/', edit_class, name='edit_class'),
    path('classes/remove_student/<int:class_id>/<int:student_id>/', remove_student, name = 'remove_student'),
    path('classes/share_code_modal/<int:class_id>/', share_code_modal, name='share_code_modal'),
    path('classes/delete_class_modal/<int:class_id>/', delete_class_modal, name='delete_class_modal'),
    path('classes/delete_class_confirm/', delete_class_confirm, name='delete_class_confirm'),


    path('admin/', admin.site.urls)
]

from django.contrib.staticfiles.urls import staticfiles_urlpatterns
urlpatterns += staticfiles_urlpatterns()