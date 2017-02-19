from django.contrib import admin
from .models import Quote, Book, Author


# customize admin views
class QuoteAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('text', 'author', 'book', 'date')

    # automatically slugify the title
    prepopulated_fields = {'slug': ('text',)}


class BookAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('title', 'author')


class AuthorAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('name',)


# register models in the admin site
admin.site.register(Quote, QuoteAdmin)
admin.site.register(Book, BookAdmin)
admin.site.register(Author, AuthorAdmin)
