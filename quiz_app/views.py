from django.shortcuts import render
from .models import *
from django.contrib.auth.decorators import login_required
from datetime import datetime, timedelta


@login_required
def render_question_list(request):
    question_list = Question.objects.all()
    return render(request, 'quiz_app/questions.html', {'question_list': question_list})


@login_required
def render_tests_page(request):
    tests = Quiz.objects.all()
    return render(request, 'quiz_app/tests.html', {'tests': tests})


@login_required
def render_results(request):
    return render(request, 'quiz_app/results.html')


@login_required
def start_test(request):
    quiz_minutes = 20
    questions = Question.objects.all()
    test_name = 'Тест з ЗВП 1 на тему АК-74'
    time_start = datetime.now()
    time_end = time_start + timedelta(minutes=quiz_minutes)
    return render(request, 'quiz_app/questions.html',
                  {'questions': questions,
                   'test_name': test_name,
                   'time_end':time_end})
