#Pasos para ejecutar la Aplicacion "EmotionRecognition"

## + 1- 
apt-get install mysql-server__		// Instalan un servidor MySQL__
Nota: la aplicacion por defecto ingresa al servidor de MySQL con un usuario: root y una contrasena: 12345__

## + 2- 
source venv/bin/activate__		// Entran al ambiente virtual de la aplicacion__

## + 3- 
Ingresan a: "EmotionRecognition/"__

## + 4- 
pip install mysqlclient__	// Instalan un cliente MySQL__

## + 5- 
python manage.py migrate__		// Migran el modelo de la base de datos__
Nota: recuerda antes de migrar haber creado una base de datos llamada "autoEvalWorkClass" en tu servidor MySQL__

## + 6- (opcional)
python manage.py makemigrations [NameApp]__ //Al ejecutar makemigrations, usted le indica a Django que ha realizado algunos cambios a sus modelos (en este caso, ha realizado cambios nuevos) y que le gustaría que los guarde como una migración__

## + 7- 
python manage.py sqlmigrate [NameApp] [IDMigration:000#]__	//Cargar el modelo__
Este ultimo paso ingresamos al directorio: "autoEvaluacion/workClass/migrations/" y miramos la ultima migracion generada por django.__
Por ejemplo: python manage.py sqlmigrate workClass 0002__

## + 8-
python manage.py runserver__	// Inicio el servidor por defecto de Django__

## + 9-
Ingresamos a nuestro browser: http://localhost:8000/workClass/__

## + 10-
Para acceder al administrador de la base de datos:__
Ingresamos a nuestro browser: http://localhost:8000/admin/__
usuario: fx1__
contrasena: autoevaluacion


