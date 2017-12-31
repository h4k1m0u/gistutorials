from django.views.generic import ListView, DetailView
from .models import Article
from rest_framework import viewsets
from .serializers import ArticleSerializer
from rest_framework.response import Response
from rest_framework.decorators import list_route


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
    Authentication not necessary (Articles are public).
    """
    queryset = Article.published_objects.all().order_by('-date')
    serializer_class = ArticleSerializer

    @list_route(url_path='month/(?P<month>[0-9]|10|11|12)')
    def month(self, request, month):
        """
        Articles published in the given month.
        This method is accessed with: /articles/month/xx/
        """
        # filter by month
        month = self.kwargs.get('month')
        qs = Article.objects.filter(date__month=month)

        return Response(ArticleSerializer(qs, many=True).data)
