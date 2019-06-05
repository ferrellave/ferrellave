# -*- encoding: utf-8 -*-
import os
import uuid
from django.db import models
from django.conf import settings
from django.contrib.auth.models import User
from django.utils.text import slugify
from django.core.urlresolvers import reverse
from django.utils.timezone import now
from blog.models import *
from accounts.models import *

class MediaCategory(models.Model):

    name = models.CharField(max_length=100, unique=True)
    body = models.TextField(blank=True, verbose_name="Contenido")
    photo = models.ImageField(upload_to='medias/categories/logos', blank=True, null=True)
    background = models.ImageField(upload_to='medias/categories/backgrounds', blank=True, null=True)
    slug = models.SlugField(editable=False)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Media Categoria'
        verbose_name_plural = 'Media Categorias'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(MediaCategory, self).save(*args, **kwargs)

class Media(models.Model):

	name = models.UUIDField(default=uuid.uuid4, editable=False)
	mediaCategory = models.ForeignKey(MediaCategory, on_delete=models.CASCADE, blank=True, null=True)
	article = models.ForeignKey(Article, on_delete=models.CASCADE, blank=True, null=True, related_name='media_article',)
	profile = models.ForeignKey(UserProfile, related_name='media_profile', blank=True, null=True)
	description = models.TextField(blank=True, verbose_name="Descripcion")
	html = models.TextField(blank=True, verbose_name="html")
	archive = models.FileField(upload_to='archives', blank=True, null=True)
	start = models.DateTimeField(blank=True, null=True)
	finish = models.DateTimeField(blank=True, null=True)
	red = models.ForeignKey(Red, related_name='media_red', blank=True, null=True)
	address = models.ForeignKey(Address, related_name='media_address', blank=True, null=True)
	tagArticle = models.ForeignKey(Article, related_name='media_tagarticle', blank=True, null=True)
	tagProfile = models.ForeignKey(UserProfile, related_name='media_taguserprofiles', blank=True, null=True)
	slug = models.SlugField(editable=False)
	create_at = models.DateTimeField(default=now, editable=False)
	update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)

	class Meta:
		ordering = ['create_at']
		verbose_name = 'Media'
		verbose_name_plural = 'Medias'

	def extension_class(self):
		name, extension = os.path.splitext(self.archive.name)
		return extension

	def __unicode__(self):
		return self.slug

	def save(self, *args, **kwargs):
		if not self.id:
			self.slug = slugify(self.name)
		super(Media, self).save(*args, **kwargs)
