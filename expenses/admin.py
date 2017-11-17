"""
https://medium.com/@hakibenita/how-to-turn-django-admin-into-a-lightweight-dashboard-a0e0bbf609ad
Checkbox: https://stackoverflow.com/a/46129772/2228912
"""
from django.contrib import admin
from django.contrib.admin import SimpleListFilter, ModelAdmin, helpers
from .models import Expense
from django.db.models import Sum


months = {
    '01': 'January',
    '02': 'February',
    '03': 'March',
    '04': 'April',
    '05': 'May',
    '06': 'June',
    '07': 'July',
    '08': 'August',
    '09': 'September',
    '10': 'October',
    '11': 'November',
    '12': 'December',
}


class MonthListFilter(SimpleListFilter):
    """
    Customized date filter by month.
    https://docs.djangoproject.com/en/dev/ref/contrib/admin/#django.contrib.admin.ModelAdmin.list_filter
    """
    # filter name in the template
    title = 'Month'

    # parameter name in the url query
    parameter_name = 'month'

    def lookups(self, request, model_admin):
        """
        Filter options shown in the filter & their url parameter values.
        """
        return list(months.items())

    def queryset(self, request, queryset):
        """
        Filtered queryset according to the filter option selected.
        """
        month = request.GET.get(self.parameter_name)

        if month:
            return queryset.filter(date__month=month)


# customize admin views
@admin.register(Expense)
class ExpenseAdmin(ModelAdmin):
    # order by date descending
    ordering = ('-date', '-id')

    # sidebar filters
    list_filter = (MonthListFilter,)

    # template to use
    change_list_template = 'admin/expense_change_list.html'

    def get_queryset(self, request):
        """
        Show only expenses owned by the logged-in user.
        """
        qs = super(ExpenseAdmin, self).get_queryset(request)

        return qs.filter(user=request.user)

    def changelist_view(self, request, extra_context=None):
        """
        Populate the context sent to the template.
        """
        response = super().changelist_view(request,
                                           extra_context=extra_context)

        # get queryset
        try:
            qs = response.context_data['cl'].queryset
        except (AttributeError, KeyError):
            return response

        # add checkboxes
        res = qs.values()
        for item in res:
            item.update({'checkbox': helpers.checkbox.render(
                helpers.ACTION_CHECKBOX_NAME,
                item['id']
            )})

        # all expenses
        response.context_data['expenses'] = res

        # total
        total = (
            qs.
            aggregate(Sum('amount'))
        )
        total_amount = total['amount__sum'] if total['amount__sum'] else 0.0
        response.context_data['total'] = total_amount

        # sum of amounts per day
        per_day = (
            qs.
            values('date').
            annotate(per_day=Sum('amount')).
            order_by('-date')
        )
        response.context_data['per_day'] = dict([d.values()
                                                 for d in per_day])

        # set title
        month = request.GET.get('month')
        title = 'Expenses'
        title += ' for ' + months[month] if month else ''
        response.context_data['title'] = title

        return response

    def save_model(self, request, obj, form, change):
        """
        Save expense's owner on creation.
        """
        if not change:
            obj.user = request.user

        super(ExpenseAdmin, self).save_model(request, obj, form, change)
