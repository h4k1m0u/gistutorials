from django.contrib import admin
from .models import Quote, Book, Author, Category, Tag


# customize admin views
class QuoteAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('text', 'book', 'date', 'member', 'published')


class BookAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('title', 'isbn', 'author')


class AuthorAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('lastname', 'firstname')


class CategoryAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('name',)


class TagAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('name',)


# register models in the admin site
admin.site.register(Quote, QuoteAdmin)
admin.site.register(Book, BookAdmin)
admin.site.register(Author, AuthorAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Tag, TagAdmin)
