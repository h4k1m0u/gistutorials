# https://stackoverflow.com/a/8000091/2228912
from django.template.defaulttags import register


@register.filter
def get_item(d, key):
    return d.get(key)
