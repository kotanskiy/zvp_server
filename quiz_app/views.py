from django.shortcuts import render, get_object_or_404
from .models import Quiz, Question, Result
from control_panel.models import Student
from django.contrib.auth.decorators import login_required
from datetime import datetime, timedelta
import ast

import logging
log = logging.getLogger(__name__)


@login_required
def render_question_list(request):
    question_list = Question.objects.all()
    return render(request, 'quiz_app/questions.html', {'question_list': question_list})


@login_required
def render_tests_page(request):
    tests = Quiz.objects.all()
    return render(request, 'quiz_app/tests.html', {'tests': tests})


@login_required
def start_test(request, quiz_id):
    # quiz_minutes = 20
    quiz = get_object_or_404(Quiz, pk=quiz_id)
    questions = Question.objects.all().filter(question_quiz=quiz)
    # test_name = 'Тест з ЗВП 1 на тему АК-74'
    # time_start = datetime.now()
    # time_end = time_start + timedelta(minutes=quiz_minutes)
    return render(
        request,
        'quiz_app/questions.html',
        {
            'quiz': quiz,
            'questions': questions
        }
    )


@login_required
def stop_test(request, quiz_id):
    quiz = get_object_or_404(Quiz, pk=quiz_id)
    student = Student.objects.get(user=request.user)
    questions = Question.objects.all().filter(question_quiz=quiz)

    # TODO end with true answer list!

    # true_answers = {}

    # for question in questions:
    #     if question.question_first_answer_state:
    #         true_answers[question.question_content] = question.question_first_answer_content
    #     elif question.question_second_answer_state:
    #         true_answers[question.question_content] = question.question_second_answer_content

    if request.POST:
        data = request.POST.copy()
        answer_list = {}
        for item in questions:
            answer_list[item.question_content] = data.get(str(item.question_content), "")

        result = Result.objects.create(
            student=student,
            test=quiz,
            results=answer_list
        )

    return render(request, 'quiz_app/results.html', {'result': result})


@login_required
def render_results(request):
    student = Student.objects.get(user=request.user)
    results = Result.objects.all().filter(student=student)

    return render(request, 'quiz_app/all_results.html', {'results': results})


@login_required
def render_result(request, result_id):
    result = get_object_or_404(Result, pk=result_id)
    quiz_results = ast.literal_eval(result.results)
    return render(request, 'quiz_app/result.html', {'result': result, 'quiz_results': quiz_results})


