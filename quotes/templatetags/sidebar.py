from django import template
from django.db.models import Count
from quotes.models import Category, Book, Author


register = template.Library()


@register.inclusion_tag('quotes/sidebar.html', takes_context=True)
def sidebar(context):
    # browsed author, book, category
    kwargs = context['view'].kwargs
    browsed_author = kwargs.get('author')
    browsed_book = kwargs.get('book')
    browsed_category = kwargs.get('category')

    # populate menu with top five entries by # of quotes
    authors = Author.objects.annotate(num_quotes=Count('quote'))\
        .order_by('-num_quotes')[:5].all()
    categories = Category.objects.annotate(num_quotes=Count('quote'))\
        .order_by('-num_quotes')[:5].all()
    books = Book.objects.annotate(num_quotes=Count('quote'))\
        .order_by('-num_quotes')[:5].all()

    return {
        'browsed_author': browsed_author,
        'browsed_book': browsed_book,
        'browsed_category': browsed_category,
        'categories': categories,
        'books': books,
        'authors': authors,
    }
