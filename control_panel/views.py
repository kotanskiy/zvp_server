from django.shortcuts import render, redirect
from .forms import LoginForm
from django.contrib.auth import authenticate


def index_render(request):
    form = LoginForm()
    return render(request, 'control_panel/index.html', {'form': form})


def login_user(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        user = None
        if form.is_valid():
            user = authenticate(username=request.POST['login_field'],
                                password=request.POST['password_field'])
        if user is None:
            return render(request,
                          'control_panel/index.html',
                          {'message': 'Невірний логін чи пароль',
                           'form': form})
        return redirect('/tests')
    else:
        form = LoginForm()
        return render(request,
                      'control_panel/index.html',
                      {'message': 'Used get method',
                       'form': form})
