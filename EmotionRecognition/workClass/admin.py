from django.contrib import admin

from .models import Video, Calificacion, Docente, Estudiante, Intensidad, Curso, Tema


class VideoAdmin(admin.ModelAdmin):
    list_display = ('formato', 'curso_id', 'video')
    def curso_id(self,obj):
        return obj.curso.id
admin.site.register(Video, VideoAdmin)


class CalificacionAdmin(admin.ModelAdmin):
    list_display = ('curso', 'estudiante', 'calificacion')
admin.site.register(Calificacion, CalificacionAdmin)


class DocenteAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'apellido', 'edad', 'celular', 'correo', 'estado')
admin.site.register(Docente, DocenteAdmin)


class EstudianteAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'apellido', 'edad', 'celular', 'correo', 'estado', 'curso_id')
    def curso_id(self,obj):
        return obj.curso.id
admin.site.register(Estudiante, EstudianteAdmin)


class IntensidadAdmin(admin.ModelAdmin):
    list_display = ('horario', 'intensidad','horas_diarias', 'horas_semanales')
admin.site.register(Intensidad, IntensidadAdmin)


class EstudianteInLine(admin.TabularInline):
    model = Estudiante
    extra = 1

class CursoAdmin(admin.ModelAdmin):
    list_display = ('docente_nombre', 'nivel', 'sede', 'idioma', 'intensidad_intensidad')
    def docente_nombre(self, obj):
        return obj.docente.nombre
    def intensidad_intensidad(self,obj):
        return obj.intensidad.intensidad
    inlines = [EstudianteInLine]
admin.site.register(Curso, CursoAdmin)


class TemaAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'descripcion', 'fecha', 'curso_id')
    def curso_id(self, obj):
        return obj.curso.id
admin.site.register(Tema, TemaAdmin)

