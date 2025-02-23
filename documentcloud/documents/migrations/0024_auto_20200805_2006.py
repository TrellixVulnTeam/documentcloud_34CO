# Generated by Django 2.2.5 on 2020-08-05 20:06

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('documents', '0023_auto_20200525_1942'),
    ]

    operations = [
        migrations.AlterField(
            model_name='note',
            name='user',
            field=models.ForeignKey(db_constraint=False, help_text='The user who created this note', on_delete=django.db.models.deletion.PROTECT, related_name='notes', to=settings.AUTH_USER_MODEL, verbose_name='user'),
        ),
    ]
