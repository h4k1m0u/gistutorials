from django.conf.urls import url
from . import views


app_name = 'quotes'

urlpatterns = [
    url(r'^$', views.QuotesListView.as_view(), name='list'),
    url(r'^quote/(?P<pk>[0-9]+)$', views.QuotesDetailView.as_view(),
        name='detail'),
]
