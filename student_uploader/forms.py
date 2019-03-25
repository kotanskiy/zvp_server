from django import forms
from control_panel.models import Troop, Department
from quiz_app.models import Quiz


class UploadFileForm(forms.Form):
    title = forms.CharField(max_length=50)
    file = forms.FileField(required=True)
    troop = forms.ModelChoiceField(queryset=Troop.objects.all(), required=True, label='Взвод')


class DownloadFileForm(forms.Form):
    department = forms.ModelChoiceField(queryset=Department.objects.all(),
                                        label='Зберегти результати за ПМК', required=False)
    troop = forms.ModelChoiceField(queryset=Troop.objects.all(), label='Зберегти результати за Взводом', required=False)
    quiz = forms.ModelChoiceField(queryset=Quiz.objects.all(), label='За яким тестом результати?', required=True)

