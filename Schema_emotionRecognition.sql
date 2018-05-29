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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$uLxBYuRWHW75$WqdPW2AL/sdvuVzmYIfys1wLmwZhtnt/bICwtvDjsOQ=','2018-05-21 04:18:27.211839',1,'fx1','','','fx1@gmail.com',1,1,'2018-04-14 20:53:29.643742');
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
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-04-14 21:01:37.301772','1','Docente object (1)',1,'[{\"added\": {}}]',10,1),(2,'2018-04-14 21:02:16.294957','1','Intensidad object (1)',1,'[{\"added\": {}}]',13,1),(3,'2018-04-14 21:03:50.412930','1','Curso object (1)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (1)\"}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (2)\"}}]',15,1),(4,'2018-04-14 21:03:57.729205','1','Audio object (1)',1,'[{\"added\": {}}]',12,1),(5,'2018-04-14 21:04:31.982811','2','Audio object (2)',1,'[{\"added\": {}}]',12,1),(6,'2018-04-14 21:05:13.060527','2','Docente object (2)',1,'[{\"added\": {}}]',10,1),(7,'2018-04-14 21:05:24.636084','2','Intensidad object (2)',1,'[{\"added\": {}}]',13,1),(8,'2018-04-14 21:05:53.376663','2','Curso object (2)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (3)\"}}]',15,1),(9,'2018-04-14 21:06:27.236972','2','Curso object (2)',2,'[{\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (4)\"}}]',15,1),(10,'2018-04-14 21:06:37.465117','3','Audio object (3)',1,'[{\"added\": {}}]',12,1),(11,'2018-04-14 21:07:03.907664','4','Audio object (4)',1,'[{\"added\": {}}]',12,1),(12,'2018-04-14 21:07:58.598194','1','Video object (1)',1,'[{\"added\": {}}]',11,1),(13,'2018-04-14 21:08:10.351563','2','Video object (2)',1,'[{\"added\": {}}]',11,1),(14,'2018-04-14 21:09:14.929145','3','Curso object (3)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (5)\"}}]',15,1),(15,'2018-04-14 21:09:19.902465','3','Video object (3)',1,'[{\"added\": {}}]',11,1),(16,'2018-04-14 21:09:34.140619','4','Video object (4)',1,'[{\"added\": {}}]',11,1),(17,'2018-04-14 21:09:46.615543','5','Video object (5)',1,'[{\"added\": {}}]',11,1),(18,'2018-04-14 21:09:57.732865','6','Video object (6)',1,'[{\"added\": {}}]',11,1),(19,'2018-04-14 21:16:38.360433','1','Docente object (1)',2,'[{\"changed\": {\"fields\": [\"apellido\"]}}]',10,1),(20,'2018-04-14 21:18:19.043871','1','Tema object (1)',1,'[{\"added\": {}}]',8,1),(21,'2018-04-14 21:18:34.084656','2','Tema object (2)',1,'[{\"added\": {}}]',8,1),(22,'2018-04-14 21:19:04.471715','3','Tema object (3)',1,'[{\"added\": {}}]',8,1),(23,'2018-04-14 21:19:31.906442','4','Tema object (4)',1,'[{\"added\": {}}]',8,1),(24,'2018-04-14 21:19:51.733111','5','Tema object (5)',1,'[{\"added\": {}}]',8,1),(25,'2018-04-14 21:20:08.409531','6','Tema object (6)',1,'[{\"added\": {}}]',8,1),(26,'2018-04-15 02:13:14.600996','3','Curso object (3)',2,'[{\"changed\": {\"fields\": [\"sede\"]}}]',15,1),(27,'2018-04-15 20:14:05.299896','3','Curso object (3)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',15,1),(28,'2018-04-15 20:14:12.460786','2','Curso object (2)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',15,1),(29,'2018-04-15 20:25:32.213918','6','Video object (6)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',11,1),(30,'2018-04-15 20:25:40.805670','6','Video object (6)',2,'[]',11,1),(31,'2018-04-15 20:25:45.326901','5','Video object (5)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',11,1),(32,'2018-04-15 20:25:50.522288','4','Video object (4)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',11,1),(33,'2018-04-15 20:25:55.496093','3','Video object (3)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',11,1),(34,'2018-04-15 20:26:00.144981','2','Video object (2)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',11,1),(35,'2018-04-15 20:26:11.201098','3','Audio object (3)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',12,1),(36,'2018-04-15 20:26:16.900101','3','Audio object (3)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',12,1),(37,'2018-04-15 20:26:21.095615','2','Audio object (2)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',12,1),(38,'2018-04-15 20:26:25.211289','1','Audio object (1)',2,'[{\"changed\": {\"fields\": [\"fecha\"]}}]',12,1),(39,'2018-04-15 23:17:14.414099','1','Video object (1)',3,'',11,1),(40,'2018-04-15 23:47:50.953887','7','Video object (7)',1,'[{\"added\": {}}]',11,1),(41,'2018-04-15 23:48:12.985514','7','Video object (7)',3,'',11,1),(42,'2018-04-16 01:03:29.174573','7','Video object (7)',3,'',11,1),(43,'2018-04-16 01:04:36.058197','8','Video object (8)',3,'',11,1),(44,'2018-04-16 01:07:02.297661','9','Video object (9)',3,'',11,1),(45,'2018-04-16 01:22:28.372513','1','Audio object (1)',3,'',12,1),(46,'2018-05-11 10:59:35.359908','5','Audio object (5)',3,'',12,1),(47,'2018-05-11 10:59:38.068663','4','Audio object (4)',3,'',12,1),(48,'2018-05-11 10:59:40.778305','3','Audio object (3)',3,'',12,1),(49,'2018-05-11 10:59:43.909594','2','Audio object (2)',3,'',12,1),(50,'2018-05-11 11:57:43.768898','14','Video object (14)',3,'',11,1),(51,'2018-05-11 11:57:46.414940','13','Video object (13)',3,'',11,1),(52,'2018-05-11 11:57:48.797273','11','Video object (11)',3,'',11,1),(53,'2018-05-11 11:57:51.060826','6','Video object (6)',3,'',11,1),(54,'2018-05-11 11:57:53.339891','4','Video object (4)',3,'',11,1),(55,'2018-05-11 11:57:55.748100','10','Video object (10)',3,'',11,1),(56,'2018-05-11 11:57:58.255700','5','Video object (5)',3,'',11,1),(57,'2018-05-11 11:58:00.707205','3','Video object (3)',3,'',11,1),(58,'2018-05-11 11:58:03.252140','2','Video object (2)',3,'',11,1),(59,'2018-05-11 11:58:05.414276','12','Video object (12)',3,'',11,1),(60,'2018-05-11 11:58:30.953907','6','Tema object (6)',3,'',8,1),(61,'2018-05-11 11:58:33.545067','5','Tema object (5)',3,'',8,1),(62,'2018-05-11 11:58:35.849785','3','Tema object (3)',3,'',8,1),(63,'2018-05-11 11:58:38.255620','2','Tema object (2)',3,'',8,1),(64,'2018-05-11 11:58:40.971441','1','Tema object (1)',3,'',8,1),(65,'2018-05-11 11:58:43.675579','4','Tema object (4)',3,'',8,1),(66,'2018-05-11 11:58:55.637078','1','Intensidad object (1)',3,'',13,1),(67,'2018-05-11 11:58:58.404671','2','Intensidad object (2)',3,'',13,1),(68,'2018-05-11 11:59:09.430646','2','Docente object (2)',3,'',10,1),(69,'2018-05-11 11:59:12.083008','1','Docente object (1)',3,'',10,1),(70,'2018-05-19 22:10:35.885703','1','Docente object (1)',1,'[{\"added\": {}}]',10,1),(71,'2018-05-19 22:10:53.927891','1','Intensidad object (1)',1,'[{\"added\": {}}]',13,1),(72,'2018-05-19 22:13:32.420003','1','Curso object (1)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (1)\"}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (2)\"}}]',15,1),(73,'2018-05-19 22:14:34.110574','1','Calificacion object (1)',1,'[{\"added\": {}}]',9,1),(74,'2018-05-19 22:27:18.633269','2','Calificacion object (2)',1,'[{\"added\": {}}]',9,1),(75,'2018-05-19 22:28:22.178955','1','Tema object (1)',1,'[{\"added\": {}}]',8,1),(76,'2018-05-19 22:28:51.648450','2','Tema object (2)',1,'[{\"added\": {}}]',8,1),(77,'2018-05-19 23:10:43.944915','1','Video object (1)',1,'[{\"added\": {}}]',11,1),(78,'2018-05-19 23:29:54.144825','2','Docente object (2)',1,'[{\"added\": {}}]',10,1),(79,'2018-05-19 23:30:14.229270','2','Intensidad object (2)',1,'[{\"added\": {}}]',13,1),(80,'2018-05-19 23:32:41.810641','2','Curso object (2)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (3)\"}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (4)\"}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (5)\"}}]',15,1),(81,'2018-05-19 23:33:10.723012','3','Calificacion object (3)',1,'[{\"added\": {}}]',9,1),(82,'2018-05-19 23:33:35.218571','4','Calificacion object (4)',1,'[{\"added\": {}}]',9,1),(83,'2018-05-19 23:34:09.111080','5','Calificacion object (5)',1,'[{\"added\": {}}]',9,1),(84,'2018-05-19 23:35:00.865269','3','Tema object (3)',1,'[{\"added\": {}}]',8,1),(85,'2018-05-19 23:35:17.435805','4','Tema object (4)',1,'[{\"added\": {}}]',8,1),(86,'2018-05-19 23:35:27.925526','4','Tema object (4)',2,'[{\"changed\": {\"fields\": [\"descripcion\"]}}]',8,1),(87,'2018-05-19 23:35:47.550360','5','Tema object (5)',1,'[{\"added\": {}}]',8,1),(88,'2018-05-20 13:26:04.729951','1','Video object (1)',2,'[{\"changed\": {\"fields\": [\"emocion\"]}}]',11,1),(89,'2018-05-20 13:26:11.594144','1','Video object (1)',2,'[{\"changed\": {\"fields\": [\"emocion\"]}}]',11,1),(90,'2018-05-20 16:23:33.502109','2','Video object (2)',1,'[{\"added\": {}}]',11,1),(91,'2018-05-20 16:55:08.494988','3','Docente object (3)',1,'[{\"added\": {}}]',10,1),(92,'2018-05-20 17:07:04.261703','3','Intensidad object (3)',1,'[{\"added\": {}}]',13,1),(93,'2018-05-20 17:15:33.884741','3','Curso object (3)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (6)\"}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (7)\"}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (8)\"}}]',15,1),(94,'2018-05-20 17:16:08.409088','6','Calificacion object (6)',1,'[{\"added\": {}}]',9,1),(95,'2018-05-20 17:16:18.937809','7','Calificacion object (7)',1,'[{\"added\": {}}]',9,1),(96,'2018-05-20 17:16:30.778456','8','Calificacion object (8)',1,'[{\"added\": {}}]',9,1),(97,'2018-05-20 17:17:23.093452','6','Tema object (6)',1,'[{\"added\": {}}]',8,1),(98,'2018-05-20 17:18:47.198793','3','Video object (3)',1,'[{\"added\": {}}]',11,1),(99,'2018-05-21 02:40:03.278023','4','Video object (4)',3,'',11,1),(100,'2018-05-21 02:42:18.282881','5','Video object (5)',3,'',11,1),(101,'2018-05-21 02:47:10.909465','6','Video object (6)',3,'',11,1),(102,'2018-05-21 02:48:06.433841','8','Video object (8)',3,'',11,1),(103,'2018-05-21 02:48:09.700372','7','Video object (7)',3,'',11,1),(104,'2018-05-21 02:49:24.036744','10','Video object (10)',3,'',11,1),(105,'2018-05-21 02:49:27.759199','9','Video object (9)',3,'',11,1),(106,'2018-05-21 02:50:50.782385','13','Video object (13)',3,'',11,1),(107,'2018-05-21 02:50:54.018468','12','Video object (12)',3,'',11,1),(108,'2018-05-21 02:50:57.485600','11','Video object (11)',3,'',11,1),(109,'2018-05-21 02:51:48.554265','16','Video object (16)',3,'',11,1),(110,'2018-05-21 02:51:52.359472','15','Video object (15)',3,'',11,1),(111,'2018-05-21 02:51:55.800233','14','Video object (14)',3,'',11,1),(112,'2018-05-21 02:54:05.204480','18','Video object (18)',3,'',11,1),(113,'2018-05-21 02:54:08.481498','17','Video object (17)',3,'',11,1),(114,'2018-05-21 02:55:56.151669','20','Video object (20)',3,'',11,1),(115,'2018-05-21 02:56:00.935601','19','Video object (19)',3,'',11,1),(116,'2018-05-21 02:58:04.793802','22','Video object (22)',3,'',11,1),(117,'2018-05-21 02:58:07.904691','21','Video object (21)',3,'',11,1),(118,'2018-05-21 02:59:21.691007','23','Video object (23)',3,'',11,1),(119,'2018-05-21 03:00:37.729983','25','Video object (25)',3,'',11,1),(120,'2018-05-21 03:00:41.011609','24','Video object (24)',3,'',11,1),(121,'2018-05-21 03:02:59.386084','26','Video object (26)',3,'',11,1),(122,'2018-05-21 03:07:18.060055','29','Video object (29)',3,'',11,1),(123,'2018-05-21 03:07:21.208423','28','Video object (28)',3,'',11,1),(124,'2018-05-21 03:07:46.293726','27','Video object (27)',3,'',11,1),(125,'2018-05-21 03:08:36.331265','32','Video object (32)',3,'',11,1),(126,'2018-05-21 03:08:39.031286','31','Video object (31)',3,'',11,1),(127,'2018-05-21 03:08:42.092797','30','Video object (30)',3,'',11,1),(128,'2018-05-21 03:55:25.755449','33','Video object (33)',3,'',11,1),(129,'2018-05-21 03:59:05.875831','35','Video object (35)',3,'',11,1),(130,'2018-05-21 03:59:10.453768','34','Video object (34)',3,'',11,1),(131,'2018-05-21 04:12:25.959834','37','Video object (37)',3,'',11,1),(132,'2018-05-21 04:12:29.307919','36','Video object (36)',3,'',11,1),(133,'2018-05-21 04:14:24.995539','38','Video object (38)',3,'',11,1),(134,'2018-05-21 04:14:46.764593','39','Video object (39)',3,'',11,1),(135,'2018-05-21 04:15:12.789871','40','Video object (40)',3,'',11,1),(136,'2018-05-21 04:18:46.221886','39','Video object (39)',3,'',11,1),(137,'2018-05-21 04:18:49.333197','38','Video object (38)',3,'',11,1),(138,'2018-05-21 04:21:38.627627','41','Video object (41)',3,'',11,1),(139,'2018-05-21 04:23:01.858620','42','Video object (42)',3,'',11,1),(140,'2018-05-21 04:34:28.189276','43','Video object (43)',3,'',11,1),(141,'2018-05-21 04:35:48.684743','44','Video object (44)',3,'',11,1),(142,'2018-05-21 04:35:52.654926','45','Video object (45)',3,'',11,1),(143,'2018-05-21 04:38:44.092960','46','Video object (46)',3,'',11,1),(144,'2018-05-21 04:39:56.601986','48','Video object (48)',3,'',11,1),(145,'2018-05-21 04:39:59.434461','47','Video object (47)',3,'',11,1),(146,'2018-05-21 04:44:20.784456','49','Video object (49)',3,'',11,1),(147,'2018-05-21 04:47:53.029022','50','Video object (50)',3,'',11,1),(148,'2018-05-21 04:52:28.581951','51','Video object (51)',3,'',11,1),(149,'2018-05-21 05:33:36.948726','53','Video object (53)',3,'',11,1),(150,'2018-05-21 05:33:40.269214','52','Video object (52)',3,'',11,1),(151,'2018-05-21 05:34:59.980697','54','Video object (54)',3,'',11,1),(152,'2018-05-21 06:27:20.137823','56','Video object (56)',3,'',11,1),(153,'2018-05-21 06:27:23.474849','55','Video object (55)',3,'',11,1),(154,'2018-05-21 06:40:25.847642','57','Video object (57)',3,'',11,1),(155,'2018-05-22 12:24:32.997330','59','Video object (59)',3,'',11,1),(156,'2018-05-22 12:24:38.010351','58','Video object (58)',3,'',11,1),(157,'2018-05-22 12:28:16.055185','61','Video object (61)',3,'',11,1),(158,'2018-05-22 12:28:31.116808','60','Video object (60)',3,'',11,1),(159,'2018-05-22 12:37:33.103581','63','Video object (63)',3,'',11,1),(160,'2018-05-22 12:37:42.362424','62','Video object (62)',3,'',11,1),(161,'2018-05-26 15:15:03.038086','4','Docente object (4)',1,'[{\"added\": {}}]',10,1),(162,'2018-05-26 15:15:26.310773','5','Docente object (5)',1,'[{\"added\": {}}]',10,1),(163,'2018-05-26 15:16:00.380230','6','Docente object (6)',1,'[{\"added\": {}}]',10,1),(164,'2018-05-26 15:18:03.173195','7','Docente object (7)',1,'[{\"added\": {}}]',10,1),(165,'2018-05-26 15:18:29.278430','8','Docente object (8)',1,'[{\"added\": {}}]',10,1),(166,'2018-05-26 15:18:54.689025','9','Docente object (9)',1,'[{\"added\": {}}]',10,1),(167,'2018-05-26 15:19:22.859482','10','Docente object (10)',1,'[{\"added\": {}}]',10,1),(168,'2018-05-26 15:25:01.544893','4','Intensidad object (4)',1,'[{\"added\": {}}]',13,1),(169,'2018-05-26 15:26:59.846968','4','Curso object (4)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (9)\"}}]',15,1),(170,'2018-05-26 15:27:23.802185','5','Intensidad object (5)',1,'[{\"added\": {}}]',13,1),(171,'2018-05-26 15:28:12.893355','5','Curso object (5)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (10)\"}}]',15,1),(172,'2018-05-26 15:28:37.003515','6','Intensidad object (6)',1,'[{\"added\": {}}]',13,1),(173,'2018-05-26 15:29:38.721251','7','Intensidad object (7)',1,'[{\"added\": {}}]',13,1),(174,'2018-05-26 15:30:02.904173','6','Curso object (6)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (11)\"}}]',15,1),(175,'2018-05-26 15:30:49.996979','1','Intensidad object (1)',2,'[]',13,1),(176,'2018-05-26 15:30:55.794002','2','Intensidad object (2)',2,'[{\"changed\": {\"fields\": [\"intensidad\"]}}]',13,1),(177,'2018-05-26 15:31:00.984198','3','Intensidad object (3)',2,'[{\"changed\": {\"fields\": [\"intensidad\"]}}]',13,1),(178,'2018-05-26 15:31:04.480998','1','Intensidad object (1)',2,'[]',13,1),(179,'2018-05-26 15:32:55.412693','7','Curso object (7)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (12)\"}}]',15,1),(180,'2018-05-26 15:34:09.242259','8','Curso object (8)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (13)\"}}]',15,1),(181,'2018-05-26 15:35:50.718415','9','Curso object (9)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (14)\"}}]',15,1),(182,'2018-05-26 15:36:42.195855','10','Curso object (10)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (15)\"}}]',15,1),(183,'2018-05-26 15:38:01.840307','11','Curso object (11)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (16)\"}}]',15,1),(184,'2018-05-26 15:39:31.287309','12','Curso object (12)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (17)\"}}]',15,1),(185,'2018-05-26 15:43:37.578312','13','Curso object (13)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (18)\"}}]',15,1),(186,'2018-05-26 15:44:25.199550','14','Curso object (14)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (19)\"}}]',15,1),(187,'2018-05-26 15:45:08.161152','15','Curso object (15)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (20)\"}}]',15,1),(188,'2018-05-26 15:45:34.817671','10','Docente object (10)',3,'',10,1),(189,'2018-05-26 15:45:37.346743','9','Docente object (9)',3,'',10,1),(190,'2018-05-26 15:47:26.890008','16','Curso object (16)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (21)\"}}]',15,1),(191,'2018-05-26 15:48:19.170586','17','Curso object (17)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (22)\"}}]',15,1),(192,'2018-05-26 15:49:07.695356','18','Curso object (18)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"estudiante\", \"object\": \"Estudiante object (23)\"}}]',15,1),(193,'2018-05-26 16:00:18.773481','66','Video object (66)',1,'[{\"added\": {}}]',11,1),(194,'2018-05-26 16:00:30.514452','67','Video object (67)',1,'[{\"added\": {}}]',11,1),(195,'2018-05-26 16:00:45.632420','68','Video object (68)',1,'[{\"added\": {}}]',11,1),(196,'2018-05-26 16:01:05.485782','69','Video object (69)',1,'[{\"added\": {}}]',11,1),(197,'2018-05-26 16:01:30.661718','70','Video object (70)',1,'[{\"added\": {}}]',11,1),(198,'2018-05-26 16:01:48.210871','66','Video object (66)',2,'[{\"changed\": {\"fields\": [\"modificado\", \"contenido\"]}}]',11,1),(199,'2018-05-26 16:01:58.441094','67','Video object (67)',2,'[{\"changed\": {\"fields\": [\"modificado\", \"contenido\"]}}]',11,1),(200,'2018-05-26 16:02:03.967012','68','Video object (68)',2,'[{\"changed\": {\"fields\": [\"modificado\", \"contenido\"]}}]',11,1),(201,'2018-05-26 16:02:11.190701','68','Video object (68)',2,'[]',11,1),(202,'2018-05-26 16:02:15.982957','69','Video object (69)',2,'[{\"changed\": {\"fields\": [\"modificado\", \"contenido\"]}}]',11,1),(203,'2018-05-26 16:02:20.214193','69','Video object (69)',2,'[]',11,1),(204,'2018-05-26 16:02:24.505373','70','Video object (70)',2,'[{\"changed\": {\"fields\": [\"modificado\", \"contenido\"]}}]',11,1),(205,'2018-05-26 16:02:36.431482','71','Video object (71)',1,'[{\"added\": {}}]',11,1),(206,'2018-05-26 16:02:45.266306','72','Video object (72)',1,'[{\"added\": {}}]',11,1),(207,'2018-05-26 16:02:59.670615','73','Video object (73)',1,'[{\"added\": {}}]',11,1),(208,'2018-05-26 16:03:18.111212','74','Video object (74)',1,'[{\"added\": {}}]',11,1),(209,'2018-05-26 16:03:30.379673','75','Video object (75)',1,'[{\"added\": {}}]',11,1),(210,'2018-05-26 16:03:52.809413','76','Video object (76)',1,'[{\"added\": {}}]',11,1),(211,'2018-05-26 16:04:13.264356','77','Video object (77)',1,'[{\"added\": {}}]',11,1),(212,'2018-05-26 16:04:20.854625','76','Video object (76)',2,'[{\"changed\": {\"fields\": [\"curso\"]}}]',11,1),(213,'2018-05-26 16:04:26.173340','75','Video object (75)',2,'[{\"changed\": {\"fields\": [\"curso\"]}}]',11,1),(214,'2018-05-26 16:04:32.748564','74','Video object (74)',2,'[{\"changed\": {\"fields\": [\"curso\"]}}]',11,1),(215,'2018-05-26 16:04:41.214860','73','Video object (73)',2,'[{\"changed\": {\"fields\": [\"curso\"]}}]',11,1),(216,'2018-05-26 16:04:50.560553','72','Video object (72)',2,'[{\"changed\": {\"fields\": [\"curso\"]}}]',11,1),(217,'2018-05-26 16:05:00.144805','71','Video object (71)',2,'[{\"changed\": {\"fields\": [\"curso\"]}}]',11,1),(218,'2018-05-26 16:05:05.645437','70','Video object (70)',2,'[{\"changed\": {\"fields\": [\"curso\"]}}]',11,1),(219,'2018-05-26 16:05:10.772307','69','Video object (69)',2,'[{\"changed\": {\"fields\": [\"curso\"]}}]',11,1),(220,'2018-05-26 16:05:18.630947','68','Video object (68)',2,'[{\"changed\": {\"fields\": [\"curso\"]}}]',11,1),(221,'2018-05-26 16:05:24.535362','67','Video object (67)',2,'[{\"changed\": {\"fields\": [\"curso\"]}}]',11,1),(222,'2018-05-26 16:05:34.988378','66','Video object (66)',2,'[{\"changed\": {\"fields\": [\"curso\"]}}]',11,1),(223,'2018-05-26 19:10:39.444866','4','Docente object (4)',3,'',10,1),(224,'2018-05-29 14:40:40.703427','1','Video object (1)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(225,'2018-05-29 14:40:48.165316','2','Video object (2)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(226,'2018-05-29 14:40:54.496879','3','Video object (3)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(227,'2018-05-29 14:41:13.753315','66','Video object (66)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(228,'2018-05-29 14:41:22.281797','67','Video object (67)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(229,'2018-05-29 14:41:31.104957','68','Video object (68)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(230,'2018-05-29 14:41:39.663057','69','Video object (69)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(231,'2018-05-29 14:41:46.424106','70','Video object (70)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(232,'2018-05-29 14:41:59.300628','71','Video object (71)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(233,'2018-05-29 14:42:15.744592','72','Video object (72)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(234,'2018-05-29 14:42:23.015138','73','Video object (73)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(235,'2018-05-29 14:42:32.280573','74','Video object (74)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(236,'2018-05-29 14:42:48.225982','75','Video object (75)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(237,'2018-05-29 14:42:59.869321','76','Video object (76)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(238,'2018-05-29 14:43:05.085379','77','Video object (77)',2,'[{\"changed\": {\"fields\": [\"audio\"]}}]',11,1),(239,'2018-05-29 20:08:18.776878','78','Video object (78)',3,'',11,1),(240,'2018-05-29 20:08:22.907776','79','Video object (79)',3,'',11,1),(241,'2018-05-29 20:08:26.045068','80','Video object (80)',3,'',11,1),(242,'2018-05-29 20:08:29.098450','81','Video object (81)',3,'',11,1),(243,'2018-05-29 20:10:05.534366','83','Video object (83)',3,'',11,1),(244,'2018-05-29 20:10:08.524929','82','Video object (82)',3,'',11,1),(245,'2018-05-29 20:14:36.478186','86','Video object (86)',3,'',11,1),(246,'2018-05-29 20:14:40.296143','87','Video object (87)',3,'',11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-04-14 20:03:56.606311'),(2,'auth','0001_initial','2018-04-14 20:03:57.105750'),(3,'admin','0001_initial','2018-04-14 20:03:57.262036'),(4,'admin','0002_logentry_remove_auto_add','2018-04-14 20:03:57.285396'),(5,'contenttypes','0002_remove_content_type_name','2018-04-14 20:03:57.405228'),(6,'auth','0002_alter_permission_name_max_length','2018-04-14 20:03:57.444351'),(7,'auth','0003_alter_user_email_max_length','2018-04-14 20:03:57.471950'),(8,'auth','0004_alter_user_username_opts','2018-04-14 20:03:57.486517'),(9,'auth','0005_alter_user_last_login_null','2018-04-14 20:03:57.525498'),(10,'auth','0006_require_contenttypes_0002','2018-04-14 20:03:57.531385'),(11,'auth','0007_alter_validators_add_error_messages','2018-04-14 20:03:57.583569'),(12,'auth','0008_alter_user_username_max_length','2018-04-14 20:03:57.670255'),(13,'auth','0009_alter_user_last_name_max_length','2018-04-14 20:03:57.687853'),(14,'sessions','0001_initial','2018-04-14 20:03:57.721973'),(15,'workClass','0001_initial','2018-04-14 20:36:46.648337'),(16,'workClass','0002_auto_20180415_2024','2018-04-15 20:24:54.429329'),(17,'workClass','0003_auto_20180511_1114','2018-05-11 11:15:36.755375'),(18,'workClass','0004_remove_video_duracion','2018-05-11 12:00:58.167191'),(19,'workClass','0005_auto_20180519_2104','2018-05-19 21:09:43.212803'),(20,'workClass','0005_auto_20180519_2146','2018-05-19 21:53:36.510553'),(21,'workClass','0006_auto_20180519_2225','2018-05-19 22:26:13.107096'),(22,'workClass','0007_auto_20180519_2231','2018-05-19 22:33:31.582874'),(23,'workClass','0008_auto_20180519_2302','2018-05-19 23:04:20.203460'),(24,'workClass','0009_auto_20180519_2308','2018-05-19 23:10:08.295722'),(25,'workClass','0005_auto_20180520_2328','2018-05-21 00:06:07.866414'),(26,'workClass','0006_auto_20180521_0231','2018-05-21 02:32:36.217422'),(27,'workClass','0007_auto_20180521_0304','2018-05-21 03:05:54.143263'),(28,'workClass','0002_video_audio','2018-05-29 14:17:19.949113');
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
INSERT INTO `django_session` VALUES ('4crzw84k35fvbyk7nxby1vegferpqlzc','ODZiZWQwNDM4ZGUwYWQ0MmRmNTkzZmY4NjZmMDlmZjNkNmFkYTljZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGRhNTNiZGYyN2IxNTdiNDY5YTdlYWRjOWVjMjQzYWQxMzEwMGMyIn0=','2018-04-30 00:02:53.305350'),('fhxxfxsfze59is7sfnwj0i55xi1giqw1','ODZiZWQwNDM4ZGUwYWQ0MmRmNTkzZmY4NjZmMDlmZjNkNmFkYTljZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGRhNTNiZGYyN2IxNTdiNDY5YTdlYWRjOWVjMjQzYWQxMzEwMGMyIn0=','2018-06-04 04:18:27.214670'),('ofyspr7w6mog56xuuw9odpobx3l199u1','ODZiZWQwNDM4ZGUwYWQ0MmRmNTkzZmY4NjZmMDlmZjNkNmFkYTljZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGRhNTNiZGYyN2IxNTdiNDY5YTdlYWRjOWVjMjQzYWQxMzEwMGMyIn0=','2018-05-25 10:59:21.338053');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_curso`
--

LOCK TABLES `workClass_curso` WRITE;
/*!40000 ALTER TABLE `workClass_curso` DISABLE KEYS */;
INSERT INTO `workClass_curso` VALUES (1,'1','Poblado','Ingles','2018-01-01',1,1),(2,'2','Poblado','Ingles','2018-01-02',2,2),(3,'9','Poblado','Ingles','2018-01-04',3,3),(7,'4','Poblado','Ingles','2018-05-26',5,1),(8,'1','Poblado','Ingles','2018-05-26',5,2),(9,'15','Poblado','Ingles','2018-05-26',5,3),(10,'8','Poblado','Ingles','2018-05-26',6,1),(11,'11','Poblado','Ingles','2018-05-26',6,2),(12,'1','Poblado','Ingles','2018-05-26',6,3),(13,'8','Poblado','Ingles','2018-05-26',7,1),(14,'11','Poblado','Ingles','2018-05-26',7,2),(15,'15','Poblado','Ingles','2018-05-26',7,3),(16,'4','Poblado','Ingles','2018-05-26',8,1),(17,'8','Poblado','Ingles','2018-05-26',8,2),(18,'11','Poblado','Ingles','2018-05-26',8,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_docente`
--

LOCK TABLES `workClass_docente` WRITE;
/*!40000 ALTER TABLE `workClass_docente` DISABLE KEYS */;
INSERT INTO `workClass_docente` VALUES (1,'Docente_n_1','Docente_a_1',34,'3002851578','docente_1@gmail.com','Activo'),(2,'Docente_n_2','Docente_a_2',40,'3143002851','docente_2@gmail.com','Activo'),(3,'Docente_n_3','Docente_a_3',39,'3002851578','docente_3@gmail.com','Activo'),(5,'Docente_n_5','Docente_a_5',33,'3144384895','Docente_n_5@gmail.com','Activo'),(6,'Docente_n_6','Docente_a_6',35,'3144384895','Docente_n_4@gmail.com6','Activo'),(7,'Docente_n_7','Docente_a_7',34,'3144384895','Docente_n_7@gmail.com','Activo'),(8,'Docente_n_8','Docente_a_8',45,'3144384895','Docente_n_8@gmail.com','Activo');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_estudiante`
--

LOCK TABLES `workClass_estudiante` WRITE;
/*!40000 ALTER TABLE `workClass_estudiante` DISABLE KEYS */;
INSERT INTO `workClass_estudiante` VALUES (1,'estudiante_n_1','estudiante_a_1',18,'3105757476','estudiante_1@gmail.com','Activo',1),(2,'estudiante_n_2','estudiante_a_2',19,'3105757476','estudiante_2@gmail.com','Desactivo',1),(3,'estudiante_n_3','estudiante_a_3',15,'3105757476','estudiante_3@gmail.com','Activo',2),(4,'estudiante_n_4','estudiante_a_4',17,'3122851589','estudiante_4@gmail.com','Activo',2),(5,'estudiante_n_5','estudiante_a_5',14,'3002852734','estudiante_5@gmail.com','Activo',2),(6,'estudiante_n_5','estudiante_a_5',22,'3105757476','estudiante_5@gmail.com','Activo',3),(7,'estudiante_n_6','estudiante_a_6',20,'3122851589','estudiante_6@gmail.com','Activo',3),(8,'estudiante_n_7','estudiante_a_7',21,'3002852734','estudiante_7@gmail.com','Activo',3),(12,'estudiante_n_11','estudiante_a_11',9,'3144384895','estudiante_n_11@gmail.com','Activo',7),(13,'estudiante_n_12','estudiante_a_12',22,'3144384895','estudiante_n_12@gmail.com','Activo',8),(14,'estudiante_n_13','estudiante_a_13',16,'3144384895','estudiante_n_13@gmail.com','Activo',9),(15,'estudiante_n_14','estudiante_a_14',9,'3144384895','estudiante_n_14@gmail.com','Activo',10),(16,'estudiante_n_15','estudiante_a_15',22,'3144384895','estudiante_n_15@gmail.com','Activo',11),(17,'estudiante_n_16','estudiante_a_16',16,'3144384895','estudiante_n_16@gmail.com','Activo',12),(18,'estudiante_n_17','estudiante_a_17',22,'3144384895','estudiante_n_17@gmail.com','Activo',13),(19,'estudiante_n_18','estudiante_a_18',16,'3144384895','estudiante_n_18@gmail.com','Activo',14),(20,'estudiante_n_19','estudiante_a_19',9,'3144384895','estudiante_n_19@gmail.com','Activo',15),(21,'estudiante_n_20','estudiante_a_20',16,'3144384895','estudiante_n_20@gmail.com','Activo',16),(22,'estudiante_n_21','estudiante_a_21',9,'3144384895','estudiante_n_21@gmail.com','Activo',17),(23,'estudiante_n_22','estudiante_a_22',22,'3144384895','estudiante_n_22@gmail.com','Activo',18);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_intensidad`
--

LOCK TABLES `workClass_intensidad` WRITE;
/*!40000 ALTER TABLE `workClass_intensidad` DISABLE KEYS */;
INSERT INTO `workClass_intensidad` VALUES (1,'Lunes - Miercoles','Horario regular','2','4'),(2,'Martes - Jueves','Horario semi-intensivo','2','4'),(3,'Viernes - Sabado','Horario intensivo','2','4'),(4,'Lunes - Miercoles','Horario regular','2','4'),(5,'Lunes - Miercoles','Horario semi-intensivo','2','4'),(6,'Lunes - Miercoles','Horario intensivo','2','4'),(7,'Lunes - Miercoles','Horario intensivo','2','4');
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
  `audio` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workClass_video_curso_id_9fe3c683_fk_workClass_curso_id` (`curso_id`),
  CONSTRAINT `workClass_video_curso_id_9fe3c683_fk_workClass_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `workClass_curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workClass_video`
--

LOCK TABLES `workClass_video` WRITE;
/*!40000 ALTER TABLE `workClass_video` DISABLE KEYS */;
INSERT INTO `workClass_video` VALUES (1,'MP4',1,'2018-01-01','clasificador_1.json',1,0,'','clasificador_audio_1.json'),(2,'MP4',2,'2018-01-03','clasificador_2.json',1,0,'','clasificador_audio_2.json'),(3,'MP4',3,'2018-01-02','clasificador_3.json',1,0,'','clasificador_audio_3.json'),(64,'MP4',1,'2018-01-01','',0,1,'RussianVideo.mp4',''),(65,'MP4',1,'2018-01-01','RussianVideo.json',1,1,'EmojiRussianVideo.mp4',''),(66,'MP4',7,'2018-05-26','clasificador_4.json',1,0,'','clasificador_audio_4.json'),(67,'MP4',8,'2018-05-26','clasificador_5.json',1,0,'','clasificador_audio_5.json'),(68,'MP4',9,'2018-05-26','clasificador_6.json',1,0,'','clasificador_audio_6.json'),(69,'MP4',10,'2018-05-26','clasificador_7.json',1,0,'','clasificador_audio_10.json'),(70,'MP4',11,'2018-05-26','clasificador_8.json',1,0,'','clasificador_audio_8.json'),(71,'MP4',12,'2018-05-26','clasificador_9.json',1,0,'','clasificador_audio_9.json'),(72,'MP4',13,'2018-05-26','clasificador_10.json',1,0,'','clasificador_audio_10_Cwb1voy.json'),(73,'MP4',14,'2018-05-26','clasificador_11.json',1,0,'','clasificador_audio_11.json'),(74,'MP4',15,'2018-05-26','clasificador_12.json',1,0,'','clasificador_audio_12.json'),(75,'MP4',16,'2018-05-26','clasificador_13.json',1,0,'','clasificador_audio_13.json'),(76,'MP4',17,'2018-05-26','clasificador_14.json',1,0,'','clasificador_audio_14.json'),(77,'MP4',18,'2018-05-26','clasificador_15.json',1,0,'','clasificador_audio_15.json'),(84,'MP4',2,'2018-02-01','',0,1,'MathemathicClassCrop.mp4',''),(85,'MP4',2,'2018-02-01','EmojiMathemathicClassCrop.json',1,1,'EmojiMathemathicClassCrop.mp4',''),(88,'MP4',3,'2018-03-01','',0,1,'EnglishGrammar3.mp4',''),(89,'MP4',3,'2018-03-01','EmojiEnglishGrammar3.json',1,1,'EmojiEnglishGrammar3.mp4',''),(90,'MP4',7,'2018-04-01','',0,1,'EnglishGrammar1.mp4',''),(91,'MP4',7,'2018-04-01','EmojiEnglishGrammar1.json',1,1,'EmojiEnglishGrammar1.mp4',''),(92,'MP4',8,'2018-05-01','',0,1,'BasicEnglishGrammar1.mp4',''),(93,'MP4',8,'2018-05-01','EmojiBasicEnglishGrammar1.json',1,1,'EmojiBasicEnglishGrammar1.mp4',''),(94,'MP4',9,'2018-06-01','',0,1,'BasicEnglishGrammar2.mp4',''),(95,'MP4',9,'2018-06-01','EmojiBasicEnglishGrammar2.json',1,1,'EmojiBasicEnglishGrammar2.mp4',''),(96,'MP4',9,'2018-07-01','',0,1,'BasicEnglishGrammar3.mp4',''),(97,'MP4',9,'2018-07-01','EmojiBasicEnglishGrammar3.json',1,1,'EmojiBasicEnglishGrammar3.mp4',''),(98,'MP4',9,'2018-08-01','',0,1,'BasicEnglishGrammar4.mp4',''),(99,'MP4',9,'2018-08-01','EmojiBasicEnglishGrammar4.json',1,1,'EmojiBasicEnglishGrammar4.mp4',''),(100,'MP4',10,'2018-09-01','',0,1,'BasicEnglishGrammar5.mp4',''),(101,'MP4',10,'2018-09-01','EmojiBasicEnglishGrammar5.json',1,1,'EmojiBasicEnglishGrammar5.mp4',''),(102,'MP4',11,'2018-10-01','',0,1,'BasicEnglishGrammar6.mp4',''),(103,'MP4',11,'2018-10-01','EmojiBasicEnglishGrammar6.json',1,1,'EmojiBasicEnglishGrammar6.mp4',''),(104,'MP4',12,'2018-11-01','',0,1,'BasicEnglishGrammar7.mp4',''),(105,'MP4',12,'2018-11-01','EmojiBasicEnglishGrammar7.json',1,1,'EmojiBasicEnglishGrammar7.mp4','');
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

-- Dump completed on 2018-05-29 15:39:06
