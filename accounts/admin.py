from django.contrib import admin

from .models import *

admin.site.register(UserProfile)
admin.site.register(Subscription)
admin.site.register(Membership)
admin.site.register(Genre)
admin.site.register(Red)
admin.site.register(UserConfig)