import xlrd
import xlwt
import os
from transliterate import slugify
from control_panel.models import Student
from django.contrib.auth.models import User
import string
import random


class StudentUploader(object):

    PATH_FOR_SAVING = 'group_docs/'

    @staticmethod
    def password_generator(size=6):
        password = ''
        for i in range(size):
            password += random.choice(string.ascii_letters)
        return password

    @classmethod
    def register_method(cls, file):
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
            response = cls.register_user(username,
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
                      student_full_name,
                      student_university_group,
                      student_faculty,
                      student_grade,
                      student_state='',
                      student_notes='',
                      password=''):
        return Student.objects.create_student(username,
                                              student_full_name,
                                              student_university_group,
                                              student_faculty,
                                              student_grade,
                                              student_state,
                                              student_notes,
                                              password)

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
