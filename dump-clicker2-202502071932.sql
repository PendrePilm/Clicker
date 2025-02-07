-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: clicker2
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `level` int DEFAULT '1',
  `clicks` int DEFAULT '0',
  `buildings` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'theo','$2y$10$ik7vNY3nh3DOVYHenvp1e.f9wkm4b5srLeglhyR9OHqJy6eag/WqW',2,22,''),(3,'defossez','$2y$10$HbcqxQpCE2efohiFEIOHFue8PE6S34J/3ue2YcP4H.U1cTKvbRmze',2,1133,'[{\"name\":\"Like\",\"cost\":14,\"quantity\":2,\"passiveRate\":1},{\"name\":\"Vues\",\"cost\":58,\"quantity\":1,\"passiveRate\":5},{\"name\":\"Partage\",\"cost\":133,\"quantity\":2,\"passiveRate\":10},{\"name\":\"Feat\",\"cost\":230,\"quantity\":1,\"passiveRate\":20},{\"name\":\"Gros concept\",\"cost\":500,\"quantity\":0,\"passiveRate\":50},{\"name\":\"Thoph\\u00e9\",\"cost\":1000,\"quantity\":0,\"passiveRate\":100}]'),(2,'aka','$2y$10$qi5vab/dxFFdWUdHvIxRKe8j8EViuhD1jiuWzQ.qENHDGusHHKhau',1,47,'[{\"name\":\"Swipe a gauche\",\"cost\":14,\"quantity\":2,\"passiveRate\":1},{\"name\":\"Swipe a droite\",\"cost\":50,\"quantity\":0,\"passiveRate\":5},{\"name\":\"Super Like\",\"cost\":100,\"quantity\":0,\"passiveRate\":10},{\"name\":\"Message\",\"cost\":200,\"quantity\":0,\"passiveRate\":20},{\"name\":\"Appel\",\"cost\":500,\"quantity\":0,\"passiveRate\":50},{\"name\":\"Date\",\"cost\":1000,\"quantity\":0,\"passiveRate\":100}]'),(4,'robert','$2y$10$yhnwond01DRxaEXLA30Ij.952hDjSSA5ktDVnLgHiTr5ejzsyLa42',1,7,'[{\"name\":\"Swipe a gauche\",\"cost\":12,\"quantity\":1,\"passiveRate\":1},{\"name\":\"Swipe a droite\",\"cost\":58,\"quantity\":1,\"passiveRate\":5},{\"name\":\"Super Like\",\"cost\":100,\"quantity\":0,\"passiveRate\":10},{\"name\":\"Message\",\"cost\":200,\"quantity\":0,\"passiveRate\":20},{\"name\":\"Appel\",\"cost\":500,\"quantity\":0,\"passiveRate\":50},{\"name\":\"Date\",\"cost\":1000,\"quantity\":0,\"passiveRate\":100}]');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'clicker2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-07 19:32:49
