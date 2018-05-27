# Emotion Recognition

Emotion Recognition is a web application designed for Idiomas EAFIT in order to support the Psychologist in charge of the evaluation of a teacher during the evaluation process to the teaching, improving the generated reports and the final concept in the quality of teaching

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You need to install some libraries and software to the correct working of the application

* Software requirements for the Operative System (Ubuntu OS example)

```
 $ sudo apt-get install mysql-server
 $ sudo apt-get install virtualenv
 $ sudo apt-get install python3.6-dev libmysqlclient-dev
 $ sudo apt-get install python3-pip
 $ sudo apt-get install git
```
* Libraries neccesary for Python 3.6

```
 $ pip install django
 $ pip install mysqlclient
 $ pip install aws awscli
 $ pip install boto3
 $ pip install Pillow
```

* Also it is necessary to configure the own Amazon AWS credential and create the **autoEvalWorkClass** DataBase on your local machine.

```
 $ aws configure # Configure own Amazon AWS credential
```

### Installing

After install and configure the	dependencies, to run the application it is necessary the next steps

```
$ git clone https://github.com/jalcara1/EmotionRecognition.git
$ python3 manage.py migrate
$ python3 manage.py makemigrations
$ python3 manage.py runserver
```
* Also you can use the previous SQL Schema saved in the source code

```
$ mysql -u root -p autoEvalWorkClass < Schema_emotionRecognition.sql
```

```
The web application might be running in http://localhost:8000/workClass/
```
## Running the tests

The automated tests and continuous integration are running thanks to Jenkins software, which runs automate tests and modify the source code changes in the web server

## Deployment

The web application is running on a Google Compute Engine VM, which is tooling and workflow support enable scaling from single instances to global, load-balanced cloud computing. Also boot quickly, come with persistent disk storage, and deliver consistent performance.

* [Web Page Example](https://35.229.87.87/workClass/)

## Built With

* [Django](https://docs.djangoproject.com/en/2.0/) - The open source web framework used.
* [Amazon Rekognition](https://aws.amazon.com/rekognition/getting-started/) - Use to image and video analytics.
* [Chart.js](http://www.chartjs.org/docs/latest/) - Simple yet flexible JavaScript charting for designers & developers.
* [MySQL](https://dev.mysql.com/doc/) - Open-source relational database management system.
* [Google Compute Engine](https://cloud.google.com/docs/) - Delivers virtual machines running in Google's innovative data centers and worldwide fiber network.
* [Jenkins](https://jenkins.io/doc/) - The open source automation server helps to automate part of the software development process.

## Authors

* **Juan Pablo Alcaraz Flórez** - *Initial Work - Developer* - [Emotion Recognition](https://github.com/jalcara1)
* **Carlos Mario Blanco Pérez** - *Initial Work - Developer* - [Emotion Recognition](https://github.com/carlos18bp)

See also the list of [Contributors](https://github.com/jalcara1/EmotionRecognition/contributors) who participated in this project.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](https://github.com/jalcara1/EmotionRecognition/blob/master/LICENSE) file for details

## Acknowledgments

*