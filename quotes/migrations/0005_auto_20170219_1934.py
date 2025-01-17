# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2017-02-19 19:34
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('quotes', '0004_auto_20170219_1823'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='slug',
            field=models.SlugField(blank=True),
        ),
        migrations.AddField(
            model_name='category',
            name='slug',
            field=models.SlugField(blank=True),
        ),
        migrations.AlterField(
            model_name='quote',
            name='slug',
            field=models.SlugField(blank=True),
        ),
    ]
