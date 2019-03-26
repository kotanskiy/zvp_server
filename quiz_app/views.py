from django.shortcuts import render, get_object_or_404
from .models import Quiz, Question, Result, Access, StartingQuiz
from control_panel.models import Student, Mark
from django.contrib.auth.decorators import login_required
from datetime import datetime, timedelta
from django.core.exceptions import ObjectDoesNotExist
import ast
from django.db.models import Q

import logging
import datetime
from datetime import timedelta
import pytz

log = logging.getLogger(__name__)


@login_required
def render_question_list(request):
    question_list = Question.objects.all()
    return render(request, 'quiz_app/questions.html', {'question_list': question_list})


@login_required
def render_tests_page(request):
    student = Student.objects.get(user=request.user)
    accesses = Access.objects.filter(student=student)
    filtered_tests = []
    for access in accesses:
        result = Result.objects.get(
            test=access.quiz,
            student=student
        )
        if access.access_granted and not result:
            filtered_tests.append(access.quiz)
    return render(request, 'quiz_app/tests.html', {'tests': filtered_tests})


@login_required
def start_test(request, quiz_id):
    quiz = get_object_or_404(Quiz, pk=quiz_id)
    questions = Question.objects.all().filter(question_quiz=quiz)
    student = Student.objects.get(user=request.user)
    starting_quiz = StartingQuiz.objects.filter(quiz=quiz, student=student).first()
    if not starting_quiz:
        kiev_tz = pytz.timezone("Europe/Kiev")
        quiz_time = quiz.quiz_time.split(':')
        end_time = datetime.datetime.now(kiev_tz) + timedelta(minutes=int(quiz_time[0])) \
                   + timedelta(minutes=int(quiz_time[1]) / 60)
        starting_quiz = StartingQuiz.objects.create(
            quiz=quiz,
            student=student,
            endTestTime=end_time.timestamp()
        )

    return render(
        request,
        'quiz_app/questions.html',
        {
            'quiz': quiz,
            'questions': questions,
            'starting_quiz': starting_quiz,

        }
    )


@login_required
def stop_test(request, quiz_id):
    quiz = get_object_or_404(Quiz, pk=quiz_id)
    student = Student.objects.get(user=request.user)
    questions = Question.objects.all().filter(question_quiz=quiz)
    StartingQuiz.objects.filter(quiz=quiz, student=student).first().delete()

    # TODO end with true answer list!

    true_answers = {}

    for question in questions:
        if question.question_first_answer_state:
            true_answers[question.question_content] = question.question_first_answer_content
        elif question.question_second_answer_state:
            true_answers[question.question_content] = question.question_second_answer_content
        elif question.question_third_answer_state:
            true_answers[question.question_content] = question.question_third_answer_content
        elif question.question_fourth_answer_state:
            true_answers[question.question_content] = question.question_fourth_answer_content
        elif question.question_fifth_answer_state:
            true_answers[question.question_content] = question.question_fifth_answer_content
        else:
            raise NameError

    if request.POST:
        data = request.POST.copy()
        answer_list = {}
        for item in questions:
            answer_list[item.question_content] = data.get(str(item.question_content), "")
        mark = 0
        for key in true_answers:
            if true_answers[key] == answer_list[key]:
                mark += 1

        Result.objects.create(
            student=student,
            test=quiz,
            results=answer_list
        )

        try:
            ex_mark = Mark.objects.get(
                student=student,
                discipline=quiz.quiz_discipline,
                quiz=quiz,
            )

            if ex_mark.first_attempt_mark:
                ex_mark.second_attempt_mark = mark
            elif ex_mark.second_attempt_mark:
                ex_mark.third_attempt_mark = mark

        except ObjectDoesNotExist:

            Mark.objects.create(
                student=student,
                discipline=quiz.quiz_discipline,
                quiz=quiz,
                first_attempt_mark=mark
            )

        context = {
            'quiz': quiz,
            'student': student,
            'mark': mark,
            'question_count': len(answer_list)
        }

    return render(request, 'quiz_app/results.html', context)


@login_required
def render_results(request):
    student = Student.objects.get(user=request.user)
    results = Result.objects.all().filter(student=student)

    return render(request, 'quiz_app/all_results.html', {'results': results})


@login_required
def render_result(request, result_id):
    result = get_object_or_404(Result, pk=result_id)
    quiz_results = ast.literal_eval(result.results)

    true_answers = {}
    questions = Question.objects.filter(question_quiz=result.test)

    for question in questions:
        if question.question_first_answer_state:
            true_answers[question.question_content] = question.question_first_answer_content
        elif question.question_second_answer_state:
            true_answers[question.question_content] = question.question_second_answer_content
        elif question.question_third_answer_state:
            true_answers[question.question_content] = question.question_third_answer_content
        elif question.question_fourth_answer_state:
            true_answers[question.question_content] = question.question_fourth_answer_content
        elif question.question_fifth_answer_state:
            true_answers[question.question_content] = question.question_fifth_answer_content
        else:
            raise NameError

    context = {
        'result': result,
        'quiz_results': quiz_results,
        'mark': result.get_mark(),
        'max_mark': len(true_answers)
    }

    return render(request, 'quiz_app/result.html', context)
