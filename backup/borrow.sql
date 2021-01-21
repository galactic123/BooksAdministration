-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: borrow_list
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
-- Table structure for table `borrowinfo`
--

DROP TABLE IF EXISTS `borrowinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowinfo` (
  `id` varchar(12) NOT NULL,
  `username` varchar(12) NOT NULL,
  `bookid` varchar(12) NOT NULL,
  `bookname` varchar(12) DEFAULT NULL,
  `statu` varchar(12) DEFAULT NULL,
  `borrowtime` date DEFAULT NULL,
  `returntime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borrowinfo_id_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowinfo`
--

LOCK TABLES `borrowinfo` WRITE;
/*!40000 ALTER TABLE `borrowinfo` DISABLE KEYS */;
INSERT INTO `borrowinfo` VALUES ('1','user','1','混元形意太极拳','归还','2020-12-01','2020-12-07'),('2','user','7','默认1','归还','2020-12-04','2020-12-08'),('3','user','3','Java从入门到放弃','归还','2020-12-01','2020-12-03'),('4','user','3','Java从入门到放弃','归还','2020-12-06','2020-12-21'),('5','user','3','Java从入门到放弃','归还','2020-12-08','2020-12-23'),('6','user','3','Java从入门到放弃','待处理','2020-12-08','2020-12-23'),('7','user','3','Java从入门到放弃','违约','2020-12-17','2021-01-01');
/*!40000 ALTER TABLE `borrowinfo` ENABLE KEYS */;
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
