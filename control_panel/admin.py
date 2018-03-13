from django.contrib import admin
from control_panel.models import *
from control_panel.forms import *

# Register your models here.


class TroopLayout(admin.ModelAdmin):
    list_editable = (
        'troop_head',
        'troop_head_rank',
        'troop_department',
    )
    list_display = (
        'troop_id',
        'troop_head',
        'troop_head_rank',
        'troop_department',
    )


admin.site.register(Troop, TroopLayout)


class TeacherLayout(admin.ModelAdmin):
    list_display = ('teacher_full_name',
                    'teacher_rank',
                    'teacher_department',
                    'teacher_check_tests'
            )

    list_editable = (
        'teacher_rank',
        'teacher_department',
        'teacher_check_tests'
        )


admin.site.register(Teacher, TeacherLayout)

admin.site.register(TeacherRank)


class StudentLayout(admin.ModelAdmin):
    list_display = (
        'student_full_name',
        'student_university_group',
        'student_faculty',
        'student_grade',
        'student_state',
        'student_notes',
    )

    list_editable = (
        'student_university_group',
        'student_faculty',
        'student_grade',
        'student_state',
        'student_notes',
    )


admin.site.register(Student, StudentLayout)


class DepartmentLayout(admin.ModelAdmin):
    list_display = (
        'department_name',
        'department_head',
        'department_head_rank',
    )

    list_editable = (
        'department_head',
        'department_head_rank',
    )


admin.site.register(Department, DepartmentLayout)


class DisciplineLayout(admin.ModelAdmin):
    list_display = (
        'discipline_name',
        'discipline_department_name',
    )


admin.site.register(Discipline, DisciplineLayout)
