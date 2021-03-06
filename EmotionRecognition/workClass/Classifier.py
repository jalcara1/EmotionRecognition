#!/usr/bin/python3

import boto3
import json
import subprocess
from PIL import Image
import os

def classifier(Prefix):
    s3 = boto3.resource('s3')
    prefix=Prefix
    bucket='emotion.recognition.db'
    client=boto3.client('rekognition','us-east-1')
    confianza_final=-1.0
    emotions=[]
    all_emotions=["HAPPY", "ANGRY", "SURPRISED", "SAD", "CALM", "DISGUSTED", "CONFUSED"]
    emoticons = {
        "HAPPY": 'Emoji/happy.png',
        "ANGRY": 'Emoji/angry.png',
        "SURPRISED": 'Emoji/surprised.png',
        "SAD": 'Emoji/sad.png',
        "CALM": 'Emoji/calm.png',
        "DISGUSTED": 'Emoji/disgusted.png',
        "CONFUSED": 'Emoji/confused.png',
            "UNKNOWN": 'Emoji/unknown.png'
    }
    os.makedirs(prefix, exist_ok=True)
    os.makedirs(prefix+"Emoji", exist_ok=True)
    videoFrames = "ffmpeg -y -i "+prefix+".mp4 -r 1 "+prefix+"/output_%05d.png"
    subprocess.call(['bash','-c', videoFrames])
    
    for dirpath, dirs, files in os.walk(prefix):
        for fileName in files:
            fileNameEmoji = fileName
            fileName = prefix+"/"+fileName
            print("----------->>>>: " + fileName)
            s3.meta.client.upload_file(fileName, bucket, fileName)
            response = client.detect_faces(Image={'S3Object':{'Bucket':bucket,'Name':fileName}},Attributes=['ALL'])
            source_img = s3.Object(bucket, fileName).get()
            im = Image.open(source_img.get('Body'))

            for face in response.get('FaceDetails'):
                w = face.get('BoundingBox').get('Width')
                h = face.get('BoundingBox').get('Height')
                l = face.get('BoundingBox').get('Left')
                t = face.get('BoundingBox').get('Top')
                x1 = im.size[0]*l
                y1 = im.size[1]*t
                x2 = x1+im.size[0]*w
                y2 = y1+im.size[1]*h
                fimemo = face.get('Emotions')[0].get('Type')
                imemo = Image.open(emoticons.get(fimemo))
                a = int(x2-x1)
                b = int(y2-y1)
                imemo = imemo.resize((a, b))
                im.paste(imemo, (int(x1), int(y1)), imemo)
            im.save(prefix+"Emoji/"+fileNameEmoji, "PNG")
            for faceDetail in response['FaceDetails']:
                for emotion in faceDetail['Emotions']:
                    confianza = float(str(emotion["Confidence"]))
                    emocion = str(emotion["Type"])
                    if confianza > confianza_final:
                        emocion_final = emocion
                        confianza_final = confianza
                emotions=emotions+[emocion_final]
                emotions=emotions+[emocion_final]
                confianza_final = -1.0
                
    data_emociones = {"HAPPY": float(str(emotions.count("HAPPY"))),
                     "ANGRY": float(str(emotions.count("ANGRY"))),
                     "SURPRISED": float(str(emotions.count("SURPRISED"))),
                     "SAD": float(str(emotions.count("SAD"))),
                     "CALM": float(str(emotions.count("CALM"))),
                     "DISGUSTED": float(str(emotions.count("DISGUSTED"))),
                     "CONFUSED": float(str(emotions.count("CONFUSED")))}
    
    emotions_json = json.dumps(data_emociones)
    print(emotions_json)
    with open('datos.json', 'w') as file:
        json.dump(emotions_json, file, ensure_ascii=False)
                
    #emptyBucket = "aws s3 rm s3://emotion.recognition.db --recursive"
    #subprocess.call(['bash','-c', emptyBucket])
    newVideo = "ffmpeg -r 1 -i RussianVideoEmoji/output_%05d.png -framerate 1 -strict -2 -pix_fmt yuv420p -c:v libx264 -c:a aac -y NewRussian.mp4"
    subprocess.call(['bash', '-c', newVideo])


