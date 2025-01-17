from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from rest_framework.authtoken.models import Token


@receiver(post_save, sender=User)
def create_token(sender, instance, created, **kwargs):
    """
        Create a token when the user is created.
    """
    if created:
        Token.objects.create(user=instance)
