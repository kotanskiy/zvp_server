from collections import namedtuple
from django.http import HttpResponse
from django.shortcuts import render, redirect
from .forms import LoginForm
from django.contrib.auth import authenticate, login
from control_panel.models import Student, Troop, Mark
from quiz_app.models import Quiz, Access

import logging
log = logging.getLogger(__name__)


def index_render(request):
    form = LoginForm()
    return render(request, 'control_panel/index.html', {'form': form, 'message': ''})


def login_user(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        user = None
        if form.is_valid():
            user = authenticate(username=request.POST['login_field'],
                                password=request.POST['password_field'])
        if user is None:
            return render(request,
                          'control_panel/index.html',
                          {'message': 'Невірний логін чи пароль',
                           'form': form})
        login(request, user)
        if request.user.is_superuser:
            return redirect('/admin')
        else:
            return redirect('/tests')
    else:
        form = LoginForm()
        return render(request,
                      'control_panel/index.html',
                      {'message': 'Used get method',
                       'form': form})


def render_access_panel(request):
    troops = Troop.objects.all()
    tests = Quiz.objects.all()

    context = {
        'tests': tests,
        'troops': troops
    }
    return render(request, 'access_panel/index.html', context=context)


def load_accesses(request):
    troop = Troop.objects.get(pk=request.GET.get('troop'))
    test = Quiz.objects.get(pk=request.GET.get('test'))
    students = Student.objects.filter(student_troop=troop)

    student_accesses = []

    for student in students:
        access = Access.objects.filter(student=student, quiz=test).first()
        mark_sum = sum([x.show_mark() for x in Mark.objects.filter(student=student, quiz=test)])
        AccessTuple = namedtuple('AccessTuple', ' student access mark_sum')
        student_accesses.append(AccessTuple(
            student=student,
            access=access,
            mark_sum=mark_sum
        ))

    context = {
        'current_troop': troop,
        'current_test': test,
        'student_accesses': student_accesses
    }
    return render(request, 'access_panel/students.html', context=context)


def submit_accesses(request):
    data = request.POST.getlist('access_checkbox')
    for item in data:
        item = item.split(';')
        student = Student.objects.filter(
            student_full_name=item[0],
            student_troop__troop_id=item[2]
        ).first()
        quiz = Quiz.objects.filter(quiz_title=item[1]).first()
        existing_access = Access.objects.filter(
            student__student_full_name=item[0],
            quiz__quiz_title=item[1]
        ).first()
        if existing_access is not None:
            existing_access.delete()
        else:
            Access.objects.create(
                student=student,
                quiz=quiz,
                access_granted=True
            )
    return redirect('access_panel')
