# -*- encoding: utf-8 -*-
import uuid
from django.db import models
from django.conf import settings
from django.contrib.auth.models import User
from django.utils.text import slugify
from django.core.urlresolvers import reverse
from django.utils.timezone import now
from blog.models import *
import os

class Subscription(models.Model):
    
    name = models.CharField(max_length=100, unique=True)
    body = models.TextField(blank=True, verbose_name="Contenido")
    color = models.CharField(blank=True, max_length=200, verbose_name="Color")
    price = models.CharField(blank=True, max_length=200, verbose_name="Precio")
    duracion = models.IntegerField(blank=True, null=True)
    photo = models.ImageField(upload_to='memberships/logos', blank=True, null=True)
    background = models.ImageField(upload_to='memberships/backgrounds', blank=True, null=True)
    language = models.ForeignKey(Language, on_delete=models.CASCADE, blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Suscripción'
        verbose_name_plural = 'Suscripciones'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Subscription, self).save(*args, **kwargs)

class Membership(models.Model):

    uuid = models.UUIDField(default=uuid.uuid4, editable=False)
    subscription = models.ForeignKey(Subscription, on_delete=models.CASCADE, blank=True, null=True)
    finish = models.DateTimeField(blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Membership'
        verbose_name_plural = 'Memberships'

    def __unicode__(self):
        return self.slug

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.uuid)
        super(Subscription, self).save(*args, **kwargs)

class Genre(models.Model):

    name = models.CharField(max_length=100, unique=True)
    color = models.CharField(blank=True, max_length=200, verbose_name="Color")
    photo = models.ImageField(upload_to='genres/logos', blank=True, null=True)
    background = models.ImageField(upload_to='genres/backgrounds', blank=True, null=True)
    language = models.ForeignKey(Language, on_delete=models.CASCADE, blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Genero'
        verbose_name_plural = 'Generos'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Genre, self).save(*args, **kwargs)

class Red(models.Model):
    uuid = models.UUIDField(default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=300, verbose_name="Titulo")
    photo = models.ImageField(upload_to='redes/logos', blank=True, null=True)
    url = models.CharField(max_length=300, verbose_name="Url")
    config = models.ForeignKey(Config, on_delete=models.CASCADE, blank=True, null=True)
    user = models.ForeignKey(User, related_name='red_owner', blank=True, null=True)
    article = models.ForeignKey(Article, related_name='article_owner', blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = "Red social"
        verbose_name_plural = 'Redes Sociales'

    def __unicode__(self):
        return self.slug

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.uuid)
        super(Red, self).save(*args, **kwargs)

class UserProfile(models.Model):

    user = models.OneToOneField(settings.AUTH_USER_MODEL, null=True, blank=True)
    name = models.CharField(blank=True, max_length=200, verbose_name="Nombre")
    color01 = models.CharField(blank=True, max_length=200, verbose_name="Color 1")
    color02 = models.CharField(blank=True, max_length=200, verbose_name="Color 2")
    color03 = models.CharField(blank=True, max_length=200, verbose_name="Color 3")
    color04 = models.CharField(blank=True, max_length=200, verbose_name="Color 4")
    color05 = models.CharField(blank=True, max_length=200, verbose_name="Color 5")
    slogan = models.TextField(blank=True, null=True)
    body = models.TextField(blank=True, null=True)
    born = models.DateTimeField(blank=True, null=True)
    genre = models.ForeignKey(Genre, on_delete=models.CASCADE, blank=True, null=True)
    telefono01 = models.CharField(blank=True, max_length=20, verbose_name="Telefono01")
    telefono02 = models.CharField(blank=True, max_length=20, verbose_name="Telefono02")
    photo = models.ImageField(upload_to='profiles/avatar', blank=True, null=True)
    background = models.ImageField(upload_to='profiles/backgrounds', blank=True, null=True)
    youtube = models.TextField(blank=True, verbose_name="youtube")
    mapa = models.TextField(blank=True, verbose_name="mapa")
    live = models.TextField(blank=True, verbose_name="live")
    multimedia = models.TextField(blank=True, verbose_name="multimedia")
    archive = models.FileField(upload_to='articles/archives', blank=True, null=True)
    address = models.ForeignKey(Address, on_delete=models.CASCADE, blank=True, null=True)
    language = models.ForeignKey(Language, on_delete=models.CASCADE, blank=True, null=True)
    membership = models.ForeignKey(Membership, related_name='profile_membership', blank=True, null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, blank=True, null=True, related_name='prof01')
    profile = models.ForeignKey(Profile, on_delete=models.CASCADE, blank=True, null=True, related_name='prof02')
    section = models.ForeignKey(Section, on_delete=models.CASCADE, blank=True, null=True, related_name='prof03')
    tag = models.ForeignKey(Tag, on_delete=models.CASCADE, blank=True, null=True, related_name='prof04')
    trend = models.ForeignKey(Trend, on_delete=models.CASCADE, blank=True, null=True, related_name='prof05')
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        verbose_name = 'Perfil de usuario'
        verbose_name_plural = 'Perfiles de usuarios'
        
    def __str__(self):
        return self.user.username

    def extension_class(self):
        name, extension = os.path.splitext(self.archive.name)
        return extension

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.user.username)
        super(UserProfile, self).save(*args, **kwargs)

class UserConfig(models.Model):

    user = models.OneToOneField(settings.AUTH_USER_MODEL, null=True, blank=True)
    color = models.TextField(blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        verbose_name = 'Configuracion de usuario'
        verbose_name_plural = 'Configuraciones de usuarios'
        
    def __str__(self):
        return self.user.username

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.user.username)
        super(UserConfig, self).save(*args, **kwargs)