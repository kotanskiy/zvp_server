import xlrd
import xlwt
import os
from transliterate import slugify
from control_panel.models import Student, Troop, Mark, Department
from quiz_app.models import Quiz
from django.contrib.auth.models import User
import string
import random
import datetime
import pytz


class StudentUploader(object):

    PATH_FOR_SAVING = os.path.dirname(os.path.dirname(__file__)) + '/group_docs/'

    @staticmethod
    def password_generator(size=6):
        password = ''
        for i in range(size):
            password += random.choice(string.ascii_letters)
        return password

    @classmethod
    def register_method(cls, file, troop):
        students = cls.parse_file(file)
        new_users = []
        if students is None:
            return 'Parsing error'
        for student in students:
            response = cls.check_student(student)
            if response != 'OK':
                return response

        for student in students:
            password = cls.password_generator(size=6)
            username = cls.get_username(student[0])
            user = None
            try:
                user = User.objects.get(username=username)
            except:
                pass
            i = 1
            while user is not None:
                user = None
                username += str(i)
                try:
                    user = User.objects.get(username=username)
                except:
                    pass

            try:
                Student.objects.get(student_full_name=student[0])
            except:
                pass
            else:
                return 'Вже є в базі {}'.format(student[0])
            if student[4] is None:
                student[4] = ''
            if student[5] is None:
                student[5] = ''
            troop_obj = Troop.objects.filter(pk=troop).first()
            response = cls.register_user(username,
                                         troop_obj,
                                         student[0],
                                         student[1],
                                         student[2],
                                         int(student[3]),
                                         student[4],
                                         student[5],
                                         password)
            new_users.append([username, password])
            if response != 'OK':
                return response
        cls.rewrite_file_with_passwords(file, new_users)
        return 'Зареєстровано успішно!'

    @staticmethod
    def check_student(student):
        if not (type(student) is list and len(student) > 3):
            return 'Incorrect student {0}'.format(str(student))
        if type(student[0]) is not str or student[0] == '':
            return "Incorrect name {0}".format(student[0])
        if type(student[1]) is not str or student[1] == '':
            return "Incorrect group {0}".format(student[1])

        if type(student[2]) is not str or student[2] == '':
            return "Incorrect faculty {0}".format(student[2])
        try:
            int(student[3])
        except:
            return "Incorrect grade {0}".format(student[3])
        return 'OK'

    @classmethod
    def handle_uploaded_file(cls, file, file_name: str):
        with open(cls.PATH_FOR_SAVING + slugify(file_name, 'uk') + '.xlsx', 'wb+') as destination:
            for chunk in file.chunks():
                destination.write(chunk)
            file_path = cls.PATH_FOR_SAVING + file_name + '.xlsx'
        return file_path

    @staticmethod
    def parse_file(file_path):
        try:
            rb = xlrd.open_workbook(file_path)
            sheet = rb.sheet_by_index(0)
            values = [sheet.row_values(row_number) for row_number in range(sheet.nrows) if row_number > 0]
            return values
        except Exception as e:
            print('[ERROR] {}'.format(e))
            return None

    @staticmethod
    def get_username(fullname: str):
        surname = slugify(fullname.split(' ')[0], 'uk')
        return surname

    @staticmethod
    def register_user(username,
                      troop,
                      student_full_name,
                      student_university_group,
                      student_faculty,
                      student_grade,
                      student_state='',
                      student_notes='',
                      password='',
                      ):
        return Student.objects.create_student(username,
                                              student_full_name,
                                              student_university_group,
                                              student_faculty,
                                              student_grade,
                                              student_state,
                                              student_notes,
                                              password,
                                              troop)

    @classmethod
    def rewrite_file_with_passwords(cls, file_name: str, student_data: list):
        try:
            wb = xlwt.Workbook()
            ws = wb.add_sheet('Паролі')
            ws.write(0, 0, 'Login')
            ws.write(0, 1, 'Пароль')
            for i in range(len(student_data)):
                for j in range(len(student_data[i])):
                    ws.write(i + 1, j, student_data[i][j])
            wb.save(file_name + 'passwords' + '.xls')
            os.remove(file_name)
            return True
        except Exception as e:
            print('[ERROR] {}'.format(e))
            return False

    @classmethod
    def write_file_results(cls, troop_pk=None, department_pk=None, quiz_pk=None):
        try:
            # kiev_tz = pytz.timezone("Europe/Kiev")
            quiz = Quiz.objects.filter(pk=quiz_pk).select_related().first()
            if troop_pk:
                troop = Troop.objects.filter(pk=troop_pk).select_related().first()
                students = Student.objects.filter(student_troop=troop).select_related()
                wb = xlwt.Workbook()
                ws = wb.add_sheet('Результати за взводом', cell_overwrite_ok=True)
                file_name = 'ResultZvod-{}-{}-{}'.format(quiz.quiz_title,troop.troop_id, datetime.datetime.now())
                cls.write_all_rows(ws=ws, wb=wb ,students=students, file_name=file_name, quiz=quiz)
            elif department_pk:
                department = Department.objects.filter(pk=department_pk).select_related().first()
                students = []
                troops = Troop.objects.filter(troop_department=department).select_related()
                for troop in troops:
                    for stud in Student.objects.filter(student_troop=troop).select_related():
                        students.append(stud)
                wb = xlwt.Workbook()
                ws = wb.add_sheet('Результати за ПМК', cell_overwrite_ok=True)
                file_name = 'ResultPMK-{}-{}-{}'.format(quiz.quiz_title, department.department_name, datetime.datetime.now())
                cls.write_all_rows(ws=ws, wb=wb ,students=students, file_name=file_name, quiz=quiz)

            return True
        except Exception as e:
            print('[ERROR] {}'.format(e))
            return False

    @classmethod
    def write_all_rows(cls, ws, wb ,students, quiz ,file_name):
        try:
            ws.write(0, 0, 'ПІБ')
            ws.write(0, 1, 'Взвод')
            ws.write(0, 2, 'Группа')
            ws.write(0, 3, 'Факультет або ВНЗ')
            ws.write(0, 4, 'Курс')
            ws.write(0, 5, 'Статус')
            ws.write(0, 6, 'Примітки')
            ws.write(0, 7, 'Предмет')
            ws.write(0, 8, 'Назва тесту')
            ws.write(0, 9, 'Оцінка за першу спробу')
            ws.write(0, 10, 'Оцінка за другу спробу')
            ws.write(0, 11, 'Оцінка за третю спробу')

            for i, student in enumerate(students):
                mark_test = Mark.objects.filter(student=student, quiz=quiz).select_related().first()
                ws.write(i + 1, 0, student.student_full_name)
                ws.write(i + 1, 1, student.student_troop.troop_id)
                ws.write(i + 1, 2, student.student_university_group)
                ws.write(i + 1, 3, student.student_faculty)
                ws.write(i + 1, 4, student.student_grade)
                ws.write(i + 1, 5, student.student_state)
                ws.write(i + 1, 6, student.student_notes)
                ws.write(i + 1, 7, quiz.quiz_discipline.discipline_name)
                ws.write(i + 1, 8, quiz.quiz_title)
                if mark_test:
                    ws.write(i + 1, 9, mark_test.first_attempt_mark)
                    ws.write(i + 1, 10, mark_test.second_attempt_mark)
                    ws.write(i + 1, 11, mark_test.third_attempt_mark)
                else:
                    for j in range(4):
                        style_fail = xlwt.easyxf('pattern: pattern solid, fore_colour red;')
                        ws.write(i + 1, 9+j, '', style_fail)


            wb.save(cls.PATH_FOR_SAVING + file_name + '.xls')
            return True
        except Exception as e:
            print('[ERROR] {}'.format(e))
            return False
