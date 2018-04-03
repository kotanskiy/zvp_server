from django.contrib.admin.views.decorators import staff_member_required
from django.shortcuts import render
from .forms import UploadFileForm

from .students_uploader import StudentUploader


@staff_member_required
def render_student_uploader(request):
    if request.method == 'POST':
        form = UploadFileForm(request.POST, request.FILES)
        if form.is_valid():
            file = StudentUploader.handle_uploaded_file(request.FILES['file'], request.POST['title'])
            print(StudentUploader.parse_file(file))
            return render(request, 'student_uploader/index.html', {'form': form, 'message': 'Успішно завантажено'})
    else:
        form = UploadFileForm()
    return render(request, 'student_uploader/index.html', {'form': form, 'message': ''})
