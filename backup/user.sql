-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: user_list
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `admin_list`
--

DROP TABLE IF EXISTS `admin_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_list` (
  `username` varchar(12) NOT NULL,
  `password` varchar(12) NOT NULL,
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `admin_list_username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_list`
--

LOCK TABLES `admin_list` WRITE;
/*!40000 ALTER TABLE `admin_list` DISABLE KEYS */;
INSERT INTO `admin_list` VALUES ('admin','123',NULL);
/*!40000 ALTER TABLE `admin_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_name`
--

DROP TABLE IF EXISTS `table_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_name` (
  `username` varchar(12) NOT NULL,
  `password` varchar(12) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `table_name_username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_name`
--

LOCK TABLES `table_name` WRITE;
/*!40000 ALTER TABLE `table_name` DISABLE KEYS */;
INSERT INTO `table_name` VALUES ('user','123'),('user12','1234'),('user123','123'),('user12345','123'),('user2','123');
/*!40000 ALTER TABLE `table_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_num`
--

DROP TABLE IF EXISTS `user_num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_num` (
  `date` date NOT NULL,
  `num` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`date`),
  KEY `user_num_date_index` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_num`
--

LOCK TABLES `user_num` WRITE;
/*!40000 ALTER TABLE `user_num` DISABLE KEYS */;
INSERT INTO `user_num` VALUES ('2020-12-06','12'),('2020-12-07','18'),('2020-12-08','13'),('2020-12-09','16'),('2020-12-10','5'),('2020-12-11','9'),('2020-12-12','7'),('2020-12-13','14'),('2020-12-14','12'),('2020-12-15','8');
/*!40000 ALTER TABLE `user_num` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-12 12:35:34
