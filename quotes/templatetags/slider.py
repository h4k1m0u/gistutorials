from django import template
from quotes.models import Quote


register = template.Library()


@register.inclusion_tag('quotes/slider.html')
def slider():
    # Pick five tags randomly
    random_quotes = Quote.objects.random(5)

    return {
        'random_quotes': random_quotes,
    }
