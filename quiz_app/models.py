from django.db import models
from control_panel.models import Discipline, Student
from model_utils.managers import InheritanceManager


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


class Question(models.Model):

    link = 'Редагувати'

    class Meta:
        db_table = 'Questions'
        verbose_name = 'Питання'
        verbose_name_plural = 'Всі питання'

    question_quiz = models.ManyToManyField(
        Quiz,
        verbose_name='Тест',
        blank=False
    )

    question_mark_value = models.PositiveIntegerField(
        null=False,
        blank=False,
        verbose_name="Кількість балів за питання",
        default=1
    )
    question_content = models.CharField(
        verbose_name='Питання',
        max_length=2000,
        help_text='Введіть питання, яке буде відображатися під час тесту'
    )

    question_discipline = models.ForeignKey(
        Discipline,
        on_delete=models.CASCADE,
        verbose_name='Предмет'
    )

    objects = InheritanceManager()

    def __str__(self):
        return self.question_content

    def get_quizzes(self):
        return ',\n'.join([q.quiz_title for q in self.question_quiz.all()])

    get_quizzes.short_description = 'Тести'


class Answer(models.Model):

    class Meta:
        db_table = 'answers'
        verbose_name = 'Відповідь'
        verbose_name_plural = 'Відповіді'

    question = models.ForeignKey(
        Question,
        on_delete=models.CASCADE
    )

    content = models.CharField(
        max_length=120,
        null=False,
        blank=False,
        verbose_name='Текст відповіді'
    )

    is_correct = models.BooleanField(
        verbose_name='Правильна відповідь',
        default=False
    )

    def __str__(self):
        return self.content


class MCQuestion(Question):

    class Meta:
        db_table = 'mc_questions'
        verbose_name = 'Питання з декількома варіантами відповідей'
        verbose_name_plural = 'Питання з декількома варіантами відповідей'

    def check_if_correct(self, guess):
        answer = Answer.objects.get(id=guess)

        if answer.is_correct:
            return True
        else:
            return True

    def get_answers(self):
        return Answer.objects.filter(question=self)

    def answer_choice_to_string(self, guess):
        return Answer.objects.get(id=guess).content



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

    def __str__(self):
        return str(self.test) + ' ' + str(self.student) + ' ' + str(self.date_time_stamp)


class QuestionType(models.Model):

    class Meta:
        db_table = 'question_types'
        verbose_name = 'Тип питання'
        verbose_name_plural = 'Типи питання'

    title = models.CharField(
        max_length=120,
        null=False,
        blank=False,
        default=""
    )

    def __str__(self):
        return self.title
