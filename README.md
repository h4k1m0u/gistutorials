# UML tool
- **Install umlet:** `pacman -S umlet`
- Open `UML/myquotes.uxf` UML diagram with `umlet`.

# First-steps with Django

## Install Django
- **Install Django:** `pacman -S python-django`

## Create the project
- **Create a Django project:** `django-admin startproject <project> .`
- **Run server:** `python manage.py runserver`
- In your browser, go to `localhost:8000`

## Install & configure PostgreSQL
- **Install PostgreSQL:** `pacman -S postgresql pgadmin3`
- **Change to postgres user:** `sudo -u postgres -i`
- **Initialize database storage on disk:** `initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'`
- **Start service:** `systemctl start postgresql.service`
- **Run CLI client:** `psql`
- **Create a new user**: `CREATE USER <username>;`
- **Create a database**: `CREATE DATABASE <database> OWNER <username>;`
- **Install python adapter**: `pacman -S python-psycopg2`
- **Configure Django**: `vim <project>/settings.py`

And insert the following:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': '<database>',
        'USER': '<database-user>',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '',
    }
}
```
- **Create built-in apps' tables:** `python manage.py migrate`
- **Create django webadmin user:** `python manage.py createsuperuser`

## Create a new app
- **Create an app:** `python manage.py startapp <app>`
- **Install app:** `vim <project>/settings.py`

And insert the following:
```python
INSTALLED_APPS = {
    '<app>.apps.QuotesConfig',
    ...
}
```
- **Create the models classes:** Add models' classes to `<app>/models.py`
- **Create app migrations:** `python manage.py makemigrations <app>`
- **View app migrations:** `python manage.py showmigrations <app>`
- **View app migrations in sql format:** `python manage.py sqlmigrate <app> <migration>`
- **Create app's tables:** `python manage.py migrate`

## Edit database tables from admin
- **Add models to admin:** `vim <app>/admin.py`

And add:
```python
admin.site.register(<model>)
```

## Creating new views:
- **Create the views classes:** Add views' classes to `<app>/views.py`
- **Add url route in app's urls:**: `vim <app>/urls.py`

And add the following line to `urlpatterns`:
```python
urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    ...
]
```
- **Include the app's urls in main urls**: `vim <project>/urls.py`

And add the following line to `urlpatterns`:
```python
urlpatterns = [
    url(r'^<app>/', include('<app>.urls')),
    ...
]
```

## Install foundation with bower
- **Install nodejs package manager:** `pacman -S npm`
- **Install bower:** `npm install -g bower`
- **Install bower python module:** `pip install django-bower`
- **Edit settings.py:** `vim <project>/settings.py`

  - **Add bower to django apps:**

```python
INSTALLED_APPS = {
    'djangobower',
    ...
}
```

  - **Set finder to look for static files:**

```python
STATICFILES_FINDERS = (
    'djangobower.finders.BowerFinder',
    ...
)
```

  - **Set where bower installs the downloaded components:**

```python
BOWER_COMPONENTS_ROOT = BASE_DIR
```

  - **Apps to install with bower:**

```python
BOWER_INSTALLED_APPS = (
    'foundation-sites',
    'motion-ui',
)
```
Note: `motion-ui` is needed by foundation's slider component (i.e. `Orbit`).

- **Install the components:** `python manage.py bower install`

# Compile SCSS to CSS with pipeline
- **Install ruby and gem:** `pacman -S ruby`
- **Install sass:** `gem install sass`
- **Add gem folder to path:** `vim ~/.bashrc`

And add the following:
```sh
export PATH=$PATH:/home/hakim/.gem/ruby/2.4.0/bin:
```

- **Install pipeline python module:** `pip install django-pipeline`
- **Edit settings.py:** `vim <project>/settings.py`

  - **Add pipeline to django apps:**

```python
INSTALLED_APPS = {
    'pipeline',
    ...
}
```

  - **Set finder to look for static files:**

```python
STATICFILES_FINDERS = (
    'pipeline.finders.PipelineFinder',
    ...
)
```

  - **Set pipeline static assets storage:**

```python
STATICFILES_STORAGE = 'pipeline.storage.PipelineStorage'
```

  - **Set where orginal SCSS file is located:**

```python
STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'assets'),
)
```

  - **Set where the produced static files are generated (e.g. compiled CSS file):**

```python
STATICFILES_ROOT = os.path.join(BASE_DIR, 'static')
```

  - **Specify SCSS files to compile to CSS:**

```python
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
```

  - **Import foundation in your custom SCSS:** `vim assets/style.scss`

```sass
@import 'foundation-sites/scss/settings/_settings.scss';
@import 'foundation-sites/scss/foundation.scss';
@import 'motion-ui/motion-ui.scss';

...

@include foundation-everything;
```

 - **Compile static assets:** `python manage.py collectstatic`
 - **Copy generated assets:** `cp static/{style.css,script.js} assets/`

## Useful shell tools
- **Run django shell:** `python manage.py shell`
- **Run unit-tests:** `python manage.py test <app>`

# Color palette
["Tech city dream" color palette](http://www.colourlovers.com/palette/1636915/Tech_city_dream)
