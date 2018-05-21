from django.urls import path, re_path
from . import views

app_name = 'workClass'
urlpatterns = [

        path('<sede>/index_sede/', views.index_sede, name='index_sede'),
        path('<idioma>/index_idioma/', views.index_idioma, name='index_idioma'),
        path('<docente_nombre>/index_docente/', views.index_docente, name='index_docente'),
        path('<nivel>/index_nivel/', views.index_nivel, name='index_nivel'),
        path('<int:fecha_id>/index_fecha/', views.index_fecha, name='index_fecha'),

        path('galeria/', views.galeria, name='galeria'),
        path('<int:video_id>/galeria_video/', views.galeria_video, name='galeria_video'),
        path('<int:video_id>/galeria_video_emociones/', views.galeria_video_emociones, name='galeria_video_emociones'),

        path('multimodal/', views.multimodal, name='multimodal'),
        path('<int:video_id>/multimodal_emociones/', views.multimodal_emociones, name='multimodal_emociones'),
        path('estadisticas/', views.estadisticas, name='estadisticas'),

        path('<int:video_id>/estadisticas_video/', views.estadisticas_video, name='estadisticas_video'),
        re_path(r'^(.*)$', views.index, name='index'),
        ]
