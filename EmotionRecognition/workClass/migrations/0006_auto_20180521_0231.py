# Generated by Django 2.0.4 on 2018-05-21 02:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('workClass', '0005_auto_20180520_2328'),
    ]

    operations = [

        migrations.AlterField(
            model_name='video',
            name='fecha',
            field=models.DateField(blank=True),
        )
    ]
