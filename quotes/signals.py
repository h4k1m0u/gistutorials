from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Member
from django.utils.text import slugify


@receiver(post_save, sender=User)
def create_member(sender, instance, created, **kwargs):
    """
        Create member (user, slug) when the user (contrib.auth) is created.
    """
    if created:
        Member.objects.create(slug=slugify(instance.username), user=instance)
