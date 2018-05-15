from django.shortcuts import render
from .models import *
from django.contrib.auth.decorators import login_required


@login_required
def render_question_list(request):
    question_list = Question.objects.all()
    return render(request, 'quiz_app/question.html', {'question_list': question_list})


@login_required
def render_tests_page(request):
    return render(request, 'quiz_app/tests.html')

