from django.urls import path
from . import views

urlpatterns = [
    path('login_user', views.login_user, name='login_user')
]

STATISTICS_URL = [
    path('access_panel/', views.render_access_panel, name='access_panel'),
    path('load_accesses/', views.load_accesses, name='load_accesses'),
    path('submit_accesses/', views.submit_accesses, name='submit_accesses'),
    path('statistics/', views.render_statistics_page, name='statistics'),
    path('load_students/', views.load_students, name='load_students'),
    path('load_results/', views.get_student_test_result, name='load_results')
]

urlpatterns += STATISTICS_URL
