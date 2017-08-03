from django import forms
from .models import Quote
from dal import autocomplete


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
