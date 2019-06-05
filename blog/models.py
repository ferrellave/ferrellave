# -*- encoding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.utils.text import slugify
from django.core.urlresolvers import reverse
from django.utils.timezone import now
from accounts.models import *
from geography.models import *
import os
import datetime

class Config(models.Model):
    webName = models.CharField(max_length=300, verbose_name="Titulo")
    webSlogan = models.CharField(max_length=300, verbose_name="Slogan action")
    webUrl = models.CharField(max_length=300, verbose_name="Url")
    language = models.ForeignKey(Language, on_delete=models.CASCADE, blank=True, null=True)
    addons = models.TextField(blank=True, verbose_name="addons")
    content = models.TextField(blank=True, verbose_name="descripcion")
    maps = models.TextField(blank=True, verbose_name="maps")
    text01 = models.CharField(max_length=300, verbose_name="buscar", blank=True, null=True)
    text02 = models.CharField(max_length=300, verbose_name="lectura", blank=True, null=True)
    text03 = models.CharField(max_length=300, verbose_name="mapa", blank=True, null=True)
    text04 = models.CharField(max_length=300, verbose_name="publicar", blank=True, null=True)
    text05 = models.CharField(max_length=300, verbose_name="salir", blank=True, null=True)
    text06 = models.CharField(max_length=300, verbose_name="experiencia", blank=True, null=True)
    text07 = models.CharField(max_length=300, verbose_name="form no listo", blank=True, null=True)
    text08 = models.CharField(max_length=300, verbose_name="form mirar", blank=True, null=True)
    text09 = models.CharField(max_length=300, verbose_name="form experiencia", blank=True, null=True)
    text10 = models.CharField(max_length=300, verbose_name="text10", blank=True, null=True)
    text11 = models.CharField(max_length=300, verbose_name="text11", blank=True, null=True)
    dino01 = models.CharField(max_length=300, verbose_name="media background", blank=True, null=True)
    dino02 = models.CharField(max_length=300, verbose_name="media audio", blank=True, null=True)
    dino03 = models.CharField(max_length=300, verbose_name="media multimedia", blank=True, null=True)
    dino04 = models.CharField(max_length=300, verbose_name="media archivo", blank=True, null=True)
    dino05 = models.CharField(max_length=300, verbose_name="media mapa", blank=True, null=True)
    dino06 = models.CharField(max_length=300, verbose_name="media live", blank=True, null=True)
    dino07 = models.CharField(max_length=300, verbose_name="media evento", blank=True, null=True)
    dino08 = models.CharField(max_length=300, verbose_name="media exp", blank=True, null=True)
    dino09 = models.CharField(max_length=300, verbose_name="media embbed", blank=True, null=True)
    dino00 = models.CharField(max_length=300, verbose_name="media body", blank=True, null=True)
    favicon = models.FileField(upload_to='favicon', blank=True, null=True)
    address = models.ForeignKey(Address, on_delete=models.CASCADE, blank=True, null=True)
    description = models.TextField(blank=True, verbose_name="Contenido")
    color = models.TextField(blank=True, verbose_name="Color Fondo de Logo")
    color02 = models.TextField(blank=True, verbose_name="Color Botones")
    color03 = models.TextField(blank=True, verbose_name="Color Fondo")
    color04 = models.TextField(blank=True, verbose_name="Color Principal Menu y Footer")
    telefono01 = models.CharField(blank=True, max_length=20, verbose_name="Telefono01")
    telefono02 = models.CharField(blank=True, max_length=20, verbose_name="map")
    categoria = models.CharField(blank=True, max_length=20, verbose_name="destacado")
    logo = models.ImageField(upload_to='config', blank=True, null=True)
    videoMp4 = models.FileField(upload_to='videos/', blank=True, null=True)
    videoOgv = models.FileField(upload_to='videos/', blank=True, null=True)
    videoWebm = models.FileField(upload_to='videos/', blank=True, null=True)
    background = models.ImageField(upload_to='config', blank=True, null=True)
    categoryBackground = models.ImageField(upload_to='config', blank=True, null=True)
    sectionBackground = models.ImageField(upload_to='config', blank=True, null=True)
    trendBackground = models.ImageField(upload_to='config', blank=True, null=True)
    profileBackground = models.ImageField(upload_to='config', blank=True, null=True)
    articleBackground = models.ImageField(upload_to='config', blank=True, null=True)
    categoryLogo = models.ImageField(upload_to='config', blank=True, null=True)
    sectionLogo = models.ImageField(upload_to='config', blank=True, null=True)
    trendLogo = models.ImageField(upload_to='config', blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = "Configuracion"
        verbose_name_plural = 'Configuraciones'

    def __unicode__(self):
        return self.webName

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.webName)
        super(Config, self).save(*args, **kwargs)

