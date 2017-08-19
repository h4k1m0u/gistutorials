from django import template
from django.db.models import Count
from quotes.models import Category, Book, Author


register = template.Library()


@register.inclusion_tag('quotes/filters.html', takes_context=True)
def filters(context):
    # populate menu with top five entries by # of quotes
    authors = Author.objects.annotate(num_quotes=Count('quote'))\
        .order_by('-num_quotes')[:5].all()
    categories = Category.objects.annotate(num_quotes=Count('quote'))\
        .order_by('-num_quotes')[:5].all()
    books = Book.objects.annotate(num_quotes=Count('quote'))\
        .order_by('-num_quotes')[:5].all()

    return {
        'categories': categories,
        'books': books,
        'authors': authors,
    }
