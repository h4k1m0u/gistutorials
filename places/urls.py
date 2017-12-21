from django.conf.urls import url
from . import views


app_name = 'places'

urlpatterns = [
    # cities list view
    url(r'^$', views.CitiesListView.as_view(), name='cities-list'),

    # city detail view
    url(r'^city/(?P<pk>[0-9]+)/(?P<slug>[-\w]*)$',
        views.CitiesDetailView.as_view(), name='city-detail'),
]
