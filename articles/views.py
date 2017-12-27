from django.views.generic import ListView, DetailView
from .models import Article
from rest_framework import viewsets
from .serializers import ArticleSerializer


class ArticlesListView(ListView):
    """
        List of articles view.
    """
    template_name = 'articles/articles-list.html'
    model = Article
    context_object_name = 'articles'

    def get_queryset(self):
        """
            Return articles queryset.
        """
        queryset = Article.published_objects.order_by('-date')

        # filter quotes by tag slug
        tag = self.kwargs.get('tag')
        if tag:
            queryset = queryset.filter(tags__slug=tag)

        return queryset


class ArticlesDetailView(DetailView):
    """
        Article detail view.
    """
    template_name = 'articles/article-detail.html'
    model = Article

    def get_queryset(self):
        """
            Show only published articles.
        """
        return super().get_queryset().filter(published=True)


class ArticleViewSet(viewsets.ModelViewSet):
    """
    REST API view to list Articles.
    """
    queryset = Article.published_objects.all().order_by('-date')
    serializer_class = ArticleSerializer
