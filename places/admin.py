from django.contrib.gis import admin
from .models import City


# OSMGeoAdmin allows to get annotated OSM maps in admin widgets
class CityAdmin(admin.OSMGeoAdmin):
    """
    OSMGeoAdmin allows to get annotated OSM maps in admin widgets.
    http://blog.adamfast.com/2011/11/improving-the-admin/
    """
    # Algeria's (lon:3, lat:36) in epsg:3857 (web maps) projection
    default_lon = 333958.47237982077
    default_lat = 4300621.372044271

    # fields to show in admin listview
    list_display = ('name', 'geometry')


# register models in the admin site
admin.site.register(City, CityAdmin)
