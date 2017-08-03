from django.db import models
from django.contrib.auth.models import User


class Member(models.Model):
    """
        Additional fields for the user model.
    """
    slug = models.SlugField(blank=True, editable=False)

    # foreign keys
    user = models.OneToOneField(User, on_delete=models.CASCADE)

    def __str__(self):
        """
            Field to show in the related models admin site.
        """
        return self.user.username
