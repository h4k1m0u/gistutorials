from django.db import models


class Person(models.Model):
    name = models.CharField(max_length=200)

    class Meta:
        abstract = True

        # order of drop-down list items
        ordering = ('name',)


class Author(Person):
    def __str__(self):
        """
            Field to show in the admin site.
        """
        return self.name


class Member(Person):
    username = models.CharField(max_length=200)
    email = models.CharField(max_length=200)
    password = models.CharField(max_length=200)


class Book(models.Model):
    title = models.CharField(max_length=200)
    isbn = models.CharField(max_length=10)

    # foreign keys
    author = models.ForeignKey(Author, null=True, blank=True,
                               on_delete=models.CASCADE)

    def __str__(self):
        """
            Field to show in the admin site.
        """
        return self.title

    class Meta:
        # order of drop-down list items
        ordering = ('title',)


class Quote(models.Model):
    text = models.CharField(max_length=1000)
    date = models.DateTimeField(auto_now_add=True)

    # foreign keys
    # null for database & blank for forms
    book = models.ForeignKey(Book, null=True, blank=True,
                             on_delete=models.CASCADE)
    author = models.ForeignKey(Author, null=True, blank=True,
                               on_delete=models.CASCADE)

    def __str__(self):
        """
            Field to show in the admin site.
        """
        return self.text

    class Meta:
        # order of drop-down list items
        ordering = ('text',)
