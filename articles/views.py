from .models import Article
from rest_framework import viewsets
from .serializers import ArticleSerializer
from rest_framework.response import Response
from rest_framework.decorators import list_route
from django.db.models.functions import ExtractMonth, ExtractYear


class ArticleViewSet(viewsets.ModelViewSet):
    """
    REST API view to list Articles.
    Authentication not necessary (Articles are public).
    """
    queryset = Article.published_objects.all().order_by('-date')
    serializer_class = ArticleSerializer

    @list_route(url_path='date/(?P<year>[0-9]{4})/(?P<month>[0-9]|10|11|12)')
    def by_date(self, request, year, month):
        """
        Articles published in the given month of the given year.
        This method is accessed with: /articles/date/yyyy/mm/
        """
        # filter by month
        month = self.kwargs.get('month')
        year = self.kwargs.get('year')
        qs = Article.published_objects.filter(date__month=month,
                                              date__year=year)

        return Response(ArticleSerializer(qs, many=True,
                                          context={'request': request}).data)

    @list_route(url_path='tag/(?P<tag>[0-9]+)')
    def by_tag(self, request, tag):
        """
        Articles published tagged by the given tag (its id).
        This method is accessed with: /articles/tag/xxx/
        """
        # filter by tag
        tag = self.kwargs.get('tag')
        qs = Article.published_objects.filter(tags__id=tag)

        return Response(ArticleSerializer(qs, many=True,
                                          context={'request': request}).data)

    @list_route()
    def dates(self, request):
        """
        Get (years, months) containing articles.
        """
        # filter by month
        qs = Article.published_objects.annotate(
            month=ExtractMonth('date'),
            year=ExtractYear('date')
        ).values_list('year', 'month')

        return Response(set(qs))
