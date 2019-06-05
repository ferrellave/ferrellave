# -*- encoding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.utils.text import slugify
from django.core.urlresolvers import reverse
from django.utils.timezone import now
import uuid

class Language(models.Model):

    name = models.CharField(max_length=100, unique=True)
    body = models.TextField(blank=True, verbose_name="Contenido")
    flag = models.ImageField(upload_to='flags', blank=True, null=True)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Idioma'
        verbose_name_plural = 'Idiomas'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Language, self).save(*args, **kwargs)

class Currency(models.Model):

    name = models.CharField(max_length=100, unique=True)
    symbol = models.CharField(blank=True, max_length=300, verbose_name="Simbolo")
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)
    slug = models.SlugField(editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Moneda'
        verbose_name_plural = 'Monedas'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Currency, self).save(*args, **kwargs)

class Continent(models.Model):

    name = models.CharField(max_length=100, unique=True)
    flag = models.ImageField(upload_to='flags', blank=True, null=True)
    slug = models.SlugField(editable=False)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Continente'
        verbose_name_plural = 'Continentes'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Continent, self).save(*args, **kwargs)

class Country(models.Model):

    name = models.CharField(max_length=100, unique=True)
    continent = models.ForeignKey(Continent, on_delete=models.CASCADE, blank=True, null=True)
    language = models.ForeignKey(Language, on_delete=models.CASCADE, blank=True, null=True)
    currency = models.ForeignKey(Currency, on_delete=models.CASCADE, blank=True, null=True)
    flag = models.ImageField(upload_to='flags', blank=True, null=True)
    slug = models.SlugField(editable=False)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Pais'
        verbose_name_plural = 'Paises'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Country, self).save(*args, **kwargs)

class Region(models.Model):

    name = models.CharField(max_length=100, unique=True)
    country = models.ForeignKey(Country, on_delete=models.CASCADE, blank=True, null=True)
    flag = models.ImageField(upload_to='flags', blank=True, null=True)
    slug = models.SlugField(editable=False)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Region'
        verbose_name_plural = 'Regiones'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Region, self).save(*args, **kwargs)

class State(models.Model):

    name = models.CharField(max_length=100, unique=True)
    region = models.ForeignKey(Region, on_delete=models.CASCADE, blank=True, null=True)
    flag = models.ImageField(upload_to='flags', blank=True, null=True)
    slug = models.SlugField(editable=False)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Estado'
        verbose_name_plural = 'Estados'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(State, self).save(*args, **kwargs)

class City(models.Model):

    name = models.CharField(max_length=100, unique=True)
    state = models.ForeignKey(State, on_delete=models.CASCADE, blank=True, null=True)
    flag = models.ImageField(upload_to='flags', blank=True, null=True)
    slug = models.SlugField(editable=False)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Ciudad'
        verbose_name_plural = 'Ciudades'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(City, self).save(*args, **kwargs)

class Zone(models.Model):

    name = models.CharField(max_length=100, unique=True)
    city = models.ForeignKey(City, on_delete=models.CASCADE, blank=True, null=True)
    flag = models.ImageField(upload_to='flags', blank=True, null=True)
    slug = models.SlugField(editable=False)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Zona'
        verbose_name_plural = 'Zonas'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Zone, self).save(*args, **kwargs)

class Community(models.Model):

    name = models.CharField(max_length=100, unique=True)
    zone = models.ForeignKey(Zone, on_delete=models.CASCADE, blank=True, null=True)
    flag = models.ImageField(upload_to='flags', blank=True, null=True)
    slug = models.SlugField(editable=False)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Comunidad'
        verbose_name_plural = 'Comunidades'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Community, self).save(*args, **kwargs)

class Location(models.Model):

    name = models.CharField(max_length=100, unique=True)
    community = models.ForeignKey(Community, on_delete=models.CASCADE, blank=True, null=True)
    flag = models.ImageField(upload_to='flags', blank=True, null=True)
    slug = models.SlugField(editable=False)
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Locacion'
        verbose_name_plural = 'Locaciones'

    def __unicode__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Location, self).save(*args, **kwargs)

class Address(models.Model):
    
    name = models.UUIDField(default=uuid.uuid4, editable=False)
    location = models.ForeignKey(Location, on_delete=models.CASCADE, blank=True, null=True)
    slug = models.SlugField(editable=False)
    body = models.TextField(blank=True, verbose_name="Direccion")
    mapa = models.TextField(blank=True, verbose_name="mapa de google")
    lat = models.CharField(max_length=100, blank=True, verbose_name="Latitud")
    lng = models.CharField(max_length=100, blank=True, verbose_name="Longitud")
    create_at = models.DateTimeField(default=now, editable=False)
    update_at = models.DateTimeField(auto_now_add = False, auto_now=True, editable=False)

    class Meta:
        ordering = ['create_at']
        verbose_name = 'Direccion'
        verbose_name_plural = 'Direcciones'

    def __unicode__(self):
        return self.slug

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.name)
        super(Address, self).save(*args, **kwargs)