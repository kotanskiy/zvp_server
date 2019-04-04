from .models import Ticket


class Cloner:

    def clone_questions(original, to_clone):
        for q in original.get_questions():
            new_q = q
            new_q.pk = None
            new_q.question_ticket = to_clone
            new_q.save()

    def clone_answers(original, to_clone):
        for q1, q2 in zip(original, to_clone):
            print(q1, q2)
            print('============================')
            if str(q1.question_content) == str(q2.question_content):
                for a in q1.get_answers():
                    print(a)
                    new_a = a
                    new_a.pk = None
                    new_a.question = q2
                    new_a.save()
