from django.shortcuts import render_to_response


def index_render(request):
    return render_to_response('control_panel/index.html')
