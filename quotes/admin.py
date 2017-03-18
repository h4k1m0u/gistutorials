from django.contrib import admin
from .models import Quote, Book, Author, Category, Tag


# customize admin views
class QuoteAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('text', 'author', 'book', 'category', 'date')

    # automatically slugify the text in the admin (js)
    prepopulated_fields = {'slug': ('text',)}


class BookAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('title', 'isbn', 'author')

    # automatically slugify the title in the admin (js)
    prepopulated_fields = {'slug': ('title',)}


class AuthorAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('lastname', 'firstname')

    # automatically slugify the name in the admin (js)
    prepopulated_fields = {'slug': ('firstname', 'lastname')}


class CategoryAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('name',)

    # automatically slugify the name in the admin (js)
    prepopulated_fields = {'slug': ('name',)}


class TagAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('name',)

    # automatically slugify the name in the admin (js)
    prepopulated_fields = {'slug': ('name',)}


# register models in the admin site
admin.site.register(Quote, QuoteAdmin)
admin.site.register(Book, BookAdmin)
admin.site.register(Author, AuthorAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Tag, TagAdmin)
