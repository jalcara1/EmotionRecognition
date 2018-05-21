from django.shortcuts import render
from .models import Curso, Docente, Estudiante, Tema, Video
from .forms import videoForm

import multiprocessing
from PIL import Image
import subprocess
import shutil
import boto3
import json
import os

emociones = ["HAPPY", "ANGRY", "SURPRICED", "SAD", "CALM", "DISGUSTED", "CONFUSE"]
try:
    todos_videos = Video.objects.all()
    reprod_video = Video.objects.filter(modificado=False, contenido=True).first()
    reprod_video_emociones = Video.objects.filter(modificado=True, contenido=True).first()
except:
    reprod_video = None
    reprod_video_emociones = None

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
        #contexto_index.pop('videos', None)
        contexto_index.pop('reprod_video', None)
        contexto_index.pop('reprod_video_emociones', None)
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


def formularios_1(request):
    if request.method == "POST":
        form1 = videoForm(request.POST, request.FILES)
        if form1.is_valid():
            post1 = form1.save(commit=False)
            post1.modificado = False
            post1.contenido = True
            post1.save()
    else:
        form1 = videoForm()

    contexto_index['form1'] = form1


def formularios_2(request):
    if request.method == "POST":
        form1 = videoForm(request.POST, request.FILES)

        if form1.is_valid():
            post2 = form1.save(commit=False)
            nameVideo = str(post2.video)
            post2.video = str("Emoji" + nameVideo)
            post2.modificado = True
            post2.contenido = True
            #post2.emocion = str(classifier(nameVideo))                                
            post2.emocion = str(post2.video)[0:-4]+".json"
            background_classifier = multiprocessing.Process(name='background_classifier', target=classifier, args=(nameVideo,))
            #background_classifier.daemon = True                                       
            background_classifier.star()
            post2.save()
    else:
        form1 = videoForm()

    contexto_index['form1'] = form1


def galeria(request):
    try:
        curso_id = contexto_index.get("curso", None).id
        videos = Video.objects.filter(curso=curso_id)
        contexto_index['videos'] = videos
    except:
        print("No ha seleccionado ningun curso")
        contexto_index['videos'] = None
    formularios_1(request)
    formularios_2(request)
    return render(request, 'workClass/galeria.html', contexto_index)

def galeria_video(request, video_id):
    reprod_video_emociones = Video.objects.filter(modificado=True, contenido=True).first()
    reprod_video = Video.objects.get(pk=video_id)
    contexto_index['reprod_video'] = reprod_video
    contexto_index['reprod_video_emociones'] = reprod_video_emociones
    formularios_1(request)
    formularios_2(request)
    return render(request, 'workClass/galeria.html', contexto_index)

def galeria_video_emociones(request, video_id):
    reprod_video = Video.objects.filter(modificado=False, contenido=True).first()
    reprod_video_emociones = Video.objects.get(pk=video_id)
    contexto_index['reprod_video'] = reprod_video
    contexto_index['reprod_video_emociones'] = reprod_video_emociones
    formularios_1(request)
    formularios_2(request)
    return render(request, 'workClass/galeria.html', contexto_index)


def multimodal(request):
    return render(request, 'workClass/multimodal.html', {'emociones': json.dumps(emociones),
                                                         'todos_videos': todos_videos,
                                                         'todos_cursos': todos_cursos,
                                                         'todos_docentes': todos_docentes})

