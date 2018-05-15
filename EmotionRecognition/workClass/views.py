from django.shortcuts import render
from .models import Curso, Docente, Estudiante, Tema, Video
from .forms import videoForm

try:
    todos_videos = Video.objects.all()
    reprod_video = todos_videos[0]
except:
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

def index(request, borrarconsulta):
    if borrarconsulta:
        contexto_index.pop('sede', None)
        contexto_index.pop('idioma', None)
        contexto_index.pop('docente_nombre', None)
        contexto_index.pop('nivel', None)
        contexto_index.pop('curso', None)
        contexto_index.pop('estudiantes', None)
        contexto_index.pop('temas', None)
        contexto_index.pop('videos', None)
        contexto_index.pop('docente', None)
        contexto_index.pop('videos', None)
        contexto_index.pop('reprod_video', None)
    return render(request, 'workClass/index.html', contexto_index)

def index_sede(request, sede):
    contexto_index['sede'] = sede
    return render(request, 'workClass/index.html', contexto_index)

def index_idioma(request, idioma):
    contexto_index['idioma'] = idioma
    return render(request, 'workClass/index.html', contexto_index)

def index_docente(request, docente_nombre):
    contexto_index['docente_nombre'] = docente_nombre
    docente = Docente.objects.filter(nombre=docente_nombre).distinct()
    try:
        contexto_index['docente'] = docente[0]
    except:
        print("No ha seleccionado ningun docente")
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
    docente = Docente.objects.filter(nombre=contexto_index.get("docente_nombre", None)).distinct()
    try:
        contexto_index['docente'] = docente[0]
    except:
        print("No ha seleccionado ningun docente")
    return render(request, 'workClass/index.html', contexto_index)


def formularios(request):
    if request.method == "POST":
        form1 = videoForm(request.POST, request.FILES)
        if form1.is_valid():
            form1.save()
    else:
        form1 = videoForm()

    contexto_index['form1'] = form1


def galeria(request):
    try:
        curso_id = contexto_index.get("curso", None).id
        videos = Video.objects.filter(curso=curso_id)
        contexto_index['videos']=videos
    except:
        print("No ha seleccionado ningun curso")
        contexto_index['videos'] = None
    formularios(request)
    return render(request, 'workClass/galeria.html', contexto_index)

def galeria_video(request, video_id):
    reprod_video = Video.objects.get(pk=video_id)
    contexto_index['reprod_video'] = reprod_video
    formularios(request)
    return render(request, 'workClass/galeria.html', contexto_index)


def multimodal(request):
    return render(request, 'workClass/multimodal.html', {'todos_videos': todos_videos,
                                                       'todos_cursos': todos_cursos,
                                                       'todos_docentes': todos_docentes})

def estadisticas(request):
    try:
        video = Video.objects.all()[0]
    except:
        video = None
    return render(request, 'workClass/estadisticas.html', {'todos_videos': todos_videos,
                                                           'video': video})

def estadisticas_video(request, video_id):
    video = Video.objects.get(pk=video_id)
    return render(request, 'workClass/estadisticas.html', {'todos_videos': todos_videos,
                                                           'video': video})


