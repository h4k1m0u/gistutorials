# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2017-03-12 18:21
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('quotes', '0010_auto_20170226_1914'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Member',
        ),
        migrations.AlterModelOptions(
            name='author',
            options={'ordering': ('lastname', 'firstname')},
        ),
    ]