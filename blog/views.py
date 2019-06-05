from django.shortcuts import render, render_to_response, get_object_or_404, redirect
from django.views import generic
from django.conf import settings
from django.core.urlresolvers import reverse_lazy

from .forms import ArticleCreateForm, FormularioContacto
from .models import *
from accounts.models import *
from medias.models import *
from geography.models import *

from django.contrib import messages 
from django.core.mail import send_mail
from django.core.mail import EmailMessage
from django.template import RequestContext
from django.http import HttpResponseBadRequest, HttpResponse, HttpRequest, HttpResponseRedirect
from django.core import serializers
import re
from django.db.models import Q
from django.core.context_processors import csrf
from django import forms 
from django.middleware.csrf import CsrfViewMiddleware, get_token
from django.utils.decorators import available_attrs, decorator_from_middleware

class ArticleListView(generic.ListView):

    template_model = 'blog/article_list.html'
    model = Article
    context_object_name = 'article'
    paginate_by = 120
    ordering = '-create_at'
    page = Page.objects.all().order_by('-color')

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(ArticleListView, self).get_context_data(**kwargs)
        # Add in a QuerySet of all the books
        context['category'] = Category.objects.all()
        context['section'] = Section.objects.all().order_by('-create_at')
        context['tag'] = Tag.objects.all()
        context['trend'] = Trend.objects.all()
        context['config'] = Config.objects.all()
        context['red'] = Red.objects.all()
        context['media'] = Media.objects.all()
        context['userprofile'] = UserProfile.objects.all()
        context['profile'] = Profile.objects.all()
        context['page'] = Page.objects.all()
        context['mediaCategory'] = MediaCategory.objects.all()
        return context

def ArticleDetailView(request, slug):

    template = 'blog/article_detail.html'
    link = Article.objects.get(slug = slug)
    article = Article.objects.all()
    section = Section.objects.all().order_by('-create_at')
    category = Category.objects.all()
    tag = Tag.objects.all()
    red = Red.objects.all()
    userprofile = UserProfile.objects.all()
    profile = Profile.objects.all()
    media = Media.objects.all()
    mediaCategory = MediaCategory.objects.all()
    trend = Trend.objects.all()
    config = Config.objects.all()
    page = Page.objects.all().order_by('-color')
    return render_to_response(template,locals(),
                                context_instance=RequestContext(request))

class ArticleCreateView(generic.CreateView):

    template_model = 'blog/article_form.html'
    model = Article
    form_class = ArticleCreateForm

    def dispatch(self, request, *args, **kwargs):
   #     if not request.user.has_perms('blog.add_article'):
    #        return redirect(settings.LOGIN_URL)
        return super(ArticleCreateView, self).dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        # Obtenemos el contexto de la clase base
        context = super(ArticleCreateView, self).get_context_data(**kwargs)
        # anadimos nuevas variables de contexto al diccionario
        context['title'] = 'Share a great experience'
        context['nombre_btn'] = 'IO'
        context['config'] = Config.objects.all()
        context['red'] = Red.objects.all()
        context['category'] = Category.objects.all()
        context['section'] = Section.objects.all().order_by('-create_at')
        # devolvemos el contexto
        return context

    def form_valid(self, form):
        form.instance.owner = self.request.user
        return super(ArticleCreateView, self).form_valid(form)

class ArticleUpdateView(generic.UpdateView):

    template_model = 'blog/article_form.html'
    model = Article
    form_class = ArticleCreateForm

    def dispatch(self, request, *args, **kwargs):
        if not request.user.has_perms('blog.change_article'):
            return redirect(settings.LOGIN_URL)
        return super(ArticleUpdateView, self).dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        # Obtenemos el contexto de la clase base
        context = super(ArticleUpdateView, self).get_context_data(**kwargs)
        # anadimos nuevas variables de contexto al diccionario
        context['title'] = 'Editar articulo'
        context['nombre_btn'] = 'Editar'
        context['config'] = Config.objects.all()
        context['red'] = Red.objects.all()
        # devolvemos el contexto
        return context

class ArticleDeleteView(generic.DeleteView):

    template_name = 'blog/confirmar_eliminacion.html'
    success_url = reverse_lazy('blog.article_list')
    model = Article

    def dispatch(self, request, *args, **kwargs):
        if not request.user.has_perms('blog.delete_article'):
            return redirect(settings.LOGIN_URL)
        return super(ArticleDeleteView, self).dispatch(request, *args, **kwargs)


def CategoryDetailView(request, slug):

    template = 'blog/category_detail.html'
    link = Category.objects.get(slug = slug)
    article = Article.objects.all().order_by('-create_at')
    section = Section.objects.all().order_by('-create_at')
    category = Category.objects.all()
    tag = Tag.objects.all()
    userprofile = UserProfile.objects.all().order_by('-create_at')
    profile = Profile.objects.all()
    red = Red.objects.all()
    trend = Trend.objects.all()
    config = Config.objects.all()
    page = Page.objects.all().order_by('-color')
    return render_to_response(template,locals(),
                                context_instance=RequestContext(request))

def SectionDetailView(request, slug):

    template = 'blog/section_detail.html'
    link = Section.objects.get(slug = slug)
    article = Article.objects.all().order_by('-create_at')
    section = Section.objects.all().order_by('-create_at')
    section2 = Section.objects.all().order_by('-create_at')
    category = Category.objects.all()
    profile = Profile.objects.all()
    userprofile = UserProfile.objects.all()
    tag = Tag.objects.all()
    red = Red.objects.all()
    trend = Trend.objects.all()
    config = Config.objects.all()
    page = Page.objects.all().order_by('-color')
    return render_to_response(template,locals(),
                                context_instance=RequestContext(request))

