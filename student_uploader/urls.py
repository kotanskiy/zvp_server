from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^student_uploader', views.render_student_uploader, name='student_uploader'),
    url(r'^download', views.download_file, name='download_file'),
]