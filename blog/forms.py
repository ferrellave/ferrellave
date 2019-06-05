from django import forms

from .models import Article

class ArticleCreateForm(forms.ModelForm):

    class Meta:
        model = Article
        fields = ('title', 'body', 'section')
        labels = {
            'body': 'Contenido',
            'title': 'Titulo',
            'section': 'Categoria',
        }
        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control'}),
            'body': forms.Textarea(attrs={'class': 'form-control'})
        }
class FormularioContacto(forms.Form):

    correo = forms.EmailField(
        label='Correo', 
        widget=forms.EmailInput(attrs={'class':'form-control'})
        )
    mensaje = forms.CharField(
        label='Mensaje', 
        widget=forms.Textarea(attrs={'class':'form-control'})
        )