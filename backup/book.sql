-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: book_list
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
-- Table structure for table `booksinfo`
--

DROP TABLE IF EXISTS `booksinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booksinfo` (
  `id` int NOT NULL,
  `name` varchar(12) DEFAULT NULL,
  `statu` varchar(12) DEFAULT NULL,
  `writer` varchar(20) DEFAULT NULL,
  `publisher` varchar(12) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booksinfo_id_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booksinfo`
--

LOCK TABLES `booksinfo` WRITE;
/*!40000 ALTER TABLE `booksinfo` DISABLE KEYS */;
INSERT INTO `booksinfo` VALUES (1,'混元形意太极拳','在馆','马保国','耗子尾汁出版社',20),(2,'数据库从删库到跑路','在馆','张三','科技出版社',30),(3,'Java从入门到放弃','不在馆','李四','科技出版社',25),(4,'我们前端绘图真是太简单了','不在馆','王五','科技出版社',35),(6,'总之就是非常懒狗','在馆','123','嘤嘤嘤出版社',0),(7,'调库调参带师','在馆','123\n','科技出版社',0),(8,'默认1','在馆','','',0),(9,'默认1','在馆','','',0),(10,'默认1','在馆','','',0),(11,'默认1','在馆','','',0),(12,'默认1','在馆','','',0),(13,'默认1','在馆','','',0),(14,'默认1','在馆','','',0),(15,'默认1','在馆','','',0),(16,'默认1','在馆','','',0),(17,'默认1','在馆','','',0);
/*!40000 ALTER TABLE `booksinfo` ENABLE KEYS */;
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
