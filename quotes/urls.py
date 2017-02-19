from django.conf.urls import url
from . import views


app_name = 'quotes'

urlpatterns = [
    # list view routes
    url(r'^$', views.QuotesListView.as_view(), name='list'),
    url(r'^category/(?P<category>[-\w]+)/$', views.QuotesListView.as_view(),
        name='list'),
    url(r'^book/(?P<book>[-\w]+)/$', views.QuotesListView.as_view(),
        name='list'),

    # detail view route
    url(r'^quote/(?P<pk>[0-9]+)/(?P<slug>[-\w]*)$',
        views.QuotesDetailView.as_view(), name='detail'),
]
