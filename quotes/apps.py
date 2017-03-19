from django.apps import AppConfig


class QuotesConfig(AppConfig):
    name = 'quotes'

    def ready(self):
        """
            Register signal receivers.
        """
        import quotes.signals
