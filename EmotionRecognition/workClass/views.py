from django.shortcuts import render, render_to_response

from .models import Audio, Curso, Docente, Estudiante, Tema, Video

try:
    todos_audios = Audio.objects.all()
    todos_videos = Video.objects.all()
    reprod_video = todos_videos[0]
    reprod_audio = todos_audios[0]
except:
    reprod_audio = None
    reprod_video = None
todos_cursos = Curso.objects.all()
todos_docentes = Docente.objects.all()
todos_estudiantes = Estudiante.objects.all()
todos_temas = Tema.objects.all()

todos_sedes_unicos = Curso.objects.values_list('sede', flat=True).order_by('sede').distinct()
todos_idiomas_unicos = Curso.objects.values_list('idioma', flat=True).order_by('idioma').distinct()
todos_docentes_unicos = Docente.objects.values_list('nombre', flat=True).order_by('nombre').distinct()
todos_niveles_unicos = Curso.objects.values_list('nivel', flat=True).order_by('nivel').distinct()
todos_fechas_unicos = Curso.objects.values('id', 'fecha').order_by('id').distinct()

contexto_index = {'todos_sedes_unicos': todos_sedes_unicos,
                  'todos_idiomas_unicos': todos_idiomas_unicos,
                  'todos_docentes_unicos': todos_docentes_unicos,
                  'todos_niveles_unicos': todos_niveles_unicos,
                  'todos_fechas_unicos': todos_fechas_unicos}


def index(request):
    contexto_index.pop('sede', None)
    contexto_index.pop('idioma', None)
    contexto_index.pop('docente_nombre', None)
    contexto_index.pop('nivel', None)
    contexto_index.pop('curso', None)
    contexto_index.pop('estudiantes', None)
    contexto_index.pop('temas', None)
    contexto_index.pop('videos', None)
    contexto_index.pop('audios', None)
    contexto_index.pop('docente', None)

    return render(request, 'workClass/index.html', contexto_index)

def index_sede(request, sede):
    contexto_index['sede'] = sede
    return render(request, 'workClass/index.html', contexto_index)

def index_idioma(request, idioma):
    contexto_index['idioma'] = idioma
    return render(request, 'workClass/index.html', contexto_index)

def index_docente(request, docente_nombre):
    contexto_index['docente_nombre'] = docente_nombre
    return render(request, 'workClass/index.html', contexto_index)

def index_nivel(request, nivel):
    contexto_index['nivel'] = nivel
    return render(request, 'workClass/index.html', contexto_index)

def index_fecha(request, fecha_id):
    curso = Curso.objects.get(pk=fecha_id)
    contexto_index['curso'] = curso
    estudiantes = Estudiante.objects.filter(curso=fecha_id)
    contexto_index['estudiantes'] = estudiantes
    temas = Tema.objects.filter(curso=fecha_id)
    contexto_index['temas'] = temas
    videos = Video.objects.filter(curso=fecha_id)
    contexto_index['videos'] = videos
    audios = Audio.objects.filter(curso=fecha_id)
    contexto_index['audios'] = audios
    docente = Docente.objects.filter(nombre=contexto_index.get("docente_nombre", None)).distinct()
    contexto_index['docente'] = docente[0]
    return render(request, 'workClass/index.html', contexto_index)




def galeria(request):
    try:
        curso = Curso.objects.all()[0]
        docente = Docente.objects.all()[0]
    except:
        curso = None
        docente = None
    temas = Tema.objects.filter(curso=curso)
    return render(request, 'workClass/galeria.html', {'todos_videos': todos_videos,
                                                      'reprod_video': reprod_video,
                                                      'todos_audios': todos_audios,
                                                      'reprod_audio': reprod_audio,
                                                      'todos_cursos': todos_cursos,
                                                      'todos_docentes': todos_docentes,
                                                      'docente': docente,
                                                      'curso': curso,
                                                      'temas': temas})
def galeria_video(request, video_id):
    reprod_video = Video.objects.get(pk=video_id)
    curso = Curso.objects.all()[0]
    docente = Docente.objects.all()[0]
    return render(request, 'workClass/galeria.html', {'todos_videos': todos_videos,
                                                      'reprod_video': reprod_video,
                                                      'todos_audios': todos_audios,
                                                      'reprod_audio': reprod_audio,
                                                      'todos_cursos': todos_cursos,
                                                      'todos_docentes': todos_docentes,
                                                      'docente': docente,
                                                      'curso': curso})
def galeria_audio(request, audio_id):
    reprod_audio = Audio.objects.get(pk=audio_id)
    curso = Curso.objects.all()[0]
    docente = Docente.objects.all()[0]
    return render(request, 'workClass/galeria.html', {'todos_videos': todos_videos,
                                                      'reprod_video': reprod_video,
                                                      'todos_audios': todos_audios,
                                                      'reprod_audio': reprod_audio,
                                                      'todos_cursos': todos_cursos,
                                                      'todos_docentes': todos_docentes,
                                                      'docente': docente,
                                                      'curso': curso})

def galeria_curso(request, curso_id):
    curso = Curso.objects.get(pk=curso_id)
    docente = Docente.objects.all()[0]
    temas = Tema.objects.filter(curso=curso)
    return render(request, 'workClass/galeria.html', {'todos_videos': todos_videos,
                                                      'reprod_video': reprod_video,
                                                      'todos_audios': todos_audios,
                                                      'reprod_audio': reprod_audio,
                                                      'todos_cursos': todos_cursos,
                                                      'todos_docentes': todos_docentes,
                                                      'docente': docente,
                                                      'curso': curso,
                                                      'temas': temas})

def galeria_docente(request, docente_id):
    docente = Docente.objects.get(pk=docente_id)
    curso = Curso.objects.all()[0]
    return render(request, 'workClass/galeria.html', {'todos_videos': todos_videos,
                                                      'reprod_video': reprod_video,
                                                      'todos_audios': todos_audios,
                                                      'reprod_audio': reprod_audio,
                                                      'todos_cursos': todos_cursos,
                                                      'todos_docentes': todos_docentes,
                                                      'docente': docente,
                                                      'curso': curso})

def concepto(request):
    return render(request, 'workClass/concepto.html', {'todos_videos': todos_videos,
                                                       'todos_audios': todos_audios,
                                                       'todos_cursos': todos_cursos,
                                                       'todos_docentes': todos_docentes})

def estadisticas(request):
    try:
        video = Video.objects.all()[0]
        audio = Audio.objects.all()[0]
    except:
        video = None
        audio = None
    return render(request, 'workClass/estadisticas.html', {'todos_videos': todos_videos,
                                                           'todos_audios': todos_audios,
                                                           'video': video,
                                                           'audio': audio})

def estadisticas_video(request, video_id):
    video = Video.objects.get(pk=video_id)
    audio = Audio.objects.all()[0]
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

