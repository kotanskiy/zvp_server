from django.shortcuts import render_to_response, render


def index_render(request):
    return render_to_response('control_panel/index.html')
