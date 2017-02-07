from django.db import models


class Book(models.Model):
    title = models.CharField(max_length=200)
    isbn = models.CharField(max_length=10)

    def __str__(self):
        """
            Field to show in the admin site.
        """
        return self.title


class Quote(models.Model):
    text = models.CharField(max_length=200)
    date = models.DateTimeField(auto_now_add=True)
    book = models.ForeignKey(Book, on_delete=models.CASCADE)

    def __str__(self):
        """
            Field to show in the admin site.
        """
        return self.text
