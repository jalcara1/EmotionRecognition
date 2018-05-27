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
import numpy as np

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
            background_classifier.start()
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
                                                         'todos_videos': todos_videos})

def multimodal_emociones(request, video_id):
    frec_emocion = Video.objects.get(pk=video_id)
    frec_emocion = frec_emocion.emocion
    with open("media/"+str(frec_emocion)) as json_file:
        frec_emocion = json.load(json_file)
    frec_emocion = json.loads(frec_emocion)
    frec_emocion_list = []
    for c,v in frec_emocion.items():
        frec_emocion_list.append(v)
    acum = 0
    for i in frec_emocion_list:
        acum = acum + i
    for i in range(len(frec_emocion_list)):
        frec_emocion_list[i] = (frec_emocion_list[i]/acum)*100
    acum = 0
    for i in frec_emocion_list:
        acum = acum + i


    return render(request, 'workClass/multimodal.html', {'emociones': json.dumps(emociones),
                                                         'frec_emociones': json.dumps(frec_emocion_list),
                                                         'todos_videos': todos_videos})

contexto_estadistica = {'todos_docentes': todos_docentes,
                        'docente_id': Docente.objects.all().first().id,
                        'grafica': 1,
                        "HAPPY": None, "ANGRY": None, "SURPRICED": None, "SAD": None, "CALM": None, "DISGUSTED": None, "CONFUSE": None,
                        'emociones': json.dumps(emociones)}

def estadisticas(request):
    return render(request, 'workClass/estadisticas.html', contexto_estadistica)

def estadisticas_docente(request, docente_id):
    contexto_estadistica['docente_id'] = docente_id
    return render(request, 'workClass/estadisticas.html', contexto_estadistica)

def determinar_nivel(docente_nivel):
    cursos_docentes = Curso.objects.filter(docente=contexto_estadistica['docente_id'])
    for i in range(len(cursos_docentes)):
        if int(cursos_docentes[i].nivel) >= 1 and int(cursos_docentes[i].nivel) <= 3:
            docente_nivel['A1'] = Video.objects.filter(curso=cursos_docentes[i].id)
        if int(cursos_docentes[i].nivel) >= 4 and int(cursos_docentes[i].nivel) <= 7:
            docente_nivel['A2'] = Video.objects.filter(curso=cursos_docentes[i].id)
        if int(cursos_docentes[i].nivel) >= 8 and int(cursos_docentes[i].nivel) <= 10:
            docente_nivel['B1'] = Video.objects.filter(curso=cursos_docentes[i].id)
        if int(cursos_docentes[i].nivel) >= 11 and int(cursos_docentes[i].nivel) <= 14:
            docente_nivel['B2'] = Video.objects.filter(curso=cursos_docentes[i].id)
        if int(cursos_docentes[i].nivel) >= 15 and int(cursos_docentes[i].nivel) <= 17:
            docente_nivel['C'] = Video.objects.filter(curso=cursos_docentes[i].id)
    return docente_nivel

def determinar_nivel_emocional(docente_nivel):
    if docente_nivel.get("A1") != None:
        docente_nivel['A1'] = docente_nivel.get("A1")[0].emocion
    if docente_nivel.get("A2") != None:
        docente_nivel['A2'] = docente_nivel.get("A2")[0].emocion
    if docente_nivel.get("B1") != None:
        docente_nivel['B1'] = docente_nivel.get("B1")[0].emocion
    if docente_nivel.get("B2") != None:
        docente_nivel['B2'] = docente_nivel.get("B2")[0].emocion
    if docente_nivel.get("C") != None:
        docente_nivel['C'] = docente_nivel.get("C")[0].emocion
    return docente_nivel

def determinar_arreglo_emocional(docente_nivel, nivel):
    if docente_nivel.get(nivel) != None:
        with open("media/"+str(docente_nivel.get(nivel))) as json_file:
            frec_emocion = json.load(json_file)
        frec_emocion = json.loads(frec_emocion)
        frec_emocion_list = []
        for c,v in frec_emocion.items():
            frec_emocion_list.append(v)
        docente_nivel[nivel] = frec_emocion_list

    return docente_nivel

def determinar_prop(matriz_emociones):
    acum = 0.0
    for i in range(matriz_emociones.shape[1]):
        for j in range(matriz_emociones.shape[0]):
            acum += matriz_emociones[j, i]
        for k in range(matriz_emociones.shape[0]):
            if acum != 0:
                matriz_emociones[k, i] = (matriz_emociones[k, i]/acum)*100
        acum = 0

    return matriz_emociones

def pasar_datos(nvector):
    vector = []
    for i in nvector:
        vector.append(i)
    return vector

def determinar_intensidad(docente_intensidad):
    cursos_docentes = Curso.objects.filter(docente=contexto_estadistica['docente_id'])
    for i in range(len(cursos_docentes)):
        if cursos_docentes[i].intensidad.intensidad == 'Horario regular':
            docente_intensidad['Regular'] = Video.objects.filter(curso=cursos_docentes[i].id)
        if cursos_docentes[i].intensidad.intensidad == 'Horario semi-intensivo':
            docente_intensidad['SemiIntensivo'] = Video.objects.filter(curso=cursos_docentes[i].id)
        if cursos_docentes[i].intensidad.intensidad == 'Horario intensivo':
            docente_intensidad['Intensivo'] = Video.objects.filter(curso=cursos_docentes[i].id)
    return docente_intensidad

