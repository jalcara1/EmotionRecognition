# Generated by Django 2.0.4 on 2018-05-21 07:01

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Calificacion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('calificacion', models.FloatField(default=0, validators=[django.core.validators.MaxValueValidator(5), django.core.validators.MinValueValidator(0)])),
            ],
        ),
        migrations.CreateModel(
            name='Curso',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nivel', models.CharField(choices=[('1', '1'), ('2', '2'), ('3', '3'), ('4', '4'), ('5', '5'), ('6', '6'), ('7', '7'), ('8', '8'), ('9', '9'), ('10', '10'), ('11', '11'), ('12', '12'), ('13', '13'), ('14', '14'), ('15', '15'), ('16', '16'), ('17', '17')], default='1', max_length=20)),
                ('sede', models.CharField(choices=[('Sur', 'Sur'), ('Laureles', 'Laureles'), ('Poblado', 'Poblado'), ('Llanogrande', 'Llanogrande'), ('Belen', 'Belen')], default='Poblado', max_length=20)),
                ('idioma', models.CharField(choices=[('Ingles', 'Ingles'), ('Espanol', 'Espanol'), ('Portugues', 'Portugues'), ('Mandarin', 'Mandarin')], default='Ingles', max_length=20)),
                ('fecha', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='Docente',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('apellido', models.CharField(max_length=50)),
                ('edad', models.IntegerField(default=0)),
                ('celular', models.CharField(max_length=10)),
                ('correo', models.EmailField(max_length=254)),
                ('estado', models.CharField(choices=[('Activo', 'Activo'), ('Desactivo', 'Desactivo')], default='Desactivo', max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Estudiante',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('apellido', models.CharField(max_length=50)),
                ('edad', models.IntegerField(default=0)),
                ('celular', models.CharField(max_length=10)),
                ('correo', models.EmailField(max_length=254)),
                ('estado', models.CharField(choices=[('Activo', 'Activo'), ('Desactivo', 'Desactivo')], default='Desactivo', max_length=20)),
                ('curso', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='workClass.Curso')),
            ],
        ),
        migrations.CreateModel(
            name='Intensidad',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('horario', models.CharField(choices=[('Lunes - Miercoles', 'Lunes - Miercoles'), ('Martes - Jueves', 'Martes - Jueves'), ('Miercoles - Jueves', 'Miercoles - Jueves'), ('Viernes - Sabado', 'Viernes - Sabado'), ('Sabado', 'Sabado'), ('Lunes - Miercoles - Viernes', 'Lunes - Miercoles - Viernes'), ('Lunes a viernes', 'Lunes a viernes'), ('Lunes a jueves', 'Lunes a jueves')], default='Lunes - Miercoles', max_length=300)),
                ('intensidad', models.CharField(choices=[('Horario regular', 'Horario regular'), ('Horario semi-intensivo', 'Horario semi-intensivo'), ('Horario intensivo', 'Horario intensivo')], default='Horario regular', max_length=60)),
                ('horas_diarias', models.CharField(choices=[('2', '2'), ('3', '3'), ('4', '4')], default='2', max_length=5)),
                ('horas_semanales', models.CharField(choices=[('4', '4'), ('6', '6'), ('8', '8')], default='4', max_length=5)),
            ],
        ),
        migrations.CreateModel(
            name='Tema',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=200)),
                ('descripcion', models.TextField()),
                ('fecha', models.DateField()),
                ('curso', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='workClass.Curso')),
            ],
        ),
        migrations.CreateModel(
            name='Video',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('formato', models.CharField(choices=[('MPEG', 'MPEG'), ('WMV', 'WMV'), ('MP4', 'MP4'), ('FLV', 'FLV')], default='MP4', max_length=6)),
                ('video', models.FileField(blank=True, upload_to='')),
                ('fecha', models.DateField()),
                ('emocion', models.FileField(blank=True, upload_to='')),
                ('modificado', models.BooleanField(default=False)),
                ('contenido', models.BooleanField(default=False)),
                ('curso', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='workClass.Curso')),
            ],
        ),
        migrations.AddField(
            model_name='curso',
            name='docente',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='workClass.Docente'),
        ),
        migrations.AddField(
            model_name='curso',
            name='intensidad',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='workClass.Intensidad'),
        ),
        migrations.AddField(
            model_name='calificacion',
            name='curso',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='workClass.Curso'),
        ),
        migrations.AddField(
            model_name='calificacion',
            name='estudiante',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='workClass.Estudiante'),
        ),
    ]
