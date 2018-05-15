from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^tests', views.render_tests_page, name='tests'),
    url(r'^questions', views.render_question_list, name='questions'),
]