# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2017-03-18 20:03
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('quotes', '0012_quote_published'),
    ]

    operations = [
        migrations.AlterField(
            model_name='quote',
            name='published',
            field=models.BooleanField(default=False),
        ),
    ]
