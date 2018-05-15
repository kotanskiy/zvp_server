from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^login_user', views.login_user, name='login_user')
]