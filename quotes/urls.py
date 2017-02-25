from django.conf.urls import url
from . import views


app_name = 'quotes'

urlpatterns = [
    # quotes list view
    url(r'^$', views.QuotesListView.as_view(), name='quotes-list'),
    url(r'^category/(?P<category>[-\w]+)/$', views.QuotesListView.as_view(),
        name='quotes-list'),
    url(r'^book/(?P<book>[-\w]+)/$', views.QuotesListView.as_view(),
        name='quotes-list'),
    url(r'^author/(?P<author>[-\w]+)/$', views.QuotesListView.as_view(),
        name='quotes-list'),
    url(r'^tag/(?P<tag>[-\w]+)/$', views.QuotesListView.as_view(),
        name='quotes-list'),

    # quote detail view
    url(r'^quote/(?P<pk>[0-9]+)/(?P<slug>[-\w]*)$',
        views.QuotesDetailView.as_view(), name='quote-detail'),

    # books list view
    url(r'^books$', views.BooksListView.as_view(), name='books-list'),

    # categories list view
    url(r'^categories$', views.CategoriesListView.as_view(),
        name='categories-list'),

    # authors list view
    url(r'^authors$', views.AuthorsListView.as_view(),
        name='authors-list'),
]
