"""
Django settings for bookquotes project.

Generated by 'django-admin startproject' using Django 1.10.3.

For more information on this file, see
https://docs.djangoproject.com/en/1.10/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.10/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.10/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'm3gq=zljfp91j#ecz!dh@7lu=8=dx&j7-2+!n$_i4z))jrb8gq'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS = ['localhost', 'bookquotes.me', 'www.bookquotes.me']


# Application definition

INSTALLED_APPS = [
    'corsheaders',
    'djoser',
    'rest_framework.authtoken',
    'rest_framework',
    'social_django',
    'debug_toolbar',
    'pipeline',
    'djangobower',
    'expenses.apps.ExpensesConfig',
    'quotes.apps.QuotesConfig',
    'articles.apps.ArticlesConfig',
    'members.apps.MembersConfig',
    'django.contrib.sites',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
]

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'bookquotes.urls'


###############################################################################
# Hakim: Look for base template at root of project
###############################################################################

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        # Look for base template at root of project
        'DIRS': [os.path.join(BASE_DIR, 'templates'), ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
            # Look for base templatetags at root of project
            'libraries': {
                'menu': 'templatetags.menu',
                'slider': 'templatetags.slider',
                'footer': 'templatetags.footer',
            }
        },
    },
]

WSGI_APPLICATION = 'bookquotes.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.10/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'bookquotes',
        'USER': 'hakim',
        'PASSWORD': '78G62h9',
        'HOST': 'localhost',
        'PORT': '',
    }
}


# Password validation
# https://docs.djangoproject.com/en/1.10/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.10/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.10/howto/static-files/

STATIC_URL = '/static/'


###############################################################################
# Hakim: Uploaded images
###############################################################################


# Location of uploaded images

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')


# URL of uploaded images

MEDIA_URL = '/media/'


###############################################################################
# Hakim: Manage staticfiles with Bower & Pipeline
###############################################################################


# Where orginal *.scss file is located

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'assets'),
)


# Where the produced static files are generated (e.g. compiled *.css file)

STATIC_ROOT = os.path.join(BASE_DIR, 'static')


# Where django, bower, pipeline look for static files

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    'djangobower.finders.BowerFinder',
    'pipeline.finders.PipelineFinder',
)


# Where bower installs the components

BOWER_COMPONENTS_ROOT = BASE_DIR


# Apps to install with bower

BOWER_INSTALLED_APPS = (
    'foundation-sites',
    'motion-ui',
    'foundation-icon-fonts'
)


# Set pipeline static assets storage

STATICFILES_STORAGE = 'pipeline.storage.PipelineStorage'


# Pass foundation through pipeline

PIPELINE = {
    'PIPELINE_ENABLED': True,
    'STYLESHEETS': {
        'style': {
            'source_filenames': (
                'style.scss',
            ),
            'output_filename': 'style.css',
        },
    },
    'JAVASCRIPT': {
        'script': {
            'source_filenames': (
                'jquery/dist/jquery.min.js',
                'foundation-sites/dist/js/foundation.min.js',
            ),
            'output_filename': 'script.js',
        },
    },
    'JS_COMPRESSOR': 'pipeline.compressors.NoopCompressor',
    'COMPILERS': (
        'pipeline.compilers.sass.SASSCompiler',
    ),
    'SASS_ARGUMENTS': "-I '%s'" % os.path.join(
        'foundation-sites',
        'scss'
    )
}


###############################################################################
# Hakim: Authentication
###############################################################################


# Where to redirect after login (if no GET[next])

LOGIN_REDIRECT_URL = '/'


# Where to redirect after logout (if no GET[next])

LOGOUT_REDIRECT_URL = '/'


###############################################################################
# Hakim: Debug bar
###############################################################################


# Whom to show the debug bar for

INTERNAL_IPS = ('127.0.0.1',)


###############################################################################
# Hakim: Contact form
###############################################################################


# site id (needed to get url domain)
SITE_ID = 1


# mail server credentials

EMAIL_HOST = 'mail.privateemail.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'admin@bookquotes.me'
EMAIL_HOST_PASSWORD = 'TY96ww2S'
EMAIL_USE_TLS = True


# who send the email

DEFAULT_FROM_EMAIL = 'admin@bookquotes.me'


# who receive the email

MANAGERS = [
    ('Admin', 'admin@bookquotes.me'),
    ('Hakim', 'h.benoudjit@gmail.com')
]


###############################################################################
# Hakim: REST API
###############################################################################


REST_FRAMEWORK = {
    # pagination
    'PAGE_SIZE': 10,
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.LimitOffsetPagination',

    # authentication required
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.TokenAuthentication',
    ),
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.IsAuthenticated',
    )
}


###############################################################################
# Hakim: REST CORS
###############################################################################


# Whitelist accounting-web

CORS_ORIGIN_WHITELIST = (
    'localhost:4200',
    'accounting.bookquotes.me',
)


###############################################################################
# Hakim: Social media authentication (oauth)
###############################################################################


# fall back to django model auth if not oauth

AUTHENTICATION_BACKENDS = (
    'social_core.backends.twitter.TwitterOAuth',
    'social_core.backends.google.GoogleOAuth2',
    'social_core.backends.facebook.FacebookOAuth2',

    'django.contrib.auth.backends.ModelBackend',
)

# apps tokens

SOCIAL_AUTH_TWITTER_KEY = 'eXHfVhSYHlGVNBZSVnxBmXpUb'
SOCIAL_AUTH_TWITTER_SECRET = 'dNGrhzPvxv7yDuFXQvrcEOOQNaglfPLPC8KjxbmE5MA62JneCC'
SOCIAL_AUTH_FACEBOOK_KEY = '1434286176666478'
SOCIAL_AUTH_FACEBOOK_SECRET = '25e1daa285a81e3b5596f6320d383456'
SOCIAL_AUTH_GOOGLE_OAUTH2_KEY = '55725089997-djgj308bu25cpiarmrfn16l2r4iqib0r.apps.googleusercontent.com'
SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET = 'bKxLfLFedQNneZo31CkyCpOX'

# pipeline of operations
# http://python-social-auth.readthedocs.io/en/latest/configuration/django.html#personalized-configuration

SOCIAL_AUTH_PIPELINE = (
    'social_core.pipeline.social_auth.social_details',
    'social_core.pipeline.social_auth.social_uid',
    'social_core.pipeline.social_auth.social_user',
    'social_core.pipeline.user.get_username',
    'social_core.pipeline.user.create_user',
    'social_core.pipeline.social_auth.associate_user',
    'social_core.pipeline.social_auth.load_extra_data',
    'social_core.pipeline.user.user_details',
    'social_core.pipeline.social_auth.associate_by_email',
)

# urls to redirect to on success/failure

SOCIAL_AUTH_LOGIN_URL = '/'
SOCIAL_AUTH_LOGIN_ERROR_URL = '/'
