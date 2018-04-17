from django.urls import path, re_path
from . import views

app_name = 'workClass'
urlpatterns = [
        re_path(r'^(.*)$', views.index, name='index'),
        path('<sede>/index_sede/', views.index_sede, name='index_sede'),
        path('<idioma>/index_idioma/', views.index_idioma, name='index_idioma'),
        path('<docente_nombre>/index_docente/', views.index_docente, name='index_docente'),
        path('<nivel>/index_nivel/', views.index_nivel, name='index_nivel'),
        path('<int:fecha_id>/index_fecha/', views.index_fecha, name='index_fecha'),

        path('galeria/', views.galeria, name='galeria'),
        path('<int:video_id>/galeria_video/', views.galeria_video, name='galeria_video'),
        path('<int:audio_id>/galeria_audio/', views.galeria_audio, name='galeria_audio'),

        path('multimodal/', views.multimodal, name='multimodal'),
        path('estadisticas/', views.estadisticas, name='estadisticas'),
        path('<int:audio_id>/estadisticas_audio/', views.estadisticas_audio, name='estadisticas_audio'),
        path('<int:video_id>/estadisticas_video/', views.estadisticas_video, name='estadisticas_video')
        ]
