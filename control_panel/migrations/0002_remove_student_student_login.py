# Generated by Django 2.0.2 on 2018-04-03 09:35

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('control_panel', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='student',
            name='student_login',
        ),
    ]
