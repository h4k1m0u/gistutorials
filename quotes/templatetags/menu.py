from django import template
from quotes.models import Category, Book, Author


register = template.Library()


@register.inclusion_tag('quotes/menu.html', takes_context=True)
def menu(context):
    return {
        'categories': Category.objects.all(),
        'books': Book.objects.all(),
        'authors': Author.objects.all(),
        'search': context.request.GET.get('search', ''),
    }
