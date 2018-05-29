#!/usr/bin/python3

import numpy as np
import subprocess
import nltk
import json
import os
import io
import re

nltk.download('vader_lexicon')
nltk.download('stopwords')
nltk.download('punkt')
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords

from scipy.io import wavfile

# Imports the Google Cloud client library
from google.cloud import speech
from google.cloud.speech import enums
from google.cloud.speech import types

def audio():
    stop_words = set(stopwords.words('english'))
    wavAudio = "SugarBites"
    message_text = ""
    # videoFrames = "ffmpeg -y -i "+wavAudio+".mp4 -async 1 -vn -acodec pcm_s16le -ar 44100 -ac 1 " + wavAudio + ".wav"
    # subprocess.call(['bash','-c', videoFrames])

    # # Instantiates a client
    # client = speech.SpeechClient()
    # # The name of the audio file to transcribe
    # file_name = os.path.join(os.path.dirname(__file__), wavAudio+".wav")
    # # Loads the audio into memory
    # with io.open(file_name, 'rb') as audio_file:
    #     content = audio_file.read()
    #     audio = types.RecognitionAudio(content=content)
    #     config = types.RecognitionConfig(encoding=enums.RecognitionConfig.AudioEncoding.LINEAR16, sample_rate_hertz=44100, language_code='en-US')
    #     # Detects speech in the audio file
    #     response = client.recognize(config, audio)
    #     for result in response.results:
    #         message_text = message_text + format(result.alternatives[0].transcript)
            
    # removing stops words from the strings
    message_text = "JUST, how everything seems a little impersonal nowadays we've all become me usernames reference, numbers AND. IP addresses"
    final = ""
    message_text = re.sub("[^a-zA-Z]", " ", message_text.lower()) 
    message_text = ' '.join(message_text.split())
    message_text = re.sub(r'[^\w\s]', '', message_text) #Punctuations
    # string_tokens = word_tokenize(message_text)
    # for w in string_tokens:
    #     if w not in stop_words:
    #         final = final + " " + w

    #message_text = final
    #print("\n »»»: " + str(message_text))
    
    sid = SentimentIntensityAnalyzer()
    scores = sid.polarity_scores(message_text)

    print("\n --->>  " + str(scores))
    
    scores_json = json.dumps(scores)
    print(scores_json)
    with open('audio_datos.json', 'w') as file:
        json.dump(scores_json, file, ensure_ascii=False)
        
    for key in sorted(scores):
        print('{0}: {1}, '.format(key, scores[key]), end='')
        
    print("")

if __name__ == "__main__":
    audio()