def TrendDetailView(request, slug):

    template = 'blog/trend_detail.html'
    link = Trend.objects.get(slug = slug)
    article = Article.objects.all().order_by('-create_at')
    section = Section.objects.all().order_by('-create_at')
    category = Category.objects.all()
    tag = Tag.objects.all()
    userprofile = UserProfile.objects.all()
    profile = Profile.objects.all()
    red = Red.objects.all()
    trend = Trend.objects.all()
    config = Config.objects.all()
    page = Page.objects.all().order_by('-color')
    return render_to_response(template,locals(),
                                context_instance=RequestContext(request))

def TagDetailView(request, slug):

    template = 'blog/tag_detail.html'
    link = Tag.objects.get(slug = slug)
    article = Article.objects.all().order_by('-create_at')
    section = Section.objects.all().order_by('-create_at')
    category = Category.objects.all()
    userprofile = UserProfile.objects.all()
    tag = Tag.objects.all()
    red = Red.objects.all()
    profile = Profile.objects.all()
    trend = Trend.objects.all()
    config = Config.objects.all()
    page = Page.objects.all().order_by('-color')
    return render_to_response(template,locals(),
                                context_instance=RequestContext(request))

def ProfileDetailView(request, slug):

    template = 'blog/profile_detail.html'
    link = Profile.objects.get(slug = slug)
    profile = Profile.objects.all()
    article = Article.objects.all().order_by('-create_at')
    section = Section.objects.all().order_by('-create_at')
    userprofile = UserProfile.objects.all()
    category = Category.objects.all()
    tag = Tag.objects.all()
    trend = Trend.objects.all()
    red = Red.objects.all()
    config = Config.objects.all()
    page = Page.objects.all().order_by('-color')
    return render_to_response(template,locals(),
                                context_instance=RequestContext(request))

def UserProfileDetailView(request, slug):

    template = 'accounts/userProfile_detail.html'
    link = UserProfile.objects.get(slug = slug)
    profile = Profile.objects.all()
    userprofile = UserProfile.objects.all()
    article = Article.objects.all().order_by('-create_at')
    section = Section.objects.all().order_by('-create_at')
    media = Media.objects.all()
    mediaCategory = MediaCategory.objects.all()
    category = Category.objects.all()
    tag = Tag.objects.all()
    trend = Trend.objects.all()
    red = Red.objects.all()
    config = Config.objects.all()
    page = Page.objects.all().order_by('-color')
    return render_to_response(template,locals(),
                                context_instance=RequestContext(request))


class ProfileListView(generic.ListView):

    template_model = 'blog/userprofile_list.html'
    model = UserProfile
    context_object_name = 'userprofile'
    paginate_by = 10
    ordering = '-create_at'
    page = Page.objects.all().order_by('-color')

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(ProfileListView, self).get_context_data(**kwargs)
        # Add in a QuerySet of all the books
        context['category'] = Category.objects.all()
        context['article'] = Article.objects.all()
        context['section'] = Section.objects.all().order_by('-create_at')
        context['tag'] = Tag.objects.all()
        context['trend'] = Trend.objects.all()
        context['config'] = Config.objects.all()
        context['red'] = Red.objects.all()
        return context

def PageDetailView(request, slug):

    template = 'blog/page_detail.html'
    link = Page.objects.get(slug = slug)
    page = Page.objects.all().order_by('color')
    section = Section.objects.all().order_by('-create_at')
    section2 = Section.objects.all().order_by('-create_at')
    category = Category.objects.all()
    profile = Profile.objects.all()
    userprofile = UserProfile.objects.all()
    tag = Tag.objects.all()
    red = Red.objects.all()
    trend = Trend.objects.all()
    config = Config.objects.all()
    return render_to_response(template,locals(),
                                context_instance=RequestContext(request))

def contact(request):
    page = Page.objects.all().order_by('color')
    section = Section.objects.all().order_by('-create_at')
    section2 = Section.objects.all().order_by('-create_at')
    category = Category.objects.all()
    profile = Profile.objects.all()
    userprofile = UserProfile.objects.all()
    tag = Tag.objects.all()
    red = Red.objects.all()
    trend = Trend.objects.all()
    config = Config.objects.all()
    if request.method =='POST':
        formulario = FormularioContacto(request.POST)
        if formulario.is_valid():
            titulo = 'Gracias'
            correo = formulario.cleaned_data['correo']
            asunto = correo, 'Su mensaje ha sido enviado'
            mensaje = formulario.cleaned_data['mensaje']
            mail = EmailMessage(asunto, mensaje, to=[correo, 'almaginet@gmail.com'])
            mail.send()
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'), {'titulo': titulo})
    else:
        formulario = FormularioContacto()
    return render_to_response('blog/contact.html', locals(),
                                context_instance=RequestContext(request))

def WelcomeView(request):

    template = 'blog/welcome.html'
    article = Article.objects.all()
    section = Section.objects.all().order_by('-create_at')
    category = Category.objects.all()
    tag = Tag.objects.all()
    red = Red.objects.all()
    userprofile = UserProfile.objects.all()
    profile = Profile.objects.all()
    media = Media.objects.all()
    mediaCategory = MediaCategory.objects.all()
    trend = Trend.objects.all()
    config = Config.objects.all()
    page = Page.objects.all().order_by('-color')
    return render_to_response(template,locals(),
                                context_instance=RequestContext(request))