class Category(models.Model):
    name = models.CharField(max_length=300, verbose_name="Titulo")
    body = models.TextField(blank=True, verbose_name="Contenido")
    color = models.TextField(blank=True, max_length=1000, verbose_name="Color")
    photo = models.ImageField(upload_to='categories/logos', blank=True, null=True)
    background = models.ImageField(upload_to='categories/backgrounds', blank=True, null=True)
    language = models.ForeignKey(Language, on_delete=models.CASCADE, blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = "0-Categoria"
        verbose_name_plural = '0-Categorias'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Category, self).save(*args, **kwargs)

class Section(models.Model):
    name = models.CharField(max_length=300, verbose_name="Titulo")
    body = models.TextField(blank=True, verbose_name="Contenido")
    color = models.CharField(default="#333",blank=True, max_length=20, verbose_name="Color")
    photo = models.ImageField(upload_to='sections/logos', blank=True, null=True)
    background = models.ImageField(upload_to='sections/backgrounds', blank=True, null=True)
    language = models.ForeignKey(Language, on_delete=models.CASCADE, blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = "1-Seccion"
        verbose_name_plural = '1-Secciones'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Section, self).save(*args, **kwargs)

class Tag(models.Model):

    name = models.CharField(max_length=100, unique=True)
    section = models.ForeignKey(Section, on_delete=models.CASCADE, blank=True, null=True)
    body = models.TextField(blank=True, verbose_name="Contenido")
    color = models.CharField(blank=True, max_length=20, verbose_name="Color")
    photo = models.ImageField(upload_to='tags/logos', blank=True, null=True)
    background = models.ImageField(upload_to='tags/backgrounds', blank=True, null=True)
    language = models.ForeignKey(Language, on_delete=models.CASCADE, blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = '2-Tag'
        verbose_name_plural = '2-Tag'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Tag, self).save(*args, **kwargs)

class Trend(models.Model):
    name = models.CharField(max_length=300, verbose_name="Titulo")
    tag = models.ForeignKey(Tag, on_delete=models.CASCADE, blank=True, null=True)
    body = models.TextField(blank=True, verbose_name="Contenido")
    color = models.CharField(blank=True, max_length=20, verbose_name="Color")
    photo = models.ImageField(upload_to='trends/logos', blank=True, null=True)
    background = models.ImageField(upload_to='trends/backgrounds', blank=True, null=True)
    language = models.ForeignKey(Language, on_delete=models.CASCADE, blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = "3-Trend"
        verbose_name_plural = '3-Trend'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Trend, self).save(*args, **kwargs)

class Profile(models.Model):
    name = models.CharField(max_length=300, verbose_name="Titulo")
    body = models.TextField(blank=True, verbose_name="Contenido")
    color = models.CharField(blank=True, max_length=20, verbose_name="Color")
    photo = models.ImageField(upload_to='trends/logos', blank=True, null=True)
    background = models.ImageField(upload_to='trends/backgrounds', blank=True, null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, blank=True, null=True)
    section = models.ForeignKey(Section, on_delete=models.CASCADE, blank=True, null=True)
    tag = models.ForeignKey(Tag, on_delete=models.CASCADE, blank=True, null=True)
    language = models.ForeignKey(Language, on_delete=models.CASCADE, blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = "4-Profile"
        verbose_name_plural = '4-Profiles'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Profile, self).save(*args, **kwargs)

