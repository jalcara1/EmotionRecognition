-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: autoEvalWorkClass
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.17.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add docente',7,'add_docente'),(20,'Can change docente',7,'change_docente'),(21,'Can delete docente',7,'delete_docente'),(22,'Can add audio',8,'add_audio'),(23,'Can change audio',8,'change_audio'),(24,'Can delete audio',8,'delete_audio'),(25,'Can add video',9,'add_video'),(26,'Can change video',9,'change_video'),(27,'Can delete video',9,'delete_video'),(28,'Can add intensidad',10,'add_intensidad'),(29,'Can change intensidad',10,'change_intensidad'),(30,'Can delete intensidad',10,'delete_intensidad'),(31,'Can add sesion',11,'add_sesion'),(32,'Can change sesion',11,'change_sesion'),(33,'Can delete sesion',11,'delete_sesion'),(34,'Can add tema',12,'add_tema'),(35,'Can change tema',12,'change_tema'),(36,'Can delete tema',12,'delete_tema'),(37,'Can add calificacion',13,'add_calificacion'),(38,'Can change calificacion',13,'change_calificacion'),(39,'Can delete calificacion',13,'delete_calificacion'),(40,'Can add estudiante',14,'add_estudiante'),(41,'Can change estudiante',14,'change_estudiante'),(42,'Can delete estudiante',14,'delete_estudiante');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$ZjzsEIPuyBMR$zS1mzJtHXNZq/y/oTU+oSXa70/9RGLUtuY/cS4BEHNA=','2018-04-09 01:43:00.601468',1,'fx1','','','fx1@gmail.com',1,1,'2018-03-29 22:41:36.699485');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-03-29 23:51:58.119254','1','Docente object (1)',1,'[{\"added\": {}}]',7,1),(2,'2018-03-29 23:52:31.687518','1','Intensidad object (1)',1,'[{\"added\": {}}]',10,1),(3,'2018-03-29 23:52:58.054528','1','Sesion object (1)',1,'[{\"added\": {}}, {\"added\": {\"object\": \"Estudiante object (1)\", \"name\": \"estudiante\"}}]',11,1),(4,'2018-03-29 23:53:09.932965','1','Video object (1)',1,'[{\"added\": {}}]',9,1),(5,'2018-03-29 23:53:59.470539','2','Video object (2)',1,'[{\"added\": {}}]',9,1),(6,'2018-03-29 23:54:26.629863','3','Video object (3)',1,'[{\"added\": {}}]',9,1),(7,'2018-03-29 23:54:51.152508','4','Video object (4)',1,'[{\"added\": {}}]',9,1),(8,'2018-03-29 23:55:09.629044','5','Video object (5)',1,'[{\"added\": {}}]',9,1),(9,'2018-03-29 23:55:39.678294','6','Video object (6)',1,'[{\"added\": {}}]',9,1),(10,'2018-03-30 00:09:19.812150','1','Audio object (1)',1,'[{\"added\": {}}]',8,1),(11,'2018-03-30 00:09:38.302914','2','Audio object (2)',1,'[{\"added\": {}}]',8,1),(12,'2018-03-30 00:09:56.795207','3','Audio object (3)',1,'[{\"added\": {}}]',8,1),(13,'2018-03-30 00:10:15.892151','4','Audio object (4)',1,'[{\"added\": {}}]',8,1),(14,'2018-03-30 00:10:44.656395','4','Audio object (4)',2,'[{\"changed\": {\"fields\": [\"ruta\"]}}]',8,1),(15,'2018-03-30 00:39:35.790287','5','Video object (5)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',9,1),(16,'2018-03-30 00:39:41.532987','4','Video object (4)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',9,1),(17,'2018-03-30 00:39:47.990255','3','Video object (3)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',9,1),(18,'2018-03-30 00:39:55.964720','2','Video object (2)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',9,1),(19,'2018-03-30 00:40:01.882024','1','Video object (1)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',9,1),(20,'2018-03-30 01:05:03.738335','4','Audio object (4)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',8,1),(21,'2018-03-30 01:05:10.543496','2','Audio object (2)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',8,1),(22,'2018-03-30 01:05:15.595689','1','Audio object (1)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',8,1),(23,'2018-04-09 01:46:13.888174','2','Intensidad object (2)',1,'[{\"added\": {}}]',10,1),(24,'2018-04-09 01:46:17.649263','2','Sesion object (2)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (2)\"}}]',11,1),(25,'2018-04-09 01:46:56.237526','2','Docente object (2)',1,'[{\"added\": {}}]',7,1),(26,'2018-04-09 01:47:24.134741','3','Docente object (3)',1,'[{\"added\": {}}]',7,1),(27,'2018-04-09 01:48:12.783897','4','Docente object (4)',1,'[{\"added\": {}}]',7,1),(28,'2018-04-09 01:48:53.429304','3','Intensidad object (3)',1,'[{\"added\": {}}]',10,1),(29,'2018-04-09 01:49:59.361317','3','Sesion object (3)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (3)\"}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (4)\"}}]',11,1),(30,'2018-04-09 01:50:24.810724','4','Intensidad object (4)',1,'[{\"added\": {}}]',10,1),(31,'2018-04-09 01:50:51.632795','4','Sesion object (4)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (5)\"}}]',11,1),(32,'2018-04-09 01:51:27.690065','1','Tema object (1)',1,'[{\"added\": {}}]',12,1),(33,'2018-04-09 01:51:48.165483','2','Tema object (2)',1,'[{\"added\": {}}]',12,1),(34,'2018-04-09 02:44:15.459165','6','Video object (6)',2,'[{\"changed\": {\"fields\": [\"sesion\"]}}]',9,1),(35,'2018-04-09 02:44:19.777703','5','Video object (5)',2,'[{\"changed\": {\"fields\": [\"sesion\"]}}]',9,1),(36,'2018-04-09 02:44:24.902383','3','Video object (3)',2,'[{\"changed\": {\"fields\": [\"sesion\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'workClass','audio'),(13,'workClass','calificacion'),(7,'workClass','docente'),(14,'workClass','estudiante'),(10,'workClass','intensidad'),(11,'workClass','sesion'),(12,'workClass','tema'),(9,'workClass','video');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-03-29 22:40:10.688820'),(2,'auth','0001_initial','2018-03-29 22:40:11.230011'),(3,'admin','0001_initial','2018-03-29 22:40:11.373433'),(4,'admin','0002_logentry_remove_auto_add','2018-03-29 22:40:11.413259'),(5,'contenttypes','0002_remove_content_type_name','2018-03-29 22:40:11.499284'),(6,'auth','0002_alter_permission_name_max_length','2018-03-29 22:40:11.507727'),(7,'auth','0003_alter_user_email_max_length','2018-03-29 22:40:11.518495'),(8,'auth','0004_alter_user_username_opts','2018-03-29 22:40:11.528282'),(9,'auth','0005_alter_user_last_login_null','2018-03-29 22:40:11.572966'),(10,'auth','0006_require_contenttypes_0002','2018-03-29 22:40:11.580003'),(11,'auth','0007_alter_validators_add_error_messages','2018-03-29 22:40:11.595572'),(12,'auth','0008_alter_user_username_max_length','2018-03-29 22:40:11.651408'),(13,'auth','0009_alter_user_last_name_max_length','2018-03-29 22:40:11.662117'),(14,'sessions','0001_initial','2018-03-29 22:40:11.705365'),(15,'workClass','0001_initial','2018-03-29 22:41:43.073070'),(16,'workClass','0002_auto_20180329_2243','2018-03-29 22:44:08.101327'),(17,'workClass','0003_auto_20180409_0154','2018-04-09 01:54:52.699343');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2ghrqojwmz4owfw61r0y1c1x2w2yo8rk','NzE5M2Q2ZjBlMGRhMzg2NGYzOGI3ZDQwZDdjMTI4MmQ5YTQ4NzM1NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYjIwNDdhY2YxOWZhYmYwMzE5MDJmMWJkYWI0MjllYTVkOWM5ZGIzIn0=','2018-04-23 01:43:00.604746'),('zxghk2h942ga5mgnzmjj8gcmt8fmuprn','NTZjYjE1NmI5NGEyZjRlMjhiZWFjOWFkYTRkZmIxZmJhZmRmMmJhZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIyYjIwNDdhY2YxOWZhYmYwMzE5MDJmMWJkYWI0MjllYTVkOWM5ZGIzIn0=','2018-04-12 22:42:10.111074');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workClass_audio`
--

DROP TABLE IF EXISTS `workClass_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workClass_audio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `duracion` double NOT NULL,
  `formato` varchar(6) NOT NULL,
  `emocion` varchar(20) NOT NULL,
  `ruta` varchar(100) NOT NULL,
  `sesion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workClass_audio_sesion_id_330db9b5_fk_workClass_sesion_id` (`sesion_id`),
  CONSTRAINT `workClass_audio_sesion_id_330db9b5_fk_workClass_sesion_id` FOREIGN KEY (`sesion_id`) REFERENCES `workClass_sesion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_audio`
--

LOCK TABLES `workClass_audio` WRITE;
/*!40000 ALTER TABLE `workClass_audio` DISABLE KEYS */;
INSERT INTO `workClass_audio` VALUES (1,'2018-06-30',5,'mp3','feliz','audio1.mp3',1),(2,'2018-05-30',10,'mp3','bravo','audio2.mp3',1),(3,'2018-03-30',15,'mp3','triste','audio3.mp3',1),(4,'2018-04-30',7,'mp3','serio','audio4.mp3',1);
/*!40000 ALTER TABLE `workClass_audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workClass_calificacion`
--

DROP TABLE IF EXISTS `workClass_calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workClass_calificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calificacion` double NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `sesion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estudiante_id` (`estudiante_id`),
  UNIQUE KEY `sesion_id` (`sesion_id`),
  CONSTRAINT `workClass_calificaci_estudiante_id_1bd413d1_fk_workClass` FOREIGN KEY (`estudiante_id`) REFERENCES `workClass_estudiante` (`id`),
  CONSTRAINT `workClass_calificacion_sesion_id_d1c31e0e_fk_workClass_sesion_id` FOREIGN KEY (`sesion_id`) REFERENCES `workClass_sesion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_calificacion`
--

LOCK TABLES `workClass_calificacion` WRITE;
/*!40000 ALTER TABLE `workClass_calificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `workClass_calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workClass_docente`
--

DROP TABLE IF EXISTS `workClass_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workClass_docente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `edad` int(11) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_docente`
--

LOCK TABLES `workClass_docente` WRITE;
/*!40000 ALTER TABLE `workClass_docente` DISABLE KEYS */;
INSERT INTO `workClass_docente` VALUES (1,'Pedro','Rojas',30,'123456789','pedro@gmail.com','Activo'),(2,'Luis','Botero',35,'3143002851','luis@gmail.com','Activo'),(3,'Jairo','Vaca',40,'3002851578','jairo@gmail.com','Activo'),(4,'Hernando','Guerrero',44,'3143002851','hernando@gmail.com','Activo');
/*!40000 ALTER TABLE `workClass_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workClass_estudiante`
--

DROP TABLE IF EXISTS `workClass_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workClass_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `edad` int(11) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `sesion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workClass_estudiante_sesion_id_ebb1a7c9_fk_workClass_sesion_id` (`sesion_id`),
  CONSTRAINT `workClass_estudiante_sesion_id_ebb1a7c9_fk_workClass_sesion_id` FOREIGN KEY (`sesion_id`) REFERENCES `workClass_sesion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_estudiante`
--

LOCK TABLES `workClass_estudiante` WRITE;
/*!40000 ALTER TABLE `workClass_estudiante` DISABLE KEYS */;
INSERT INTO `workClass_estudiante` VALUES (1,'Carlos','Blanco',23,'987654321','carlos@gmail.com','Activo',1),(2,'Camilo','Garcia',22,'3105757476','camilo@gmail.com','Activo',2),(3,'Fabian','Gomez',20,'3105757476','fabian@gmail.com','Activo',3),(4,'Sofia','Ibanez',19,'3122851589','sofia@gmail.com','Activo',3),(5,'David','Otero',21,'3105757476','david@gmail.com','Activo',4);
/*!40000 ALTER TABLE `workClass_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workClass_intensidad`
--

DROP TABLE IF EXISTS `workClass_intensidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workClass_intensidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horas_diarias` int(11) NOT NULL,
  `horas_semanales` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_intensidad`
--

LOCK TABLES `workClass_intensidad` WRITE;
/*!40000 ALTER TABLE `workClass_intensidad` DISABLE KEYS */;
INSERT INTO `workClass_intensidad` VALUES (1,3,6),(2,2,6),(3,2,8),(4,3,1);
/*!40000 ALTER TABLE `workClass_intensidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workClass_sesion`
--

DROP TABLE IF EXISTS `workClass_sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workClass_sesion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso` varchar(20) NOT NULL,
  `sede` varchar(20) NOT NULL,
  `horario` varchar(200) NOT NULL,
  `idioma` varchar(20) NOT NULL,
  `docente_id` int(11) NOT NULL,
  `intensidad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workClass_sesion_docente_id_9570623c_fk_workClass_docente_id` (`docente_id`),
  KEY `workClass_sesion_intensidad_id_fd5a00ca` (`intensidad_id`),
  CONSTRAINT `workClass_sesion_docente_id_9570623c_fk_workClass_docente_id` FOREIGN KEY (`docente_id`) REFERENCES `workClass_docente` (`id`),
  CONSTRAINT `workClass_sesion_intensidad_id_fd5a00ca_fk_workClass` FOREIGN KEY (`intensidad_id`) REFERENCES `workClass_intensidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_sesion`
--

LOCK TABLES `workClass_sesion` WRITE;
/*!40000 ALTER TABLE `workClass_sesion` DISABLE KEYS */;
INSERT INTO `workClass_sesion` VALUES (1,'1','Poblado','Martes-Miercoles','Ingles',1,1),(2,'6','Poblado','Lunes - Miercoles','Ingles',1,2),(3,'10','Poblado','Miercoles - Viernes','Ingles',3,3),(4,'13','Poblado','Sabados','Ingles',4,4);
/*!40000 ALTER TABLE `workClass_sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workClass_tema`
--

DROP TABLE IF EXISTS `workClass_tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workClass_tema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `fecha` date NOT NULL,
  `sesion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workClass_tema_sesion_id_270d9a65_fk_workClass_sesion_id` (`sesion_id`),
  CONSTRAINT `workClass_tema_sesion_id_270d9a65_fk_workClass_sesion_id` FOREIGN KEY (`sesion_id`) REFERENCES `workClass_sesion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_tema`
--

LOCK TABLES `workClass_tema` WRITE;
/*!40000 ALTER TABLE `workClass_tema` DISABLE KEYS */;
INSERT INTO `workClass_tema` VALUES (1,'Tema 1','Descripción tema 1','2018-04-09',1),(2,'Tema 2','Descripción tema 2','2018-04-09',3);
/*!40000 ALTER TABLE `workClass_tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workClass_video`
--

DROP TABLE IF EXISTS `workClass_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workClass_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `duracion` double NOT NULL,
  `formato` varchar(6) NOT NULL,
  `emocion` varchar(20) NOT NULL,
  `ruta` varchar(100) NOT NULL,
  `sesion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workClass_video_sesion_id_5335fdef_fk_workClass_sesion_id` (`sesion_id`),
  CONSTRAINT `workClass_video_sesion_id_5335fdef_fk_workClass_sesion_id` FOREIGN KEY (`sesion_id`) REFERENCES `workClass_sesion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_video`
--

LOCK TABLES `workClass_video` WRITE;
/*!40000 ALTER TABLE `workClass_video` DISABLE KEYS */;
INSERT INTO `workClass_video` VALUES (1,'2018-07-29',10,'mp4','feliz','video1.mp4',1),(2,'2018-06-29',20,'mp4','aburrido','video2.mp4',1),(3,'2018-05-29',30,'mp4','bravo','video3.mp4',4),(4,'2018-04-29',40,'mp4','deprimido','video4.mp4',1),(5,'2018-02-20',50,'mp4','ocioso','video5.mp4',3),(6,'2018-03-29',10,'mp4','serio','video6.mp4',2);
/*!40000 ALTER TABLE `workClass_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-08 21:45:26
