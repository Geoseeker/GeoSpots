# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-07 08:28
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('GeoApp', '0002_auto_20170406_0903'),
    ]

    operations = [
        migrations.AlterField(
            model_name='collection',
            name='picture',
            field=models.ImageField(blank=True, upload_to='/GeoApp/static/'),
        ),
    ]