from django.urls import path
from . import views

urlpatterns = [
    path('login_user', views.login_user, name='login_user')
]

STATISTICS_URL = [
    path('access_panel/', views.render_access_panel, name='access_panel'),
    path('load_accesses/', views.load_accesses, name='load_accesses'),
    path('submit_accesses/', views.submit_accesses, name='submit_accesses')
]

urlpatterns += STATISTICS_URL
