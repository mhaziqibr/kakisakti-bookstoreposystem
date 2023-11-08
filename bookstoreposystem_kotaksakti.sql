-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookingposystem
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL,
  `name` text,
  `email` text,
  `tel` bigint DEFAULT NULL,
  `created_at` text,
  `updated_at` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Irfan Bakti','irfan88@example.com',60123456789,'7/8/2019 8:13','7/8/2019 8:13'),(2,'Jack Smmith','jack.smmith@acme.io',60132456781,'7/8/2019 8:13','7/8/2019 8:13'),(3,'Nazir','',601185000000,'7/8/2019 8:13','7/8/2019 8:13'),(4,'Faiz Ma','faiz.ma@jholow.cn',6019772002,'7/8/2019 8:13','7/8/2019 8:13'),(5,'Isham Rais','isham@pmo.gov.my',60135482020,'7/8/2019 8:13','7/8/2019 8:13'),(6,'Shanon Teoh','shahnon.teoh@st.com.sg',NULL,'7/8/2019  8:13','7/8/2019  8:13');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_lines`
--

DROP TABLE IF EXISTS `invoice_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_lines` (
  `id` double NOT NULL,
  `description` text,
  `unit_price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `tax_total` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `tax_id` text,
  `sku_id` int DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id_idx` (`invoice_id`),
  CONSTRAINT `invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_lines`
--

LOCK TABLES `invoice_lines` WRITE;
/*!40000 ALTER TABLE `invoice_lines` DISABLE KEYS */;
INSERT INTO `invoice_lines` VALUES (1,'Book #1',30,1,30,0,30,NULL,1,1),(2,'Book #2',25,4,100,0,100,NULL,2,2),(3,'Book #3',50,1,50,0,50,NULL,3,2),(4,'Book #1',30,1,30,0,30,NULL,1,3),(5,'Book #1',30,1,30,0,30,NULL,1,4),(6,'Book #2',25,1,25,0,25,NULL,2,4),(7,'Book #1',30,5,150,0,150,NULL,1,5),(8,'Book #3',50,6,300,0,300,NULL,3,5);
/*!40000 ALTER TABLE `invoice_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` int NOT NULL,
  `number` int DEFAULT NULL,
  `sub_total` int DEFAULT NULL,
  `tax_total` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `created_at` text,
  `updated_at` text,
  PRIMARY KEY (`id`),
  KEY `customer_id_idx` (`customer_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,20190001,30,0,30,1,'7/8/2019 8:13','7/8/2019 8:13'),(2,20190002,150,0,150,2,'7/8/2019 8:13','7/8/2019 8:13'),(3,20190003,30,0,30,2,'15/9/2019 8:13','15/9/2019 8:13'),(4,20190004,55,0,55,3,'15/9/2019 8:13','15/9/2019 8:13'),(5,20190005,450,0,0,6,'15/9/2019 8:13','15/9/2019 8:13');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08 10:01:16
