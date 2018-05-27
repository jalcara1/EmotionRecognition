#!/usr/bin/python3

import numpy as np
import subprocess
import nltk
import os
import io

nltk.download('vader_lexicon')
nltk.download('punkt')
from nltk.sentiment.vader import SentimentIntensityAnalyzer

from scipy.io import wavfile

# Imports the Google Cloud client library
from google.cloud import speech
from google.cloud.speech import enums
from google.cloud.speech import types

def audio():
    wavAudio = "VideoExample"
    message_text = ""
    videoFrames = "ffmpeg -y -i "+wavAudio+".mp4 -async 1 -vn -acodec pcm_s16le -ar 44100 -ac 1 " + wavAudio + ".wav"
    subprocess.call(['bash','-c', videoFrames])

    # Instantiates a client
    client = speech.SpeechClient()
    # The name of the audio file to transcribe
    file_name = os.path.join(os.path.dirname(__file__), wavAudio+".wav")
    # Loads the audio into memory
    with io.open(file_name, 'rb') as audio_file:
        content = audio_file.read()
        audio = types.RecognitionAudio(content=content)
        config = types.RecognitionConfig(encoding=enums.RecognitionConfig.AudioEncoding.LINEAR16, sample_rate_hertz=44100, language_code='en-US')
        # Detects speech in the audio file
        response = client.recognize(config, audio)
        for result in response.results:
            message_text = message_text + format(result.alternatives[0].transcript)

    sid = SentimentIntensityAnalyzer()
    print("\n »»»: " + message_text)

    scores = sid.polarity_scores(message_text)
    for key in sorted(scores):
        print('{0}: {1}, '.format(key, scores[key]), end='')
        
    print("")

if __name__ == "__main__":
    audio()
