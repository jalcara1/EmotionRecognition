from django.shortcuts import render
from .models import Video, Audio

todos_audios = Audio.objects.all()
todos_videos = Video.objects.all()
reprod_video = todos_videos[0]
reprod_audio = todos_audios[0]


def index(request):
    return render(request, 'workClass/index.html')

def galeria(request):
    return render(request, 'workClass/galeria.html', {'todos_videos': todos_videos,
                                                      'reprod_video': reprod_video,
                                                      'todos_audios': todos_audios,
                                                      'reprod_audio': reprod_audio})
def galeria_video(request, video_id):
    reprod_video = Video.objects.get(pk=video_id)
    return render(request, 'workClass/galeria.html', {'todos_videos': todos_videos,
                                                      'reprod_video': reprod_video,
                                                      'todos_audios': todos_audios,
                                                      'reprod_audio': reprod_audio})
def galeria_audio(request, audio_id):
    reprod_audio = Audio.objects.get(pk=audio_id)
    return render(request, 'workClass/galeria.html', {'todos_videos': todos_videos,
                                                      'reprod_video': reprod_video,
                                                      'todos_audios': todos_audios,
                                                      'reprod_audio': reprod_audio})

def concepto(request):
    return render(request, 'workClass/concepto.html', {'todos_videos': todos_videos,
                                                       'todos_audios': todos_audios})

def estadisticas(request):
    return render(request, 'workClass/estadisticas.html', {'todos_videos': todos_videos,
                                                          'todos_audios': todos_audios})