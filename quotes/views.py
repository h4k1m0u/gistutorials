from django.views.generic import ListView, DetailView
from .models import Quote, Category, Book, Author, Tag
from django.shortcuts import render
from .serializers import QuoteSerializer
from django.db.models import Count
from rest_framework import viewsets
from rest_framework.response import Response


class QuotesListView(ListView):
    """
        List of quotes view.
    """
    template_name = 'quotes/quotes-list.html'
    model = Quote
    context_object_name = 'quotes'
    paginate_by = 12

    def get_queryset(self):
        """
            Return quotes ordered by date and filtered by url parameters.
        """
        queryset = Quote.published_objects.order_by('-date')

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

        # filter quotes by member slug
        member = self.kwargs.get('member')
        if member:
            queryset = queryset.filter(member__slug=member)

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
    """
        Quote detail view.
    """
    template_name = 'quotes/quote-detail.html'
    model = Quote

    def get_queryset(self):
        """
            Show only published quotes.
        """
        return super().get_queryset().filter(published=True)


class BooksListView(ListView):
    """
        List of books view.
    """
    template_name = 'quotes/books-list.html'
    model = Book
    context_object_name = 'books'
    paginate_by = 12


class CategoriesListView(ListView):
    """
        List of categories view.
    """
    template_name = 'quotes/categories-list.html'
    model = Category
    context_object_name = 'categories'


class AuthorsListView(ListView):
    """
        List of authors view.
    """
    template_name = 'quotes/authors-list.html'
    model = Author
    context_object_name = 'authors'


def home_page(request):
    # top 6 categories by # of quotes
    categories = Category.objects.annotate(num_quotes=Count('quote'))\
        .order_by('-num_quotes')[:6].all()

    return render(request, 'quotes/home-page.html', {'categories': categories})


class QuoteViewSet(viewsets.ModelViewSet):
    """
    REST API view to list Quotes.
    """
    queryset = Quote.published_objects.all().order_by('-date')
    serializer_class = QuoteSerializer

    def create(self, request):
        """
        Create the quote's author before creating the quote
        """
        # get request params
        text = request.data.get('text')
        firstname = request.data.get('firstname')
        lastname = request.data.get('lastname')

        # create a new author
        author = Author.objects.create(firstname=firstname, lastname=lastname)

        # create the quote
        Quote.objects.create(text=text, author=author)

        return Response({'text': text, 'firstname': firstname,
                         'lastname': lastname})
