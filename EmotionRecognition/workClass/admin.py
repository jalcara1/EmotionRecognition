from django.contrib import admin
from .models import Audio, Video, Calificacion, Docente, Estudiante, Intensidad, Sesion, Tema


class AudioAdmin(admin.ModelAdmin):
    list_display = ('duracion','formato','emocion','sesion','ruta')
admin.site.register(Audio, AudioAdmin)


class VideoAdmin(admin.ModelAdmin):
    list_display = ('duracion', 'formato', 'emocion', 'sesion', 'ruta')
admin.site.register(Video, VideoAdmin)


class CalificacionAdmin(admin.ModelAdmin):
    list_display = ('sesion', 'estudiante','calificacion')
admin.site.register(Calificacion, CalificacionAdmin)


class DocenteAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'apellido', 'edad', 'celular', 'correo', 'estado')
admin.site.register(Docente, DocenteAdmin)


class EstudianteAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'apellido', 'edad', 'celular', 'correo', 'estado', 'sesion')
admin.site.register(Estudiante, EstudianteAdmin)


class IntensidadAdmin(admin.ModelAdmin):
    list_display = ('horas_diarias', 'horas_semanales')
admin.site.register(Intensidad, IntensidadAdmin)


class EstudianteInLine(admin.TabularInline):
    model = Estudiante
    extra = 1

class SesionAdmin(admin.ModelAdmin):
    list_display = ('docente', 'curso', 'sede', 'horario', 'idioma', 'intensidad')
    inlines = [EstudianteInLine]
admin.site.register(Sesion, SesionAdmin)


class TemaAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'descripcion', 'fecha', 'sesion')
admin.site.register(Tema, TemaAdmin)