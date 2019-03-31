import ast
from collections import namedtuple
from urllib.parse import urlencode
from django.http import HttpResponse
from django.urls import reverse
from django.shortcuts import render, redirect
from .forms import LoginForm
from django.contrib.auth import authenticate, login
from control_panel.models import Student, Troop, Mark, Presence
from quiz_app.models import Quiz, Access, Result, Ticket

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
        presence = Presence.objects.filter(quiz=test, student=student)
        AccessTuple = namedtuple('AccessTuple', ' student access presence mark_sum')
        student_accesses.append(AccessTuple(
            student=student,
            access=access,
            presence=presence,
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
    presence_data = request.POST.getlist('presence_checkbox')
    for item in presence_data:
        item = item.split(';')
        student = Student.objects.filter(
            student_full_name=item[0],
            student_troop__troop_id=item[2]
        ).first()
        quiz = Quiz.objects.filter(quiz_title=item[1]).first()
        existing_presence = Presence.objects.filter(
            student=student,
            quiz=quiz
        ).first()
        if existing_presence is not None:
            existing_presence.delete()
        else:
            Presence.objects.create(
                quiz=quiz,
                student=student
            )
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
    if data:
        troop = Troop.objects.filter(troop_id=data[0].split(';')[2]).first()
        quiz = Quiz.objects.filter(quiz_title=data[0].split(';')[1]).first()
        base_url = reverse('access_panel')
        query_string = urlencode({'troop': troop.id, 'test': quiz.id})
        url = f'{base_url}?{query_string}'
        return redirect(url)
    else:
        troop = Troop.objects.filter(troop_id=presence_data[0].split(';')[2]).first()
        quiz = Quiz.objects.filter(quiz_title=presence_data[0].split(';')[1]).first()
        base_url = reverse('access_panel')
        query_string = urlencode({'troop': troop.id, 'test': quiz.id})
        url = f'{base_url}?{query_string}'
        return redirect(url)


def render_statistics_page(request):
    troops = Troop.objects.all()
    tests = Quiz.objects.all()
    context = {
        'troops': troops,
        'tests': tests
    }
    return render(request, 'statistics/index.html', context)


def load_students(request):
    troop = Troop.objects.filter(pk=request.GET.get('troop')).first()
    students = Student.objects.filter(student_troop=troop)

    context = {
        'students': students
    }
    return render(request, 'statistics/students.html', context)


def get_student_test_result(request):
    student = Student.objects.filter(pk=request.GET.get('student')).first()
    test = Quiz.objects.filter(pk=request.GET.get('test')).first()

    result = Result.objects.filter(
        student=student,
        test=test
    ).first()

    true_answers = {}
    ticket = Ticket.objects.filter(pk=result.ticket_id).first()
    questions = ticket.get_questions()

    for question in questions:
        for answer in question.get_answers():
            if answer.is_true:
                true_answers[question.question_content] = answer.title

    context = {
        'result': ast.literal_eval(result.results),
        'student': student,
        'test': test,
        'true_answers': true_answers
    }
    return render(request, 'statistics/result.html', context)
