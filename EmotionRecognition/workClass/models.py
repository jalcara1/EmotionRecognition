from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator

class Docente(models.Model):
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    edad = models.IntegerField(default=0)
    celular = models.CharField(max_length=10)
    correo = models.EmailField()
    ESTADO_CHOICES = (('Activo', 'Activo'), ('Desactivo', 'Desactivo'))
    estado = models.CharField(choices=ESTADO_CHOICES, default='Desactivo',max_length=20)

class Intensidad(models.Model):
    horas_diarias = models.IntegerField()
    horas_semanales = models.IntegerField()

class Sesion(models.Model):
    docente = models.ForeignKey(Docente, on_delete=models.CASCADE)
    CURSO_CHOICES = (('1','1'),('2','2'),('3','3'),('4','4'),('5','5'),
                     ('6', '6'), ('7', '7'), ('7', '7'), ('8', '8'), ('9', '9'),
                     ('10', '10'), ('11', '11'), ('12', '12'), ('13', '13'), ('14', '14'),('15','15'))
    curso = models.CharField(choices=CURSO_CHOICES,default='1',max_length=20)
    SEDE_CHOICES = (('Mayorca','Mayorca'),('Laureles','Laureles'),('Poblado','Poblado'))
    sede = models.CharField(choices=SEDE_CHOICES, default='Poblado',max_length=20)
    horario = models.CharField(max_length=200)
    IDIOMA_CHOICE = (('Ingles','Ingles'),('Espanol','Espanol'),('Portugues','Portugues'),('Mandarin','Mandarin'))
    idioma = models.CharField(choices=IDIOMA_CHOICE, default='Ingles',max_length=20)
    intensidad = models.ForeignKey(Intensidad, on_delete=models.CASCADE)

class Estudiante(models.Model):
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    edad = models.IntegerField(default=0)
    celular = models.CharField(max_length=10)
    correo = models.EmailField()
    ESTADO_CHOICES = (('Activo', 'Activo'),('Desactivo', 'Desactivo'))
    estado = models.CharField(choices=ESTADO_CHOICES, default='Desactivo',max_length=20)
    sesion = models.ForeignKey(Sesion, on_delete=models.CASCADE)

class Tema(models.Model):
    nombre = models.CharField(max_length=200)
    descripcion = models.TextField()
    fecha = models.DateField()
    sesion = models.ForeignKey(Sesion, on_delete=models.CASCADE)

class Calificacion(models.Model):
    sesion = models.OneToOneField(Sesion,on_delete=models.CASCADE)
    estudiante = models.OneToOneField(Estudiante, on_delete=models.CASCADE)
    calificacion = models.FloatField(default=0, validators=[MaxValueValidator(5),MinValueValidator(0)])

class Video(models.Model):
    fecha = models.DateField()
    duracion = models.FloatField()
    formato = models.CharField(max_length=6)
    emocion = models.CharField(max_length=20)
    sesion = models.ForeignKey(Sesion,on_delete=models.CASCADE)
    ruta = models.FileField()

class Audio(models.Model):
    fecha = models.DateField()
    duracion = models.FloatField()
    formato = models.CharField(max_length=6)
    emocion = models.CharField(max_length=20)
    sesion = models.ForeignKey(Sesion, on_delete=models.CASCADE)
    ruta = models.FileField()

