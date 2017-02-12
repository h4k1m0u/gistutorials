from django.views.generic import ListView, DetailView
from .models import Quote


class QuotesListView(ListView):
    template_name = 'quotes/list.html'
    context_object_name = 'quotes'

    def get_queryset(self):
        """
            Return quotes ordered by date.
        """
        return Quote.objects.order_by('-date')


class QuotesDetailView(DetailView):
    template_name = 'quotes/detail.html'
    model = Quote
