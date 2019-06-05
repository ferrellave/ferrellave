from django.contrib import admin

from .models import *

class ArticleAdmin(admin.ModelAdmin):

    list_display = ('title', 'owner', 'create_at', 'update_at')

admin.site.register(Article, ArticleAdmin)
admin.site.register(Tag)
admin.site.register(Category)
admin.site.register(Section)
admin.site.register(Trend)
admin.site.register(Config)
admin.site.register(Profile)
admin.site.register(Page)
admin.site.register(PageSection)