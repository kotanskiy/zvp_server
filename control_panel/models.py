from django.db import models


class TeacherRank(models.Model):

    class Meta:
        db_table = 'Teacher\'s ranks'
        verbose_name = 'Звання викладача'
        verbose_name_plural = 'Звання викладачів'

    teacher_rank = models.CharField(max_length=100, verbose_name="Звання")

    def __str__(self):
        return self.teacher_rank


class Teacher(models.Model):

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

    class Meta:
        db_table = 'Departments'
        verbose_name = 'Кафедра'
        verbose_name_plural = 'Кафедри'

    department_name = models.CharField(max_length=100, default=None, verbose_name="Назва")
    department_head = models.ForeignKey(Teacher, on_delete=models.CASCADE, related_name='+', blank=True, null=True, verbose_name="Голова")
    department_head_rank = models.ForeignKey(TeacherRank, on_delete=models.CASCADE, related_name='+', blank=True, null=True, verbose_name="Звання голови")

    def __str__(self):
        return self.department_name


class Student(models.Model):

    class Meta:
        db_table = 'Students'
        verbose_name = 'Студент'
        verbose_name_plural = 'Студенти'

    student_full_name = models.CharField(max_length=200, default=None, verbose_name="ПІБ")
    student_university_group = models.CharField(max_length=10, default=None, verbose_name="Группа")
    student_faculty = models.CharField(max_length=15, default=None, verbose_name="Факультет або ВНЗ")
    student_grade = models.IntegerField(default=None, verbose_name="Курс")
    student_state = models.CharField(max_length=100,default=None, blank=True, verbose_name="Статус")
    student_notes = models.TextField(default=None, blank=True, verbose_name="Примітки")

    def __str__(self):
        return self.student_full_name


class Discipline(models.Model):

    class Meta:
        db_table = 'Disciplines'
        verbose_name = 'Предмет'
        verbose_name_plural = 'Предмети'

    discipline_name = models.CharField(max_length=100, verbose_name="Назва")
    discipline_department_name = models.ForeignKey(Department, on_delete=models.CASCADE, related_name='+',blank=True, null=True, verbose_name="Кафедра")

    def __str__(self):
        return self.discipline_name


class Troop(models.Model):

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
