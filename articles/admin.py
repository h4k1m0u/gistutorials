from django.contrib import admin
from .models import Article, Category, Tag


# customize admin views
class ArticleAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('title', 'date', 'member', 'published')

    def save_model(self, request, obj, form, change):
        # save member on creation
        if not change:
            obj.member = request.user.member

        super(ArticleAdmin, self).save_model(request, obj, form, change)


class CategoryAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('name',)


class TagAdmin(admin.ModelAdmin):
    # fields to show in admin listview
    list_display = ('name',)


# register models in the admin site
admin.site.register(Article, ArticleAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Tag, TagAdmin)
