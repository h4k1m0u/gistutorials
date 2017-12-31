from .models import Expense
from django.db.models import Sum
from django.db.models.functions import Extract
from rest_framework import viewsets
from .serializers import ExpenseSerializer
from rest_framework.response import Response
from rest_framework.decorators import list_route
from rest_framework.decorators import permission_classes
from rest_framework.permissions import IsAuthenticated
from .constants import months


@permission_classes((IsAuthenticated, ))
class ExpenseViewSet(viewsets.ModelViewSet):
    """
    REST API expenses view.
    Authentication needed because expenses are owned by logged on member.
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

    @list_route()
    def total_monthly(self, request):
        """
        Calculate the totals of expenses for each month owned by user.
        """
        # filter by current user
        qs = Expense.objects.filter(user=request.user)

        # total for each month
        per_month = (
            qs.
            annotate(month=Extract('date', 'month')).
            values('month').
            annotate(per_month=Sum('amount')).
            order_by('-month')
        )

        # format monthly totals
        total = {}
        for row in per_month:
            month_ind = row['month']
            month_name = months[month_ind].lower()
            total[month_name] = row['per_month']

        return Response(total)
