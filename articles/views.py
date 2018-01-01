from .models import Article
from rest_framework import viewsets
from .serializers import ArticleSerializer
from rest_framework.response import Response
from rest_framework.decorators import list_route


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
