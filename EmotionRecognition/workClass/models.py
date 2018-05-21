from django.db import models

from django.core.validators import MaxValueValidator, MinValueValidator

class Docente(models.Model):
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    edad = models.IntegerField(default=0)
    celular = models.CharField(max_length=10)
    correo = models.EmailField()
    ESTADO_CHOICES = (('Activo', 'Activo'),
                      ('Desactivo', 'Desactivo'))
    estado = models.CharField(choices=ESTADO_CHOICES, default='Desactivo', max_length=20)

class Intensidad(models.Model):
    HORARIO_CHOICES = (('Lunes - Miercoles', 'Lunes - Miercoles'),
                       ('Martes - Jueves', 'Martes - Jueves'),
                       ('Miercoles - Jueves', 'Miercoles - Jueves'),
                       ('Viernes - Sabado', 'Viernes - Sabado'),
                       ('Sabado', 'Sabado'),
                       ('Lunes - Miercoles - Viernes', 'Lunes - Miercoles - Viernes'),
                       ('Lunes a viernes', 'Lunes a viernes'),
                       ('Lunes a jueves', 'Lunes a jueves'))
    horario = models.CharField(choices=HORARIO_CHOICES, default='Lunes - Miercoles', max_length=300)
    INTENSIDAD_CHOICES = (('Horario regular', 'Horario regular'),
                          ('Horario semi-intensivo', 'Horario semi-intensivo'),
                          ('Horario intensivo', 'Horario intensivo'))
    intensidad = models.CharField(choices=INTENSIDAD_CHOICES, default='Horario regular', max_length=60)
    HDIARIAS_CHOICES = (('2', '2'), ('3', '3'), ('4', '4'))
    horas_diarias = models.CharField(choices=HDIARIAS_CHOICES, default='2', max_length=5)
    HSEMANALES_CHOICES = (('4', '4'), ('6', '6'), ('8', '8'))
    horas_semanales = models.CharField(choices=HSEMANALES_CHOICES, default='4', max_length=5)


class Curso(models.Model):
    docente = models.ForeignKey(Docente, on_delete=models.CASCADE)
    CURSO_CHOICES = (('1', '1'), ('2', '2'), ('3', '3'), ('4', '4'), ('5', '5'),
                     ('6', '6'), ('7', '7'), ('8', '8'), ('9', '9'), ('10', '10'),
                     ('11', '11'), ('12', '12'), ('13', '13'), ('14', '14'), ('15', '15'),
                     ('16', '16'), ('17', '17'))
    nivel = models.CharField(choices=CURSO_CHOICES, default='1', max_length=20)
    SEDE_CHOICES = (('Sur', 'Sur'),
                    ('Laureles', 'Laureles'),
                    ('Poblado', 'Poblado'),
                    ('Llanogrande', 'Llanogrande'),
                    ('Belen', 'Belen'))
    sede = models.CharField(choices=SEDE_CHOICES, default='Poblado', max_length=20)
    IDIOMA_CHOICE = (('Ingles', 'Ingles'),
                     ('Espanol', 'Espanol'),
                     ('Portugues', 'Portugues'),
                     ('Mandarin', 'Mandarin'))
    idioma = models.CharField(choices=IDIOMA_CHOICE, default='Ingles', max_length=20)
    intensidad = models.ForeignKey(Intensidad, on_delete=models.CASCADE)
    fecha = models.DateField()

class Estudiante(models.Model):
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    edad = models.IntegerField(default=0)
    celular = models.CharField(max_length=10)
    correo = models.EmailField()
    ESTADO_CHOICES = (('Activo', 'Activo'),
                      ('Desactivo', 'Desactivo'))
    estado = models.CharField(choices=ESTADO_CHOICES, default='Desactivo', max_length=20)
    curso = models.ForeignKey(Curso, on_delete=models.CASCADE)

class Tema(models.Model):
    nombre = models.CharField(max_length=200)
    descripcion = models.TextField()
    fecha = models.DateField()
    curso = models.ForeignKey(Curso, on_delete=models.CASCADE)

class Calificacion(models.Model):
    estudiante = models.ForeignKey(Estudiante, on_delete=models.CASCADE)
    curso = models.OneToOneField(Curso, on_delete=models.CASCADE)
    calificacion = models.FloatField(default=0, validators=[MaxValueValidator(5), MinValueValidator(0)])

class Video(models.Model):
    FORMATO_CHOICES = (('MPEG', 'MPEG'), ('WMV', 'WMV'), ('MP4', 'MP4'), ('FLV', 'FLV'))
    formato = models.CharField(choices=FORMATO_CHOICES, default='MP4', max_length=6)
    curso = models.ForeignKey(Curso, on_delete=models.CASCADE)
    video = models.FileField(blank=True)
    fecha = models.DateField()
    emocion = models.FileField(blank=True)
    modificado = models.BooleanField(default=False)
    contenido = models.BooleanField(default=False)




