from django import template
from quotes.models import Quote


register = template.Library()


@register.inclusion_tag('quotes/similar_quotes.html', takes_context=True)
def similar_quotes(context):
    # get current quote by its id
    kwargs = context['view'].kwargs
    pk = kwargs.get('pk')
    browsed_quote = Quote.objects.get(pk=pk)

    # quotes in the same category
    similar_quotes = Quote.objects.filter(category=browsed_quote.category)\
        .order_by('text')[:5]

    return {
        'browsed_quote': browsed_quote,
        'similar_quotes': similar_quotes,
    }
