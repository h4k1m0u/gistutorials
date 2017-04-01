from registration.forms import RegistrationFormUniqueEmail
from django import forms
from .models import Quote
from dal import autocomplete


class CustomRegistrationFormUniqueEmail(RegistrationFormUniqueEmail):
    """
        Registration form without the help_text for each field.
    """
    def __init__(self, *args, **kwargs):
        super(RegistrationFormUniqueEmail, self).__init__(*args, **kwargs)

        # Remove help-text from the form
        for fieldname in ['username', 'email', 'password1', 'password2']:
            self.fields[fieldname].help_text = None


def get_choice_list():
    return ['France', 'Fiji', 'Finland', 'Switzerland']


class SubmitQuoteForm(forms.ModelForm):
    """
        Form to submit a quote for moderation.
    """
    class Meta:
        model = Quote
        fields = ['text', 'book', 'author', 'category', 'tags']
        widgets = {
            'book': autocomplete.ModelSelect2(
                url='quotes:book-autocomplete'
            ),
            'author': autocomplete.ModelSelect2(
                url='quotes:author-autocomplete'
            ),
            'category': autocomplete.ModelSelect2(
                url='quotes:category-autocomplete'
            ),
            'tags': autocomplete.ModelSelect2Multiple(
                url='quotes:tags-autocomplete'
            ),
        }
