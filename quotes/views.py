from django.views.generic import ListView, DetailView
from .models import Quote


class QuotesListView(ListView):
    template_name = 'quotes/list.html'
    context_object_name = 'quotes'

    def get_queryset(self):
        """
            Return quotes ordered by date.
        """
        queryset = Quote.objects.order_by('-date')

        # filter quotes by search query
        search = self.request.GET.get('search', '').strip()
        if search:
            queryset = queryset.filter(text__icontains=' ' + search + ' ')

        # filter quotes by category slug
        category = self.kwargs.get('category')
        if category:
            queryset = queryset.filter(category__slug=category)

        # filter quotes by book slug
        book = self.kwargs.get('book')
        if book:
            queryset = queryset.filter(book__slug=book)

        # filter quotes by author slug
        author = self.kwargs.get('author')
        if author:
            queryset = queryset.filter(author__slug=author)

        return queryset


class QuotesDetailView(DetailView):
    template_name = 'quotes/detail.html'
    model = Quote
