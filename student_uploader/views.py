from django.contrib.admin.views.decorators import staff_member_required
from django.shortcuts import render
from django.http.response import HttpResponse
from .forms import UploadFileForm, DownloadFileForm
from .students_uploader import StudentUploader
import os
from slugify import slugify

import logging

log = logging.getLogger(__name__)


@staff_member_required
def render_student_uploader(request):
    if request.method == 'POST' and 'form_upload_submit' in request.POST:
        form_upload = UploadFileForm(request.POST, request.FILES)
        form_download = DownloadFileForm()
        if form_upload.is_valid():
            file = StudentUploader.handle_uploaded_file(request.FILES['file'], request.POST['title'])
            response_message = StudentUploader.register_method(file, request.POST['troop'])
            return render(request, 'student_uploader/index.html', {'form_upload': form_upload,
                                                                   'form_download': form_download,
                                                                   'message': response_message,
                                                                   'directory': os.listdir(
                                                                   StudentUploader.PATH_FOR_SAVING)})
    elif request.method == 'POST' and 'form_download_submit' in request.POST:
        form_upload = UploadFileForm()
        form_download = DownloadFileForm()
        if request.POST['troop'] and request.POST['department']:
            return render(request, 'student_uploader/index.html', {'form_upload': form_upload,
                                                                   'form_download': form_download,
                                                                   'message': '',
                                                                   'message_download': 'Оберіть тільки взвод або '
                                                                                       'тільки ПМК',
                                                                   'directory': os.listdir(
                                                                       StudentUploader.PATH_FOR_SAVING)})
        elif not request.POST['troop'] and not request.POST['department']:
            return render(request, 'student_uploader/index.html', {'form_upload': form_upload,
                                                                   'form_download': form_download,
                                                                   'message': '',
                                                                   'message_download': 'Оберіть взвод або ПМК ',
                                                                   'directory': os.listdir(
                                                                       StudentUploader.PATH_FOR_SAVING)})

        elif request.POST['troop']:
            StudentUploader.write_file_results(troop_pk=request.POST['troop'], quiz_pk=request.POST['quiz'])
        elif request.POST['department']:
            StudentUploader.write_file_results(department_pk=request.POST['department'], quiz_pk=request.POST['quiz'])

        return render(request, 'student_uploader/index.html', {'form_upload': form_upload,
                                                               'form_download': form_download,
                                                               'message': '',
                                                               'message_download': 'Файл створено. Ви можете '
                                                                                   'скачати його з списку нижче ',
                                                               'directory': os.listdir(
                                                                   StudentUploader.PATH_FOR_SAVING)})
    else:
        form_upload = UploadFileForm()
        form_download = DownloadFileForm()
        return render(request, 'student_uploader/index.html', {'form_upload': form_upload,
                                                               'form_download': form_download,
                                                               'message': '',
                                                               'directory': os.listdir(StudentUploader.PATH_FOR_SAVING)})


@staff_member_required
def download_file(request):
    try:
        StudentUploader.write_file_results()
        filename = request.GET['filename']
        with open(StudentUploader.PATH_FOR_SAVING + filename, "rb") as f:
            current_file = f.read()
            response = HttpResponse(content=current_file,
                                    content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
            response['Content-Disposition'] = 'attachment; filename={}'.format(slugify(filename).replace('-', '.'))
            return response
    except Exception as e:
        print('[ERROR]{}'.format(e))
        form = UploadFileForm()
        return render(request,
                      'student_uploader/index.html',
                      {'form': form,
                       'message': '',
                       'directory': os.listdir(StudentUploader.PATH_FOR_SAVING)})
