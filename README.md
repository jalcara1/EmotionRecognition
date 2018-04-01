Pasos para ejecutar la Aplicacion "EmotionRecognition"
=====================================================

## 1
- Puedes seguir el siguiente link para instalar la version correcta de python
- http://docs.python-guide.org/en/latest/starting/install3/linux/

## 2
- **apt-get install mysql-server**	
- Instalan un servidor MySQL
- Nota: la aplicacion por defecto ingresa al servidor de MySQL con un usuario: root y una contrasena: 12345

## 3
- **source venv/bin/activate**
- Entran al ambiente virtual de la aplicacion

## 4 
- Ingresan a: **"EmotionRecognition/"**

## 5
- **pip install mysqlclient**
- Instalan un cliente MySQL

## 6 
- **python manage.py migrate**
- Migran el modelo de la base de datos
- **Nota:** recuerda antes de migrar haber creado una base de datos llamada "autoEvalWorkClass" en tu servidor MySQL

## 7- (opcional)
- python manage.py makemigrations [NameApp]
- Al ejecutar makemigrations, usted le indica a Django que ha realizado algunos cambios a sus modelos (en este caso, ha realizado cambios nuevos) y que le gustaría que los guarde como una migración

## 8
- python manage.py sqlmigrate [NameApp] [IDMigration:000#]
- Cargar el modelo
- Este ultimo paso ingresamos al directorio: **"EmotionRecognition/workClass/migrations/"** y miramos la ultima migracion generada por django.
- Por ejemplo: python **manage.py sqlmigrate workClass 0002**

## 9
- **python manage.py runserver**
- Inicio el servidor por defecto de Django

## 10
- Ingresamos a nuestro browser: **http://localhost:8000/workClass/**

## 11
- Para acceder al administrador de la base de datos:
- Ingresamos a nuestro browser: **http://localhost:8000/admin/**
- usuario: **fx1**
- contrasena: **autoevaluacion**

## 12
- **pip freeze**
- Nos muestra todas las dependencias de nuestro proyecto


