from django.db import models
from control_panel.models import Discipline


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

    question_content = models.CharField(
        verbose_name='Питання',
        max_length=2000,
        help_text='Введіть питання, яке буде відображатися під час тесту'
    )

    question_discipline = models.ForeignKey(Discipline,
                                            on_delete=models.CASCADE,
                                            verbose_name='Предмет'
                                            )

    def __str__(self):
        return self.question_content


    def get_quizzes(self):
        return ',\n'.join([q.quiz_title for q in self.question_quiz.all()])

    get_quizzes.short_description = 'Тести'

    def get_answers(self):
        return Answer.objects.filter(answer_question=self)

    get_answers.short_description = 'Відповіді'


class Answer(models.Model):

    link = 'Редагувати'

    class Meta:
        db_table = 'Answers'
        verbose_name = 'Відповідь до питання'
        verbose_name_plural = 'Відповіді до питаннь'

    answer_question = models.ForeignKey(
        Question,
        on_delete=models.CASCADE,
        blank=False,
        verbose_name='Питання',
        help_text='Питання до якого відноситься відповідь'
    )

    answer_title = models.CharField(
        max_length=200,
        blank=False,
        verbose_name='Відповідь'
    )

    answer_is_correct = models.BooleanField(
        blank=False,
        default=False,
        help_text='Позначення, що відповідь на питання є вірною',
        verbose_name='Правильна відповідь? '
    )

    def __str__(self):
        return self.answer_title

