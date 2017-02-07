from django.contrib import admin
from .models import Quote, Book


# register models in the admin site
admin.site.register(Quote)
admin.site.register(Book)
