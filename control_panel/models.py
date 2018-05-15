from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.models import Group
from picklefield.fields import PickledObjectField


class TeacherRank(models.Model):

    link = 'Редагувати'

    class Meta:
        db_table = 'Teacher\'s ranks'
        verbose_name = 'Звання викладача'
        verbose_name_plural = 'Звання викладачів'

    teacher_rank = models.CharField(max_length=100, verbose_name="Звання")

    def __str__(self):
        return self.teacher_rank


class Teacher(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

    link = 'Редагувати'

    class Meta:
        db_table = 'Teachers'
        verbose_name = 'Викладач'
        verbose_name_plural = 'Викладачі'

    teacher_full_name = models.CharField(max_length=200, default=None, verbose_name="ПІБ")
    teacher_rank = models.ForeignKey(TeacherRank, on_delete=models.CASCADE, related_name='+', blank =True, null=True,verbose_name="Звання")
    teacher_department = models.ForeignKey('control_panel.Department', on_delete=models.CASCADE, related_name='+', blank=True, null=True, verbose_name="Кафедра")
    teacher_check_tests = models.BooleanField(default=False, verbose_name="Приймає контрольні")

    def __str__(self):
        return self.teacher_full_name


class Department(models.Model):

    link = 'Редагувати'

    class Meta:
        db_table = 'Departments'
        verbose_name = 'Кафедра'
        verbose_name_plural = 'Кафедри'

    department_name = models.CharField(max_length=100, default=None, verbose_name="Назва")
    department_head = models.ForeignKey(Teacher, on_delete=models.CASCADE, related_name='+', blank=True, null=True, verbose_name="Голова")
    department_head_rank = models.ForeignKey(TeacherRank, on_delete=models.CASCADE, related_name='+', blank=True, null=True, verbose_name="Звання голови")

    def __str__(self):
        return self.department_name


class StudentManager(models.Manager):

    def create_student(self, username, full_name, uni_group, faculty, grade, state, notes, password):
        if type(full_name) is not str or full_name == '':
            return "Incorrect name {0}".format(full_name)

        if type(uni_group) is not str or uni_group == '':
            return "Incorrect group {0}".format(uni_group)

        if type(faculty) is not str or faculty == '':
            return "Incorrect faculty {0}".format(faculty)

        if type(grade) is not int and (type(grade) is not str and not grade.isdecimal()):
            return "Incorrect grade {0}".format(grade)
        try:
            self.create(
                student_full_name=full_name,
                student_university_group=uni_group,
                student_faculty=faculty,
                student_grade=int(grade),
                student_state=state,
                student_notes=notes,
                user=User.objects.create_user(username=username, email=None, password=password)
            )
        except Exception as e:
            return '[ERROR] {0}'.format(e)
        else:
            return 'OK'


class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, blank=True)
    link = 'Редагувати'

    class Meta:
        db_table = 'Students'
        verbose_name = 'Студент'
        verbose_name_plural = 'Студенти'

    student_active = models.BooleanField(default=True)

    objects = StudentManager()

    student_full_name = models.CharField(max_length=200, default=None, verbose_name="ПІБ", blank=True, null=True)
    student_university_group = models.CharField(max_length=10, default=None, verbose_name="Группа",  blank=True, null=True)
    student_faculty = models.CharField(max_length=15, default=None, verbose_name="Факультет або ВНЗ",  blank=True, null=True)
    student_grade = models.IntegerField(default=None, verbose_name="Курс",  blank=True, null=True)
    student_state = models.CharField(max_length=100,default=None, blank=True, verbose_name="Статус", null=True)
    student_notes = models.TextField(default=None, blank=True, verbose_name="Примітки", null=True)
    student_quizzes = PickledObjectField()

    def __str__(self):
        return self.student_full_name

    def set_mark(self, quiz, mark,):
        print(quiz)
        print(mark)
        mylist = list(self.student_quizzes)
        mylist.append({quiz: mark})
        self.student_quizzes = mylist
        self.save()

    def show_marks(self):
        marks = self.student_quizzes
        return marks


class Discipline(models.Model):

    link = 'Редагувати'

    class Meta:
        db_table = 'Disciplines'
        verbose_name = 'Предмет'
        verbose_name_plural = 'Предмети'

    discipline_name = models.CharField(max_length=100, verbose_name="Назва")
    discipline_department_name = models.ForeignKey(Department, on_delete=models.CASCADE, related_name='+',blank=True, null=True, verbose_name="Кафедра")

    def __str__(self):
        return self.discipline_name


class Troop(models.Model):

    link = 'Редагувати'

    class Meta:
        db_table = 'Troops'
        verbose_name = 'Взвод'
        verbose_name_plural = 'Взводи'

    troop_id = models.IntegerField(default=None, verbose_name="Номер взводу")
    troop_head = models.ForeignKey(Teacher, on_delete=models.CASCADE, related_name='+', blank=True, null=True, verbose_name="Куратор")

    troop_head_rank = models.ForeignKey(TeacherRank, on_delete=models.CASCADE, related_name='+', blank=True, null=True, verbose_name="Звання Куратора")
    troop_department = models.ForeignKey(Department, on_delete=models.CASCADE, related_name='+', blank=True, null=True, verbose_name="Кафедра")

    def __str__(self):
        return str(self.troop_id)
