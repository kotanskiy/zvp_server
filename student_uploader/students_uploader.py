import xlrd, xlwt
from transliterate import slugify


class StudentUploader(object):

    PATH_FOR_SAVING = 'group_docs/'

    def file_validator(self):
        pass

    @classmethod
    def handle_uploaded_file(cls, file, file_name: str):
        with open(cls.PATH_FOR_SAVING + file_name + '.xls', 'wb+') as destination:
            for chunk in file.chunks():
                destination.write(chunk)
            file_path = cls.PATH_FOR_SAVING + file_name + '.xls'
        return file_path

    @staticmethod
    def parse_file(file_path):
        rb = xlrd.open_workbook(file_path)
        sheet = rb.sheet_by_index(0)
        values = [sheet.row_values(rownum) for rownum in range(sheet.nrows)]
        return values

    @staticmethod
    def add_user_in_base(fullname: str):
        surname = slugify(fullname.split(' ')[0], 'uk')