-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mytutorial
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `expense_report`
--

DROP TABLE IF EXISTS `expense_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_report` (
  `Entry_ID` int NOT NULL AUTO_INCREMENT,
  `Entry_Name` varchar(45) NOT NULL,
  `Entry_Amount` float NOT NULL,
  `Entry_Year` varchar(4) NOT NULL,
  `Entry_Month` varchar(6) NOT NULL,
  PRIMARY KEY (`Entry_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_report`
--

LOCK TABLES `expense_report` WRITE;
/*!40000 ALTER TABLE `expense_report` DISABLE KEYS */;
INSERT INTO `expense_report` VALUES (1,'Electricity',1321.59,'2019','Jan'),(2,'Electricity',830.54,'2019','Feb'),(3,'Electricity',1986.62,'2019','Mar'),(4,'Electricity',2400,'2019','Apr'),(5,'Electricity',2500,'2019','May'),(6,'Electricity',2600,'2019','Jun'),(7,'Electricity',2600,'2019','Jul'),(8,'Electricity',1300,'2019','Aug'),(9,'Electricity',1200,'2019','Sep'),(10,'Electricity',1986.62,'2019','Oct'),(11,'Electricity',1100,'2019','Nov'),(12,'Electricity',1200,'2019','Dec'),(25,'Water',521.61,'2019','Jan'),(26,'Water',492.83,'2019','Feb'),(27,'Water',616.67,'2019','Mar'),(28,'Water',492.83,'2019','Apr'),(29,'Water',487.11,'2019','May'),(30,'Water',600,'2019','Jun'),(31,'Water',700,'2019','Jul'),(32,'Water',700,'2019','Aug'),(33,'Water',700,'2019','Sep'),(34,'Water',521.61,'2019','Oct'),(35,'Water',492.83,'2019','Nov'),(36,'Water',616.67,'2019','Dec'),(37,'Internet',839,'2019','Jan'),(38,'Internet',838.02,'2019','Feb'),(39,'Internet',1004,'2019','Mar'),(40,'Internet',1000,'2019','Apr'),(41,'Internet',958.02,'2019','May'),(42,'Internet',999,'2019','Jun'),(43,'Internet',1000,'2019','Jul'),(44,'Internet',1000,'2019','Aug'),(45,'Internet',1000,'2019','Sep'),(46,'Internet',1004,'2019','Oct'),(47,'Internet',0,'2019','Nov'),(48,'Internet',958.02,'2019','Dec');
/*!40000 ALTER TABLE `expense_report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-10 11:41:23
