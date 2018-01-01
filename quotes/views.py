from .models import Quote, Author
from .serializers import QuoteSerializer
from rest_framework import viewsets
from rest_framework.response import Response


class QuoteViewSet(viewsets.ModelViewSet):
    """
    REST API view to list Quotes.
    Authentication not necessary (quotes are public).
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
