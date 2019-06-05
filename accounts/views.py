from django.shortcuts import render
from django.contrib.auth.models import User
from django.http import HttpResponse
from django.shortcuts import redirect
from django.core.urlresolvers import reverse
from .forms import RegistroUserForm, EditarEmailForm, EditarContrasenaForm
from .models import UserProfile
from blog.models import *
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import make_password

def registro_usuario_view(request):
    # Si el usuario esta ya logueado, lo redireccionamos a index_view
    if request.user.is_authenticated():
        return redirect(reverse('blog.crear'))

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(registro_usuario_view, self).get_context_data(**kwargs)
        # Add in a QuerySet of all the books
        return context
        
    if request.method == 'POST':
        # Si el method es post, obtenemos los datos del formulario
        form = RegistroUserForm(request.POST, request.FILES)

        # Comprobamos si el formulario es valido
        if form.is_valid():
            # En caso de ser valido, obtenemos los datos del formulario.
            # form.cleaned_data obtiene los datos limpios y los pone en un
            # diccionario con pares clave/valor, donde clave es el nombre del campo
            # del formulario y el valor es el valor si existe.
            cleaned_data = form.cleaned_data
            username = cleaned_data.get('username')
            password = cleaned_data.get('password')
         #   body = cleaned_data.get('body')
            profile = cleaned_data.get('profile')
            name = cleaned_data.get('name')
            # E instanciamos un objeto User, con el username y password
            user_model = User.objects.create_user(username=username, password=password)
            # Anadimos el email
            # Y guardamos el objeto, esto guardara los datos en la db.
            user_model.save()
            # Ahora, creamos un objeto UserProfile, aunque no haya incluido
            # una imagen, ya quedara la referencia creada en la db.
            user_profile = UserProfile()
            # Al campo user le asignamos el objeto user_model
            user_profile.user = user_model
            # y le asignamos la photo (el campo, permite datos null)
         #   user_profile.body = body
            user_profile.name = name
            # Por ultimo, guardamos tambien el objeto UserProfile
            user_profile.save()
            # Ahora, redireccionamos a la pagina accounts/gracias.html
            # Pero lo hacemos con un redirect.
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return redirect(reverse('blog.crear'))
                else:
                    # Redireccionar informando que la cuenta esta inactiva
                    # Lo dejo como ejercicio al lector :)
                    pass
                mensaje = 'Usuario incorrecto'
                return render(request, 'accounts/login.html', {'mensaje': mensaje})
    else:
        # Si el mthod es GET, instanciamos un objeto RegistroUserForm vacio
        form = RegistroUserForm()
    # Creamos el contexto
    context = {'form': form}
    context['category'] = Category.objects.all()
    context['section'] = Section.objects.all()
    context['tag'] = Tag.objects.all()
    context['trend'] = Trend.objects.all()
    context['config'] = Config.objects.all()
    context['userprofile'] = UserProfile.objects.all()
    context['profile'] = Profile.objects.all()
    context['page'] = Page.objects.all().order_by('color')
    # Y mostramos los datos
    return render(request, 'accounts/registro.html', context)

def gracias_view(request, username):
    return render(request, 'accounts/gracias.html', {'username': username})

@login_required
def index_view(request):
    return render(request, 'accounts/index.html')

def login_view(request):
    # Si el usuario esta ya logueado, lo redireccionamos a index_view
    if request.user.is_authenticated():
        return redirect(reverse('blog.crear'))

    mensaje = ''
    section = Section.objects.all()
    category = Category.objects.all()
    tag = Tag.objects.all()
    userprofile = UserProfile.objects.all()
    profile = Profile.objects.all()
    trend = Trend.objects.all()
    config = Config.objects.all()
    page = Page.objects.all().order_by('color')
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                return redirect(reverse('blog.crear'))
            else:
                # Redireccionar informando que la cuenta esta inactiva
                # Lo dejo como ejercicio al lector :)
                pass
        mensaje = 'Usuario Incorrecto'
    return render(request, 'accounts/login.html', {'mensaje': mensaje})

def logout_view(request):
    logout(request)
    messages.success(request, 'Ingresa para continuar')
    return redirect(reverse('accounts.login'))

@login_required
def editar_email(request):
    if request.method == 'POST':
        form = EditarEmailForm(request.POST, request=request)
        if form.is_valid():
            request.user.email = form.cleaned_data['email']
            request.user.save()
            messages.success(request, 'El email ha sido cambiado con exito!.')
            return redirect(reverse('accounts.index'))
    else:
        form = EditarEmailForm(
            request=request,
            initial={'email': request.user.email})
    return render(request, 'accounts/editar_email.html', {'form': form})

@login_required
def editar_contrasena(request):
    if request.method == 'POST':
        form = EditarContrasenaForm(request.POST)
        if form.is_valid():
            request.user.password = make_password(form.cleaned_data['password'])
            request.user.save()
            messages.success(request, 'La contrasena ha sido cambiado con exito!.')
            messages.success(request, 'Es necesario introducir los datos para entrar.')
            return redirect(reverse('accounts.index'))
    else:
        form = EditarContrasenaForm()
    return render(request, 'accounts/editar_contrasena.html', {'form': form})