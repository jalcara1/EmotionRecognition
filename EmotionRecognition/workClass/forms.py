from django.forms import ModelForm
from .models import Video

class videoForm(ModelForm):
    class Meta:
        model = Video
        fields = '__all__'
