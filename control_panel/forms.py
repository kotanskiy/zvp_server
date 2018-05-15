from django import forms


class LoginForm(forms.Form):
    login_field = forms.CharField(label='Логін', max_length=100, required=True)
    password_field = forms.CharField(widget=forms.PasswordInput(), required=True)
