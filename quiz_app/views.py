from django.shortcuts import render, get_object_or_404
from .models import Quiz, Question, Result
from control_panel.models import Student
from django.contrib.auth.decorators import login_required
from datetime import datetime, timedelta

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

        context = {
            'student_name': student.student_full_name,
            'quiz_title': quiz.quiz_title,
            'results': answer_list.keys(),
            'results_values': answer_list.values()
        }

        print(context)

    return render(request, 'quiz_app/results.html', context)


@login_required
def render_results(request):
    student = Student.objects.get(user=request.user)
    results = Result.objects.all().filter(student=student)

    return render(request, 'quiz_app/all_results.html', {'results': results})


@login_required
def render_result(request, result_id):
    result = get_object_or_404(Result, pk=result_id)
    result_dict = {}
    return render(request, 'quiz_app/result.html', {'result': result})



