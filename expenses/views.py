from .models import Expense
from django.db.models import Sum
from rest_framework import viewsets
from .serializers import ExpenseSerializer
from rest_framework.response import Response
from rest_framework.decorators import list_route


class ExpenseViewSet(viewsets.ModelViewSet):
    """
    REST API expenses view.
    """
    queryset = Expense.objects.all().order_by('-date')
    serializer_class = ExpenseSerializer

    def get_queryset(self):
        """
        Show only expenses owned by user in given month on the list.
        """
        qs = super(viewsets.ModelViewSet, self).get_queryset()

        # filter by month
        month = self.request.query_params.get('month', '')
        if month:
            qs = qs.filter(date__month=month)

        return qs.filter(user=self.request.user)

    @list_route()
    def total(self, request):
        """
        Calculate the total of expenses owned by user for the given  month.
        """
        # filter by current user
        qs = Expense.objects.filter(user=request.user)

        # filter by month
        month = request.GET.get('month', '')
        if month:
            qs = qs.filter(date__month=month)

        # sum of expenses
        total = qs.aggregate(Sum('amount'))
        total_amount = total['amount__sum'] if total['amount__sum'] else 0.0

        return Response(total_amount)
