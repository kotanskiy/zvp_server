from django.shortcuts import render, get_object_or_404
from .models import Quiz, Question, Result, Access, Ticket, StartingQuiz
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
        try:
            result = Result.objects.get(
                test=access.quiz,
                student=student
            )
        except Result.DoesNotExist:
            result = None
        if access.quiz.quiz_type == Quiz.EXAM and access.access_granted and not result:
            filtered_tests.append(access.quiz)
        elif access.quiz.quiz_type == Quiz.CONTROL_WORK and not result:
            filtered_tests.append(access.quiz)
    return render(request, 'quiz_app/tests.html', {'tests': filtered_tests})


@login_required
def start_test(request, quiz_id):
    quiz = get_object_or_404(Quiz, pk=quiz_id)
    ticket = Ticket.objects.filter(quiz=quiz).order_by('?').first()
    questions = ticket.get_questions()
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


def control_work_calculate_mark(mark):
    if mark >= 18:
        return 8
    elif mark >= 17:
        return 7
    elif mark >= 15:
        return 6
    elif mark >= 13:
        return 5
    elif mark >= 11:
        return 4
    elif mark >= 4:
        return 0


def exam_calculate_mark(fire_training_mark, statutes_mark):
    if fire_training_mark >= 13 and statutes_mark >= 14:
        return 12
    elif fire_training_mark >= 12 and statutes_mark >= 13:
        return 10
    elif fire_training_mark >= 10 and statutes_mark >= 11:
        return 8
    elif fire_training_mark >= 8 and statutes_mark >= 9:
        return 7
    elif fire_training_mark >= 7 and statutes_mark >= 8:
        return 6
    elif fire_training_mark < 7 and statutes_mark < 8:
        return 5


@login_required
def stop_test(request, quiz_id):
    quiz = get_object_or_404(Quiz, pk=quiz_id)
    student = Student.objects.get(user=request.user)
    ticket = Ticket.objects.filter(quiz=quiz).order_by('?').first()
    questions = ticket.get_questions()
    StartingQuiz.objects.filter(quiz=quiz, student=student).first().delete()

    true_answers = {}

    for question in questions:
        for answer in question.get_answers():
            if answer.is_true:
                true_answers[question.question_content] = answer.title

    if request.POST:
        data = request.POST.copy()
        answer_list = {}
        for item in questions:
            answer_list[item.question_content] = data.get(str(item.question_content), "")
        mark = 0
        fire_training_mark = 0
        statutes_mark = 0
        fire_training_dict = {k: answer_list[k] for k in list(answer_list)[:14]}
        statutes_dict = {k: answer_list[k] for k in list(answer_list)[14:]}
        for key in true_answers:
            if quiz.quiz_type == Quiz.CONTROL_WORK:
                if true_answers[key] == answer_list[key]:
                    mark += 1
        for key in fire_training_dict:
            if true_answers[key] == fire_training_dict[key]:
                fire_training_mark += 1
        for key in statutes_dict:
            if true_answers[key] == statutes_dict[key]:
                statutes_mark += 1

        if quiz.quiz_type == Quiz.CONTROL_WORK:
            mark = control_work_calculate_mark(mark)
        else:
            mark = exam_calculate_mark(fire_training_mark, statutes_mark)

        Result.objects.create(
            student=student,
            test=quiz,
            results=answer_list,
            ticket=ticket
        )

        try:
            ex_mark = Mark.objects.get(
                student=student,
                discipline=quiz.quiz_discipline,
                quiz=quiz,
            )

            print('mark exist', ex_mark.first_attempt_mark)

            if ex_mark.first_attempt_mark is not None:
                ex_mark.second_attempt_mark = mark
                ex_mark.save()
            if ex_mark.second_attempt_mark is not None:
                ex_mark.third_attempt_mark = mark
                ex_mark.save()
            if ex_mark.third_attempt_mark:
                raise Mark.DoesNotExist

        except Mark.DoesNotExist:

            Mark.objects.create(
                student=student,
                discipline=quiz.quiz_discipline,
                quiz=quiz,
                first_attempt_mark=mark
            )

        max_mark = 12 if quiz.quiz_type == Quiz.EXAM else 8

        context = {
            'quiz': quiz,
            'student': student,
            'mark': mark,
            'max_mark': max_mark
        }

    return render(request, 'quiz_app/results.html', context)


@login_required
def render_results(request):
    student = Student.objects.get(user=request.user)
    results = Result.objects.filter(student=student)

    return render(request, 'quiz_app/all_results.html', {'results': results})


@login_required
def render_result(request, result_id):
    result = get_object_or_404(Result, pk=result_id)
    quiz_results = ast.literal_eval(result.results)

    true_answers = {}
    ticket = Ticket.objects.filter(quiz=result.test).order_by('?').first()
    questions = ticket.get_questions()

    for question in questions:
        for answer in question.get_answers():
            if answer.is_true:
                true_answers[question.question_content] = answer.title

    max_mark = 12 if ticket.quiz.quiz_type == Quiz.EXAM else 8
    context = {
        'result': result,
        'quiz_results': quiz_results,
        'mark': result.get_mark(),
        'max_mark': max_mark
    }

    return render(request, 'quiz_app/result.html', context)
