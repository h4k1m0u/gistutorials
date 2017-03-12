from django.conf.urls import url, include
from . import views
from django.contrib.auth import views as auth_views
from django.contrib.auth.decorators import user_passes_test


app_name = 'quotes'

# prevent access to login page for authenticated users (redirect '/' no ?next)
login_forbidden = user_passes_test(lambda user: user.is_anonymous(),
                                   login_url='/', redirect_field_name=None)

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
    url(r'^authors$', views.AuthorsListView.as_view(), name='authors-list'),

    # authentication
    url(r'^login$', login_forbidden(auth_views.login),
        {'template_name': 'quotes/login.html'}, name='login'),
    url(r'^logout$', auth_views.logout, name='logout'),
]
