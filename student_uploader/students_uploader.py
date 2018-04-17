import xlrd
import xlwt
import os
from transliterate import slugify
from control_panel.models import Student


class StudentUploader(object):

    PATH_FOR_SAVING = 'group_docs/'

    @classmethod
    def register_method(cls, file):
        students = cls.parse_file(file)
        if students is None:
            return 'Parsing error'
        for student in students:
            response = cls.check_student(student)
            if response != 'OK':
                return response
        for student in students:
            response = cls.register_user(cls.get_username(student[0]),
                                         student[0],
                                         student[1],
                                         student[2],
                                         student[3],
                                         student[4],
                                         student[5])
            if response != 'OK':
                return response
        return 'Зареєстровано успішно!'

    @staticmethod
    def check_student(student):
        if not (type(student) is list and len(student > 3)):
            return 'Incorrect student {0}'.format(str(student))
        if type(student[0]) is not str or student[0] == '':
            return "Incorrect name {0}".format(student[0])
        if type(student[1]) is not str or student[1] == '':
            return "Incorrect group {0}".format(student[1])

        if type(student[2]) is not str or student[2] == '':
            return "Incorrect faculty {0}".format(student[2])

        if type(student[3]) is not int and (type(student[3]) is not str and not student[3].isdecimal()):
            return "Incorrect grade {0}".format(student[3])
        return 'OK'

    @classmethod
    def handle_uploaded_file(cls, file, file_name: str):
        with open(cls.PATH_FOR_SAVING + file_name + '.xls', 'wb+') as destination:
            for chunk in file.chunks():
                destination.write(chunk)
            file_path = cls.PATH_FOR_SAVING + file_name + '.xls'
        return file_path

    @staticmethod
    def parse_file(file_path):
        try:
            rb = xlrd.open_workbook(file_path)
            sheet = rb.sheet_by_index(0)
            values = [sheet.row_values(row_number) for row_number in range(sheet.nrows)]
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
                      student_state=None,
                      student_notes=None):
        return Student.objects.create_student(username,
                                              student_full_name,
                                              student_university_group,
                                              student_faculty,
                                              student_grade,
                                              student_state,
                                              student_notes)

    @classmethod
    def rewrite_file_with_passwords(cls, file_name: str, student_data: list):
        try:
            wb = xlwt.Workbook()
            ws = wb.add_sheet('Паролі')
            i = 0
            for student in student_data:
                ws.write(i, 0, student)
                i = + i
            wb.save(cls.PATH_FOR_SAVING + file_name + '_passwords' + '.xls')
            os.remove(cls.PATH_FOR_SAVING + file_name + '.xls')
            return True
        except Exception as e:
            print('[ERROR] {}'.format(e))
            return False