class Article(models.Model):

    title = models.CharField(verbose_name='titulo', max_length=100, unique=True)
    body = models.TextField()
    background = models.ImageField(upload_to='articles/backgrounds', blank=True, null=True, verbose_name="Foto")
    youtube = models.TextField(blank=True, verbose_name="youtube")
    mapa = models.TextField(blank=True, verbose_name="mapa")
    live = models.TextField(blank=True, verbose_name="live")
    multimedia = models.TextField(blank=True, verbose_name="multimedia")
    video = models.FileField(upload_to='articles/video', blank=True, null=True)
    audio = models.FileField(upload_to='articles/audio', blank=True, null=True)
    archive = models.FileField(upload_to='articles/archives', blank=True, null=True)
    start = models.DateTimeField(blank=True, null=True)
    finish = models.DateTimeField(blank=True, null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, blank=True, null=True, related_name='prof01a')
    profile = models.ForeignKey(Profile, on_delete=models.CASCADE, blank=True, null=True, related_name='prof02a')
    section = models.ForeignKey(Section, on_delete=models.CASCADE, related_name='prof03a')
    tag = models.ForeignKey(Tag, on_delete=models.CASCADE, blank=True, null=True, related_name='prof04a')
    trend = models.ForeignKey(Trend, on_delete=models.CASCADE, blank=True, null=True, related_name='prof05a')
    category2 = models.ForeignKey(Category, on_delete=models.CASCADE, blank=True, null=True, related_name='prof1a')
    profile2 = models.ForeignKey(Profile, on_delete=models.CASCADE, blank=True, null=True, related_name='prof2a')
    section2 = models.ForeignKey(Section, on_delete=models.CASCADE, blank=True, null=True, related_name='prof3a')
    tag2 = models.ForeignKey(Tag, on_delete=models.CASCADE, blank=True, null=True, related_name='prof4a')
    trend2 = models.ForeignKey(Trend, on_delete=models.CASCADE, blank=True, null=True, related_name='prof5a')
    category3 = models.ForeignKey(Category, on_delete=models.CASCADE, blank=True, null=True, related_name='prof6a')
    profile3 = models.ForeignKey(Profile, on_delete=models.CASCADE, blank=True, null=True, related_name='prof7a')
    section3 = models.ForeignKey(Section, on_delete=models.CASCADE, blank=True, null=True, related_name='prof8a')
    tag3 = models.ForeignKey(Tag, on_delete=models.CASCADE, blank=True, null=True, related_name='prof9a')
    trend3 = models.ForeignKey(Trend, on_delete=models.CASCADE, blank=True, null=True, related_name='prof10a')
    owner = models.ForeignKey(User, related_name='article_owner', blank=True, null=True)
    address = models.ForeignKey(Address, on_delete=models.CASCADE, blank=True, null=True)
    language = models.ForeignKey(Language, on_delete=models.CASCADE, blank=True, null=True)
    publish = models.DateTimeField(auto_now_add=True, blank=True, null=True,editable=True)
    unpublish = models.DateTimeField(blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False,max_length=144)

    def get_absolute_url(self):
        return reverse('blog.article_detail', kwargs={'slug': self.slug})

    def extension_class(self):
        name, extension = os.path.splitext(self.archive.name)
        return extension

    class Meta:
            ordering = ['create_at']
            verbose_name = 'Publicación'
            verbose_name_plural = 'Publicaciones'

    def __unicode__(self):
        return self.title

    def save(self):
        super(Article, self).save()
        date = self.create_at
        self.slug = '%i/%i/%i/%i' % (
            date.year, date.month, date.day, self.id
        )
        super(Article, self).save()

class PageSection(models.Model):
    name = models.CharField(max_length=300, verbose_name="Titulo")
    body = models.TextField(blank=True, verbose_name="Contenido")
    color = models.CharField(default="#333",blank=True, max_length=20, verbose_name="Color")
    photo = models.ImageField(upload_to='sections/logos', blank=True, null=True)
    background = models.ImageField(upload_to='sections/backgrounds', blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = "Sección de página"
        verbose_name_plural = 'secciones de paginas'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(PageSection, self).save(*args, **kwargs)

class Page(models.Model):
    name = models.CharField(max_length=300, verbose_name="Titulo")
    body = models.TextField(blank=True, verbose_name="Contenido")
    color = models.CharField(default="#333",blank=True, max_length=20, verbose_name="Color")
    photo = models.ImageField(upload_to='sections/logos', blank=True, null=True)
    background = models.ImageField(upload_to='sections/backgrounds', blank=True, null=True)
    PageSection = models.ForeignKey(PageSection, on_delete=models.CASCADE, blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = "Página"
        verbose_name_plural = 'Páginas'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Page, self).save(*args, **kwargs)