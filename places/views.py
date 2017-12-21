from django.views.generic import ListView, DetailView
from .models import City


class CitiesListView(ListView):
    """
        List of cities view.
    """
    template_name = 'places/cities-list.html'
    model = City
    context_object_name = 'cities'


class CitiesDetailView(DetailView):
    """
        City detail view.
    """
    template_name = 'places/city-detail.html'
    model = City
