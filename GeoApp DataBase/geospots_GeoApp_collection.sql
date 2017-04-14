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
-- Table structure for table `GeoApp_collection`
--

DROP TABLE IF EXISTS `GeoApp_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeoApp_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `description` longtext COLLATE utf8_polish_ci NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `picture` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `user_collection_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `GeoApp_collection_user_collection_id_e9e7d066_fk_auth_user_id` (`user_collection_id`),
  KEY `GeoApp_collection_location_id_ef7f9fae_uniq` (`location_id`),
  CONSTRAINT `GeoApp_collection_location_id_ef7f9fae_fk_GeoApp_geospots_id` FOREIGN KEY (`location_id`) REFERENCES `GeoApp_geospots` (`id`),
  CONSTRAINT `GeoApp_collection_user_collection_id_e9e7d066_fk_auth_user_id` FOREIGN KEY (`user_collection_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GeoApp_collection`
--

LOCK TABLES `GeoApp_collection` WRITE;
/*!40000 ALTER TABLE `GeoApp_collection` DISABLE KEYS */;
INSERT INTO `GeoApp_collection` VALUES (1,'Belemnit','Kompletne rostrum belemnita, okaz znaleziony w pokładach dolnej Kredy.\r\n------------------------------------------------\r\nPo modyfikacji - jednak działa ?\r\n--------\r\nDodano nowy obrazek',1,'',2),(2,'Azuryt','Znaleziony u podnóża MIedzianki',2,'',1),(3,'Malachit','Malachit, drobny, okruchy, słabo wykształcone kryształy\r\n----------------------------------\r\nInne okazy znajdują się głębiej',2,'GeoApp/static/malachit.jpg',2),(4,'Galena','Okaz Galeny na Barycie znaleziony w kamieniołomie Ostrówka',4,'GeoApp/static/galena.jpg',2),(5,'krzemien','fdsfdsf',1,'',2),(6,'Belemnit 2','Drugi okaz',3,'GeoApp/static/bele.jpg',1);
/*!40000 ALTER TABLE `GeoApp_collection` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-14  7:04:13
