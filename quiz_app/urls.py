from django.urls import path
from .views import (
    render_tests_page,
    render_results,
    render_question_list,
    start_test,
    stop_test,
    render_result
)

urlpatterns = [
    path('tests/', render_tests_page, name='tests'),
    path('results/', render_results, name='results'),
    path('results/<int:result_id>', render_result, name='result'),
    path('questions/', render_question_list, name='questions'),
    path('start-test/<int:quiz_id>', start_test, name='test'),
    path('stop/<int:quiz_id>', stop_test, name='stop_test')
]