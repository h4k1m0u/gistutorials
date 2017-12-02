"""myquotes URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.conf import settings
from quotes.views import home_page, QuoteViewSet
from expenses.views import ExpenseViewSet
from rest_framework import routers


# REST API router
router = routers.DefaultRouter()
router.register(r'quotes', QuoteViewSet)
router.register(r'expenses', ExpenseViewSet)

urlpatterns = [
    # REST API routes
    url(r'^api/', include(router.urls)),
    url(r'^api/auth/', include('djoser.urls.authtoken')),

    # django built-in administration
    url(r'^admin/', admin.site.urls),

    # home page
    url(r'^$', home_page, name='home-page'),

    # applications
    url(r'^quotes/', include('quotes.urls')),
    url(r'^articles/', include('articles.urls')),
    url(r'^members/', include('members.urls')),
    url(r'^expenses/', include('expenses.urls')),

    # social media authentication (oauth)
    url(r'^oauth/', include('social_django.urls')),
]

# show the debug bar (sql queries) in debug mode only
if settings.DEBUG:
    import debug_toolbar

    urlpatterns += [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ]