def multimodal_emociones(request, video_id):
    frec_emocion = Video.objects.get(pk=video_id)
    frec_emocion = frec_emocion.emocion
    with open("media/"+str(frec_emocion)) as json_file:
        frec_emocion = json.load(json_file)
    frec_emocion = json.loads(frec_emocion)
    frec_emocion_list = []
    for c,v in frec_emocion.items():
        frec_emocion_list.append(v)
    return render(request, 'workClass/multimodal.html', {'emociones': json.dumps(emociones),
                                                         'frec_emociones': json.dumps(frec_emocion_list),
                                                         'todos_videos': todos_videos,
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


def classifier(nameVideo):
    nameVideo = nameVideo[0:-4]
    s3 = boto3.resource('s3')
    prefix = "media/"
    Emoji = prefix + "imagenes/Emoji/"
    bucket = 'emotion.recognition.db'
    client = boto3.client('rekognition', 'us-east-1')
    confianza_final = -1.0
    emotions = []
    emoticons = {
        "HAPPY": Emoji + 'happy.png',
        "ANGRY": Emoji + 'angry.png',
        "SURPRISED": Emoji + 'surprised.png',
        "SAD": Emoji + 'sad.png',
        "CALM": Emoji + 'calm.png',
        "DISGUSTED": Emoji + 'disgusted.png',
        "CONFUSED": Emoji + 'confused.png',
        "UNKNOWN": Emoji + 'unknown.png'
    }
    os.makedirs(prefix + "imagenes/" + nameVideo, exist_ok=True)
    os.makedirs(prefix + "imagenes/" + nameVideo + "Emoji", exist_ok=True)
    videoFrames = "ffmpeg -y -i " + prefix + nameVideo + ".mp4 -r 1 " + prefix + "imagenes/" + nameVideo + "/output_%05d.png"
    subprocess.call(['bash', '-c', videoFrames])

    for dirpath, dirs, files in os.walk(prefix + "imagenes/" + nameVideo):
        for fileName in files:
            fileNameEmoji = fileName
            fileName = prefix + "imagenes/" + nameVideo + "/" + fileName
            s3.meta.client.upload_file(fileName, bucket, fileName)
            response = client.detect_faces(Image={'S3Object': {'Bucket': bucket, 'Name': fileName}}, Attributes=['ALL'])
            source_img = s3.Object(bucket, fileName).get()
            im = Image.open(source_img.get('Body'))

            for faceDetails in response.get('FaceDetails'):
                w = faceDetails.get('BoundingBox').get('Width')
                h = faceDetails.get('BoundingBox').get('Height')
                l = faceDetails.get('BoundingBox').get('Left')
                t = faceDetails.get('BoundingBox').get('Top')
                x1 = im.size[0] * l
                y1 = im.size[1] * t
                x2 = x1 + im.size[0] * w
                y2 = y1 + im.size[1] * h
                fimemo = faceDetails.get('Emotions')[0].get('Type')
                imemo = Image.open(emoticons.get(fimemo))
                a = int(x2 - x1)
                b = int(y2 - y1)
                imemo = imemo.resize((a, b))
                im.paste(imemo, (int(x1), int(y1)), imemo)
                
                for emotion in faceDetails['Emotions']:
                    confianza = float(str(emotion["Confidence"]))
                    emocion = str(emotion["Type"])
                    if confianza > confianza_final:
                        emocion_final = emocion
                        confianza_final = confianza
                        
                emotions = emotions + [emocion_final]
                emotions = emotions + [emocion_final]
                confianza_final = -1.0
                
            im.save(prefix + "imagenes/" + nameVideo + "Emoji/" + fileNameEmoji, "PNG")

    data_emociones = {"HAPPY": float(str(emotions.count("HAPPY"))),
                      "ANGRY": float(str(emotions.count("ANGRY"))),
                      "SURPRISED": float(str(emotions.count("SURPRISED"))),
                      "SAD": float(str(emotions.count("SAD"))),
                      "CALM": float(str(emotions.count("CALM"))),
                      "DISGUSTED": float(str(emotions.count("DISGUSTED"))),
                      "CONFUSED": float(str(emotions.count("CONFUSED")))}

    emotions_json = json.dumps(data_emociones)
    with open(prefix + nameVideo + '.json', 'w') as file:
        json.dump(emotions_json, file, ensure_ascii=False)

    # emptyBucket = "aws s3 rm s3://emotion.recognition.db --recursive"
    # subprocess.call(['bash','-c', emptyBucket])
    newVideo = "ffmpeg -r 1 -i " + prefix + "imagenes/" + nameVideo + "Emoji/output_%05d.png -framerate 1 -strict -2 -pix_fmt yuv420p -c:v libx264 -c:a aac -y " + prefix + "Emoji" + nameVideo + ".mp4"
    subprocess.call(['bash', '-c', newVideo])
    
    shutil.rmtree(prefix + "imagenes/" + nameVideo + "Emoji/", ignore_errors=True)
    shutil.rmtree(prefix + "imagenes/" + nameVideo, ignore_errors=True)

    return nameVideo + '.json'



