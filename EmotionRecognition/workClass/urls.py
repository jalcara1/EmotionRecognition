from django.urls import path

from . import views

app_name = 'workClass'
urlpatterns = [
                  path('', views.index, name='index'),
                  path('<int:sesion_id>/index_sesion', views.index_sesion, name='index_sesion'),
                  path('<int:docente_id>/index_docente', views.index_docente, name='index_docente'),
                  path('<int:estudiante_id>/index_estudiante', views.index_estudiante, name='index_estudiante'),
                  path('<int:tema_id>/index_tema', views.index_tema, name='index_tema'),
                  path('galeria/', views.galeria, name='galeria'),
                  path('<int:video_id>/galeria_video/', views.galeria_video, name='galeria_video'),
                  path('<int:audio_id>/galeria_audio/', views.galeria_audio, name='galeria_audio'),
                  path('<int:sesion_id>/galeria_sesion/', views.galeria_sesion, name='galeria_sesion'),
                  path('<int:docente_id>/galeria_docente/', views.galeria_docente, name='galeria_docente'),
                  path('concepto/', views.concepto, name='concepto'),
                  path('estadisticas/', views.estadisticas, name='estadisticas'),
                  path('<int:audio_id>/estadisticas_audio/', views.estadisticas_audio, name='estadisticas_audio'),
                  path('<int:video_id>/estadisticas_video/', views.estadisticas_video, name='estadisticas_video')

              ]
