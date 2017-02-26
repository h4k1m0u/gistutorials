from django import template


register = template.Library()


@register.inclusion_tag('quotes/breadcrumb.html', takes_context=True)
def breadcrumb(context):
    return {
        'quote': context['object']
    }
