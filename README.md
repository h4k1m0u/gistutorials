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
- **Configure Django**: `vim myquotes/settings.py`
And insert the following:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'myquotes',
        'USER': 'hakim',
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
- **Install app:** `vim myquotes/settings.py`
And insert the following:
```python
INSTALLED_APPS = {
    'quotes.apps.QuotesConfig',
    ...
}
```
- **Create the models classes:** Add models' classes to `quotes/models.py`
- **Create app migrations:** `python manage.py makemigrations <app>`
- **View app migrations:** `python manage.py sqlmigrate <app> <migration>`
- **Create app's tables:** `python manage.py migrate`

## Useful shell tools
- **Run unit-tests:** `python manage.py test <app>`
