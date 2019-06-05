-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: qlturasur
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `accounts_genre`
--

DROP TABLE IF EXISTS `accounts_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `color` varchar(200) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `accounts_genre_language_id_efcf8c79_fk_geography_language_id` (`language_id`),
  KEY `accounts_genre_2dbcba41` (`slug`),
  CONSTRAINT `accounts_genre_language_id_efcf8c79_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_genre`
--

LOCK TABLES `accounts_genre` WRITE;
/*!40000 ALTER TABLE `accounts_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_membership`
--

DROP TABLE IF EXISTS `accounts_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `finish` datetime DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `subscription_id` int(11),
  PRIMARY KEY (`id`),
  KEY `accounts_membership_2dbcba41` (`slug`),
  KEY `accounts_membership_ef42673f` (`subscription_id`),
  CONSTRAINT `accounts_me_subscription_id_57fd4cda_fk_accounts_subscription_id` FOREIGN KEY (`subscription_id`) REFERENCES `accounts_subscription` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_membership`
--

LOCK TABLES `accounts_membership` WRITE;
/*!40000 ALTER TABLE `accounts_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_red`
--

DROP TABLE IF EXISTS `accounts_red`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_red` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `name` varchar(300) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `url` varchar(300) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_red_article_id_c0658647_fk_blog_article_id` (`article_id`),
  KEY `accounts_red_config_id_2b135f67_fk_blog_config_id` (`config_id`),
  KEY `accounts_red_user_id_23226b9b_fk_auth_user_id` (`user_id`),
  KEY `accounts_red_2dbcba41` (`slug`),
  CONSTRAINT `accounts_red_user_id_23226b9b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `accounts_red_article_id_c0658647_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `accounts_red_config_id_2b135f67_fk_blog_config_id` FOREIGN KEY (`config_id`) REFERENCES `blog_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_red`
--

LOCK TABLES `accounts_red` WRITE;
/*!40000 ALTER TABLE `accounts_red` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_red` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_subscription`
--

DROP TABLE IF EXISTS `accounts_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `color` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `duracion` int(11) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `accounts_subscript_language_id_01a79b51_fk_geography_language_id` (`language_id`),
  KEY `accounts_subscription_2dbcba41` (`slug`),
  CONSTRAINT `accounts_subscript_language_id_01a79b51_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_subscription`
--

