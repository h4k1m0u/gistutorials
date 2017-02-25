from django.views.generic import ListView, DetailView
from .models import Quote, Category, Book, Author, Tag


class QuotesListView(ListView):
    template_name = 'quotes/list.html'
    context_object_name = 'quotes'

    def get_queryset(self):
        """
            Return quotes ordered by date and filtered by url parameters.
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

        # filter quotes by tag slug
        tag = self.kwargs.get('tag')
        if tag:
            queryset = queryset.filter(tags__slug=tag)

        return queryset

    def get_context_data(self, **kwargs):
        """
            Pass url parameters to the template.
        """
        context = super(QuotesListView, self).get_context_data(**kwargs)

        # find name corresponding to slug
        category_slug = self.kwargs.get('category')
        if category_slug:
            category_name = Category.objects.get(slug=category_slug).name
            context['category'] = category_name

        book_slug = self.kwargs.get('book')
        if book_slug:
            book_title = Book.objects.get(slug=book_slug).title
            context['book'] = book_title

        author_slug = self.kwargs.get('author')
        if author_slug:
            author_name = Author.objects.get(slug=author_slug).name
            context['author'] = author_name

        tag_slug = self.kwargs.get('tag')
        if tag_slug:
            tag_name = Tag.objects.get(slug=tag_slug).name
            context['tag'] = tag_name

        return context


class QuotesDetailView(DetailView):
    template_name = 'quotes/detail.html'
    model = Quote
