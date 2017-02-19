from django.db import models


class Person(models.Model):
    name = models.CharField(max_length=200, unique=True)

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
    username = models.CharField(max_length=200, unique=True)
    email = models.CharField(max_length=200, unique=True)
    password = models.CharField(max_length=200)


class Book(models.Model):
    title = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(blank=True)
    isbn = models.CharField(max_length=10, unique=True)

    # foreign keys
    # can be empty: null in database & blank in forms
    author = models.ForeignKey(Author, null=True, blank=True,
                               on_delete=models.CASCADE)

    def __str__(self):
        """
            Field to show in the related models admin site.
        """
        return self.title

    class Meta:
        # order of drop-down list items
        ordering = ('title',)


class Category(models.Model):
    name = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(blank=True)

    def __str__(self):
        """
            Field to show in the related models admin site.
        """
        return self.name

    class Meta:
        # order of drop-down list items
        ordering = ('name',)

        # plural form in admin view
        verbose_name_plural = 'categories'


class Quote(models.Model):
    text = models.CharField(max_length=1000, unique=True)
    slug = models.SlugField(blank=True)
    date = models.DateTimeField(auto_now_add=True)

    # foreign keys
    # can be empty: null in database & blank in forms
    book = models.ForeignKey(Book, null=True, blank=True,
                             on_delete=models.CASCADE)
    author = models.ForeignKey(Author, null=True, blank=True,
                               on_delete=models.CASCADE)
    category = models.ForeignKey(Category, null=True, blank=True,
                                 on_delete=models.CASCADE)

    def __str__(self):
        """
            Field to show in the related models admin site.
        """
        return self.text

    class Meta:
        # order of drop-down list items
        ordering = ('text',)
