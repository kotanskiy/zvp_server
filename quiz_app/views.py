from django.shortcuts import render
from .models import *


def render_question_list(request):
    question_list = Question.objects.all()

    return render(request, 'quiz_app/question.html', {'question_list': question_list})

