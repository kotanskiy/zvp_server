from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^tests', views.render_tests_page, name='tests'),
    url(r'^results', views.render_results, name='results'),
    url(r'^questions', views.render_question_list, name='questions'),
    url(r'^start-test', views.start_test, name='test'),
]