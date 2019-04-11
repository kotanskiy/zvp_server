from django.contrib import admin
from django.contrib.auth import get_user_model
from control_panel.models import *
from control_panel.forms import *


admin.site.site_title = 'Кафедра Військової Підготовки. Адміністрування'
admin.site.site_header = 'Кафедра Військової Підготовки. Адміністрування'


@admin.register(TeacherRank)
class TeacherRankLayout(admin.ModelAdmin):
    list_display = ('teacher_rank', 'link')
    list_display_links = ('link', )


@admin.register(Troop)
class TroopLayout(admin.ModelAdmin):
    list_display_links = ('link',)

    list_display = (
        'troop_id',
        'troop_head',
        'troop_head_rank',
        'troop_department',
        'link'
    )


@admin.register(Teacher)
class TeacherLayout(admin.ModelAdmin):
    list_display = (
        'teacher_full_name',
        'teacher_rank',
        'teacher_department',
        'teacher_check_tests',
        'link'
    )

    list_display_links = ('link',)


@admin.register(Student)
class StudentLayout(admin.ModelAdmin):

    list_display = (
        'student_full_name',
        'student_troop',
        'troop_commander',
        'student_university_group',
        'student_faculty',
        'student_grade',
        'show_marks',
        'student_state',
        'student_notes',
        'link'
    )

    list_filter = (
        'troop_commander',
        'student_troop',
        'student_university_group',
        'student_faculty',
        'student_grade'
    )

    list_display_links = ('link',)


@admin.register(Department)
class DepartmentLayout(admin.ModelAdmin):
    list_display = (
        'department_name',
        'department_head',
        'department_head_rank',
        'link'
    )

    list_display_links = ('link',)


@admin.register(Discipline)
class DisciplineLayout(admin.ModelAdmin):
    list_display = (
        'discipline_name',
        'discipline_department_name',
        'link'
    )

    list_display_links = ('link', )


@admin.register(Mark)
class MarkAdmin(admin.ModelAdmin):

    list_display = (
        'student',
        'get_troop',
        'discipline',
        'quiz',
        'show_mark',
        'link',

    )

    list_display_links = (
        'link',
    )

    def get_troop(self, obj):
        return obj.student.student_troop.troop_id

    get_troop.short_description = 'Взвод'


