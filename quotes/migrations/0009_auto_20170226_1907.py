# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2017-02-26 19:07
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('quotes', '0008_auto_20170226_1856'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='author',
            name='name',
        ),
        migrations.RemoveField(
            model_name='member',
            name='name',
        ),
    ]
