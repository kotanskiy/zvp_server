from django.contrib.admin.views.decorators import staff_member_required
from django.shortcuts import render
from django.http.response import HttpResponse

from .forms import UploadFileForm
from .students_uploader import StudentUploader
import os


@staff_member_required
def render_student_uploader(request):
    if request.method == 'POST':
        form = UploadFileForm(request.POST, request.FILES)
        if form.is_valid():
            file = StudentUploader.handle_uploaded_file(request.FILES['file'], request.POST['title'])
            response_message = StudentUploader.parse_file(file)
            return render(request, 'student_uploader/index.html', {'form': form,
                                                                   'message': response_message,
                                                                   'directory': os.listdir(StudentUploader.PATH_FOR_SAVING)})
    else:
        form = UploadFileForm()
    return render(request, 'student_uploader/index.html', {'form': form,
                                                           'message': '',
                                                           'directory': os.listdir(StudentUploader.PATH_FOR_SAVING)})


@staff_member_required
def download_file(request):
    try:
        filename = request.GET['filename']
        with open(StudentUploader.PATH_FOR_SAVING + filename, "rb") as f:
            current_file = f.read()
            response = HttpResponse(content=current_file,
                                    content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
            response['Content-Disposition'] = 'attachment; filename={}'.format(filename)
            return response
    except Exception as e:
        print('[ERROR]{}'.format(e))
        form = UploadFileForm()
        return render(request,
                      'student_uploader/index.html',
                      {'form': form,
                       'message': '',
                       'directory': os.listdir(StudentUploader.PATH_FOR_SAVING)})
