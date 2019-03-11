from django.contrib import admin
from .models import Quiz, Question, Result, Access

admin.site.site_title = 'Кафедра Військової Підготовки. Адміністрування'
admin.site.site_header = 'Кафедра Військової Підготовки. Адміністрування'


@admin.register(Question)
class QuestionLayout(admin.ModelAdmin):

    list_display = (
        'question_discipline',
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
        'link'
    )

    list_display_links = ('link', )

    list_editable = (
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
        'date_time_stamp',
        'get_mark'
    )


@admin.register(Access)
class AccessModelAdmin(admin.ModelAdmin):

    list_display = (
        'student',
        'quiz',
        'access_granted'
    )
