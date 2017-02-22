from django import template
from quotes.models import Category, Book, Author


register = template.Library()


@register.inclusion_tag('quotes/sidebar.html', takes_context=True)
def sidebar(context):
    # browsed author, book, category
    kwargs = context['view'].kwargs
    browsed_author = kwargs.get('author')
    browsed_book = kwargs.get('book')
    browsed_category = kwargs.get('category')

    return {
        'authors': Author.objects.all(),
        'browsed_author': browsed_author,
        'books': Book.objects.all(),
        'browsed_book': browsed_book,
        'categories': Category.objects.all(),
        'browsed_category': browsed_category,
    }
