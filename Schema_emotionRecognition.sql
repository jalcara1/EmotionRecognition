-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: autoEvalWorkClass
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.17.10.1

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add estudiante',7,'add_estudiante'),(20,'Can change estudiante',7,'change_estudiante'),(21,'Can delete estudiante',7,'delete_estudiante'),(22,'Can add tema',8,'add_tema'),(23,'Can change tema',8,'change_tema'),(24,'Can delete tema',8,'delete_tema'),(25,'Can add calificacion',9,'add_calificacion'),(26,'Can change calificacion',9,'change_calificacion'),(27,'Can delete calificacion',9,'delete_calificacion'),(28,'Can add docente',10,'add_docente'),(29,'Can change docente',10,'change_docente'),(30,'Can delete docente',10,'delete_docente'),(31,'Can add video',11,'add_video'),(32,'Can change video',11,'change_video'),(33,'Can delete video',11,'delete_video'),(34,'Can add audio',12,'add_audio'),(35,'Can change audio',12,'change_audio'),(36,'Can delete audio',12,'delete_audio'),(37,'Can add intensidad',13,'add_intensidad'),(38,'Can change intensidad',13,'change_intensidad'),(39,'Can delete intensidad',13,'delete_intensidad'),(40,'Can add emocion',14,'add_emocion'),(41,'Can change emocion',14,'change_emocion'),(42,'Can delete emocion',14,'delete_emocion'),(43,'Can add curso',15,'add_curso'),(44,'Can change curso',15,'change_curso'),(45,'Can delete curso',15,'delete_curso');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$uLxBYuRWHW75$WqdPW2AL/sdvuVzmYIfys1wLmwZhtnt/bICwtvDjsOQ=','2018-05-11 10:59:21.334641',1,'fx1','','','fx1@gmail.com',1,1,'2018-04-14 20:53:29.643742');
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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-04-14 21:01:37.301772','1','Docente object (1)',1,'[{\"added\": {}}]',10,1),(2,'2018-04-14 21:02:16.294957','1','Intensidad object (1)',1,'[{\"added\": {}}]',13,1),(3,'2018-04-14 21:03:50.412930','1','Curso object (1)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (1)\"}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (2)\"}}]',15,1),(4,'2018-04-14 21:03:57.729205','1','Audio object (1)',1,'[{\"added\": {}}]',12,1),(5,'2018-04-14 21:04:31.982811','2','Audio object (2)',1,'[{\"added\": {}}]',12,1),(6,'2018-04-14 21:05:13.060527','2','Docente object (2)',1,'[{\"added\": {}}]',10,1),(7,'2018-04-14 21:05:24.636084','2','Intensidad object (2)',1,'[{\"added\": {}}]',13,1),(8,'2018-04-14 21:05:53.376663','2','Curso object (2)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (3)\"}}]',15,1),(9,'2018-04-14 21:06:27.236972','2','Curso object (2)',2,'[{\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (4)\"}}]',15,1),(10,'2018-04-14 21:06:37.465117','3','Audio object (3)',1,'[{\"added\": {}}]',12,1),(11,'2018-04-14 21:07:03.907664','4','Audio object (4)',1,'[{\"added\": {}}]',12,1),(12,'2018-04-14 21:07:58.598194','1','Video object (1)',1,'[{\"added\": {}}]',11,1),(13,'2018-04-14 21:08:10.351563','2','Video object (2)',1,'[{\"added\": {}}]',11,1),(14,'2018-04-14 21:09:14.929145','3','Curso object (3)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (5)\"}}]',15,1),(15,'2018-04-14 21:09:19.902465','3','Video object (3)',1,'[{\"added\": {}}]',11,1),(16,'2018-04-14 21:09:34.140619','4','Video object (4)',1,'[{\"added\": {}}]',11,1),(17,'2018-04-14 21:09:46.615543','5','Video object (5)',1,'[{\"added\": {}}]',11,1),(18,'2018-04-14 21:09:57.732865','6','Video object (6)',1,'[{\"added\": {}}]',11,1),(19,'2018-04-14 21:16:38.360433','1','Docente object (1)',2,'[{\"changed\": {\"fields\": [\"apellido\"]}}]',10,1),(20,'2018-04-14 21:18:19.043871','1','Tema object (1)',1,'[{\"added\": {}}]',8,1),(21,'2018-04-14 21:18:34.084656','2','Tema object (2)',1,'[{\"added\": {}}]',8,1),(22,'2018-04-14 21:19:04.471715','3','Tema object (3)',1,'[{\"added\": {}}]',8,1),(23,'2018-04-14 21:19:31.906442','4','Tema object (4)',1,'[{\"added\": {}}]',8,1),(24,'2018-04-14 21:19:51.733111','5','Tema object (5)',1,'[{\"added\": {}}]',8,1),(25,'2018-04-14 21:20:08.409531','6','Tema object (6)',1,'[{\"added\": {}}]',8,1),(26,'2018-04-15 02:13:14.600996','3','Curso object (3)',2,'[{\"changed\": {\"fields\": [\"sede\"]}}]',15,1),(27,'2018-04-15 20:14:05.299896','3','Curso object (3)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',15,1),(28,'2018-04-15 20:14:12.460786','2','Curso object (2)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',15,1),(29,'2018-04-15 20:25:32.213918','6','Video object (6)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',11,1),(30,'2018-04-15 20:25:40.805670','6','Video object (6)',2,'[]',11,1),(31,'2018-04-15 20:25:45.326901','5','Video object (5)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',11,1),(32,'2018-04-15 20:25:50.522288','4','Video object (4)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',11,1),(33,'2018-04-15 20:25:55.496093','3','Video object (3)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',11,1),(34,'2018-04-15 20:26:00.144981','2','Video object (2)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',11,1),(35,'2018-04-15 20:26:11.201098','3','Audio object (3)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',12,1),(36,'2018-04-15 20:26:16.900101','3','Audio object (3)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',12,1),(37,'2018-04-15 20:26:21.095615','2','Audio object (2)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',12,1),(38,'2018-04-15 20:26:25.211289','1','Audio object (1)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',12,1),(39,'2018-04-15 23:17:14.414099','1','Video object (1)',3,'',11,1),(40,'2018-04-15 23:47:50.953887','7','Video object (7)',1,'[{\"added\": {}}]',11,1),(41,'2018-04-15 23:48:12.985514','7','Video object (7)',3,'',11,1),(42,'2018-04-16 01:03:29.174573','7','Video object (7)',3,'',11,1),(43,'2018-04-16 01:04:36.058197','8','Video object (8)',3,'',11,1),(44,'2018-04-16 01:07:02.297661','9','Video object (9)',3,'',11,1),(45,'2018-04-16 01:22:28.372513','1','Audio object (1)',3,'',12,1),(46,'2018-05-11 10:59:35.359908','5','Audio object (5)',3,'',12,1),(47,'2018-05-11 10:59:38.068663','4','Audio object (4)',3,'',12,1),(48,'2018-05-11 10:59:40.778305','3','Audio object (3)',3,'',12,1),(49,'2018-05-11 10:59:43.909594','2','Audio object (2)',3,'',12,1),(50,'2018-05-11 11:57:43.768898','14','Video object (14)',3,'',11,1),(51,'2018-05-11 11:57:46.414940','13','Video object (13)',3,'',11,1),(52,'2018-05-11 11:57:48.797273','11','Video object (11)',3,'',11,1),(53,'2018-05-11 11:57:51.060826','6','Video object (6)',3,'',11,1),(54,'2018-05-11 11:57:53.339891','4','Video object (4)',3,'',11,1),(55,'2018-05-11 11:57:55.748100','10','Video object (10)',3,'',11,1),(56,'2018-05-11 11:57:58.255700','5','Video object (5)',3,'',11,1),(57,'2018-05-11 11:58:00.707205','3','Video object (3)',3,'',11,1),(58,'2018-05-11 11:58:03.252140','2','Video object (2)',3,'',11,1),(59,'2018-05-11 11:58:05.414276','12','Video object (12)',3,'',11,1),(60,'2018-05-11 11:58:30.953907','6','Tema object (6)',3,'',8,1),(61,'2018-05-11 11:58:33.545067','5','Tema object (5)',3,'',8,1),(62,'2018-05-11 11:58:35.849785','3','Tema object (3)',3,'',8,1),(63,'2018-05-11 11:58:38.255620','2','Tema object (2)',3,'',8,1),(64,'2018-05-11 11:58:40.971441','1','Tema object (1)',3,'',8,1),(65,'2018-05-11 11:58:43.675579','4','Tema object (4)',3,'',8,1),(66,'2018-05-11 11:58:55.637078','1','Intensidad object (1)',3,'',13,1),(67,'2018-05-11 11:58:58.404671','2','Intensidad object (2)',3,'',13,1),(68,'2018-05-11 11:59:09.430646','2','Docente object (2)',3,'',10,1),(69,'2018-05-11 11:59:12.083008','1','Docente object (1)',3,'',10,1),(70,'2018-05-19 22:10:35.885703','1','Docente object (1)',1,'[{\"added\": {}}]',10,1),(71,'2018-05-19 22:10:53.927891','1','Intensidad object (1)',1,'[{\"added\": {}}]',13,1),(72,'2018-05-19 22:13:32.420003','1','Curso object (1)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (1)\"}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (2)\"}}]',15,1),(73,'2018-05-19 22:14:34.110574','1','Calificacion object (1)',1,'[{\"added\": {}}]',9,1),(74,'2018-05-19 22:27:18.633269','2','Calificacion object (2)',1,'[{\"added\": {}}]',9,1),(75,'2018-05-19 22:28:22.178955','1','Tema object (1)',1,'[{\"added\": {}}]',8,1),(76,'2018-05-19 22:28:51.648450','2','Tema object (2)',1,'[{\"added\": {}}]',8,1),(77,'2018-05-19 23:10:43.944915','1','Video object (1)',1,'[{\"added\": {}}]',11,1),(78,'2018-05-19 23:29:54.144825','2','Docente object (2)',1,'[{\"added\": {}}]',10,1),(79,'2018-05-19 23:30:14.229270','2','Intensidad object (2)',1,'[{\"added\": {}}]',13,1),(80,'2018-05-19 23:32:41.810641','2','Curso object (2)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (3)\"}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (4)\"}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (5)\"}}]',15,1),(81,'2018-05-19 23:33:10.723012','3','Calificacion object (3)',1,'[{\"added\": {}}]',9,1),(82,'2018-05-19 23:33:35.218571','4','Calificacion object (4)',1,'[{\"added\": {}}]',9,1),(83,'2018-05-19 23:34:09.111080','5','Calificacion object (5)',1,'[{\"added\": {}}]',9,1),(84,'2018-05-19 23:35:00.865269','3','Tema object (3)',1,'[{\"added\": {}}]',8,1),(85,'2018-05-19 23:35:17.435805','4','Tema object (4)',1,'[{\"added\": {}}]',8,1),(86,'2018-05-19 23:35:27.925526','4','Tema object (4)',2,'[{\"changed\": {\"fields\": [\"descripcion\"]}}]',8,1),(87,'2018-05-19 23:35:47.550360','5','Tema object (5)',1,'[{\"added\": {}}]',8,1),(88,'2018-05-20 13:26:04.729951','1','Video object (1)',2,'[{\"changed\": {\"fields\": [\"emocion\"]}}]',11,1),(89,'2018-05-20 13:26:11.594144','1','Video object (1)',2,'[{\"changed\": {\"fields\": [\"emocion\"]}}]',11,1),(90,'2018-05-20 16:23:33.502109','2','Video object (2)',1,'[{\"added\": {}}]',11,1),(91,'2018-05-20 16:55:08.494988','3','Docente object (3)',1,'[{\"added\": {}}]',10,1),(92,'2018-05-20 17:07:04.261703','3','Intensidad object (3)',1,'[{\"added\": {}}]',13,1),(93,'2018-05-20 17:15:33.884741','3','Curso object (3)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (6)\"}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (7)\"}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (8)\"}}]',15,1),(94,'2018-05-20 17:16:08.409088','6','Calificacion object (6)',1,'[{\"added\": {}}]',9,1),(95,'2018-05-20 17:16:18.937809','7','Calificacion object (7)',1,'[{\"added\": {}}]',9,1),(96,'2018-05-20 17:16:30.778456','8','Calificacion object (8)',1,'[{\"added\": {}}]',9,1),(97,'2018-05-20 17:17:23.093452','6','Tema object (6)',1,'[{\"added\": {}}]',8,1),(98,'2018-05-20 17:18:47.198793','3','Video object (3)',1,'[{\"added\": {}}]',11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(12,'workClass','audio'),(9,'workClass','calificacion'),(15,'workClass','curso'),(10,'workClass','docente'),(14,'workClass','emocion'),(7,'workClass','estudiante'),(13,'workClass','intensidad'),(8,'workClass','tema'),(11,'workClass','video');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-04-14 20:03:56.606311'),(2,'auth','0001_initial','2018-04-14 20:03:57.105750'),(3,'admin','0001_initial','2018-04-14 20:03:57.262036'),(4,'admin','0002_logentry_remove_auto_add','2018-04-14 20:03:57.285396'),(5,'contenttypes','0002_remove_content_type_name','2018-04-14 20:03:57.405228'),(6,'auth','0002_alter_permission_name_max_length','2018-04-14 20:03:57.444351'),(7,'auth','0003_alter_user_email_max_length','2018-04-14 20:03:57.471950'),(8,'auth','0004_alter_user_username_opts','2018-04-14 20:03:57.486517'),(9,'auth','0005_alter_user_last_login_null','2018-04-14 20:03:57.525498'),(10,'auth','0006_require_contenttypes_0002','2018-04-14 20:03:57.531385'),(11,'auth','0007_alter_validators_add_error_messages','2018-04-14 20:03:57.583569'),(12,'auth','0008_alter_user_username_max_length','2018-04-14 20:03:57.670255'),(13,'auth','0009_alter_user_last_name_max_length','2018-04-14 20:03:57.687853'),(14,'sessions','0001_initial','2018-04-14 20:03:57.721973'),(15,'workClass','0001_initial','2018-04-14 20:36:46.648337'),(16,'workClass','0002_auto_20180415_2024','2018-04-15 20:24:54.429329'),(17,'workClass','0003_auto_20180511_1114','2018-05-11 11:15:36.755375'),(18,'workClass','0004_remove_video_duracion','2018-05-11 12:00:58.167191'),(19,'workClass','0005_auto_20180519_2104','2018-05-19 21:09:43.212803'),(20,'workClass','0005_auto_20180519_2146','2018-05-19 21:53:36.510553'),(21,'workClass','0006_auto_20180519_2225','2018-05-19 22:26:13.107096'),(22,'workClass','0007_auto_20180519_2231','2018-05-19 22:33:31.582874'),(23,'workClass','0008_auto_20180519_2302','2018-05-19 23:04:20.203460'),(24,'workClass','0009_auto_20180519_2308','2018-05-19 23:10:08.295722'),(25,'workClass','0005_auto_20180520_2328','2018-05-21 00:06:07.866414');
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
INSERT INTO `django_session` VALUES ('4crzw84k35fvbyk7nxby1vegferpqlzc','ODZiZWQwNDM4ZGUwYWQ0MmRmNTkzZmY4NjZmMDlmZjNkNmFkYTljZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGRhNTNiZGYyN2IxNTdiNDY5YTdlYWRjOWVjMjQzYWQxMzEwMGMyIn0=','2018-04-30 00:02:53.305350'),('ofyspr7w6mog56xuuw9odpobx3l199u1','ODZiZWQwNDM4ZGUwYWQ0MmRmNTkzZmY4NjZmMDlmZjNkNmFkYTljZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGRhNTNiZGYyN2IxNTdiNDY5YTdlYWRjOWVjMjQzYWQxMzEwMGMyIn0=','2018-05-25 10:59:21.338053');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
  `curso_id` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workClass_calificaci_estudiante_id_1bd413d1_fk_workClass` (`estudiante_id`),
  KEY `workClass_calificacion_curso_id_1f38e7ea` (`curso_id`),
  CONSTRAINT `workClass_calificaci_estudiante_id_1bd413d1_fk_workClass` FOREIGN KEY (`estudiante_id`) REFERENCES `workClass_estudiante` (`id`),
  CONSTRAINT `workClass_calificacion_curso_id_1f38e7ea_fk_workClass_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `workClass_curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_calificacion`
--

LOCK TABLES `workClass_calificacion` WRITE;
/*!40000 ALTER TABLE `workClass_calificacion` DISABLE KEYS */;
INSERT INTO `workClass_calificacion` VALUES (1,3,1,1),(2,4,1,2),(3,2,2,3),(4,3,2,4),(5,1.5,2,5),(6,3,3,6),(7,2,3,7),(8,4,3,8);
/*!40000 ALTER TABLE `workClass_calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workClass_curso`
--

DROP TABLE IF EXISTS `workClass_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workClass_curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(20) NOT NULL,
  `sede` varchar(20) NOT NULL,
  `idioma` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `docente_id` int(11) NOT NULL,
  `intensidad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workClass_curso_docente_id_4e6cb7ed_fk_workClass_docente_id` (`docente_id`),
  KEY `workClass_curso_intensidad_id_90d556c9_fk_workClass` (`intensidad_id`),
  CONSTRAINT `workClass_curso_docente_id_4e6cb7ed_fk_workClass_docente_id` FOREIGN KEY (`docente_id`) REFERENCES `workClass_docente` (`id`),
  CONSTRAINT `workClass_curso_intensidad_id_90d556c9_fk_workClass` FOREIGN KEY (`intensidad_id`) REFERENCES `workClass_intensidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_curso`
--

LOCK TABLES `workClass_curso` WRITE;
/*!40000 ALTER TABLE `workClass_curso` DISABLE KEYS */;
INSERT INTO `workClass_curso` VALUES (1,'1','Poblado','Ingles','2018-01-01',1,1),(2,'2','Poblado','Ingles','2018-01-02',2,2),(3,'9','Poblado','Ingles','2018-01-04',3,3);
/*!40000 ALTER TABLE `workClass_curso` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_docente`
--

LOCK TABLES `workClass_docente` WRITE;
/*!40000 ALTER TABLE `workClass_docente` DISABLE KEYS */;
INSERT INTO `workClass_docente` VALUES (1,'Docente_n_1','Docente_a_1',34,'3002851578','docente_1@gmail.com','Activo'),(2,'Docente_n_2','Docente_a_2',40,'3143002851','docente_2@gmail.com','Activo'),(3,'Docente_n_3','Docente_a_3',39,'3002851578','docente_3@gmail.com','Activo');
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
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workClass_estudiante_curso_id_1c511edd_fk_workClass_curso_id` (`curso_id`),
  CONSTRAINT `workClass_estudiante_curso_id_1c511edd_fk_workClass_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `workClass_curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_estudiante`
--

LOCK TABLES `workClass_estudiante` WRITE;
/*!40000 ALTER TABLE `workClass_estudiante` DISABLE KEYS */;
INSERT INTO `workClass_estudiante` VALUES (1,'estudiante_n_1','estudiante_a_1',18,'3105757476','estudiante_1@gmail.com','Activo',1),(2,'estudiante_n_2','estudiante_a_2',19,'3105757476','estudiante_2@gmail.com','Desactivo',1),(3,'estudiante_n_3','estudiante_a_3',15,'3105757476','estudiante_3@gmail.com','Activo',2),(4,'estudiante_n_4','estudiante_a_4',17,'3122851589','estudiante_4@gmail.com','Activo',2),(5,'estudiante_n_5','estudiante_a_5',14,'3002852734','estudiante_5@gmail.com','Activo',2),(6,'estudiante_n_5','estudiante_a_5',22,'3105757476','estudiante_5@gmail.com','Activo',3),(7,'estudiante_n_6','estudiante_a_6',20,'3122851589','estudiante_6@gmail.com','Activo',3),(8,'estudiante_n_7','estudiante_a_7',21,'3002852734','estudiante_7@gmail.com','Activo',3);
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
  `horario` varchar(300) NOT NULL,
  `intensidad` varchar(60) NOT NULL,
  `horas_diarias` varchar(5) NOT NULL,
  `horas_semanales` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_intensidad`
--

LOCK TABLES `workClass_intensidad` WRITE;
/*!40000 ALTER TABLE `workClass_intensidad` DISABLE KEYS */;
INSERT INTO `workClass_intensidad` VALUES (1,'Lunes - Miercoles','Horario regular','2','4'),(2,'Martes - Jueves','Horario regular','2','4'),(3,'Viernes - Sabado','Horario regular','2','4');
/*!40000 ALTER TABLE `workClass_intensidad` ENABLE KEYS */;
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
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workClass_tema_curso_id_34426855_fk_workClass_curso_id` (`curso_id`),
  CONSTRAINT `workClass_tema_curso_id_34426855_fk_workClass_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `workClass_curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_tema`
--

LOCK TABLES `workClass_tema` WRITE;
/*!40000 ALTER TABLE `workClass_tema` DISABLE KEYS */;
INSERT INTO `workClass_tema` VALUES (1,'tema_1','descripción_tema_1','2018-01-01',1),(2,'tema_2','descripcion_tema_2','2018-01-02',1),(3,'tema_3','descripcion_tema_3','2018-01-01',2),(4,'tema_4','descripcion_tema_4','2018-01-02',2),(5,'tema_5','descripcion_tema_5','2018-01-01',2),(6,'tema_6','descripcion_tema_6','2018-01-03',3);
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
  `formato` varchar(6) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `emocion` varchar(100) NOT NULL,
  `modificado` tinyint(1) NOT NULL,
  `contenido` tinyint(1) NOT NULL,
  `video` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workClass_video_curso_id_9fe3c683_fk_workClass_curso_id` (`curso_id`),
  CONSTRAINT `workClass_video_curso_id_9fe3c683_fk_workClass_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `workClass_curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_video`
--

LOCK TABLES `workClass_video` WRITE;
/*!40000 ALTER TABLE `workClass_video` DISABLE KEYS */;
INSERT INTO `workClass_video` VALUES (1,'MP4',1,'2018-01-01','clasificador_1.json',1,0,''),(2,'MP4',2,'2018-01-03','clasificador_2.json',1,0,''),(3,'MP4',3,'2018-01-02','clasificador_3.json',1,0,'');
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

-- Dump completed on 2018-05-20 19:14:04