def determinar_intensidad_emocional(docente_intensidad):
    if docente_intensidad.get("Regular") != None:
        docente_intensidad['Regular'] = docente_intensidad.get("Regular")[0].emocion
    if docente_intensidad.get("SemiIntensivo") != None:
        docente_intensidad['SemiIntensivo'] = docente_intensidad.get("SemiIntensivo")[0].emocion
    if docente_intensidad.get("Intensivo") != None:
        docente_intensidad['Intensivo'] = docente_intensidad.get("Intensivo")[0].emocion
    return docente_intensidad

def estadisticas_grafica(request, grafica_id):
    contexto_estadistica['grafica'] = grafica_id


    if grafica_id == 1:
        docente_nivel = {"A1": None, "A2": None, "B1": None, "B2": None, "C": None}
        docente_nivel = determinar_nivel(docente_nivel)
        docente_nivel = determinar_nivel_emocional(docente_nivel)
        docente_nivel = determinar_arreglo_emocional(docente_nivel, "A1")
        docente_nivel = determinar_arreglo_emocional(docente_nivel, "A2")
        docente_nivel = determinar_arreglo_emocional(docente_nivel, "B1")
        docente_nivel = determinar_arreglo_emocional(docente_nivel, "B2")
        docente_nivel = determinar_arreglo_emocional(docente_nivel, "C")

        matriz_emociones = []
        if docente_nivel.get("A1") != None:
            matriz_emociones.append(docente_nivel["A1"])
        else:
            matriz_emociones.append([0,0,0,0,0,0,0])
        if docente_nivel.get("A2") != None:
            matriz_emociones.append(docente_nivel["A2"])
        else:
            matriz_emociones.append([0,0,0,0,0,0,0])
        if docente_nivel.get("B1") != None:
            matriz_emociones.append(docente_nivel["B1"])
        else:
            matriz_emociones.append([0,0,0,0,0,0,0])
        if docente_nivel.get("B2") != None:
            matriz_emociones.append(docente_nivel["B2"])
        else:
            matriz_emociones.append([0,0,0,0,0,0,0])
        if docente_nivel.get("C") != None:
            matriz_emociones.append(docente_nivel["C"])
        else:
            matriz_emociones.append([0,0,0,0,0,0,0])

        matriz_emociones = np.array(matriz_emociones)
        matriz_emociones = np.transpose(matriz_emociones)

        matriz_emociones = determinar_prop(matriz_emociones)

        contexto_estadistica["HAPPY"] = json.dumps(pasar_datos(matriz_emociones[0]))
        contexto_estadistica["ANGRY"] = json.dumps(pasar_datos(matriz_emociones[1]))
        contexto_estadistica["SURPRICED"] = json.dumps(pasar_datos(matriz_emociones[2]))
        contexto_estadistica["SAD"] = json.dumps(pasar_datos(matriz_emociones[3]))
        contexto_estadistica["CALM"] = json.dumps(pasar_datos(matriz_emociones[4]))
        contexto_estadistica["DISGUSTED"] = json.dumps(pasar_datos(matriz_emociones[5]))
        contexto_estadistica["CONFUSE"] = json.dumps(pasar_datos(matriz_emociones[6]))

    if grafica_id == 2:
        docente_intensidad = {"Regular": None, "SemiIntensivo": None, "Intensivo": None}
        docente_intensidad = determinar_intensidad(docente_intensidad)
        docente_intensidad = determinar_intensidad_emocional(docente_intensidad)
        docente_intensidad = determinar_arreglo_emocional(docente_intensidad, "Regular")
        docente_intensidad = determinar_arreglo_emocional(docente_intensidad, "SemiIntensivo")
        docente_intensidad = determinar_arreglo_emocional(docente_intensidad, "Intensivo")

        matriz_emociones = []
        if docente_intensidad.get("Regular") != None:
            matriz_emociones.append(docente_intensidad["Regular"])
        else:
            matriz_emociones.append([0, 0, 0, 0, 0, 0, 0])
        if docente_intensidad.get("SemiIntensivo") != None:
            matriz_emociones.append(docente_intensidad["SemiIntensivo"])
        else:
            matriz_emociones.append([0, 0, 0, 0, 0, 0, 0])
        if docente_intensidad.get("Intensivo") != None:
            matriz_emociones.append(docente_intensidad["Intensivo"])
        else:
            matriz_emociones.append([0, 0, 0, 0, 0, 0, 0])

        matriz_emociones = np.array(matriz_emociones)
        matriz_emociones = np.transpose(matriz_emociones)
        matriz_emociones = determinar_prop(matriz_emociones)


        contexto_estadistica["HAPPY"] = json.dumps(pasar_datos(matriz_emociones[0]))
        contexto_estadistica["ANGRY"] = json.dumps(pasar_datos(matriz_emociones[1]))
        contexto_estadistica["SURPRICED"] = json.dumps(pasar_datos(matriz_emociones[2]))
        contexto_estadistica["SAD"] = json.dumps(pasar_datos(matriz_emociones[3]))
        contexto_estadistica["CALM"] = json.dumps(pasar_datos(matriz_emociones[4]))
        contexto_estadistica["DISGUSTED"] = json.dumps(pasar_datos(matriz_emociones[5]))
        contexto_estadistica["CONFUSE"] = json.dumps(pasar_datos(matriz_emociones[6]))

    return render(request, 'workClass/estadisticas.html', contexto_estadistica)



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



