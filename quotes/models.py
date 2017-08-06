from django.db import models
import random
from django.utils.text import slugify
from members.models import Member


class Author(models.Model):
    firstname = models.CharField(max_length=50, blank=True)
    lastname = models.CharField(max_length=50, blank=True)
    slug = models.SlugField(blank=True, editable=False)

    @property
    def name(self):
        """
            Returns the complete name.
        """
        return self.firstname + ' ' + self.lastname

    def __str__(self):
        """
            Field to show in the admin site.
        """
        return self.name

    class Meta:
        # name must be unique
        unique_together = ('firstname', 'lastname',)

        # order of drop-down list items
        ordering = ('lastname', 'firstname')

    def save(self, *args, **kwargs):
        """
            Save slug when saving model.
            Slug saved only if not existant, to avoid duplicity of urls.
        """
        if not self.id:
            # new object to create
            self.slug = slugify(self.name)[:50]

        super().save(*args, **kwargs)


class Book(models.Model):
    title = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(blank=True, editable=False)
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

    def save(self, *args, **kwargs):
        """
            Save slug when saving model.
            Slug saved only if not existant, to avoid duplicity of urls.
        """
        if not self.id:
            # new object to create
            self.slug = slugify(self.title)[:50]

        super().save(*args, **kwargs)


class Category(models.Model):
    name = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(blank=True, editable=False)

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

    def save(self, *args, **kwargs):
        """
            Save slug when saving model.
            Slug saved only if not existant, to avoid duplicity of urls.
        """
        if not self.id:
            # new object to create
            self.slug = slugify(self.name)[:50]

        super().save(*args, **kwargs)


class Tag(models.Model):
    name = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(blank=True, editable=False)

    def __str__(self):
        """
            Field to show in the related models admin site.
        """
        return self.name

    class Meta:
        # order of drop-down list items
        ordering = ('name',)

    def save(self, *args, **kwargs):
        """
            Save slug when saving model.
            Slug saved only if not existant, to avoid duplicity of urls.
        """
        if not self.id:
            # new object to create
            self.slug = slugify(self.name)[:50]

        super().save(*args, **kwargs)


class QuoteManager(models.Manager):
    """
        Model manager used on the front-end website only.
    """
    def random(self, n):
        """
            Pick 'n' quotes randomly.
            'n' should be <= to number of quotes in the database.

            Args:
                n(int)
            Returns:
                random_quotes(QuerySet)
        """
        count = self.count()

        # pick 'n' indices randomly
        if n <= count:
            random_indices = random.sample(range(count), n)
        else:
            random_indices = range(count)

        random_quotes = self.filter(id__in=random_indices)

        return random_quotes

    def get_queryset(self):
        """
            Return only published quotes.
        """
        return super().get_queryset().filter(published=True)


class Quote(models.Model):
    text = models.CharField(max_length=1000, unique=True)
    slug = models.SlugField(blank=True, editable=False)
    date = models.DateTimeField(auto_now_add=True)
    published = models.BooleanField(default=False)

    # foreign keys
    # can be empty: null in database & blank in forms
    book = models.ForeignKey(Book, null=True, blank=True,
                             on_delete=models.CASCADE)
    author = models.ForeignKey(Author, null=True, blank=True,
                               on_delete=models.CASCADE)
    category = models.ForeignKey(Category, null=True, blank=True,
                                 on_delete=models.CASCADE)
    tags = models.ManyToManyField(Tag)
    member = models.ForeignKey(Member, null=True, blank=True,
                               on_delete=models.CASCADE)

    # default and custom managers
    objects = models.Manager()
    published_objects = QuoteManager()

    def __str__(self):
        """
            Field to show in the related models admin site.
        """
        return self.text

    class Meta:
        # order of drop-down list items
        ordering = ('-date', '-id')

    def save(self, *args, **kwargs):
        """
            Save slug when saving model.
            Slug saved only if not existant, to avoid duplicity of urls.
        """
        if not self.id:
            # new object to create
            self.slug = slugify(self.text)[:50]

        super().save(*args, **kwargs)
