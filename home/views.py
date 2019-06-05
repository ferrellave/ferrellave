from django.shortcuts import render
from django.http import HttpResponse
from django.utils import timezone
from django.views import generic

def index_view(request):
    context = {
        'ahora': timezone.now()
    }
    return render(request, 'home/index.html', context)


class AboutView(generic.View):

    def get(self, request, *args, **kwargs):
        return render(request, 'home/about.html')