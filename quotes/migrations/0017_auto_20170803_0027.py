# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2017-08-03 00:27
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('quotes', '0016_auto_20170325_0158'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='member',
            name='user',
        ),
        migrations.RemoveField(
            model_name='quote',
            name='member',
        ),
        migrations.DeleteModel(
            name='Member',
        ),
    ]
