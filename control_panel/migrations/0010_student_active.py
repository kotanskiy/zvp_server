# Generated by Django 2.0.2 on 2018-03-20 10:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('control_panel', '0009_remove_student_active'),
    ]

    operations = [
        migrations.AddField(
            model_name='student',
            name='active',
            field=models.BooleanField(default=True),
        ),
    ]
