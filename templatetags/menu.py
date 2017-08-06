from django import template
from django.db.models import Count
from quotes.models import Category, Book, Author


register = template.Library()


@register.inclusion_tag('menu.html', takes_context=True)
def menu(context):
    # app name
    app_name = context['request'].resolver_match.app_name

    # populate menu with top five entries by # of quotes
    authors = Author.objects.annotate(num_quotes=Count('quote'))\
        .order_by('-num_quotes')[:5].all()
    categories = Category.objects.annotate(num_quotes=Count('quote'))\
        .order_by('-num_quotes')[:5].all()
    books = Book.objects.annotate(num_quotes=Count('quote'))\
        .order_by('-num_quotes')[:5].all()

    # current user
    user = context['user']

    return {
        'categories': categories,
        'books': books,
        'authors': authors,
        'search': context.request.GET.get('search', ''),
        'user': user,
        'app_name': app_name,
    }
