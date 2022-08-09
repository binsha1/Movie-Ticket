-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: movie_ticket
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(100) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `movie_format` varchar(45) DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `trailer_url` varchar(100) DEFAULT NULL,
  `poster` varchar(100) DEFAULT NULL,
  `wallpaper` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Rocketry','2022-06-29','3D','Drama','English','02:30:00','https://youtu.be/nvOB1uGUSl0','rocketry.jpg','rocketry_wallpaper.jpg','A biographical drama based on the life of former ISRO scientist Nambi Narayanan, who fought years on end for justice after being falsely accused of espionage.'),(3,'Spider-Man: No Way Home','2021-06-16','3D','Adventure','English','02:00:00','https://youtu.be/o_beiBRTp1c','spider_man-poster.jpg','spider-wallpaper.jpg','When Dr. Strange`s spell to restore Spider-Man`s identity goes awry, Peter is forced to overcome his greatest challenge yet.'),(5,'Kaduva','2022-07-07','2D','Action','Malayalam','02:30:00','https://youtu.be/qNHJrP3ihy8','kaduva.jpg','kaduva-wallpaper.jpg','Set in the late 90s, Kaduva revolves around the life of a young rubber planter from Mundakayam and his rivalry with a high ranking officer in the Kerala Police.'),(9,'dfgdf','2022-07-23','3D','Action','Malayalam','02:00:00','dgdf','pic-2.jpg','event-single.jpg','sgsgsg'),(10,'fdgfdgfd','2022-08-26','2D','Comedy','English','02:03:00','sgss','b2.jpg','b4.jpg','cbxchfdfg'),(11,'sdgsdg','2022-07-07','3D','Action','English','02:00:00','sdg','e1.jpg','f2.jpg','sdgsdgsd');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-09 18:32:17
