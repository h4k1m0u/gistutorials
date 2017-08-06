from django.conf.urls import url
from . import views


app_name = 'articles'

urlpatterns = [
    # articles list view
    url(r'^$', views.ArticlesListView.as_view(), name='articles-list'),
    url(r'^tag/(?P<tag>[-\w]+)/$', views.ArticlesListView.as_view(),
        name='articles-list'),
    url(r'^member/(?P<member>[-\w]+)/$', views.ArticlesListView.as_view(),
        name='articles-list'),

    # article detail view
    url(r'^article/(?P<pk>[0-9]+)/(?P<slug>[-\w]*)$',
        views.ArticlesDetailView.as_view(), name='article-detail'),
]
