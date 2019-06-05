from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^suscripcion/$', views.registro_usuario_view, name='accounts.registro'),
    url(r'gracias/(?P<username>[\w]+)/$', views.gracias_view, name='accounts.gracias'),
    url(r'^$', views.index_view, name='accounts.index'),
    url(r'^ingresar/$', views.login_view, name='accounts.login'),
    url(r'^salir/$', views.logout_view, name='accounts.logout'),
    url(r'^edit_mail/$', views.editar_email, name='accounts.editar_email'),
    url(r'^edit_key/$', views.editar_contrasena, name='accounts.editar_contrasena'),
]