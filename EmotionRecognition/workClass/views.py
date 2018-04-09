from django.shortcuts import render
from .models import Video, Audio, Sesion, Docente, Estudiante, Tema

todos_audios = Audio.objects.all()
todos_videos = Video.objects.all()
reprod_video = todos_videos[0]
reprod_audio = todos_audios[0]
todos_sesiones = Video.objects.all()
todos_docentes = Docente.objects.all()
todos_estudiantes = Estudiante.objects.all()
todos_temas = Tema.objects.all()

def index(request):
    return render(request, 'workClass/index.html',  {'todos_sesiones': todos_sesiones,
                                                     'todos_docentes': todos_docentes,
                                                     'todos_estudiantes': todos_estudiantes,
                                                     'todos_temas': todos_temas})

def index_sesion(request, sesion_id):
    sesion = Sesion.objects.get(pk=sesion_id)
    docente = Docente.objects.all()[0]
    estudiante = Estudiante.objects.all()[0]
    tema = Tema.objects.all()[0]
    return render(request, 'workClass/index.html', {'todos_sesiones': todos_sesiones,
                                                    'todos_docentes': todos_docentes,
                                                    'todos_estudiantes': todos_estudiantes,
                                                    'todos_temas': todos_temas,
                                                    'sesion': sesion,
                                                    'docente': docente,
                                                    'estudiante': estudiante,
                                                    'tema': tema})

def index_docente(request, docente_id):
    docente = Docente.objects.get(pk=docente_id)
    estudiante = Estudiante.objects.all()[0]
    tema = Tema.objects.all()[0]
    sesion = Sesion.objects.all()[0]
    return render(request, 'workClass/index.html', {'todos_sesiones': todos_sesiones,
                                                    'todos_docentes': todos_docentes,
                                                    'todos_estudiantes': todos_estudiantes,
                                                    'todos_temas': todos_temas,
                                                    'sesion': sesion,
                                                    'docente': docente,
                                                    'estudiante': estudiante,
                                                    'tema': tema})

def index_estudiante(request, estudiante_id):
    estudiante = Estudiante.objects.get(pk=estudiante_id)
    docente = Docente.objects.all()[0]
    tema = Tema.objects.all()[0]
    sesion = Sesion.objects.all()[0]
    return render(request, 'workClass/index.html', {'todos_sesiones': todos_sesiones,
                                                    'todos_estudiantes': todos_estudiantes,
                                                    'todos_docentes': todos_docentes,
                                                    'todos_temas': todos_temas,
                                                    'sesion': sesion,
                                                    'estudiante': estudiante,
                                                    'docente': docente,
                                                    'tema': tema})

def index_tema(request, tema_id):
    tema = Tema.objects.get(pk=tema_id)
    docente = Docente.objects.all()[0]
    estudiante = Estudiante.objects.all()[0]
    sesion = Sesion.objects.all()[0]
    return render(request, 'workClass/index.html', {'todos_sesiones': todos_sesiones,
                                                    'todos_temas': todos_temas,
                                                    'todos_docentes': todos_docentes,
                                                    'todos_estudiantes': todos_estudiantes,
                                                    'sesion': sesion,
                                                    'tema': tema,
                                                    'docente': docente,
                                                    'estudiante': estudiante})

def galeria(request):
    sesion = Sesion.objects.all()[0]
    docente = Docente.objects.all()[0]
    temas = Tema.objects.filter(sesion=sesion)
    return render(request, 'workClass/galeria.html', {'todos_videos': todos_videos,
                                                      'reprod_video': reprod_video,
                                                      'todos_audios': todos_audios,
                                                      'reprod_audio': reprod_audio,
                                                      'todos_sesiones': todos_sesiones,
                                                      'todos_docentes': todos_docentes,
                                                      'docente': docente,
                                                      'sesion': sesion,
                                                      'temas': temas})
def galeria_video(request, video_id):
    reprod_video = Video.objects.get(pk=video_id)
    sesion = Sesion.objects.all()[0]
    docente = Docente.objects.all()[0]
    return render(request, 'workClass/galeria.html', {'todos_videos': todos_videos,
                                                      'reprod_video': reprod_video,
                                                      'todos_audios': todos_audios,
                                                      'reprod_audio': reprod_audio,
                                                      'todos_sesiones': todos_sesiones,
                                                      'todos_docentes': todos_docentes,
                                                      'docente': docente,
                                                      'sesion': sesion})
def galeria_audio(request, audio_id):
    reprod_audio = Audio.objects.get(pk=audio_id)
    sesion = Sesion.objects.all()[0]
    docente = Docente.objects.all()[0]
    return render(request, 'workClass/galeria.html', {'todos_videos': todos_videos,
                                                      'reprod_video': reprod_video,
                                                      'todos_audios': todos_audios,
                                                      'reprod_audio': reprod_audio,
                                                      'todos_sesiones': todos_sesiones,
                                                      'todos_docentes': todos_docentes,
                                                      'docente': docente,
                                                      'sesion': sesion})

def galeria_sesion(request, sesion_id):
    sesion = Sesion.objects.get(pk=sesion_id)
    docente = Docente.objects.all()[0]
    temas = Tema.objects.filter(sesion=sesion)
    return render(request, 'workClass/galeria.html', {'todos_videos': todos_videos,
                                                      'reprod_video': reprod_video,
                                                      'todos_audios': todos_audios,
                                                      'reprod_audio': reprod_audio,
                                                      'todos_sesiones': todos_sesiones,
                                                      'todos_docentes': todos_docentes,
                                                      'docente': docente,
                                                      'sesion': sesion,
                                                      'temas': temas})

def galeria_docente(request, docente_id):
    docente = Docente.objects.get(pk=docente_id)
    sesion = Sesion.objects.all()[0]
    return render(request, 'workClass/galeria.html', {'todos_videos': todos_videos,
                                                      'reprod_video': reprod_video,
                                                      'todos_audios': todos_audios,
                                                      'reprod_audio': reprod_audio,
                                                      'todos_sesiones': todos_sesiones,
                                                      'todos_docentes': todos_docentes,
                                                      'docente': docente,
                                                      'sesion': sesion})

def concepto(request):
    return render(request, 'workClass/concepto.html', {'todos_videos': todos_videos,
                                                       'todos_audios': todos_audios,
                                                       'todos_sesiones': todos_sesiones,
                                                       'todos_docentes': todos_docentes})

def estadisticas(request):
    video = Video.objects.all()[0]
    audio = Audio.objects.all()[0]
    return render(request, 'workClass/estadisticas.html', {'todos_videos': todos_videos,
                                                           'todos_audios': todos_audios,
                                                           'video': video,
                                                           'audio': audio})

def estadisticas_video(request, video_id):
    video = Video.objects.get(pk=video_id)
    audio = Audio.objects.all()[0]
    print(video, " ----------->>>>>>>>")
    return render(request, 'workClass/estadisticas.html', {'todos_videos': todos_videos,
                                                           'todos_audios': todos_audios,
                                                           'video': video,
                                                           'audio': audio})

def estadisticas_audio(request, audio_id):
    audio = Audio.objects.get(pk=audio_id)
    video = Video.objects.all()[0]
    return render(request, 'workClass/estadisticas.html', {'todos_videos': todos_videos,
                                                           'todos_audios': todos_audios,
                                                           'video': video,
                                                           'audio': audio})