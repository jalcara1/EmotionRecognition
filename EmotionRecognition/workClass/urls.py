from django.urls import path

from . import views

app_name = 'workClass'
urlpatterns = [
                  path('', views.index, name='index'),
                  path('galeria/', views.galeria, name='galeria'),
                  path('<int:video_id>/galeria_video/', views.galeria_video, name='galeria_video'),
                  path('<int:audio_id>/galeria_audio/', views.galeria_audio, name='galeria_audio'),
                  path('concepto/', views.concepto, name='concepto'),
                  path('estadisticas/', views.estadisticas, name='estadisticas')
              ]
