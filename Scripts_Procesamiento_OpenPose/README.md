
Pasos del Ciclo de Procesamiento de la Base de Datos de Entrenamiento de Emociones del Proyecto "EmotionRecognition"
====================================================================================================================

## 1. Ejecutar Openpose Para Procesar Toda la Base de Datos
Comnado de Ejecución de un solo archivo (Imagen | Video)

  **ruta_del_openpose_bin -image_dir=ruta_del_archivo 
                        -write_keypoint=ruta_de_salida 
                        -write_keypoint_format=formato_del_archivo_ha_generar 
                        -face -no_display
  
Entonces debemos usar este comando para procesar toda la base de datos, para ello usamos el primer archivo
ExecuteOpenposeBNU-LSVED.sh, el cual nos permite generar todos los archivos de la base de datos con las mismas rutas de los directorios.

## 2. Procesar la Base de Datos de los archivos generados por OpenPose

Aquí vamos a construir dos archivos, primer es un archivo de los 70 pares de puntos de los rostros de cada archivo xml, el segundo es construir un archivo donde carge la etiqueta de la emoción correspondiente para ese archivo.

Para ello vamos a utilizar el archivo Create_BNU-LSVED_dataset_xy_and_label.py

El orden de las etiquetas es el siguiente

- concentrated: 1
- disgust:      2
- distracted:   3
- happy:        4
- puzzle:       5
- surprise:     6
- tired:        7
 
## 3 Construir un matriz para la herramienta donde se va a cargar el modelo
Nosotros vamos a construir una matriz para la herramienta de Caffe

Para ello vamos a generar una matriz en Numpy.
