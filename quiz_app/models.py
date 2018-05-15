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

    question_first_answer_content = models.CharField(
        max_length=450,
        help_text='Варіант відповіді під літерою А',
        verbose_name='А',
        blank=False
    )
    question_first_answer_state = models.BooleanField(
        default=False,
        blank=False,
        help_text='Показчик чи є відповідь вірною',
        verbose_name='Правильна відповідь'
    )

    question_second_answer_content = models.CharField(
        max_length=450,
        help_text='Варіант відповіді під літерою А',
        verbose_name='Б',
        blank=False
    )
    question_second_answer_state = models.BooleanField(
        default=False,
        blank=False,
        help_text='Показчик чи є відповідь вірною',
        verbose_name = 'Правильна відповідь'
    )

    question_third_answer_content = models.CharField(
        max_length=450,
        help_text='Варіант відповіді під літерою А',
        verbose_name='В',
        blank=False
    )
    question_third_answer_state = models.BooleanField(
        default=False,
        blank=False,
        help_text='Показчик чи є відповідь вірною',
        verbose_name = 'Правильна відповідь'
    )

    question_fourth_answer_content = models.CharField(
        max_length=450,
        help_text='Варіант відповіді під літерою А',
        verbose_name='Г',
        blank=False
    )
    question_fourth_answer_state = models.BooleanField(
        default=False,
        blank=False,
        help_text='Показчик чи є відповідь вірною',
        verbose_name = 'Правильна відповідь'
    )

    question_fifth_answer_content = models.CharField(
        max_length=450,
        help_text='Варіант відповіді під літерою А',
        verbose_name='Д',
        blank=False
    )
    question_fifth_answer_state = models.BooleanField(
        default=False,
        blank=False,
        help_text='Показчик чи є відповідь вірною',
        verbose_name='Правильна відповідь'
    )

    def __str__(self):
        return self.question_content

    def get_answers(self):

        question_answer_list = (
            'A' + ': ' + str(self.question_first_answer_content),
            'Б' + ': ' + str(self.question_second_answer_content),
            'В' + ': ' + str(self.question_third_answer_content),
            'Г' + ': ' + str(self.question_fourth_answer_content),
            'Д' + ': ' + str(self.question_fifth_answer_content)
        )

        return ',\n'.join(question_answer_list)

    get_answers.short_description = 'Відповіді'

    def get_quizzes(self):
        return ',\n'.join([q.quiz_title for q in self.question_quiz.all()])

    get_quizzes.short_description = 'Тести'

