from django.db import models
from django.utils.text import slugify
from members.models import Member
from tinymce.models import HTMLField


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


class ArticleManager(models.Manager):
    """
        Model manager used on the front-end website only.
    """
    def get_queryset(self):
        """
            Return only published articles.
        """
        return super().get_queryset().filter(published=True)


class Article(models.Model):
    title = models.CharField(max_length=140, unique=True)
    slug = models.SlugField(blank=True, editable=False)
    date = models.DateTimeField(auto_now_add=True)
    published = models.BooleanField(default=False)
    text = HTMLField()

    # foreign keys
    # can be empty: null in database & blank in forms
    category = models.ForeignKey(Category, null=True, blank=True,
                                 on_delete=models.CASCADE)
    tags = models.ManyToManyField(Tag)
    member = models.ForeignKey(Member, null=True, blank=True,
                               on_delete=models.CASCADE, editable=False)

    # default and custom managers
    objects = models.Manager()
    published_objects = ArticleManager()

    def __str__(self):
        """
            Field to show in the related models admin site.
        """
        return self.title

    class Meta:
        # order of drop-down list items
        ordering = ('-date',)

    def save(self, *args, **kwargs):
        """
            Save slug when saving model.
            Slug saved only if not existant, to avoid duplicity of urls.
        """
        if not self.id:
            # new object to create
            self.slug = slugify(self.title)[:50]

        super().save(*args, **kwargs)
