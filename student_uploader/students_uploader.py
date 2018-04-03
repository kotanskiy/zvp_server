import xlrd
import xlwt
import os
from transliterate import slugify


class StudentUploader(object):

    PATH_FOR_SAVING = 'group_docs/'

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
            return False

    @staticmethod
    def add_user_in_base(fullname: str):
        surname = slugify(fullname.split(' ')[0], 'uk')
        return surname

    @staticmethod
    def register_users(student_full_name,
                       student_university_group,
                       student_faculty,
                       student_grade,
                       student_state=None,
                       student_notes=None):
        return

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
