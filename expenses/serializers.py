from .models import Expense
from rest_framework import serializers


class ExpenseSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField()

    class Meta:
        model = Expense
        fields = ('date', 'description', 'amount', 'user')

    def create(self, validated_data):
        # save connected user
        validated_data['user'] = self.context['request'].user

        return Expense.objects.create(**validated_data)
