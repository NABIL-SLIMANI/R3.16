-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: wikicoaster
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coaster`
--

DROP TABLE IF EXISTS `coaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaster` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `max_speed` int DEFAULT NULL,
  `length` int DEFAULT NULL,
  `max_height` int DEFAULT NULL,
  `operating` tinyint NOT NULL,
  `park_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F6312A7844990C25` (`park_id`),
  CONSTRAINT `FK_F6312A7844990C25` FOREIGN KEY (`park_id`) REFERENCES `park` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaster`
--

LOCK TABLES `coaster` WRITE;
/*!40000 ALTER TABLE `coaster` DISABLE KEYS */;
INSERT INTO `coaster` VALUES (1,'Bleu Fire',NULL,NULL,NULL,1,NULL),(2,'Bleu Fire',NULL,NULL,NULL,1,NULL),(3,'Bleu Fire',NULL,NULL,NULL,1,NULL),(4,'Bleu Fire',NULL,NULL,NULL,1,NULL),(5,'Bleu Fire',NULL,NULL,NULL,1,NULL),(6,'Bleu Fire',NULL,NULL,NULL,1,NULL),(7,'Bleu Fire',NULL,NULL,NULL,1,NULL),(8,'Bleu Fire',NULL,NULL,NULL,1,NULL),(9,'Bleu Fire',NULL,NULL,NULL,1,NULL),(10,'Bleu Fire',NULL,NULL,NULL,1,NULL),(11,'Bleu Fire',NULL,NULL,NULL,1,NULL),(12,'Bleu Fire',NULL,NULL,NULL,1,NULL),(13,'Bleu Fire',NULL,NULL,NULL,1,NULL),(14,'Bleu Fire',NULL,NULL,NULL,1,NULL),(15,'Bleu Fire',NULL,NULL,NULL,1,NULL),(16,'Bleu Fire',NULL,NULL,NULL,1,NULL),(17,'Bleu Fire',NULL,NULL,NULL,1,NULL),(18,'Bleu Fire',NULL,NULL,NULL,1,NULL),(19,'Bleu Fire',NULL,NULL,NULL,1,NULL),(20,'Bleu Fire',NULL,NULL,NULL,1,NULL),(21,'Bleu Fire',NULL,NULL,NULL,1,NULL),(22,'Bleu Fire',NULL,NULL,NULL,1,NULL),(23,'Bleu Fire',NULL,NULL,NULL,1,NULL),(24,'Bleu Fire',NULL,NULL,NULL,1,NULL),(25,'Bleu Fire',NULL,NULL,NULL,1,NULL),(26,'Bleu Fire',NULL,NULL,NULL,1,NULL),(27,'Bleu Fire',NULL,NULL,NULL,1,NULL),(28,'Bleu Fire',NULL,NULL,NULL,1,NULL),(29,'Bleu Fire',NULL,NULL,NULL,1,NULL),(30,'Bleu Fire',NULL,NULL,NULL,1,NULL),(31,'Bleu Fire',NULL,NULL,NULL,1,NULL),(32,'Bleu Fire',NULL,NULL,NULL,1,NULL),(33,'Bleu Fire',NULL,NULL,NULL,1,NULL),(34,'Bleu Fire',NULL,NULL,NULL,1,NULL),(35,'Bleu Fire',NULL,NULL,NULL,1,NULL),(36,'Bleu Fire',NULL,NULL,NULL,1,NULL),(37,'Bleu Fire',NULL,NULL,NULL,1,NULL),(38,'Bleu Fire',NULL,NULL,NULL,1,NULL),(39,'Bleu Fire',NULL,NULL,NULL,1,NULL),(40,'Bleu Fire',NULL,NULL,NULL,1,NULL),(41,'Bleu Fire',NULL,NULL,NULL,1,NULL),(42,'Bleu Fire',NULL,NULL,NULL,1,NULL),(43,'Bleu Fire',NULL,NULL,NULL,1,NULL),(44,'Bleu Fire',NULL,NULL,NULL,1,NULL),(45,'Bleu Fire',NULL,NULL,NULL,1,NULL),(46,'Bleu Fire',NULL,NULL,NULL,1,NULL),(47,'Bleu Fire',NULL,NULL,NULL,1,NULL),(48,'Bleu Fire',NULL,NULL,NULL,1,NULL),(49,'Bleu Fire',NULL,NULL,NULL,1,NULL),(50,'ss',NULL,NULL,NULL,1,NULL),(51,'nabil',1,2,3,1,NULL),(52,'nabil',NULL,NULL,NULL,1,NULL),(53,'TestCoaster123',100,500,23,1,1);
/*!40000 ALTER TABLE `coaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20260921131224','2026-09-21 13:12:42',48),('DoctrineMigrations\\Version20261012130759','2026-10-12 13:08:16',73),('DoctrineMigrations\\Version20261019131932','2026-10-19 13:20:28',304);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `park`
--

DROP TABLE IF EXISTS `park`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `park` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `country` varchar(2) NOT NULL,
  `opening_year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `park`
--

LOCK TABLES `park` WRITE;
/*!40000 ALTER TABLE `park` DISABLE KEYS */;
INSERT INTO `park` VALUES (1,'Nabil','ES',2007);
/*!40000 ALTER TABLE `park` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-19 17:08:03
