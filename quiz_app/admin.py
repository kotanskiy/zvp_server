from django.contrib import admin
from .models import Quiz, Question, Result, QuestionType
from control_panel.models import Student

admin.site.site_title = 'Кафедра Військової Підготовки. Адміністрування'
admin.site.site_header = 'Кафедра Військової Підготовки. Адміністрування'


class QuestionLayout(admin.ModelAdmin):

    list_display = (
        'question_discipline',
        'question_type',
        'question_content',
        'get_quizzes',
        'get_answers',
        'get_true_answer',
        'link'
    )

    list_display_links = ('link', )

    list_editable = (
        'question_discipline',
        'question_content',
    )


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


class ResultLayout(admin.ModelAdmin):

    def has_add_permission(self, request, obj=None):
        return False

    list_display = (
        'test',
        'student',
        'date_time_stamp'
    )


admin.site.register(Question, QuestionLayout)
admin.site.register(Quiz, QuizLayout)
admin.site.register(Result, ResultLayout)


@admin.register(QuestionType)
class QuestionTypeAdmin(admin.ModelAdmin):

    list_display = (
        'title',
    )
