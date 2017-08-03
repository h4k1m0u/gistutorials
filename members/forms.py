from registration.forms import RegistrationFormUniqueEmail


class CustomRegistrationFormUniqueEmail(RegistrationFormUniqueEmail):
    """
        Registration form without the help_text for each field.
    """
    def __init__(self, *args, **kwargs):
        super(RegistrationFormUniqueEmail, self).__init__(*args, **kwargs)

        # Remove help-text from the form
        for fieldname in ['username', 'email', 'password1', 'password2']:
            self.fields[fieldname].help_text = None
