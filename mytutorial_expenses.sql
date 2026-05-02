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
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `Expense_ID` int NOT NULL AUTO_INCREMENT,
  `Expense_Name` varchar(45) NOT NULL,
  `Expense_Amount` float NOT NULL,
  `Expense_Datetime` datetime NOT NULL,
  `Expense_Remarks` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Expense_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,'Electric Bill',2321.59,'2019-11-26 09:52:01','VECO'),(2,'Water Bill',521.61,'2019-11-26 09:52:01','MCWD'),(3,'Internet Bill',839,'2019-11-26 09:52:01','PLDT'),(4,'Life Insurance',2063.77,'2019-11-26 09:52:01','MANULIFE'),(5,'Tithes',1000,'2019-11-26 09:52:01',NULL),(6,'Meal Allowance',450,'2019-11-26 09:52:01',NULL),(7,'Transpo',196,'2019-11-26 09:52:01','PUJ'),(8,'Snacks',756,'2019-11-26 09:52:01',NULL),(9,'Hygenics',250,'2019-11-26 09:52:01',NULL),(10,'Vitamins',770,'2019-11-26 09:52:01',NULL),(11,'Groceries',1000,'2019-11-26 09:52:01',NULL),(29,'Internet Bill',1400,'2022-12-08 08:40:48','PLDTL'),(30,'Electric Bill',2400,'2019-12-26 09:52:01','Test VECO'),(31,'Snacks',200,'2022-12-08 08:58:00','Yummy snacks'),(32,'Internet Bill',1400,'2022-12-08 10:11:01','PLDT Home Fiber');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-08 11:33:10
