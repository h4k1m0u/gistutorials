from django.conf.urls import url, include
from registration.backends.simple.views import RegistrationView
from .forms import CustomRegistrationFormUniqueEmail


app_name = 'members'

urlpatterns = [
    # django-registration plugin (unique email)
    url(r'^register/$',
        RegistrationView.as_view(form_class=CustomRegistrationFormUniqueEmail),
        name='registration_register'),
    url(r'^', include('registration.backends.simple.urls')),
]
