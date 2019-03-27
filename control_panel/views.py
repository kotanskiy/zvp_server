from django.shortcuts import render, redirect
from .forms import LoginForm
from django.contrib.auth import authenticate, login
from control_panel.models import Student, Troop
from quiz_app.models import Quiz

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

    context = {
        'current_troop': troop,
        'current_test': test,
        'students': students
    }
    return render(request, 'access_panel/students.html', context=context)
