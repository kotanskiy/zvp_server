from django.contrib import admin
from .models import Quiz, Question, Result, Access, Ticket, Answer
import nested_admin

admin.site.site_title = 'Кафедра Військової Підготовки. Адміністрування'
admin.site.site_header = 'Кафедра Військової Підготовки. Адміністрування'


@admin.register(Question)
class QuestionLayout(admin.ModelAdmin):

    list_display = (
        'question_content',
        'get_quizzes',
        'get_answers',
        'get_true_answer',
        'link'
    )

    list_display_links = ('link', )


@admin.register(Quiz)
class QuizLayout(admin.ModelAdmin):

    list_display = (
        'quiz_title',
        'quiz_description',
        'quiz_discipline',
        'quiz_single_attempt',
    )


@admin.register(Result)
class ResultLayout(admin.ModelAdmin):

    def has_add_permission(self, request, obj=None):
        return False

    list_display = (
        'test',
        'student',
        'results',
        'date_time_stamp',
        'get_mark'
    )


@admin.register(Answer)
class AnswerModelAdmin(admin.ModelAdmin):
    list_display = (
        'title',
        'question',
        'is_true'
    )


class AnswerInline(nested_admin.NestedStackedInline):
    model = Answer
    extra = 1


class QuestionTable(nested_admin.NestedStackedInline):
    model = Question
    extra = 0
    inlines = [AnswerInline]


@admin.register(Ticket)
class TicketModelAdmin(nested_admin.NestedModelAdmin):
    list_display = (
        'title',
        'quiz',
    )

    inlines = [QuestionTable]
