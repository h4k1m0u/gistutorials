from django.apps import AppConfig


class ExpensesConfig(AppConfig):
    name = 'expenses'

    def ready(self):
        """
        Register signal receivers.
        """
        import expenses.signals
