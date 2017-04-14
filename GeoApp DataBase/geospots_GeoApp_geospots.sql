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
-- Table structure for table `GeoApp_geospots`
--

DROP TABLE IF EXISTS `GeoApp_geospots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeoApp_geospots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `description` longtext COLLATE utf8_polish_ci NOT NULL,
  `location` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `voivodeship` int(11) NOT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(8,6) DEFAULT NULL,
  `added_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `GeoApp_geospots_added_by_id_b8cc113e_fk_auth_user_id` (`added_by_id`),
  CONSTRAINT `GeoApp_geospots_added_by_id_b8cc113e_fk_auth_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GeoApp_geospots`
--

LOCK TABLES `GeoApp_geospots` WRITE;
/*!40000 ALTER TABLE `GeoApp_geospots` DISABLE KEYS */;
INSERT INTO `GeoApp_geospots` VALUES (1,'Odkrywkowa kopalnia kredy w Mielniku','Odkrywkowa kopalnia kredy jest jedyną tego typu kopalnią czynną obecnie w Polsce. Początki eksploatacji kredy w Mielniku datuje się na wiek XVI. Wydobywano ją początkowo do celów budowlanych metodą tzw. \"biedaszybów\". Aż do roku 1952 było to wydobycie ręczne wykorzystywane wyłącznie dla potrzeb okolicznych mieszkańców. Od połowy XX wieku rozpoczęto eksploatację na skalę przemysłową. Wybudowano również nowoczesny zakład przetwórczy. Dziś roczne wydobycie kredy wynosi około 80 tys. ton. \r\n-------------------------------------\r\nNowy wpis po Update View','Mielnik',10,52.330204,23.051763,2),(2,'Góra Miedzianka','Miedzianka była swego czasu miejscem, w którym oprócz miedzi wydobywano również wapienie. O tym, że eksploatacja tego miejsca była znacząca, świadczą szyby i korytarze, które ciągną się we wnętrzu góry. Jeden z korytarzy ma być wkrótce otwarty dla zwiedzających.','Miedzianka',13,50.847348,20.359168,1),(3,'Kamieniołom Nasiłów','Kamieniołom w Nasiłowie położony na lewym brzegu Wisły w odległości ok. 7 km na południe od Puław,','Nasiłów',13,51.344024,21.959523,2),(4,'Kamieniołom w Ostrówce','Karbon w Górach Świętokrzyskich jest niekompletny, brakuje bowiem górnokarbońskich utworów węglonośnych tak charakterystycznych dla tego systemu.','Ostrówka',13,50.842778,20.414167,1),(5,'Wiśniówka','tu mozna znalezc trylobity','POINT (20.70244789123535 50.93163059250112)',13,50.931630,20.702447,1);
/*!40000 ALTER TABLE `GeoApp_geospots` ENABLE KEYS */;
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
