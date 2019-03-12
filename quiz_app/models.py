from django.db import models
from control_panel.models import Discipline, Student, Mark


DEFAULT_QUESTION_TYPE = 1


class Quiz(models.Model):

    link = 'Редагувати'

    class Meta:
        db_table = 'Quizzes'
        verbose_name = 'Тест'
        verbose_name_plural = 'Тести'

    quiz_title = models.CharField(
        verbose_name='Назва тесту',
        max_length=200,
        blank=False
    )

    quiz_description = models.TextField(
        verbose_name='Опис тесту',
        blank=True, help_text='Опис про тест та його питання'
    )

    quiz_discipline = models.ForeignKey(
        Discipline,
        null=True,
        blank=False,
        verbose_name='Предмет',
        help_text='Предмет з якого складається тест',
        on_delete=models.CASCADE
    )

    quiz_single_attempt = models.BooleanField(
        blank=False,
        default=False,
        help_text='Якщо так, студент матиме лише одну спробу.' 
                  'Незареєстрованні студенти не зможуть користуватися тестом (іспитом)',
        verbose_name='Лише одна спроба'
    )

    quiz_time = models.CharField(
        max_length=5,
        null=False,
        blank=False,
        verbose_name="Час на складання у форматі - 03:00",
        default="10:00"
    )

    def __str__(self):
        return self.quiz_title


class Answer(models.Model):

    question = models.ForeignKey(
        'quiz_app.Question',
        on_delete=models.CASCADE,
        verbose_name='Питання'
    )

    title = models.CharField(
        max_length=300,
        verbose_name='Текст відповіді'
    )

    is_true = models.BooleanField(
        default=False,
        verbose_name='Вірне',
        help_text='Вибрати, якщо питання є вірним'
    )

    def __str__(self):
        return self.title

    class Meta:
        db_table = 'answers'
        verbose_name = 'Відповідь'
        verbose_name_plural = 'Відповіді'


class Question(models.Model):

    link = 'Редагувати'

    class Meta:
        db_table = 'Questions'
        verbose_name = 'Питання'
        verbose_name_plural = 'Всі питання'

    question_ticket = models.ForeignKey(
        'quiz_app.Ticket',
        on_delete=models.SET_NULL,
        verbose_name='Білет',
        blank=False,
        null=True
    )

    question_content = models.CharField(
        verbose_name='Питання',
        max_length=2000,
        help_text='Введіть питання, яке буде відображатися під час тесту'
    )

    def __str__(self):
        return self.question_content

    def get_answers(self):
        return Answer.objects.filter(question=self)

    get_answers.short_description = 'Відповіді'

    def get_quizzes(self):
        return ',\n'.join([q.quiz_title for q in self.question_quiz.all()])

    get_quizzes.short_description = 'Тести'

    def get_true_answer(self):
        if self.question_first_answer_state:
            return 'A' + ': ' + str(self.question_first_answer_content)
        elif self.question_second_answer_state:
            return 'Б' + ': ' + str(self.question_second_answer_content)
        elif self.question_third_answer_state:
            return 'В' + ': ' + str(self.question_third_answer_content)
        elif self.question_fourth_answer_state:
            return 'Г' + ': ' + str(self.question_fourth_answer_content)
        elif self.question_fifth_answer_state:
            return 'Д' + ': ' + str(self.question_fifth_answer_content)

    get_true_answer.short_description = 'Правильна відповідь'


class Ticket(models.Model):
    title = models.CharField(
        max_length=120,
        verbose_name='Названня білету'
    )

    quiz = models.ForeignKey(
        'quiz_app.Quiz',
        on_delete=models.CASCADE,
        verbose_name='Тест'
    )

    def __str__(self):
        return self.title

    def get_questions(self):
        return Question.objects.filter(question_ticket=self)

    class Meta:
        db_table = 'tickets'
        verbose_name = 'Білет'
        verbose_name_plural = 'Білети'


class Result(models.Model):

    class Meta:
        db_table = 'Results'
        verbose_name = 'Результат'
        verbose_name_plural = 'Результати'
        unique_together = (
            'test',
            'student'
        )

    test = models.ForeignKey(
        Quiz,
        on_delete=models.CASCADE,
        null=False,
        blank=False,
        verbose_name='Тест',
        editable=False
    )

    student = models.ForeignKey(
        Student,
        on_delete=models.CASCADE,
        null=False,
        blank=False,
        editable=False,
        verbose_name='Студент'
    )

    results = models.TextField(
        null=False,
        blank=False,
        editable=False,
        verbose_name='Відповіді студента'
    )

    date_time_stamp = models.DateTimeField(
        auto_now_add=True,
        verbose_name='Дата та час складання тесту'
    )

    ticket = models.ForeignKey(
        'quiz_app.Ticket',
        on_delete=models.SET_NULL,
        verbose_name='Білет за яким був складений тест',
        null=True,
        editable=False
    )

    def __str__(self):
        return str(self.test) + ' ' + str(self.student) + ' ' + str(self.date_time_stamp)

    def get_mark(self):
        return Mark.objects.get(
            student=self.student,
            quiz=self.test
        ).show_mark()

    get_mark.short_description = 'Оцінка'


class Access(models.Model):

    student = models.ForeignKey(
        'control_panel.Student',
        on_delete=models.CASCADE,
        verbose_name='Студент'
    )

    quiz = models.ForeignKey(
        'quiz_app.Quiz',
        on_delete=models.CASCADE,
        verbose_name='Тест'
    )

    access_granted = models.BooleanField(
        default=False,
        verbose_name='Доступ',
        help_text='Відмітьте, якщо студент має доступ до складання тесту'
    )

    def __str__(self):
        return 'Допуск до тесту: {0}, студента: {1}'.format(self.quiz, self.student)

    class Meta:
        db_table = 'accesses'
        verbose_name_plural = 'Допуски'
        verbose_name = 'Допуск'
