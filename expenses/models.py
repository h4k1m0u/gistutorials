from django.db import models
from django.contrib.auth.models import User


class Expense(models.Model):
    date = models.DateField(auto_now_add=True)
    amount = models.DecimalField(max_digits=5, decimal_places=2, blank=False)
    description = models.CharField(max_length=20, blank=False)

    # foreign keys
    user = models.ForeignKey(User, null=True, editable=False,
                             on_delete=models.CASCADE)
