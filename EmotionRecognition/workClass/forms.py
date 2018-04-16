from django.forms import ModelForm
from .models import Video, Audio

class videoForm(ModelForm):
    class Meta:
        model = Video
        fields = '__all__'

class audioForm(ModelForm):
    class Meta:
        model = Audio
        fields = '__all__'