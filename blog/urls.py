from django.conf.urls import url
# -*- encoding: utf-8 -*-
from . import views

urlpatterns = [
    # /blog/ | /
    url(r'^$', views.ArticleListView.as_view(), name='blog.article_list'),
    url(r'^@(?P<slug>[-\w]+)/$', 'blog.views.UserProfileDetailView', name='blog.userprofile_detail'),
    url(r'^publicacion/(?P<slug>[^\.]+)/$', 'blog.views.ArticleDetailView', name='blog.article_detail'),
    url(r'^categorias/(?P<slug>[-\w]+)/$', 'blog.views.ProfileDetailView', name='blog.profile_detail'),
    url(r'^categoria/(?P<slug>[-\w]+)/$', 'blog.views.CategoryDetailView', name='blog.category_detail'),
    url(r'^secciones/(?P<slug>[-\w]+)/$', 'blog.views.SectionDetailView', name='blog.section_detail'),
    url(r'^tag/(?P<slug>[-\w]+)/$', 'blog.views.TagDetailView', name='blog.tag_detail'),
    url(r'^trend/(?P<slug>[-\w]+)/$', 'blog.views.TrendDetailView', name='blog.trend_detail'),
    url(r'^informacion/(?P<slug>[-\w]+)/$', 'blog.views.PageDetailView', name='blog.page_detail'),
 #   url(r'^crear/$', views.ArticleCreateView.as_view(), name='blog.crear'),
    url(r'^bienvenido/$', 'blog.views.WelcomeView', name='blog.crear'),
    url(r'^editar/(?P<slug>[-\w]+)/$', views.ArticleUpdateView.as_view(), name='blog.editar'),
    url(r'^eliminar/(?P<slug>[-\w]+)/$', views.ArticleDeleteView.as_view(), name='blog.eliminar'),
    url(r'^contacto/$', 'blog.views.contact', name='blog.contact'),
]