-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: geospots
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-04-06 08:31:48.647916'),(2,'auth','0001_initial','2017-04-06 08:31:49.145684'),(3,'admin','0001_initial','2017-04-06 08:31:49.284454'),(4,'admin','0002_logentry_remove_auto_add','2017-04-06 08:31:49.316219'),(5,'contenttypes','0002_remove_content_type_name','2017-04-06 08:31:49.482111'),(6,'auth','0002_alter_permission_name_max_length','2017-04-06 08:31:49.539625'),(7,'auth','0003_alter_user_email_max_length','2017-04-06 08:31:49.653855'),(8,'auth','0004_alter_user_username_opts','2017-04-06 08:31:49.676252'),(9,'auth','0005_alter_user_last_login_null','2017-04-06 08:31:49.772388'),(10,'auth','0006_require_contenttypes_0002','2017-04-06 08:31:49.775956'),(11,'auth','0007_alter_validators_add_error_messages','2017-04-06 08:31:49.805344'),(12,'auth','0008_alter_user_username_max_length','2017-04-06 08:31:49.862644'),(13,'sessions','0001_initial','2017-04-06 08:31:49.897930'),(14,'GeoApp','0001_initial','2017-04-06 08:33:22.447975'),(15,'GeoApp','0002_auto_20170406_0903','2017-04-06 09:04:35.387053'),(16,'GeoApp','0003_auto_20170407_0828','2017-04-07 08:28:58.908568'),(17,'GeoApp','0004_auto_20170407_0904','2017-04-07 09:04:54.072558');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-14  7:04:14
