##Pasos para ejecutar la Aplicacion "EmotionRecognition"

### 1
- **apt-get install mysql-server**	
- Instalan un servidor MySQL
- Nota: la aplicacion por defecto ingresa al servidor de MySQL con un usuario: root y una contrasena: 12345

### 2
- **source venv/bin/activate**
- Entran al ambiente virtual de la aplicacion

### 3 
- Ingresan a: **"EmotionRecognition/"**

### 4
- **pip install mysqlclient**
- Instalan un cliente MySQL

### 5 
- **python manage.py migrate**
- Migran el modelo de la base de datos
- **Nota:** recuerda antes de migrar haber creado una base de datos llamada "autoEvalWorkClass" en tu servidor MySQL

### 6- (opcional)
- python manage.py makemigrations [NameApp]
- Al ejecutar makemigrations, usted le indica a Django que ha realizado algunos cambios a sus modelos (en este caso, ha realizado cambios nuevos) y que le gustaría que los guarde como una migración

### 7
- python manage.py sqlmigrate [NameApp] [IDMigration:000#]
- Cargar el modelo
- Este ultimo paso ingresamos al directorio: **"EmotionRecognition/workClass/migrations/"** y miramos la ultima migracion generada por django.
- Por ejemplo: python **manage.py sqlmigrate workClass 0002**

### 8
- **python manage.py runserver**
- Inicio el servidor por defecto de Django

### 9
- Ingresamos a nuestro browser: **http://localhost:8000/workClass/**

### 10
- Para acceder al administrador de la base de datos:
- Ingresamos a nuestro browser: **http://localhost:8000/admin/**
- usuario: **fx1**
- contrasena: **autoevaluacion**

## 11
- **pip freeze**
- Nos muestra todas las dependencias de nuestro proyecto


