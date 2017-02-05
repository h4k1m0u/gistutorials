# First-steps with Django

## Install Django
- **Install Django:** `pacman -S python-django`

## Create the project and the app
- **Create a Django project:** `django-admin startproject <project> .`
- **Create an app:** `python manage.py startapp <app>`

## Run the app
- **Run server:** `python manage.py runserver`
- In your browser, go to `localhost:8000`

## Install & configure PostgreSQL
- **Install PostgreSQL:** `pacman -S postgresql`
- **Change to postgres user:** `sudo -u postgres -i`
- **Initialize database storage on disk:** `initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'`
- **Start service:** `systemctl start postgresql.service`
- **Run CLI client:** `psql`
- **Create a new user**: `CREATE USER <username>;`
- **Create a database**: `CREATE DATABASE <database> OWNER <username>;`
- **Install python adapter**: `pacman -S python-psycopg2`
- **Configure Django**: `vim myquotes/settings.py`
And insert the following accordingly:
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

## Useful shell tools
- **Create migrations:** `python manage.py makemigrations <app>`
- **View migrations:** `python manage.py sqlmigrate <app> <migration>`
- **Run unit-tests:** `python manage.py test <app>`
