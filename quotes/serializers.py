from .models import Quote
from rest_framework import serializers


class QuoteSerializer(serializers.ModelSerializer):
    author = serializers.StringRelatedField()

    class Meta:
        model = Quote
        fields = ('text', 'author')
