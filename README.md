# Django commands

## Starting a new project
1. **Install Django:** `pip install django`.
2. **Create a Django project:** `django-admin startproject <project>`.
3. **Create an app:** `python manage.py startapp <app>`.
4. **Run server:** `python manage.py runserver`.
5. **Create an admin user:** `python manage.py createsuperuser`.

## Migrations
1. **Create migrations:** `python manage.py makemigrations <app>`.
2. **View migrations:** `python manage.py sqlmigrate <app> <migration>`.
3. **Run migrations:** `python manage.py migrate`.
