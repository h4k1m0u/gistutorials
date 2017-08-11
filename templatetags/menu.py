from django import template


register = template.Library()


@register.inclusion_tag('menu.html', takes_context=True)
def menu(context):
    # app name
    app_name = context['request'].resolver_match.app_name

    # current user
    user = context['user']

    return {
        'search': context.request.GET.get('search', ''),
        'user': user,
        'app_name': app_name,
    }
