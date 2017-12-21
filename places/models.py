from django.db import models
from django.contrib.gis.db import models as geomodels
from django.utils.text import slugify


class City(models.Model):
    name = models.CharField(max_length=100, blank=False)
    geometry = geomodels.PointField()
    slug = models.SlugField(blank=True, editable=False)

    class Meta:
        # order of drop-down list items
        ordering = ('name',)

        # plural form in admin view
        verbose_name_plural = 'cities'

    def save(self, *args, **kwargs):
        """
            Save slug when saving model.
            Slug saved only if not existant, to avoid duplicity of urls.
        """
        if not self.id:
            # new object to create
            self.slug = slugify(self.name)[:50]

        super().save(*args, **kwargs)