LOCK TABLES `accounts_subscription` WRITE;
/*!40000 ALTER TABLE `accounts_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_userconfig`
--

DROP TABLE IF EXISTS `accounts_userconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_userconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` longtext,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `accounts_userconfig_2dbcba41` (`slug`),
  CONSTRAINT `accounts_userconfig_user_id_9941dffb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userconfig`
--

LOCK TABLES `accounts_userconfig` WRITE;
/*!40000 ALTER TABLE `accounts_userconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_userconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_userprofile`
--

DROP TABLE IF EXISTS `accounts_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slogan` longtext,
  `body` longtext,
  `born` datetime DEFAULT NULL,
  `telefono01` varchar(20) NOT NULL,
  `telefono02` varchar(20) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `youtube` longtext NOT NULL,
  `mapa` longtext NOT NULL,
  `live` longtext NOT NULL,
  `multimedia` longtext NOT NULL,
  `archive` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `membership_id` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `trend_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `accounts_userprofile_address_id_1e385580_fk_geography_address_id` (`address_id`),
  KEY `accounts_userprofile_category_id_e3a7d8f8_fk_blog_category_id` (`category_id`),
  KEY `accounts_userprofile_genre_id_cc74ce83_fk_accounts_genre_id` (`genre_id`),
  KEY `accounts_userprofi_language_id_a6dea094_fk_geography_language_id` (`language_id`),
  KEY `accounts_userpr_membership_id_2a53909a_fk_accounts_membership_id` (`membership_id`),
  KEY `accounts_userprofile_profile_id_19df22a6_fk_blog_profile_id` (`profile_id`),
  KEY `accounts_userprofile_section_id_a6b4f951_fk_blog_section_id` (`section_id`),
  KEY `accounts_userprofile_tag_id_f692befe_fk_blog_tag_id` (`tag_id`),
  KEY `accounts_userprofile_trend_id_a1741db9_fk_blog_trend_id` (`trend_id`),
  KEY `accounts_userprofile_2dbcba41` (`slug`),
  CONSTRAINT `accounts_userprofile_user_id_92240672_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `accounts_userprofile_address_id_1e385580_fk_geography_address_id` FOREIGN KEY (`address_id`) REFERENCES `geography_address` (`id`),
  CONSTRAINT `accounts_userprofile_category_id_e3a7d8f8_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `accounts_userprofile_genre_id_cc74ce83_fk_accounts_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `accounts_genre` (`id`),
  CONSTRAINT `accounts_userprofile_profile_id_19df22a6_fk_blog_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `blog_profile` (`id`),
  CONSTRAINT `accounts_userprofile_section_id_a6b4f951_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `accounts_userprofile_tag_id_f692befe_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `accounts_userprofile_trend_id_a1741db9_fk_blog_trend_id` FOREIGN KEY (`trend_id`) REFERENCES `blog_trend` (`id`),
  CONSTRAINT `accounts_userprofi_language_id_a6dea094_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `accounts_userpr_membership_id_2a53909a_fk_accounts_membership_id` FOREIGN KEY (`membership_id`) REFERENCES `accounts_membership` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userprofile`
--

LOCK TABLES `accounts_userprofile` WRITE;
/*!40000 ALTER TABLE `accounts_userprofile` DISABLE KEYS */;
INSERT INTO `accounts_userprofile` VALUES (1,'Fundarte','La soberanía cultural y estética es consustancial a los proyectos de independencia y el campo de la sensibilidad opera a favor de la consciencia creando las condiciones subjetivas que toda revolución precisa','Es el ente encargado de ejecutar las políticas culturales de la Alcaldía de Caracas. Creado a mediados de los años 70 en la última década ha dado un giro filosófico, junto al país, en busca de nuevos conceptos y praxis que privilegian la identidad, la tradición y la creación de nuevos imaginarios, desde una política acorde con nuestra realidad geo-histórica.',NULL,'','','profiles/avatar/fundarte-ban.png','profiles/backgrounds/fundarte.jpg','<iframe width=\"420\" height=\"315\" src=\"https://www.youtube.com/embed/K5xm-BIC0FI\" frameborder=\"0\" allowfullscreen></iframe>','','','','','2016-06-01 15:19:59','2016-06-01 15:39:59','fundarte',NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2),(2,'',NULL,NULL,NULL,'','','','','','','','','','2016-06-01 15:54:24','2016-06-01 15:54:24','kikemendez',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,3),(3,'',NULL,NULL,NULL,'','','','','','','','','','2016-06-01 16:37:53','2016-06-01 16:37:53','poesianomada',NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,4),(4,'',NULL,NULL,NULL,'','','','','','','','','','2016-06-14 17:11:50','2016-06-14 17:11:50','raul-acosta',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `accounts_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add Suscripción',7,'add_subscription'),(20,'Can change Suscripción',7,'change_subscription'),(21,'Can delete Suscripción',7,'delete_subscription'),(22,'Can add Membership',8,'add_membership'),(23,'Can change Membership',8,'change_membership'),(24,'Can delete Membership',8,'delete_membership'),(25,'Can add Genero',9,'add_genre'),(26,'Can change Genero',9,'change_genre'),(27,'Can delete Genero',9,'delete_genre'),(28,'Can add Red social',10,'add_red'),(29,'Can change Red social',10,'change_red'),(30,'Can delete Red social',10,'delete_red'),(31,'Can add Perfil de usuario',11,'add_userprofile'),(32,'Can change Perfil de usuario',11,'change_userprofile'),(33,'Can delete Perfil de usuario',11,'delete_userprofile'),(34,'Can add Configuracion de usuario',12,'add_userconfig'),(35,'Can change Configuracion de usuario',12,'change_userconfig'),(36,'Can delete Configuracion de usuario',12,'delete_userconfig'),(37,'Can add Configuracion',13,'add_config'),(38,'Can change Configuracion',13,'change_config'),(39,'Can delete Configuracion',13,'delete_config'),(40,'Can add 0-Categoria',14,'add_category'),(41,'Can change 0-Categoria',14,'change_category'),(42,'Can delete 0-Categoria',14,'delete_category'),(43,'Can add 1-Seccion',15,'add_section'),(44,'Can change 1-Seccion',15,'change_section'),(45,'Can delete 1-Seccion',15,'delete_section'),(46,'Can add 2-Tag',16,'add_tag'),(47,'Can change 2-Tag',16,'change_tag'),(48,'Can delete 2-Tag',16,'delete_tag'),(49,'Can add 3-Trend',17,'add_trend'),(50,'Can change 3-Trend',17,'change_trend'),(51,'Can delete 3-Trend',17,'delete_trend'),(52,'Can add 4-Profile',18,'add_profile'),(53,'Can change 4-Profile',18,'change_profile'),(54,'Can delete 4-Profile',18,'delete_profile'),(55,'Can add Publicación',19,'add_article'),(56,'Can change Publicación',19,'change_article'),(57,'Can delete Publicación',19,'delete_article'),(58,'Can add Idioma',20,'add_language'),(59,'Can change Idioma',20,'change_language'),(60,'Can delete Idioma',20,'delete_language'),(61,'Can add Moneda',21,'add_currency'),(62,'Can change Moneda',21,'change_currency'),(63,'Can delete Moneda',21,'delete_currency'),(64,'Can add Continente',22,'add_continent'),(65,'Can change Continente',22,'change_continent'),(66,'Can delete Continente',22,'delete_continent'),(67,'Can add Pais',23,'add_country'),(68,'Can change Pais',23,'change_country'),(69,'Can delete Pais',23,'delete_country'),(70,'Can add Region',24,'add_region'),(71,'Can change Region',24,'change_region'),(72,'Can delete Region',24,'delete_region'),(73,'Can add Estado',25,'add_state'),(74,'Can change Estado',25,'change_state'),(75,'Can delete Estado',25,'delete_state'),(76,'Can add Ciudad',26,'add_city'),(77,'Can change Ciudad',26,'change_city'),(78,'Can delete Ciudad',26,'delete_city'),(79,'Can add Zona',27,'add_zone'),(80,'Can change Zona',27,'change_zone'),(81,'Can delete Zona',27,'delete_zone'),(82,'Can add Comunidad',28,'add_community'),(83,'Can change Comunidad',28,'change_community'),(84,'Can delete Comunidad',28,'delete_community'),(85,'Can add Locacion',29,'add_location'),(86,'Can change Locacion',29,'change_location'),(87,'Can delete Locacion',29,'delete_location'),(88,'Can add Direccion',30,'add_address'),(89,'Can change Direccion',30,'change_address'),(90,'Can delete Direccion',30,'delete_address'),(91,'Can add Media Categoria',31,'add_mediacategory'),(92,'Can change Media Categoria',31,'change_mediacategory'),(93,'Can delete Media Categoria',31,'delete_mediacategory'),(94,'Can add Media',32,'add_media'),(95,'Can change Media',32,'change_media'),(96,'Can delete Media',32,'delete_media');
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
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$VSOESQjSwSu3$dVYfK/cGPkhY3GnbDO5mfKJkLHV7fyI7j2hXs3DIay0=','2016-06-01 21:07:19',1,'qlturasur','','','qlturasur@gmail.com',1,1,'2016-05-31 17:42:02'),(2,'pbkdf2_sha256$24000$RjuDa7mChuoZ$kcxwyu7tJicsIWwrq790qd4T1ivNSpEbunHdFMrrM4k=','2016-06-01 15:19:59',0,'Fundarte','','','',0,1,'2016-06-01 15:19:58'),(3,'pbkdf2_sha256$24000$7ljLqa58EVWg$k6NKIG+6aHCkxkEL64EAURlKTyryxkn3/CUnq0juXf8=','2016-06-01 15:54:24',0,'KikeMendez','','','',0,1,'2016-06-01 15:54:23'),(4,'pbkdf2_sha256$24000$8AHRDROngIlI$wcRiAL0ko1VgRCyWyP/QsL398GVpe8Pc5pX6OS3JtEQ=','2016-06-01 16:37:53',0,'PoesiaNomada','','','',0,1,'2016-06-01 16:37:53'),(5,'pbkdf2_sha256$24000$qdszwr8JHh3p$evvkxxo7JGvi0pmWv2Mp5zsWkdcS/TfKp6l27dCae04=','2016-06-14 17:11:50',0,'Raúl Acosta','','','',0,1,'2016-06-14 17:11:50');
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `background` varchar(100) DEFAULT NULL,
  `youtube` longtext NOT NULL,
  `mapa` longtext NOT NULL,
  `live` longtext NOT NULL,
  `multimedia` longtext NOT NULL,
  `video` varchar(100) DEFAULT NULL,
  `audio` varchar(100) DEFAULT NULL,
  `archive` varchar(100) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `finish` datetime DEFAULT NULL,
  `publish` datetime DEFAULT NULL,
  `unpublish` datetime DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(144) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `category_id` int(11),
  `category2_id` int(11),
  `category3_id` int(11),
  `language_id` int(11),
  `owner_id` int(11),
  `profile_id` int(11),
  `profile2_id` int(11),
  `profile3_id` int(11),
  `section_id` int(11) NOT NULL,
  `section2_id` int(11),
  `section3_id` int(11),
  `tag_id` int(11),
  `tag2_id` int(11),
  `tag3_id` int(11),
  `trend_id` int(11),
  `trend2_id` int(11),
  `trend3_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `blog_article_address_id_05d1ae54_fk_geography_address_id` (`address_id`),
  KEY `blog_article_2dbcba41` (`slug`),
  KEY `blog_article_b583a629` (`category_id`),
  KEY `blog_article_c6024334` (`category2_id`),
  KEY `blog_article_cb1082d1` (`category3_id`),
  KEY `blog_article_468679bd` (`language_id`),
  KEY `blog_article_5e7b1936` (`owner_id`),
  KEY `blog_article_83a0eb3f` (`profile_id`),
  KEY `blog_article_4186ab98` (`profile2_id`),
  KEY `blog_article_b9d6531f` (`profile3_id`),
  KEY `blog_article_730f6511` (`section_id`),
  KEY `blog_article_6be5d109` (`section2_id`),
  KEY `blog_article_849293a9` (`section3_id`),
  KEY `blog_article_76f094bc` (`tag_id`),
  KEY `blog_article_b8791fee` (`tag2_id`),
  KEY `blog_article_c950c2b7` (`tag3_id`),
  KEY `blog_article_e881e49b` (`trend_id`),
  KEY `blog_article_24e1819d` (`trend2_id`),
  KEY `blog_article_ea245fcb` (`trend3_id`),
  CONSTRAINT `blog_article_trend3_id_a9b72795_fk_blog_trend_id` FOREIGN KEY (`trend3_id`) REFERENCES `blog_trend` (`id`),
  CONSTRAINT `blog_article_address_id_05d1ae54_fk_geography_address_id` FOREIGN KEY (`address_id`) REFERENCES `geography_address` (`id`),
  CONSTRAINT `blog_article_category2_id_1adc8a7a_fk_blog_category_id` FOREIGN KEY (`category2_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_article_category3_id_0f49217e_fk_blog_category_id` FOREIGN KEY (`category3_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_article_language_id_8692f4a9_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `blog_article_owner_id_5cc237cd_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_article_profile2_id_a7fc0b6f_fk_blog_profile_id` FOREIGN KEY (`profile2_id`) REFERENCES `blog_profile` (`id`),
  CONSTRAINT `blog_article_profile3_id_24118711_fk_blog_profile_id` FOREIGN KEY (`profile3_id`) REFERENCES `blog_profile` (`id`),
  CONSTRAINT `blog_article_profile_id_b13eeb5e_fk_blog_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `blog_profile` (`id`),
  CONSTRAINT `blog_article_section2_id_a99a1cda_fk_blog_section_id` FOREIGN KEY (`section2_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `blog_article_section3_id_4d0c2153_fk_blog_section_id` FOREIGN KEY (`section3_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `blog_article_section_id_2cfa4ebe_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `blog_article_tag2_id_c277d515_fk_blog_tag_id` FOREIGN KEY (`tag2_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `blog_article_tag3_id_54729695_fk_blog_tag_id` FOREIGN KEY (`tag3_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `blog_article_tag_id_4c94be52_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `blog_article_trend2_id_e360ecaf_fk_blog_trend_id` FOREIGN KEY (`trend2_id`) REFERENCES `blog_trend` (`id`),
  CONSTRAINT `blog_article_trend_id_fd464ff7_fk_blog_trend_id` FOREIGN KEY (`trend_id`) REFERENCES `blog_trend` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'Festival de Teatro de Caracas 2016','El Festival de Teatro de Caracas muestra la diversidad y la pluralidad de los diferentes géneros y tendencias de las artes escénicas, confrontando las diversas expresiones de las culturas. Éste incluye diferentes tipos de obras de teatros, en distintos puntos de la ciudad capital como el teatro callejero, teatro de sala, danza clásica, teatro infantil y juvenil, conciertos internacionales, entre otros. Desde el 2011, la Alcaldía del Municipio Bolivariano Libertador, gracias a la gestión del Alcalde Jorge Rodríguez, y a través de la Fundación para la Cultura y las Artes, Fundarte, ha organizado 4 exitosas ediciones y se espera que para el 2016, se efectúe nuevamente este tipo de actividades para el disfrute del público que visita y vive en la capital.','articles/backgrounds/ftc2016.jpg','<iframe width=\"90%\" height=\"315\" src=\"https://www.youtube.com/embed/K5xm-BIC0FI\" frameborder=\"0\" allowfullscreen></iframe></br><img src=\"http://www.fundarte.gob.ve/images/noticias/2016/5.jpg\" width=\"90%\">','Del 03 al 12 de Junio de 2016 en Caracas Venezuela. Más información en <a href=\"http://www.festivaldeteatrodecaracas.org.ve\">www.festivaldeteatrodecaracas.org.ve</a>','','Organizado por: <a href=\"http://www.fundarte.gob.ve\">Fundación para la Cultura y las Artes. Alcaldía de Caracas</a>','','','','2016-06-03 00:00:00','2016-06-12 00:00:00','2016-06-01 15:26:24',NULL,'2016-06-01 15:26:24','2016-06-01 15:34:20','2016/6/1/1',NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Fundación Asonic Lucha contra el cancer infantil','El día 03 de junio tenemos rueda de prensa en el concejo provincial, y el día 11 de Junio estaremos haciendo la clase de bailoterapia masiva en el Parque La Carolina. ¡Te esperamos desde las 8 de la mañana!','','','Parque La Carolina, Quito, Ecuador.  (Alado de la tribuna de los Shyris). 11 de Junio de 2016','','','','','',NULL,NULL,'2016-06-01 15:57:18',NULL,'2016-06-01 15:57:18','2016-06-01 15:57:18','2016/6/1/2',NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Reconstrucción historica de la escritura Ecuatoriana','Asumimos el reto de reconstruir historicamente la escritura Ecuatoriana','','','','','','','','',NULL,NULL,'2016-06-01 16:38:51',NULL,'2016-06-01 16:38:51','2016-06-01 16:38:51','2016/6/1/3',NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `body` longtext NOT NULL,
  `color` longtext NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_category_language_id_ba7cfa29_fk_geography_language_id` (`language_id`),
  KEY `blog_category_2dbcba41` (`slug`),
  CONSTRAINT `blog_category_language_id_ba7cfa29_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_config`
--

DROP TABLE IF EXISTS `blog_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webName` varchar(300) NOT NULL,
  `webSlogan` varchar(300) NOT NULL,
  `webUrl` varchar(300) NOT NULL,
  `addons` longtext NOT NULL,
  `text01` varchar(300) DEFAULT NULL,
  `text02` varchar(300) DEFAULT NULL,
  `text03` varchar(300) DEFAULT NULL,
  `text04` varchar(300) DEFAULT NULL,
  `text05` varchar(300) DEFAULT NULL,
  `text06` varchar(300) DEFAULT NULL,
  `text07` varchar(300) DEFAULT NULL,
  `text08` varchar(300) DEFAULT NULL,
  `text09` varchar(300) DEFAULT NULL,
  `text10` varchar(300) DEFAULT NULL,
  `text11` varchar(300) DEFAULT NULL,
  `dino01` varchar(300) DEFAULT NULL,
  `dino02` varchar(300) DEFAULT NULL,
  `dino03` varchar(300) DEFAULT NULL,
  `dino04` varchar(300) DEFAULT NULL,
  `dino05` varchar(300) DEFAULT NULL,
  `dino06` varchar(300) DEFAULT NULL,
  `dino07` varchar(300) DEFAULT NULL,
  `dino08` varchar(300) DEFAULT NULL,
  `dino09` varchar(300) DEFAULT NULL,
  `dino00` varchar(300) DEFAULT NULL,
  `favicon` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `color` longtext NOT NULL,
  `color02` longtext NOT NULL,
  `color03` longtext NOT NULL,
  `color04` longtext NOT NULL,
  `telefono01` varchar(20) NOT NULL,
  `telefono02` varchar(20) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `videoMp4` varchar(100) DEFAULT NULL,
  `videoOgv` varchar(100) DEFAULT NULL,
  `videoWebm` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `categoryBackground` varchar(100) DEFAULT NULL,
  `sectionBackground` varchar(100) DEFAULT NULL,
  `trendBackground` varchar(100) DEFAULT NULL,
  `profileBackground` varchar(100) DEFAULT NULL,
  `articleBackground` varchar(100) DEFAULT NULL,
  `categoryLogo` varchar(100) DEFAULT NULL,
  `sectionLogo` varchar(100) DEFAULT NULL,
  `trendLogo` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_config_address_id_fd3cb07f_fk_geography_address_id` (`address_id`),
  KEY `blog_config_language_id_2d1b35bb_fk_geography_language_id` (`language_id`),
  KEY `blog_config_2dbcba41` (`slug`),
  CONSTRAINT `blog_config_language_id_2d1b35bb_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `blog_config_address_id_fd3cb07f_fk_geography_address_id` FOREIGN KEY (`address_id`) REFERENCES `geography_address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_config`
--

LOCK TABLES `blog_config` WRITE;
/*!40000 ALTER TABLE `blog_config` DISABLE KEYS */;
INSERT INTO `blog_config` VALUES (1,'Qlturasur','Involúcrate','www.qlturasur.org','<script>\r\n  (function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\r\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\r\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\r\n  })(window,document,\'script\',\'https://www.google-analytics.com/analytics.js\',\'ga\');\r\n\r\n  ga(\'create\', \'UA-75283313-1\', \'auto\');\r\n  ga(\'send\', \'pageview\');\r\n\r\n</script>','explorar','Modo lectura','Mapa Cultural','Publicar','Salir','Proyectos','¿No estas listo para publicar?','Encuentra más experiencias','Pública','Publicar','Otro','Imágenes','Audios','Videos','Archivos','Ubicación','Transmision','Fechas','Involúcrate','Más','Información','favicon/buhosouth.png','Explora y Comparte Proyectos Culturales en América Latina','#6F52A8','#3CCF80','rgba(32, 11, 51, 0.79)','black','','','2016/6/1/1','config/buhosouth.png','','','','config/gasolina.jpg','','','','','','','','','2016-05-31 19:40:05','2016-06-01 21:07:55','qlturasur',NULL,NULL);
/*!40000 ALTER TABLE `blog_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_profile`
--

DROP TABLE IF EXISTS `blog_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `body` longtext NOT NULL,
  `color` varchar(20) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `section_id` int(11),
  `tag_id` int(11),
  PRIMARY KEY (`id`),
  KEY `blog_profile_category_id_dc133fd0_fk_blog_category_id` (`category_id`),
  KEY `blog_profile_language_id_414e0a80_fk_geography_language_id` (`language_id`),
  KEY `blog_profile_2dbcba41` (`slug`),
  KEY `blog_profile_730f6511` (`section_id`),
  KEY `blog_profile_76f094bc` (`tag_id`),
  CONSTRAINT `blog_profile_tag_id_83eb905d_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `blog_profile_category_id_dc133fd0_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_profile_language_id_414e0a80_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `blog_profile_section_id_93814983_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_profile`
--

LOCK TABLES `blog_profile` WRITE;
/*!40000 ALTER TABLE `blog_profile` DISABLE KEYS */;
INSERT INTO `blog_profile` VALUES (1,'Cultores','','#7E5AC6','trends/logos/67.png','','2016-05-31 20:07:35','2016-05-31 20:07:35','cultores',NULL,NULL,NULL,NULL),(2,'Comunidades','','#7E5AC6','trends/logos/82.png','','2016-05-31 20:08:43','2016-05-31 20:11:55','comunidades',NULL,NULL,NULL,NULL),(3,'Instituciones','','#7E5AC6','trends/logos/91.png','','2016-05-31 20:10:56','2016-05-31 20:10:56','instituciones',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `blog_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_section`
--

DROP TABLE IF EXISTS `blog_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `body` longtext NOT NULL,
  `color` varchar(20) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_section_language_id_bf908c21_fk_geography_language_id` (`language_id`),
  KEY `blog_section_2dbcba41` (`slug`),
  CONSTRAINT `blog_section_language_id_bf908c21_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_section`
--

LOCK TABLES `blog_section` WRITE;
/*!40000 ALTER TABLE `blog_section` DISABLE KEYS */;
INSERT INTO `blog_section` VALUES (1,'Arte','Artistas, empresas, artesanos y comunidades, comprometidos con la innovación para promover la educación con sus emprendimientos y obras\"','#EA48BA','sections/logos/153.png','sections/backgrounds/el_born.jpg','2016-05-31 19:46:46','2016-05-31 19:47:52','arte',NULL),(2,'Ciudad','Ayudanos a conectar tus experiencias con el resto del mundo. De esta manera generamos oportunidades de asumir proyectos innovadores que transformen nuestras naciones.','#7A48EA','sections/logos/134_wUxt8Ca.png','sections/backgrounds/hey.jpg','2016-05-31 19:49:42','2016-05-31 19:49:42','ciudad',NULL),(3,'Educación','Promovemos la educación tecnológica e impulsamos personas de todas las edades, generos, culturas y profesiónes a emprender.','#3573D1','sections/logos/148.png','sections/backgrounds/12803233_978096372225612_3972950742954543504_n.jpg','2016-05-31 19:51:43','2016-05-31 19:51:43','educacion',NULL);
/*!40000 ALTER TABLE `blog_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `color` varchar(20) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `blog_tag_language_id_b599e302_fk_geography_language_id` (`language_id`),
  KEY `blog_tag_section_id_f4ee52f8_fk_blog_section_id` (`section_id`),
  KEY `blog_tag_2dbcba41` (`slug`),
  CONSTRAINT `blog_tag_section_id_f4ee52f8_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `blog_tag_language_id_b599e302_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_trend`
--

DROP TABLE IF EXISTS `blog_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_trend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `body` longtext NOT NULL,
  `color` varchar(20) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_trend_language_id_ba7b3940_fk_geography_language_id` (`language_id`),
  KEY `blog_trend_tag_id_36dd18d3_fk_blog_tag_id` (`tag_id`),
  KEY `blog_trend_2dbcba41` (`slug`),
  CONSTRAINT `blog_trend_tag_id_36dd18d3_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `blog_trend_language_id_ba7b3940_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_trend`
--

LOCK TABLES `blog_trend` WRITE;
/*!40000 ALTER TABLE `blog_trend` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-05-31 19:40:05','1','Qlturasur',1,'Added.',13,1),(2,'2016-05-31 19:40:47','1','Qlturasur',2,'Changed background.',13,1),(3,'2016-05-31 19:46:46','1','Arte',1,'Added.',15,1),(4,'2016-05-31 19:47:52','1','Arte',2,'Changed photo.',15,1),(5,'2016-05-31 19:49:42','2','Ciudad',1,'Added.',15,1),(6,'2016-05-31 19:51:43','3','Educación',1,'Added.',15,1),(7,'2016-05-31 20:07:35','1','Cultores',1,'Added.',18,1),(8,'2016-05-31 20:08:43','2','Comunidades',1,'Added.',18,1),(9,'2016-05-31 20:10:56','3','Instituciones',1,'Added.',18,1),(10,'2016-05-31 20:11:55','2','Comunidades',2,'Changed photo.',18,1),(11,'2016-06-01 15:32:55','1','Festival de Teatro de Caracas 2016',2,'Changed background, youtube and live.',19,1),(12,'2016-06-01 15:34:20','1','Festival de Teatro de Caracas 2016',2,'Changed start and finish.',19,1),(13,'2016-06-01 15:37:46','1','Fundarte',2,'Changed name, slogan, body, photo, background and youtube.',11,1),(14,'2016-06-01 15:39:59','1','Fundarte',2,'Changed slogan.',11,1),(15,'2016-06-01 15:44:18','1','Qlturasur',2,'Changed categoria.',13,1),(16,'2016-06-01 15:44:37','1','Qlturasur',2,'Changed categoria.',13,1),(17,'2016-06-01 21:07:55','1','Qlturasur',2,'Changed addons.',13,1);
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'accounts','genre'),(8,'accounts','membership'),(10,'accounts','red'),(7,'accounts','subscription'),(12,'accounts','userconfig'),(11,'accounts','userprofile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(19,'blog','article'),(14,'blog','category'),(13,'blog','config'),(18,'blog','profile'),(15,'blog','section'),(16,'blog','tag'),(17,'blog','trend'),(5,'contenttypes','contenttype'),(30,'geography','address'),(26,'geography','city'),(28,'geography','community'),(22,'geography','continent'),(23,'geography','country'),(21,'geography','currency'),(20,'geography','language'),(29,'geography','location'),(24,'geography','region'),(25,'geography','state'),(27,'geography','zone'),(32,'medias','media'),(31,'medias','mediacategory'),(6,'sessions','session');
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
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-05-31 17:27:39'),(2,'auth','0001_initial','2016-05-31 17:27:39'),(3,'admin','0001_initial','2016-05-31 17:27:39'),(4,'admin','0002_logentry_remove_auto_add','2016-05-31 17:27:39'),(5,'contenttypes','0002_remove_content_type_name','2016-05-31 17:27:39'),(6,'auth','0002_alter_permission_name_max_length','2016-05-31 17:27:39'),(7,'auth','0003_alter_user_email_max_length','2016-05-31 17:27:39'),(8,'auth','0004_alter_user_username_opts','2016-05-31 17:27:39'),(9,'auth','0005_alter_user_last_login_null','2016-05-31 17:27:39'),(10,'auth','0006_require_contenttypes_0002','2016-05-31 17:27:39'),(11,'auth','0007_alter_validators_add_error_messages','2016-05-31 17:27:39'),(12,'sessions','0001_initial','2016-05-31 17:27:39'),(13,'geography','0001_initial','2016-05-31 17:28:53'),(14,'blog','0001_initial','2016-05-31 17:28:56'),(15,'accounts','0001_initial','2016-05-31 17:28:57'),(16,'medias','0001_initial','2016-06-01 15:28:02');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('h7g2n4siel9j2nrp77usrbpow49y3pe8','NDYyYTYxNmY2MjRjN2RmMmZiMWFjNDk0YzllNjM5ZjZjM2IwYTQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImNhOGM2ZGRiZTg2NDI3ZGYwN2JlNmMyYWRiMGNjY2RlNzBmYTQxZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-06-15 21:07:19'),('nyt75jktxvoiw3lq4zogb31ciax4fqfv','NDYyYTYxNmY2MjRjN2RmMmZiMWFjNDk0YzllNjM5ZjZjM2IwYTQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImNhOGM2ZGRiZTg2NDI3ZGYwN2JlNmMyYWRiMGNjY2RlNzBmYTQxZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-06-14 19:31:31'),('wnhww496gkwb275t0fm4eax7cxusbzzb','MDk1NTAzOGUyNDQ4OTE4MTBiNTVkZjRhNTY0YWI0NmJjN2Q0ZDBjNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjYwNTkwMTI5ZDA4NWVmMDI3ZTMzMTUxMmQxNTc4ZGI2YWYzNjZkYjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2016-06-28 17:11:50');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_address`
--

DROP TABLE IF EXISTS `geography_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(32) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `body` longtext NOT NULL,
  `mapa` longtext NOT NULL,
  `lat` varchar(100) NOT NULL,
  `lng` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `location_id` int(11),
  PRIMARY KEY (`id`),
  KEY `geography_address_2dbcba41` (`slug`),
  KEY `geography_address_e274a5da` (`location_id`),
  CONSTRAINT `geography_address_location_id_951b5b45_fk_geography_location_id` FOREIGN KEY (`location_id`) REFERENCES `geography_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_address`
--

LOCK TABLES `geography_address` WRITE;
/*!40000 ALTER TABLE `geography_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_city`
--

DROP TABLE IF EXISTS `geography_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `state_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_city_2dbcba41` (`slug`),
  KEY `geography_city_d5582625` (`state_id`),
  CONSTRAINT `geography_city_state_id_76440657_fk_geography_state_id` FOREIGN KEY (`state_id`) REFERENCES `geography_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_city`
--

LOCK TABLES `geography_city` WRITE;
/*!40000 ALTER TABLE `geography_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_community`
--

DROP TABLE IF EXISTS `geography_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `zone_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_community_2dbcba41` (`slug`),
  KEY `geography_community_06342dd7` (`zone_id`),
  CONSTRAINT `geography_community_zone_id_d267aa23_fk_geography_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `geography_zone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_community`
--

LOCK TABLES `geography_community` WRITE;
/*!40000 ALTER TABLE `geography_community` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_continent`
--

DROP TABLE IF EXISTS `geography_continent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_continent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_continent_2dbcba41` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_continent`
--

LOCK TABLES `geography_continent` WRITE;
/*!40000 ALTER TABLE `geography_continent` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_continent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_country`
--

DROP TABLE IF EXISTS `geography_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `continent_id` int(11) DEFAULT NULL,
  `currency_id` int(11),
  `language_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_countr_continent_id_0755ea09_fk_geography_continent_id` (`continent_id`),
  KEY `geography_country_2dbcba41` (`slug`),
  KEY `geography_country_2c7d5721` (`currency_id`),
  KEY `geography_country_468679bd` (`language_id`),
  CONSTRAINT `geography_country_language_id_9eee34ab_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `geography_country_currency_id_6b7c5a11_fk_geography_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `geography_currency` (`id`),
  CONSTRAINT `geography_countr_continent_id_0755ea09_fk_geography_continent_id` FOREIGN KEY (`continent_id`) REFERENCES `geography_continent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_country`
--

LOCK TABLES `geography_country` WRITE;
/*!40000 ALTER TABLE `geography_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_currency`
--

DROP TABLE IF EXISTS `geography_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `symbol` varchar(300) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_currency_2dbcba41` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_currency`
--

LOCK TABLES `geography_currency` WRITE;
/*!40000 ALTER TABLE `geography_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_language`
--

DROP TABLE IF EXISTS `geography_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_language_2dbcba41` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_language`
--

LOCK TABLES `geography_language` WRITE;
/*!40000 ALTER TABLE `geography_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_location`
--

DROP TABLE IF EXISTS `geography_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_locati_community_id_32c0e97a_fk_geography_community_id` (`community_id`),
  KEY `geography_location_2dbcba41` (`slug`),
  CONSTRAINT `geography_locati_community_id_32c0e97a_fk_geography_community_id` FOREIGN KEY (`community_id`) REFERENCES `geography_community` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_location`
--

LOCK TABLES `geography_location` WRITE;
/*!40000 ALTER TABLE `geography_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_region`
--

DROP TABLE IF EXISTS `geography_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_region_country_id_7b89c739_fk_geography_country_id` (`country_id`),
  KEY `geography_region_2dbcba41` (`slug`),
  CONSTRAINT `geography_region_country_id_7b89c739_fk_geography_country_id` FOREIGN KEY (`country_id`) REFERENCES `geography_country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_region`
--

LOCK TABLES `geography_region` WRITE;
/*!40000 ALTER TABLE `geography_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_state`
--

DROP TABLE IF EXISTS `geography_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_state_region_id_99424c7d_fk_geography_region_id` (`region_id`),
  KEY `geography_state_2dbcba41` (`slug`),
  CONSTRAINT `geography_state_region_id_99424c7d_fk_geography_region_id` FOREIGN KEY (`region_id`) REFERENCES `geography_region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_state`
--

LOCK TABLES `geography_state` WRITE;
/*!40000 ALTER TABLE `geography_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_zone`
--

DROP TABLE IF EXISTS `geography_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_zone_city_id_49ee0420_fk_geography_city_id` (`city_id`),
  KEY `geography_zone_2dbcba41` (`slug`),
  CONSTRAINT `geography_zone_city_id_49ee0420_fk_geography_city_id` FOREIGN KEY (`city_id`) REFERENCES `geography_city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_zone`
--

LOCK TABLES `geography_zone` WRITE;
/*!40000 ALTER TABLE `geography_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medias_media`
--

DROP TABLE IF EXISTS `medias_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medias_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(32) NOT NULL,
  `description` longtext NOT NULL,
  `html` longtext NOT NULL,
  `archive` varchar(100) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `finish` datetime DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `mediaCategory_id` int(11),
  `profile_id` int(11),
  `red_id` int(11),
  `tagArticle_id` int(11),
  `tagProfile_id` int(11),
  PRIMARY KEY (`id`),
  KEY `medias_media_address_id_21bd8ba1_fk_geography_address_id` (`address_id`),
  KEY `medias_media_article_id_168af554_fk_blog_article_id` (`article_id`),
  KEY `medias_media_2dbcba41` (`slug`),
  KEY `medias_media_1c876244` (`mediaCategory_id`),
  KEY `medias_media_83a0eb3f` (`profile_id`),
  KEY `medias_media_223bf4cf` (`red_id`),
  KEY `medias_media_0ec0c337` (`tagArticle_id`),
  KEY `medias_media_ec34f82e` (`tagProfile_id`),
  CONSTRAINT `medias_media_tagProfile_id_2920835b_fk_accounts_userprofile_id` FOREIGN KEY (`tagProfile_id`) REFERENCES `accounts_userprofile` (`id`),
  CONSTRAINT `medias_media_address_id_21bd8ba1_fk_geography_address_id` FOREIGN KEY (`address_id`) REFERENCES `geography_address` (`id`),
  CONSTRAINT `medias_media_article_id_168af554_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `medias_media_profile_id_a6d8e009_fk_accounts_userprofile_id` FOREIGN KEY (`profile_id`) REFERENCES `accounts_userprofile` (`id`),
  CONSTRAINT `medias_media_red_id_8b364994_fk_accounts_red_id` FOREIGN KEY (`red_id`) REFERENCES `accounts_red` (`id`),
  CONSTRAINT `medias_media_tagArticle_id_d49a13ec_fk_blog_article_id` FOREIGN KEY (`tagArticle_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `medias_medi_mediaCategory_id_4e284a72_fk_medias_mediacategory_id` FOREIGN KEY (`mediaCategory_id`) REFERENCES `medias_mediacategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medias_media`
--

LOCK TABLES `medias_media` WRITE;
/*!40000 ALTER TABLE `medias_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `medias_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medias_mediacategory`
--

DROP TABLE IF EXISTS `medias_mediacategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medias_mediacategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `medias_mediacategory_2dbcba41` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medias_mediacategory`
--

LOCK TABLES `medias_mediacategory` WRITE;
/*!40000 ALTER TABLE `medias_mediacategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `medias_mediacategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-16 17:53:53
