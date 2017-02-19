from django import template
from quotes.models import Category, Book


register = template.Library()


@register.inclusion_tag('quotes/menu.html')
def menu():
    return {'categories': Category.objects.all(), 'books': Book.objects.all()}
