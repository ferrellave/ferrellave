# -*- encoding: utf-8 -*-
from django import forms
from django.contrib.auth.models import User
from blog.models import Profile


class RegistroUserForm(forms.Form):

    profile = forms.ModelChoiceField(queryset=Profile.objects.all(),label="Selecciona tu interes",required=True)

#    body = forms.CharField(
 #       label='Tell something about you',
  #      required=True,
   #     widget=forms.Textarea(attrs={'class': 'form-control'}))
    username = forms.EmailField(
        label='Escribe tu correo electronico',
        min_length=1,
        widget=forms.EmailInput(attrs={'class': 'form-control'}))

    name = forms.CharField(
        label='Escribe un nombre de usuario',
        min_length=1,
        widget=forms.TextInput(attrs={'class': 'form-control'}))

    password = forms.CharField(
        label='Escribe una Contraseña',
        min_length=3,
        widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    def clean_username(self):
        """Comprueba que no exista un username igual en la db"""
        username = self.cleaned_data['username']
        if User.objects.filter(username=username):
            raise forms.ValidationError('Este correo electronico ya existe')
        return username

    def clean_email(self):
        """Comprueba que no exista un email igual en la db"""
        email = self.cleaned_data['email']
        if User.objects.filter(email=email):
            raise forms.ValidationError('Ya existe un email igual en la db.')
        return email


class EditarEmailForm(forms.Form):

    email = forms.EmailField(
        widget=forms.EmailInput(attrs={'class': 'form-control'}))

    def __init__(self, *args, **kwargs):
        """Obtener request"""
        self.request = kwargs.pop('request')
        return super(EditarEmailForm, self).__init__(*args, **kwargs)

    def clean_email(self):
        email = self.cleaned_data['email']
        # Comprobar si ha cambiado el email
        actual_email = self.request.user.email
        username = self.request.user.username
        if email != actual_email:
            # Si lo ha cambiado, comprobar que no exista en la db.
            # Exluye el usuario actual.
            existe = User.objects.filter(email=email).exclude(username=username)
            if existe:
                raise forms.ValidationError('Ya existe un email igual en la db.')
        return email


class EditarContrasenaForm(forms.Form):

    actual_password = forms.CharField(
        label='Contrasena actual',
        min_length=5,
        widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    password = forms.CharField(
        label='Nueva contrasena',
        min_length=5,
        widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    password2 = forms.CharField(
        label='Repetir contrasena',
        min_length=5,
        widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    def clean_password2(self):
        """Comprueba que password y password2 sean iguales."""
        password = self.cleaned_data['password']
        password2 = self.cleaned_data['password2']
        if password != password2:
            raise forms.ValidationError('Las contrasenas no coinciden.')
        return password2
