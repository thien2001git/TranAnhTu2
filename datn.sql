-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: laptopstore
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `account_detail`
--

DROP TABLE IF EXISTS `account_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `birthdate` datetime NOT NULL,
  `email` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `account_id` bigint DEFAULT NULL,
  `address` varchar(265) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9ova18pr7v2oy5naxm6godxg3` (`account_id`),
  CONSTRAINT `FK9ova18pr7v2oy5naxm6godxg3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_detail`
--

LOCK TABLES `account_detail` WRITE;
/*!40000 ALTER TABLE `account_detail` DISABLE KEYS */;
INSERT INTO `account_detail` VALUES (1,'2022-08-27 00:00:00','tanvx308@gmail.com','Vũ Xuân Tân','Nam','0366202468',1,'Hà Nội 36 phố phường'),(2,'2022-08-28 00:00:00','minhminhnc@gmail.com','Nguyễn Công Minh','Nữ','0697856354',2,'xxx, Phường Ngọc Thụy, Quận Long Biên, Thành phố Hà Nội'),(3,'2001-04-02 00:00:00','chudai010421@gmail.com','Chu Văn Đài','Nam','0587719303',3,''),(4,'1996-08-07 00:00:00','hunghv070896@gmail.com','Hoàng Văn Hưng','Nam','0364690214',4,''),(5,'2001-02-06 00:00:00','manhqnph11859@fpt.edu.vn','Quách Ngọc Mạnh','Nữ','0365046857',5,''),(6,'2001-03-07 00:00:00','hieuncph12247@fpt.edu.vn','Nguyễn Công Hiếu','Nam','0965799576',6,''),(7,'2022-08-27 00:00:00','minhncph13186@fpt.edu.vn','Chu Công Minh','Nam','0987654321',7,'69 Long Biên'),(8,'2022-08-28 00:00:00','minh17cm@fpt.edu.vn','Chu Công Minh','Nữ','0987654321',8,'69 Long Biên, Mỹ'),(9,'2022-07-24 00:00:00','tuanhaph12996@fpt.edu.vn','Chu Công Minh','Nam','0987654321',9,'HN'),(10,'2022-07-24 00:00:00','englishvillashare@gmail.com','Chu Công Minh','Nữ','0987654321',10,'HN'),(11,'2022-07-24 00:00:00','tanvx308@gmail.com','Vu Xuan Tan','Nam','0987654321',11,'số 55 Tổ Dân Phố Đông Ba'),(12,'2022-07-24 00:00:00','minhcmc69@gmail.com','Chu Công Minh','Nữ','0987654321',12,'Long Biên'),(13,'2022-07-24 00:00:00','minhncph1318@fpt.edu.vn','Chu Công Minh','Nữ','0987654321',13,'Long Biên'),(14,'2022-08-07 00:00:00','minhncph13185@fpt.edu.vn','Chu Công Minh','Nữ','0987654321',14,'HN'),(15,'2022-08-28 00:00:00','minhncph13186@cmc.vn','Công Minh Khinh Người','Nữ','0987654321',15,'Long Biên');
/*!40000 ALTER TABLE `account_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `modify_date` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_k8h1bgqoplx0rkngj01pm1rgp` (`username`),
  KEY `FKt3wava8ssfdspnh3hg4col3m1` (`role_id`),
  CONSTRAINT `FKt3wava8ssfdspnh3hg4col3m1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'2022-06-01',1,'2022-08-27','$2a$10$8u4b.UhMGLoKB4UUGED3ZOPBQCF2jh9VSRqCeGqoXNTMshs3zACli','tanvx',1),(2,'2022-06-01',1,'2022-08-28','$2a$10$wGrHJdgHvTaqlNxxreKtNO4rttRSUgRFZ4LfYeBCRfPFUCvZ5pYCa','minhnc',3),(3,'2022-06-01',1,'2022-06-01','$2a$10$DnZ83rlh.z.Wvua5MOYCuu0oXvosnyuRIdmPQxwMPVqn.0Rbw.MJC','daicv',2),(4,'2022-06-01',1,'2022-06-01','$2a$10$wt9PMeccQR5I.qyX2.lseOtu5BvRd9019bHnD.m02N1gQ/wkL9koa','manhnq',3),(5,'2022-06-01',1,'2022-06-01','$2a$10$LF8y3CRaXeymrPGU33eEsO1GwrffjgwnfMb17MQLzYpJCWXlOhX/6','hunghv',3),(6,'2022-06-01',1,'2022-06-01','$2a$10$WfghWo8b0Xmg.2jkNoWaz.N/3kH.TPQAM4uipGQ0sgLiogKYTXKU6','hieunv',3),(7,'2022-07-17',1,'2022-07-17','$2a$10$knFYVxG563kfNlbXCYg1bOrzXm3a5ZiNLt4SrCAO1heM5kp62swMu','sa',2),(8,'2022-07-17',1,'2022-08-28','$2a$10$tiUL9aNM9K9jD6/F/3XZzup0OZRDVKCltCAbu/2K4KoVGMxR5RjsO','minh17cm',3),(9,'2022-07-24',1,'2022-07-24','$2a$10$LuofhzCEhaPKArDsyaVT4OSwvvzOdElvkSZedW.vOuJUp90toZqDW','sa999',3),(10,'2022-07-24',1,'2022-07-24','$2a$10$3EnWRztWKm8Q8Pw4yLPvL.GGUvLzU0x7sX/7rkdyQBzowkLNmddgS','minhnc69',3),(11,'2022-07-24',1,'2022-07-24','$2a$10$QwKSpsnbVVikqiPZbd90UeXZ3UIcsV2OL81GZHsoscoQgibXK3HgS','tanvx_fsoft',3),(12,'2022-07-24',1,'2022-07-24','$2a$10$oGQgxgycDxqDiLMyiUNl2.U5e5V.w81cnNq3J9oEmlxDWsHLaodXy','minhnc_cmc',3),(13,'2022-07-24',0,'2022-07-24','$2a$10$0zqRKuezJ0O5NOuI9pU2iuWYLzcu80sn2EMGEett7k8/WyqiWiY96','sa123',3),(14,'2022-08-07',1,'2022-08-07','$2a$10$C.S4KmQz6GrbLoZ7HZYBs.Hakk0oQvZJv/uOvKVFUfRnJqLFFcnqa','sa22',3),(15,'2022-08-08',1,'2022-08-28','$2a$10$f80O3iOaPSYiBEBemo4ZQupIJDbdGIYRCr7LnzHVbbWS0MMrhP19.','minh69cmc',3);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date NOT NULL,
  `modify_date` date NOT NULL,
  `price` double NOT NULL,
  `size` int NOT NULL,
  `stock` int NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `cache` int NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdmxq368cv2u55c08l151uhwer` (`product_id`),
  CONSTRAINT `FKdmxq368cv2u55c08l151uhwer` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` VALUES (1,'2022-06-01','2022-06-01',1250000,39,20,2,3,'Giày Sneaker Adidas Eq21 Triple Black'),(2,'2022-06-01','2022-06-01',1350000,40,10,2,7,'Giày Sneaker Adidas Eq21 Triple Black'),(3,'2022-06-01','2022-06-01',1450000,41,7,2,2,'Giày Sneaker Adidas Eq21 Triple Black'),(4,'2022-06-01','2022-06-01',1320000,39,10,3,6,'Giày Sneaker Adidas Stansmith Mule'),(5,'2022-06-01','2022-06-01',1420000,40,10,3,6,'Giày Sneaker Adidas Stansmith Mule'),(6,'2022-06-01','2022-06-01',1520000,41,5,3,1,'Giày Sneaker Adidas Stansmith Mule'),(7,'2022-06-01','2022-06-01',1610000,39,4,4,2,'Giày Sneaker Adidas 4d Fwd Pulse'),(8,'2022-06-01','2022-06-01',17100000,40,9,4,1,'Giày Sneaker Adidas 4d Fwd Pulse'),(9,'2022-06-01','2022-06-01',18100000,41,10,4,0,'Giày Sneaker Adidas 4d Fwd Pulse'),(10,'2022-06-01','2022-06-01',1200000,39,14,1,0,'Giày Sneaker Adidas Bravada NAM ANA'),(11,'2022-06-01','2022-06-01',1300000,40,9,1,0,'Giày Sneaker Adidas Bravada NAM ANA'),(12,'2022-06-01','2022-06-01',1400000,41,9,1,0,'Giày Sneaker Adidas Bravada NAM ANA'),(13,'2022-06-01','2022-06-01',1300000,39,10,20,0,'Chuck Taylor All Star Classic AB'),(14,'2022-06-01','2022-06-01',1400000,40,10,20,0,'Chuck Taylor All Star Classic AB'),(15,'2022-06-01','2022-06-01',1500000,41,10,20,0,'Chuck Taylor All Star Classic AB'),(16,'2022-06-01','2022-06-01',1400000,39,10,19,0,'Giày Thể Thao Fila Shiny Pink '),(17,'2022-06-01','2022-06-01',1500000,40,10,19,0,'Giày Thể Thao Fila Shiny Pink '),(18,'2022-06-01','2022-06-01',1600000,41,10,19,0,'Giày Thể Thao Fila Shiny Pink '),(19,'2022-06-01','2022-06-01',1500000,39,5,5,3,'GIÀY NIKE RENEW RIDE 3 NỮ'),(20,'2022-06-01','2022-06-01',1600000,40,10,5,0,'GIÀY NIKE RENEW RIDE 3 NỮ'),(21,'2022-06-01','2022-06-01',1700000,41,10,5,0,'GIÀY NIKE RENEW RIDE 3 NỮ'),(22,'2022-06-01','2022-06-01',1600000,39,10,6,0,'GIÀY NIKE AIR ZOOM PEGASUS NAM '),(23,'2022-06-01','2022-06-01',1700000,40,10,6,0,'GIÀY NIKE AIR ZOOM PEGASUS NAM '),(24,'2022-06-01','2022-06-01',1800000,41,10,6,0,'GIÀY NIKE AIR ZOOM PEGASUS NAM '),(25,'2022-06-01','2022-06-01',1550000,39,10,8,0,'GIÀY NIKE AIR ZOOM RIVAL FLY'),(26,'2022-06-01','2022-06-01',1650000,40,10,8,0,'GIÀY NIKE AIR ZOOM RIVAL FLY'),(27,'2022-06-01','2022-06-01',1750000,41,10,8,0,'GIÀY NIKE AIR ZOOM RIVAL FLY'),(28,'2022-06-01','2022-06-01',1650000,39,10,9,0,'REEBOK ROYAL TECHQUET DEPOR ACE NAE'),(29,'2022-06-01','2022-06-01',1750000,40,10,9,0,'REEBOK ROYAL TECHQUET DEPOR ACE NAE'),(30,'2022-06-01','2022-06-01',1850000,41,10,9,0,'REEBOK ROYAL TECHQUET DEPOR ACE NAE'),(31,'2022-06-01','2022-06-01',1750000,39,10,10,0,'REEBOK ROYAL COMPLETE CLN2 HAZN AB'),(32,'2022-06-01','2022-06-01',1850000,40,10,10,0,'REEBOK ROYAL COMPLETE CLN2 HAZN AB'),(33,'2022-06-01','2022-06-01',1950000,41,10,10,0,'REEBOK ROYAL COMPLETE CLN2 HAZN AB'),(34,'2022-06-01','2022-06-01',1850000,39,10,11,0,'LIQUIFECT 902 BR AUTMAX AB SN'),(35,'2022-06-01','2022-06-01',1950000,40,10,11,0,'LIQUIFECT 902 BR AUTMAX AB SN'),(36,'2022-06-01','2022-06-01',2050000,41,10,11,0,'LIQUIFECT 902 BR AUTMAX AB SN'),(37,'2022-06-01','2022-06-01',1850000,39,10,12,0,'HIIT TR 2.0 FIFA ZATHER ONE'),(38,'2022-06-01','2022-06-01',1950000,40,10,12,0,'HIIT TR 2.0 FIFA ZATHER ONE'),(39,'2022-06-01','2022-06-01',2050000,41,10,12,0,'HIIT TR 2.0 FIFA ZATHER ONE'),(40,'2022-06-01','2022-06-01',1950000,39,7,13,2,'GIÀY PUMA ANZARUB LITE NAM A1'),(41,'2022-06-01','2022-06-01',2050000,40,10,13,0,'GIÀY PUMA ANZARUB LITE NAM A1'),(42,'2022-06-01','2022-06-01',2150000,41,10,13,0,'GIÀY PUMA ANZARUB LITE NAM A1'),(43,'2022-06-01','2022-06-01',2050000,39,10,14,0,'GIÀY PUMA CAVEN NỮ AB CAP'),(44,'2022-06-01','2022-06-01',2150000,40,10,14,0,'GIÀY PUMA CAVEN NỮ AB CAP'),(45,'2022-06-01','2022-06-01',2250000,41,10,14,0,'GIÀY PUMA CAVEN NỮ AB CAP'),(46,'2022-06-01','2022-06-01',2050000,39,10,15,0,'GIÀY PUMA ELICTIRIFY NITRO NAM BB'),(47,'2022-06-01','2022-06-01',2150000,40,10,15,0,'GIÀY PUMA ELICTIRIFY NITRO NAM BB'),(48,'2022-06-01','2022-06-01',2250000,41,10,15,0,'GIÀY PUMA ELICTIRIFY NITRO NAM BB'),(49,'2022-06-01','2022-06-01',2050000,39,10,16,0,'GIÀY PUMA RALPH SAMPSON LO JOKER'),(50,'2022-06-01','2022-06-01',2150000,40,10,16,0,'GIÀY PUMA RALPH SAMPSON LO JOKER'),(51,'2022-06-01','2022-06-01',2250000,41,10,16,0,'GIÀY PUMA RALPH SAMPSON LO JOKER'),(52,'2022-06-01','2022-06-01',2150000,39,10,17,0,'Giày Fila Unisex Como Mule Trắng'),(53,'2022-06-01','2022-06-01',2250000,40,10,17,0,'Giày Fila Unisex Como Mule Trắng'),(54,'2022-06-01','2022-06-01',2350000,41,10,17,0,'Giày Fila Unisex Como Mule Trắng'),(55,'2022-06-01','2022-06-01',2250000,39,10,18,0,'Giày Fila Unisex Scanline Mule Đen'),(56,'2022-06-01','2022-06-01',2350000,40,10,18,0,'Giày Fila Unisex Scanline Mule Đen'),(57,'2022-06-01','2022-06-01',2450000,41,10,18,0,'Giày Fila Unisex Scanline Mule Đen'),(58,'2022-06-01','2022-06-01',2350000,39,9,21,1,'Chuck Taylor All Star Crafted Stripes'),(59,'2022-06-01','2022-06-01',2450000,40,10,21,0,'Chuck Taylor All Star Crafted Stripes'),(60,'2022-06-01','2022-06-01',2550000,41,10,21,0,'Chuck Taylor All Star Crafted Stripes'),(61,'2022-06-01','2022-06-01',2350000,39,10,22,0,'Chuck 70 Seasonal Color CX CATER'),(62,'2022-06-01','2022-06-01',2450000,40,10,22,0,'Chuck 70 Seasonal Color CX CATER'),(63,'2022-06-01','2022-06-01',2550000,41,10,22,0,'Chuck 70 Seasonal Color CX CATER'),(64,'2022-06-01','2022-06-01',2350000,39,10,23,0,'Chuck Taylor All Star Lift Platform'),(65,'2022-06-01','2022-06-01',2450000,40,10,23,0,'Chuck Taylor All Star Lift Platform'),(66,'2022-06-01','2022-06-01',2550000,41,10,23,0,'Chuck Taylor All Star Lift Platform'),(67,'2022-06-01','2022-06-01',2350000,39,10,24,0,'Giày Super Light 19 nam AB'),(68,'2022-06-01','2022-06-01',2450000,40,10,24,0,'Giày Super Light 19 nam AB'),(69,'2022-06-01','2022-06-01',2550000,41,10,24,0,'Giày Super Light 19 nam AB'),(70,'2022-06-01','2022-06-01',2350000,39,10,25,0,'Giày chạy bộ nam SUPER ID'),(71,'2022-06-01','2022-06-01',2450000,40,10,25,0,'Giày chạy bộ nam SUPER ID'),(72,'2022-06-01','2022-06-01',2550000,41,10,25,0,'Giày chạy bộ nam SUPER ID'),(73,'2022-06-01','2022-06-01',2350000,39,9,26,0,'Giày chạy bộ nữ SUPER ID'),(74,'2022-06-01','2022-06-01',2450000,40,10,26,0,'Giày chạy bộ nữ SUPER ID'),(75,'2022-06-01','2022-06-01',2550000,41,10,26,0,'Giày chạy bộ nữ SUPER ID'),(76,'2022-06-01','2022-06-01',2350000,39,10,27,9,'Giày chạy bộ thể thao nữ'),(77,'2022-06-01','2022-06-01',2450000,40,10,27,0,'Giày chạy bộ thể thao nữ'),(78,'2022-06-01','2022-06-01',2550000,41,10,27,0,'Giày chạy bộ thể thao nữ'),(79,'2022-06-01','2022-06-01',2450000,39,7,7,1,'GIÀY NIKE AIR ZOOM PEGASUS NỮ'),(80,'2022-06-01','2022-06-01',2550000,40,10,7,0,'GIÀY NIKE AIR ZOOM PEGASUS NỮ'),(81,'2022-06-01','2022-06-01',2650000,41,10,7,0,'GIÀY NIKE AIR ZOOM PEGASUS NỮ'),(82,'2022-07-31','2022-07-31',1500000,39,7,28,1,'Giày Adidas BOA'),(83,'2022-07-31','2022-07-31',1600000,40,10,28,0,'Giày Adidas BOA'),(84,'2022-07-31','2022-07-31',1700000,41,9,28,1,'Giày Adidas BOA'),(85,'2022-07-31','2022-07-31',1500000,39,7,29,3,'ADIDAS BOA New'),(86,'2022-07-31','2022-07-31',1600000,40,10,29,0,'ADIDAS BOA New'),(87,'2022-07-31','2022-07-31',1700000,41,10,29,0,'ADIDAS BOA New'),(88,'2022-07-31','2022-07-31',2000000,39,4,30,3,'NIKE 2022'),(89,'2022-07-31','2022-07-31',2500000,40,10,30,0,'NIKE 2022'),(90,'2022-07-31','2022-07-31',3000000,41,10,30,0,'NIKE 2022'),(91,'2022-07-31','2022-07-31',3500000,42,10,30,0,'NIKE 2022'),(92,'2022-07-31','2022-07-31',500000,38,9,31,2,'ADIDAS Super Ultra'),(93,'2022-07-31','2022-07-31',700000,39,3,31,17,'ADIDAS Super Ultra'),(94,'2022-07-31','2022-07-31',1000000,40,13,31,0,'ADIDAS Super Ultra'),(95,'2022-07-31','2022-07-31',1500000,41,14,31,0,'ADIDAS Super Ultra'),(96,'2022-08-27','2022-08-27',4000000,39,10,32,0,'Ultraboost'),(97,'2022-08-27','2022-08-27',4500000,40,9,32,0,'Ultraboost'),(98,'2022-08-27','2022-08-27',5000000,41,10,32,0,'Ultraboost'),(99,'2022-08-27','2022-08-27',5500000,42,9,32,0,'Ultraboost'),(100,'2022-08-28','2022-08-28',10500000,36,1,33,0,'Gucci Gang'),(101,'2022-08-28','2022-08-28',11000000,37,4,33,0,'Gucci Gang'),(102,'2022-08-28','2022-08-28',12000000,38,4,33,0,'Gucci Gang'),(103,'2022-08-28','2022-08-28',13000000,39,5,33,0,'Gucci Gang'),(104,'2022-08-28','2022-08-28',24000000,40,4,33,0,'Gucci Gang'),(105,'2022-08-28','2022-08-28',15000000,41,4,33,0,'Gucci Gang'),(106,'2022-08-28','2022-08-28',16000000,42,5,33,0,'Gucci Gang'),(107,'2022-08-28','2022-08-28',17000000,43,5,33,0,'Gucci Gang'),(108,'2022-08-28','2022-08-28',18000000,44,5,33,0,'Gucci Gang'),(109,'2022-08-28','2022-08-28',19000000,45,5,33,0,'Gucci Gang'),(110,'2022-08-28','2022-08-28',1200000,39,5,34,0,'Gucci000'),(111,'2022-08-28','2022-08-28',2000000,40,5,34,0,'Gucci000'),(112,'2022-08-28','2022-08-28',2500000,41,5,34,0,'Gucci000'),(113,'2022-08-28','2022-08-28',3000000,42,5,34,0,'Gucci000');
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `modify_date` date NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'2022-06-01','PUMA','puma.jpg',_binary '','2022-07-14','PUMA'),(2,'2022-06-01','REEBOK','reeebok.jpg',_binary '','2022-06-01','REEBOK'),(3,'2022-06-01','NIKE','nike.jpg',_binary '','2022-07-21','NIKE'),(4,'2022-06-01','ADIDAS','adidas.jpg',_binary '','2022-06-01','ADIDAS'),(5,'2022-06-01','FILA','Dfila.jpg',_binary '','2022-06-01','FILA'),(6,'2022-06-01','CONVERSE vintage','converse.jpg',_binary '','2022-07-14','CONVERSE'),(7,'2022-06-01','LI-NING  của Trung Quốc','lining.jpg',_binary '','2022-07-14','LI-NING'),(8,'2022-07-14','Local brand của Công Minh Idol',NULL,_binary '\0','2022-07-17','Gucci');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  `attribute_id` bigint DEFAULT NULL,
  `last_price` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr73mlc9qnqbuohor52oa82e8u` (`account_id`),
  KEY `FKqqnwtpr34wi90lptk7a4pd66` (`attribute_id`),
  CONSTRAINT `FKqqnwtpr34wi90lptk7a4pd66` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`),
  CONSTRAINT `FKr73mlc9qnqbuohor52oa82e8u` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (1,0,1,10,960000,0),(2,0,1,1,1000000,0),(3,0,1,6,1216000,0),(4,0,2,1,1000000,0),(5,0,2,7,1610000,0),(6,0,2,6,1216000,0),(7,0,2,10,960000,0),(8,0,2,19,1200000,0),(9,0,2,4,1056000,0),(10,0,2,11,1040000,0),(11,0,2,3,1160000,0),(12,0,2,12,1120000,0),(13,0,2,22,800000,0),(14,0,2,23,850000,0),(15,0,2,76,1645000,0),(16,0,2,73,1880000,0),(17,0,2,93,490000,0),(18,3,2,88,1400000,1),(19,2,11,93,490000,1),(20,1,11,88,1400000,1),(21,0,11,55,1575000,0),(22,0,11,49,2050000,0),(23,0,11,40,1950000,0),(24,0,11,58,1645000,0),(25,0,2,92,350000,0),(26,0,11,85,1350000,0),(27,0,11,94,700000,0),(28,0,11,92,350000,0),(29,0,11,79,2450000,0),(30,0,11,82,1350000,0),(31,0,11,104,11200000,0),(32,0,11,102,9600000,0),(33,1,11,109,15200000,1),(34,1,11,110,840000,1),(35,0,11,105,12000000,0),(36,0,11,99,3850000,0),(37,1,11,70,2350000,1),(38,1,11,89,1750000,1);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `modify_date` date NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'2022-06-01','Giày Nam',_binary '','2022-07-21','Giày Nam'),(2,'2022-06-01','Giày Nữ',_binary '','2022-06-01','Giày Nữ'),(3,'2022-06-01','Giày Trẻ Em',_binary '','2022-06-01','Giày Trẻ Em'),(4,'2022-06-01','Giày Ðá Bóng',_binary '','2022-06-01','Giày Ðá Bóng'),(5,'2022-06-01','Giày Thời Trang',_binary '','2022-06-01','Giày Thời Trang'),(6,'2022-06-01','Giày bóng rổ',_binary '','2022-07-15','Giày bóng rổ'),(7,'2022-06-01','Giày chạy bộ nè',_binary '','2022-07-15','Giày chạy bộ');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `modify_date` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKghwsjbjo7mg3iufxruvq6iu3q` (`product_id`),
  CONSTRAINT `FKghwsjbjo7mg3iufxruvq6iu3q` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'2022-06-01','Fw2888.jpg',_binary '','2022-06-01','main',1),(2,'2022-06-01','Fw2888_1.jpg',_binary '','2022-06-01','other',1),(3,'2022-06-01','Fw2888_2.jpg',_binary '','2022-06-01','other',1),(4,'2022-06-01','Fw2888_3.jpg',_binary '','2022-06-01','other',1),(5,'2022-06-01','Fw2888_4.jpg',_binary '','2022-06-01','other',1),(6,'2022-06-01','Fw2888_5.jpg',_binary '','2022-06-01','other',1),(7,'2022-06-01','H00521.jpg',_binary '','2022-06-01','main',2),(8,'2022-06-01','H00521_1.jpg',_binary '','2022-06-01','other',2),(9,'2022-06-01','H00521_2.jpg',_binary '','2022-06-01','other',2),(10,'2022-06-01','H00521_3.jpg',_binary '','2022-06-01','other',2),(11,'2022-06-01','H00521_4.jpg',_binary '','2022-06-01','other',2),(12,'2022-06-01','H00521_5.jpg',_binary '','2022-06-01','other',2),(13,'2022-06-01','Fx5849.jpg',_binary '','2022-06-01','main',3),(14,'2022-06-01','Fx5849_1.jpg',_binary '','2022-06-01','other',3),(15,'2022-06-01','Fx5849_2.jpg',_binary '','2022-06-01','other',3),(16,'2022-06-01','Fx5849_3.jpg',_binary '','2022-06-01','other',3),(17,'2022-06-01','Fx5849_4.jpg',_binary '','2022-06-01','other',3),(18,'2022-06-01','Fx5849_5.jpg',_binary '','2022-06-01','other',3),(19,'2022-06-01','h026064.jpg',_binary '','2022-06-01','main',19),(20,'2022-06-01','h026064_1.jpg',_binary '','2022-06-01','other',9),(21,'2022-06-01','h026064_2.jpg',_binary '','2022-06-01','other',19),(22,'2022-06-01','h026064_3.jpg',_binary '','2022-06-01','other',19),(23,'2022-06-01','h026064_4.jpg',_binary '','2022-06-01','other',19),(24,'2022-06-01','h026064_5.jpg',_binary '','2022-06-01','other',19),(25,'2022-06-01','A00416C.png',_binary '','2022-06-01','main',21),(26,'2022-06-01','A00416C_1.jpg',_binary '','2022-06-01','other',21),(27,'2022-06-01','A00416C_2.jpg',_binary '','2022-06-01','other',21),(28,'2022-06-01','A00416C_3.jpg',_binary '','2022-06-01','other',21),(29,'2022-06-01','A00416C_4.jpg',_binary '','2022-06-01','other',21),(30,'2022-06-01','A00416C_5.jpg',_binary '','2022-06-01','other',21),(31,'2022-06-01','M7650.png',_binary '','2022-06-01','main',20),(32,'2022-06-01','M7650_1.jpg',_binary '','2022-06-01','other',20),(33,'2022-06-01','M7650_2.jpg',_binary '','2022-06-01','other',20),(34,'2022-06-01','M7650_3.jpg',_binary '','2022-06-01','other',20),(35,'2022-06-01','M7650_4.jpg',_binary '','2022-06-01','other',20),(36,'2022-06-01','M7650_5.jpg',_binary '','2022-06-01','other',20),(37,'2022-06-01','Q46225.jpg',_binary '','2022-06-01','main',4),(38,'2022-06-01','Q46225_1.jpg',_binary '','2022-06-01','other',4),(39,'2022-06-01','Q46225_2.jpg',_binary '','2022-06-01','other',4),(40,'2022-06-01','Q46225_3.jpg',_binary '','2022-06-01','other',4),(41,'2022-06-01','Q46225_4.jpg',_binary '','2022-06-01','other',4),(42,'2022-06-01','Q46225_5.jpg',_binary '','2022-06-01','other',4),(43,'2022-06-01','MSN913.jpg',_binary '','2022-06-01','main',5),(44,'2022-06-01','MSN913_1.jpg',_binary '','2022-06-01','other',5),(45,'2022-06-01','MSN913_2.jpg',_binary '','2022-06-01','other',5),(46,'2022-06-01','MSN913_3.jpg',_binary '','2022-06-01','other',5),(47,'2022-06-01','MSN913_4.jpg',_binary '','2022-06-01','other',5),(48,'2022-06-01','MSN913_5.jpg',_binary '','2022-06-01','other',5),(49,'2022-06-01','MSN911.jpg',_binary '','2022-06-01','main',6),(50,'2022-06-01','MSN911_1.jpg',_binary '','2022-06-01','other',6),(51,'2022-06-01','MSN911_2.jpg',_binary '','2022-06-01','other',6),(52,'2022-06-01','MSN911_3.jpg',_binary '','2022-06-01','other',6),(53,'2022-06-01','MSN911_4.jpg',_binary '','2022-06-01','other',6),(54,'2022-06-01','MSN911_5.jpg',_binary '','2022-06-01','other',6),(55,'2022-06-01','MSN910.jpg',_binary '','2022-06-01','main',7),(56,'2022-06-01','MSN910_1.jpg',_binary '','2022-06-01','other',7),(57,'2022-06-01','MSN910_3.jpg',_binary '','2022-06-01','other',7),(58,'2022-06-01','MSN910_4.jpg',_binary '','2022-06-01','other',7),(59,'2022-06-01','MSN910_5.jpg',_binary '','2022-06-01','other',7),(60,'2022-06-01','MSN910_6.jpg',_binary '','2022-06-01','other',7),(61,'2022-06-01','MSN908.jpg',_binary '','2022-06-01','main',8),(62,'2022-06-01','MSN908_1.jpg',_binary '','2022-06-01','other',8),(63,'2022-06-01','MSN908_2.jpg',_binary '','2022-06-01','other',8),(64,'2022-06-01','MSN908_3.jpg',_binary '','2022-06-01','other',8),(65,'2022-06-01','MSN908_4.jpg',_binary '','2022-06-01','other',8),(66,'2022-06-01','MSN908_5.jpg',_binary '','2022-06-01','other',8),(67,'2022-06-01','GV7412_7.jpg',_binary '','2022-06-01','main',9),(68,'2022-06-01','GV7412-1.jpg',_binary '','2022-06-01','other',9),(69,'2022-06-01','GV7412-2.jpg',_binary '','2022-06-01','other',9),(70,'2022-06-01','GV7412-3.jpg',_binary '','2022-06-01','other',9),(71,'2022-06-01','GV7412-4.jpg',_binary '','2022-06-01','other',9),(72,'2022-06-01','GV7412-5.jpg',_binary '','2022-06-01','other',9),(73,'2022-06-01','EG9415_7.jpg',_binary '','2022-06-01','main',10),(74,'2022-06-01','EG9415-1.jpg',_binary '','2022-06-01','other',10),(75,'2022-06-01','EG9415-2.jpg',_binary '','2022-06-01','other',10),(76,'2022-06-01','EG9415-3.jpg',_binary '','2022-06-01','other',10),(77,'2022-06-01','EG9415-4.jpg',_binary '','2022-06-01','other',10),(78,'2022-06-01','EG9415-5.jpg',_binary '','2022-06-01','other',10),(79,'2022-06-01','GY7749_7.jpg',_binary '','2022-06-01','main',11),(80,'2022-06-01','GY7749-1.jpg',_binary '','2022-06-01','other',11),(81,'2022-06-01','GY7749-2.jpg',_binary '','2022-06-01','other',11),(82,'2022-06-01','GY7749-3.jpg',_binary '','2022-06-01','other',11),(83,'2022-06-01','GY7749-4.jpg',_binary '','2022-06-01','other',11),(84,'2022-06-01','GY7749-5.jpg',_binary '','2022-06-01','other',11),(85,'2022-06-01','GY8453_7.jpg',_binary '','2022-06-01','main',12),(86,'2022-06-01','GY8453-1.jpg',_binary '','2022-06-01','other',12),(87,'2022-06-01','GY8453-2.jpg',_binary '','2022-06-01','other',12),(88,'2022-06-01','GY8453-3.jpg',_binary '','2022-06-01','other',12),(89,'2022-06-01','GY8453-4.jpg',_binary '','2022-06-01','other',12),(90,'2022-06-01','GY8453-5.jpg',_binary '','2022-06-01','other',12),(91,'2022-06-01','MSP215.jpg',_binary '','2022-06-01','main',13),(92,'2022-06-01','MSP215-1.jpg',_binary '','2022-06-01','other',13),(93,'2022-06-01','MSP215-2.jpg',_binary '','2022-06-01','other',13),(94,'2022-06-01','MSP215-3.jpg',_binary '','2022-06-01','other',13),(95,'2022-06-01','MSP215-4.jpg',_binary '','2022-06-01','other',13),(96,'2022-06-01','MSP215-5.jpg',_binary '','2022-06-01','other',13),(97,'2022-06-01','MSP207.jpg',_binary '','2022-06-01','main',14),(98,'2022-06-01','MSP207-1.jpg',_binary '','2022-06-01','other',14),(99,'2022-06-01','MSP207-2.jpg',_binary '','2022-06-01','other',14),(100,'2022-06-01','MSP207-3.jpg',_binary '','2022-06-01','other',14),(101,'2022-06-01','MSP207-4.jpg',_binary '','2022-06-01','other',14),(102,'2022-06-01','MSP207-5.jpg',_binary '','2022-06-01','other',14),(103,'2022-06-01','MSP223.jpg',_binary '','2022-06-01','main',15),(104,'2022-06-01','MSP223-1.jpg',_binary '','2022-06-01','other',15),(105,'2022-06-01','MSP223-2.jpg',_binary '','2022-06-01','other',15),(106,'2022-06-01','MSP223-3.jpg',_binary '','2022-06-01','other',15),(107,'2022-06-01','MSP223-4.jpg',_binary '','2022-06-01','other',15),(108,'2022-06-01','MSP223-5.jpg',_binary '','2022-06-01','other',15),(109,'2022-06-01','MSP218.jpg',_binary '','2022-06-01','main',16),(110,'2022-06-01','MSP218-1.jpg',_binary '','2022-06-01','other',16),(111,'2022-06-01','MSP218-2.jpg',_binary '','2022-06-01','other',16),(112,'2022-06-01','MSP218-3.jpg',_binary '','2022-06-01','other',16),(113,'2022-06-01','MSP218-4.jpg',_binary '','2022-06-01','other',16),(114,'2022-06-01','MSP218-5.jpg',_binary '','2022-06-01','other',16),(115,'2022-06-01','A00621C.png',_binary '','2022-06-01','main',22),(116,'2022-06-01','A00621C_1.jpg',_binary '','2022-06-01','other',22),(117,'2022-06-01','A00621C_2.jpg',_binary '','2022-06-01','other',22),(118,'2022-06-01','A00621C_3.jpg',_binary '','2022-06-01','other',22),(119,'2022-06-01','A00621C_4.jpg',_binary '','2022-06-01','other',22),(120,'2022-06-01','A00621C_5.jpg',_binary '','2022-06-01','other',22),(121,'2022-06-01','A03175C.png',_binary '','2022-06-01','main',23),(122,'2022-06-01','A03175C_1.jpg',_binary '','2022-06-01','other',23),(123,'2022-06-01','A03175C_2.jpg',_binary '','2022-06-01','other',23),(124,'2022-06-01','A03175C_3.jpg',_binary '','2022-06-01','other',23),(125,'2022-06-01','A03175C_4.jpg',_binary '','2022-06-01','other',23),(126,'2022-06-01','A03175C_5.jpg',_binary '','2022-06-01','other',23),(127,'2022-06-01','ARVS001-5.jpg',_binary '','2022-06-01','other',24),(128,'2022-06-01','ARVS001-5_1.jpg',_binary '','2022-06-01','other',24),(129,'2022-06-01','ARVS001-5_2.jpg',_binary '','2022-06-01','other',24),(130,'2022-06-01','ARVS001-5_3.jpg',_binary '','2022-06-01','other',24),(131,'2022-06-01','ARVS001-5_4.jpg',_binary '','2022-06-01','other',24),(132,'2022-06-01','ARVS001-5_5.jpg',_binary '','2022-06-01','other',24),(133,'2022-06-01','ARMS003-2.jpg',_binary '','2022-06-01','main',25),(134,'2022-06-01','ARMS003-2_1.jpg',_binary '','2022-06-01','other',25),(135,'2022-06-01','ARMS003-2_2.jpg',_binary '','2022-06-01','other',25),(136,'2022-06-01','ARMS003-2_3.jpg',_binary '','2022-06-01','other',25),(137,'2022-06-01','ARMS003-2_4.jpg',_binary '','2022-06-01','other',25),(138,'2022-06-01','ARMS003-2_5.jpg',_binary '','2022-06-01','other',25),(139,'2022-06-01','ARHR042-4.jpg',_binary '','2022-06-01','main',26),(140,'2022-06-01','ARHR042-4_1.jpg',_binary '','2022-06-01','other',26),(141,'2022-06-01','ARHR042-4_2.jpg',_binary '','2022-06-01','other',26),(142,'2022-06-01','ARHR042-4_3.jpg',_binary '','2022-06-01','other',26),(143,'2022-06-01','ARHR042-4_4.jpg',_binary '','2022-06-01','other',26),(144,'2022-06-01','ARHR042-4_5.jpg',_binary '','2022-06-01','other',26),(145,'2022-06-01','ARHR132-1.jpg',_binary '','2022-06-01','main',27),(146,'2022-06-01','ARHR132-1_1.jpg',_binary '','2022-06-01','other',27),(147,'2022-06-01','ARHR132-1_2.jpg',_binary '','2022-06-01','other',27),(148,'2022-06-01','ARHR132-1_3.jpg',_binary '','2022-06-01','other',27),(149,'2022-06-01','ARHR132-1_4.jpg',_binary '','2022-06-01','other',27),(150,'2022-06-01','ARHR132-1_5.jpg',_binary '','2022-06-01','other',27),(151,'2022-06-01','h041906.jpg',_binary '','2022-06-01','main',17),(152,'2022-06-01','h04190_1.jpg',_binary '','2022-06-01','other',17),(153,'2022-06-01','h04190_2.jpg',_binary '','2022-06-01','other',17),(154,'2022-06-01','h04190_3.jpg',_binary '','2022-06-01','other',17),(155,'2022-06-01','h04190_4.jpg',_binary '','2022-06-01','other',17),(156,'2022-06-01','h04190_5.jpg',_binary '','2022-06-01','other',17),(157,'2022-06-01','h041919.jpg',_binary '','2022-06-01','main',18),(158,'2022-06-01','h041919_1.jpg',_binary '','2022-06-01','other',18),(159,'2022-06-01','h041919_2.jpg',_binary '','2022-06-01','other',18),(160,'2022-06-01','h041919_3.jpg',_binary '','2022-06-01','other',18),(161,'2022-06-01','h041919_4.jpg',_binary '','2022-06-01','other',18),(162,'2022-06-01','h041919_5.jpg',_binary '','2022-06-01','other',18),(163,'2022-07-31','adidas_boa.jpg',_binary '','2022-07-31','main',28),(164,'2022-07-31','adidas_boa_1.jpg',_binary '','2022-07-31','other',28),(165,'2022-07-31','adidas_boa_3.jpg',_binary '','2022-07-31','other',28),(166,'2022-07-31','adidas_boa_3.jpg',_binary '','2022-07-31','other',28),(167,'2022-07-31','adidas_boa_4.jpg',_binary '','2022-07-31','other',28),(168,'2022-07-31','adidas_boa_5.jpg',_binary '','2022-07-31','other',28),(169,'2022-07-31','adidas_boa.jpg',_binary '','2022-07-31','main',29),(170,'2022-07-31','adidas_boa_1.jpg',_binary '','2022-07-31','other',29),(171,'2022-07-31','adidas_boa_3.jpg',_binary '','2022-07-31','other',29),(172,'2022-07-31','adidas_boa_3.jpg',_binary '','2022-07-31','other',29),(173,'2022-07-31','adidas_boa_4.jpg',_binary '','2022-07-31','other',29),(174,'2022-07-31','adidas_boa_5.jpg',_binary '','2022-07-31','other',29),(175,'2022-07-31','nike_b.jpg',_binary '','2022-07-31','main',30),(176,'2022-07-31','nike_b_1.jpg',_binary '','2022-07-31','other',30),(177,'2022-07-31','nike_b_2.jpg',_binary '','2022-07-31','other',30),(178,'2022-07-31','nike_b_3.jpg',_binary '','2022-07-31','other',30),(179,'2022-07-31','nike_b_4.jpg',_binary '','2022-07-31','other',30),(180,'2022-07-31','nike_b_5.jpg',_binary '','2022-07-31','other',30),(181,'2022-07-31','adidas_supper.jpg',_binary '','2022-07-31','main',31),(182,'2022-07-31','adidas_supper_1.jpg',_binary '','2022-07-31','other',31),(183,'2022-07-31','adidas_supper_2.jpg',_binary '','2022-07-31','other',31),(184,'2022-07-31','adidas_supper_3.jpg',_binary '','2022-07-31','other',31),(185,'2022-07-31','adidas_supper_4.jpg',_binary '','2022-07-31','other',31),(186,'2022-07-31','adidas_supper_5.jpg',_binary '','2022-07-31','other',31),(187,'2022-08-27','nike_a.jpg',_binary '','2022-08-27','main',32),(188,'2022-08-27','nike_a_1.jpg',_binary '','2022-08-27','other',32),(189,'2022-08-27','nike_a_2.jpg',_binary '','2022-08-27','other',32),(190,'2022-08-27','nike_a_3.jpg',_binary '','2022-08-27','other',32),(191,'2022-08-27','nike_a_4.jpg',_binary '','2022-08-27','other',32),(192,'2022-08-27','nike_a_5.jpg',_binary '','2022-08-27','other',32),(193,'2022-08-28','converse_a.jpg',_binary '','2022-08-28','main',33),(194,'2022-08-28','converse_a_1.jpg',_binary '','2022-08-28','other',33),(195,'2022-08-28','converse_a_2.jpg',_binary '','2022-08-28','other',33),(196,'2022-08-28','converse_a_3.jpg',_binary '','2022-08-28','other',33),(197,'2022-08-28','converse_a_4.jpg',_binary '','2022-08-28','other',33),(198,'2022-08-28','converse_a_5.jpg',_binary '','2022-08-28','other',33),(199,'2022-08-28','adidas_supper.jpg',_binary '','2022-08-28','main',34),(200,'2022-08-28','adidas_supper_1.jpg',_binary '','2022-08-28','other',34),(201,'2022-08-28','adidas_supper_2.jpg',_binary '','2022-08-28','other',34),(202,'2022-08-28','adidas_supper_3.jpg',_binary '','2022-08-28','other',34),(203,'2022-08-28','adidas_supper_4.jpg',_binary '','2022-08-28','other',34),(204,'2022-08-28','adidas_supper_5.jpg',_binary '','2022-08-28','other',34);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `deliver` tinyint(1) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `type` int DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4gbdnyp7alt2qobudy7oo1nwp` (`order_id`),
  KEY `FK557oqdnctfria015no3n7ev72` (`product_id`),
  CONSTRAINT `FK4gbdnyp7alt2qobudy7oo1nwp` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK557oqdnctfria015no3n7ev72` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'Đơn hàng 10028 vừa được tạo, xác nhận ngay nào',1,1,10028,1,NULL),(2,'Đơn hàng 10029 vừa được tạo, xác nhận ngay nào',1,1,10029,1,NULL),(3,'Đơn hàng 10030 đã được tạo, xử lí ngay nào!',1,1,10030,1,NULL),(4,'Đơn hàng 10027 đã được tạo, xử lí ngay nào!',1,1,10027,1,NULL),(5,'Đơn hàng 10031 đã được tạo, xử lí ngay nào!',1,1,10031,1,NULL),(6,'Đơn hàng 10032 đã được tạo, xử lí ngay nào!',1,1,10032,1,NULL),(7,'Đơn hàng 10035 vừa được tạo, xác nhận ngay nào',1,1,10035,1,NULL),(8,'Đơn hàng 10036 vừa được tạo, xác nhận ngay nào',1,1,10036,1,NULL),(9,'Đơn hàng 10037 vừa được tạo, xác nhận ngay nào',1,1,10037,1,NULL),(10,'Đơn hàng 10038 vừa được tạo, xác nhận ngay nào',1,1,10038,1,NULL),(11,'Đơn hàng 10039 vừa được tạo, xác nhận ngay nào',1,1,10039,1,NULL),(12,'Đơn hàng 10040 vừa được tạo, xác nhận ngay nào',1,1,10040,1,NULL),(13,'Đơn hàng 10041 vừa được tạo, xác nhận ngay nào',1,1,10041,1,NULL),(14,'Đơn hàng 10042 vừa được tạo, xác nhận ngay nào',1,1,10042,1,NULL),(15,'Đơn hàng 10015 vừa hủy, kiểm tra ngay nào',1,1,10015,2,NULL),(16,'Đơn hàng 10042 vừa hủy, kiểm tra ngay nào',1,1,10042,2,NULL),(17,'Đơn hàng 10015 vừa hủy, kiểm tra ngay nào',1,1,10015,2,NULL),(18,'Đơn hàng 10014 vừa hủy, kiểm tra ngay nào',1,1,10014,2,NULL),(19,'Đơn hàng 10036 vừa hủy, kiểm tra ngay nào',1,1,10036,2,NULL),(20,'Đơn hàng 10043 vừa được tạo, xác nhận ngay nào',1,1,10043,1,NULL),(21,'Đơn hàng 10044 vừa được tạo, xác nhận ngay nào',1,1,10044,1,NULL),(22,'Đơn hàng 10045 vừa được tạo, xác nhận ngay nào',1,1,10045,1,NULL),(23,'Đơn hàng 10046 vừa được tạo, xác nhận ngay nào',1,1,10046,1,NULL),(24,'Đơn hàng 10047 vừa được tạo, xác nhận ngay nào',1,1,10047,1,NULL),(26,'Đơn hàng 10046 vừa hủy, kiểm tra ngay nào',1,1,10046,2,NULL),(27,'Đơn hàng 10049 vừa được tạo, xác nhận ngay nào',1,1,10049,1,NULL),(29,'Đơn hàng 10051 vừa được tạo, xác nhận ngay nào',1,1,10051,1,NULL),(31,'Đơn hàng 10053 vừa được tạo, xác nhận ngay nào',1,1,10053,1,NULL),(33,'Đơn hàng 10055 vừa được tạo, xác nhận ngay nào',1,1,10055,1,NULL),(34,'Đơn hàng 10056 vừa được tạo, xác nhận ngay nào',1,1,10056,1,NULL),(35,'Đơn hàng 10026 vừa hủy, kiểm tra ngay nào',1,1,10026,2,NULL),(36,'Đơn hàng 10017 vừa hủy, kiểm tra ngay nào',1,1,10017,2,NULL),(37,'Đơn hàng 10011 vừa hủy, kiểm tra ngay nào',1,1,10011,2,NULL),(38,'Đơn hàng 10008 vừa hủy, kiểm tra ngay nào',1,1,10008,2,NULL),(39,'Đơn hàng 10057 vừa được tạo, xác nhận ngay nào',1,1,10057,1,NULL),(40,'Đơn hàng 10058 vừa được tạo, xác nhận ngay nào',1,1,10058,1,NULL),(41,'Đơn hàng 10059 vừa được tạo, xác nhận ngay nào',1,1,10059,1,NULL),(42,'Đơn hàng 10059 vừa hủy, kiểm tra ngay nào',1,1,10059,2,NULL),(43,'Đơn hàng 10060 vừa được tạo, xác nhận ngay nào',1,1,10060,1,NULL),(44,'Đơn hàng 10060 vừa hủy, kiểm tra ngay nào',1,1,10060,2,NULL),(45,'Đơn hàng 10061 vừa được tạo, xác nhận ngay nào',1,1,10061,1,NULL),(46,'Đơn hàng 10061 vừa hủy, kiểm tra ngay nào',1,1,10061,2,NULL),(47,'Đơn hàng 10057 vừa hủy, kiểm tra ngay nào',1,1,10057,2,NULL),(48,'Đơn hàng 10062 vừa được tạo, xác nhận ngay nào',1,1,10062,1,NULL),(49,'Đơn hàng 10062 vừa hủy, kiểm tra ngay nào',1,1,10062,2,NULL),(50,'Đơn hàng 10062 vừa hủy, kiểm tra ngay nào',1,1,10062,2,NULL),(51,'Đơn hàng 10063 vừa được tạo, xác nhận ngay nào',1,1,10063,1,NULL),(52,'Đơn hàng 10064 vừa được tạo, xác nhận ngay nào',1,1,10064,1,NULL),(53,'Đơn hàng 10065 vừa được tạo, xác nhận ngay nào',1,1,10065,1,NULL),(54,'Sản phẩm Gucci Gang size 36 sắp hết, kiểm tra ngay nào',1,1,NULL,3,33),(55,'Sản phẩm Gucci Gang size 36 sắp hết, kiểm tra ngay nào',1,1,NULL,3,33),(56,'Đơn hàng 10066 vừa được tạo, xác nhận ngay nào',1,1,10066,1,NULL),(57,'Đơn hàng 10067 vừa được tạo, xác nhận ngay nào',1,1,10067,1,NULL),(58,'Đơn hàng 10068 vừa được tạo, xác nhận ngay nào',1,1,10068,1,NULL),(59,'Đơn hàng 10069 vừa được tạo, xác nhận ngay nào',1,1,10069,1,NULL),(60,'Đơn hàng 10070 vừa được tạo, xác nhận ngay nào',1,1,10070,1,NULL),(61,'Sản phẩm Gucci Gang size 36 sắp hết, kiểm tra ngay nào',0,1,NULL,3,33),(62,'Đơn hàng 10071 vừa được tạo, xác nhận ngay nào',0,1,10071,1,NULL),(63,'Đơn hàng 10072 vừa được tạo, xác nhận ngay nào',0,1,10072,1,NULL);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `origin_price` double NOT NULL,
  `quantity` int NOT NULL,
  `sell_price` double NOT NULL,
  `attribute_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbpibmme3f3wayg5vs7pbnnmaw` (`attribute_id`),
  KEY `FKrws2q0si6oyd6il8gqe2aennc` (`order_id`),
  CONSTRAINT `FKbpibmme3f3wayg5vs7pbnnmaw` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`),
  CONSTRAINT `FKrws2q0si6oyd6il8gqe2aennc` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1250000,1,250000,1,10001),(2,1610000,1,500000,7,10001),(3,1500000,1,300000,19,10002),(4,1200000,1,240000,10,10002),(5,1200000,1,960000,10,10003),(6,1250000,1,1000000,1,10003),(7,1200000,1,960000,10,10004),(8,1250000,1,1000000,1,10004),(9,1500000,1,1200000,19,10005),(10,1520000,1,1216000,6,10005),(11,1610000,2,1610000,7,10006),(12,1200000,2,960000,10,10006),(13,1610000,2,1610000,7,10007),(14,1200000,2,960000,10,10007),(15,1320000,1,1056000,4,10008),(16,1250000,1,1000000,1,10008),(17,1450000,1,1160000,3,10009),(18,1300000,1,1040000,11,10009),(19,1400000,1,1120000,12,10010),(20,1200000,1,960000,10,10011),(21,1600000,10,800000,22,10012),(23,2350000,4,1645000,76,10014),(24,2350000,4,2350000,76,10015),(25,2350000,1,2350000,76,10016),(26,2350000,1,1880000,73,10016),(27,700000,1,490000,93,10017),(28,2000000,1,1400000,88,10017),(30,700000,1,490000,93,10024),(31,1500000,1,1350000,82,10024),(32,2450000,1,2450000,79,10025),(33,2250000,1,1575000,55,10026),(34,2050000,1,2050000,49,10026),(35,2000000,1,1400000,88,10027),(36,2000000,1,1400000,88,10028),(37,1500000,1,1350000,85,10029),(38,1950000,1,1950000,40,10030),(39,1500000,1,1200000,19,10031),(40,1700000,1,1530000,84,10032),(41,2000000,1,1400000,88,10033),(42,2450000,1,2450000,79,10034),(43,1950000,1,1950000,40,10035),(44,2350000,1,1645000,58,10036),(45,500000,1,350000,92,10037),(46,500000,1,350000,92,10038),(47,2000000,1,1400000,88,10039),(48,1500000,1,1350000,85,10040),(49,500000,1,350000,92,10041),(50,2350000,1,2350000,76,10042),(51,700000,1,490000,93,10043),(52,700000,2,490000,93,10044),(53,2000000,5,1400000,88,10045),(54,1500000,1,1350000,85,10046),(55,700000,3,490000,93,10047),(57,700000,1,490000,93,10049),(59,2000000,1,1400000,88,10051),(61,700000,1,490000,93,10053),(63,1950000,1,1950000,40,10055),(64,2450000,1,2450000,79,10056),(65,2450000,1,2450000,79,10057),(66,2000000,1,1400000,88,10057),(67,2000000,1,1400000,88,10058),(68,1950000,1,1950000,40,10059),(69,2000000,1,1400000,88,10060),(70,2450000,2,2450000,79,10061),(71,500000,1,350000,92,10062),(72,2000000,1,1400000,88,10063),(73,4000000,1,2800000,96,10064),(74,11000000,1,8800000,101,10065),(75,14000000,1,11200000,104,10066),(76,12000000,1,9600000,102,10067),(77,2000000,1,1400000,88,10068),(78,19000000,1,15200000,109,10069),(79,1500000,2,1350000,82,10070),(80,15000000,1,12000000,105,10071),(81,5500000,1,3850000,99,10072);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `update_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'2022-06-01','Đơn hàng tạo mới','Chờ xác nhận','2022-06-01'),(2,'2022-06-01','Đơn hàng đang được xử lí','Đang xử lí','2022-06-01'),(3,'2022-06-01','Đơn hàng đang vận chuyển','Đang vận chuyển','2022-06-01'),(4,'2022-06-01','Đơn hàng giao thành công','Đã giao','2022-06-01'),(5,'2022-06-01','Đơn hàng đã hủy','Đã hủy','2022-06-01');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `create_date` date NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `is_pending` tinyint(1) NOT NULL,
  `modify_date` date NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `ship_date` date DEFAULT NULL,
  `total` double NOT NULL,
  `account_id` bigint DEFAULT NULL,
  `order_status_id` bigint DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `voucher_id` bigint DEFAULT NULL,
  `encode_url` varchar(255) DEFAULT NULL,
  `seen` tinyint(1) NOT NULL,
  `code` varchar(1000) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `shipment` varchar(1000) DEFAULT NULL,
  `payment` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKagh5svlor3slbay6tq5wqor1o` (`account_id`),
  KEY `FK2n7p8t83wo7x0lep1q06a6cvy` (`order_status_id`),
  KEY `FKdimvsocblb17f45ikjr6xn1wj` (`voucher_id`),
  CONSTRAINT `FK2n7p8t83wo7x0lep1q06a6cvy` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `FKagh5svlor3slbay6tq5wqor1o` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FKdimvsocblb17f45ikjr6xn1wj` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10073 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (10001,'TDP 69, Phường Ngọc Thụy, Quận Long Biên, Thành phố Hà Nội','2022-04-03','Công Minh Idol',0,'2022-07-10','Mua hàng không cần nhìn giá','0987654321','2022-06-08',375000,1,3,'minhncph13186@fpt.edu.vn',NULL,'MTAwMDE=',1,NULL,NULL,NULL,NULL),(10002,'TDP 69, Phường Ngọc Thụy, Quận Long Biên, Thành phố Hà Nội','2022-05-03','Công Minh Idol',0,'2022-07-10','xxx','0987654321','2022-07-08',270000,2,3,'minhncph13186@fpt.edu.vn',NULL,'MTAwMDI=',1,NULL,NULL,NULL,NULL),(10003,'69, Phường Ngọc Thụy, Quận Long Biên, Thành phố Hà Nội','2022-06-03','Công Minh Idol',1,'2022-07-10','xyz','0987654321','2022-05-08',980000,1,4,'minhncph13186@fpt.edu.vn',NULL,'MTAwMDM=',1,NULL,NULL,NULL,NULL),(10004,'TDP69, Phường Ngọc Thụy, Quận Long Biên, Thành phố Hà Nội','2022-07-03','Công Minh Idol',0,'2022-07-11','xyz','0987654321','2022-04-08',980000,2,2,'minhncph13186@fpt.edu.vn',NULL,'MTAwMDQ=',1,NULL,NULL,NULL,NULL),(10005,'69, Phường Ngọc Thụy, Quận Long Biên, Thành phố Hà Nội','2022-07-06','Công Minh Idol',0,'2022-07-10','nợ','0987654321','2022-07-11',1208000,1,3,'minhncph13186@fpt.edu.vn',NULL,'MTAwMDU=',1,NULL,NULL,NULL,NULL),(10006,'68, Phường Thượng Cát, Quận Bắc Từ Liêm, Thành phố Hà Nội','2022-07-10','Công Minh Idol',0,'2022-07-10','Giàu vl','0987654321','2022-07-15',5140000,2,2,'minhncph13186@fpt.edu.vn',NULL,'MTAwMDY=',1,NULL,NULL,NULL,NULL),(10007,'68, Phường Thượng Cát, Quận Bắc Từ Liêm, Thành phố Hà Nội','2022-07-10','Công Minh Idol',1,'2022-07-11','Giàu vl','0987654321','2022-07-15',5140000,2,4,'minhncph13186@fpt.edu.vn',NULL,'MTAwMDc=',1,NULL,NULL,NULL,NULL),(10008,'68, Phường Phú Thượng, Quận Tây Hồ, Thành phố Hà Nội','2020-07-10','Công Minh Idol',0,'2022-07-10','xxx','0987654321','2022-07-15',1028000,2,5,'minhncph13186@fpt.edu.vn',NULL,'MTAwMDg=',1,NULL,'AhaMove - Không thích nữa',NULL,NULL),(10009,'xxx, Phường Hạ Long, Thành phố Nam Định, Tỉnh Nam Định','2022-07-10','Công Minh Idol',0,'2022-07-17','xxx','0987654321','2022-07-15',2200000,2,3,'minhncph13186@fpt.edu.vn',NULL,'MTAwMDk=',1,NULL,NULL,NULL,NULL),(10010,'123, Phường Nhật Tân, Quận Tây Hồ, Thành phố Hà Nội','2022-07-10','Công Minh Idol',0,'2022-07-11','xxx','0987654321','2022-07-15',560000,2,3,'minhncph13186@fpt.edu.vn',NULL,'MTAwMTA=',1,NULL,NULL,NULL,NULL),(10011,'123, Phường Phúc Tân, Quận Hoàn Kiếm, Thành phố Hà Nội','2019-07-10','Công Minh Idol',0,'2022-07-12','qưe','0987654321','2022-07-15',480000,2,5,'minhncph13186@fpt.edu.vn',NULL,'MTAwMTE=',1,NULL,'Thêm bớt sản phẩm - Mua chục đôi',NULL,NULL),(10012,'1, Phường Trúc Bạch, Quận Ba Đình, Thành phố Hà Nội','2018-07-10','Công Minh Idol',0,'2022-07-16','Idol','0987654321','2022-07-15',8000000,2,3,'minhncph13186@fpt.edu.vn',NULL,'MTAwMTI=',1,NULL,NULL,NULL,NULL),(10014,'zzz, Phường Phúc Tân, Quận Hoàn Kiếm, Thành phố Hà Nội','2020-07-18','Công Minh Idol',1,'2022-07-18','','0987654321','2022-07-23',6580000,2,4,'minhncph13186@fpt.edu.vn',NULL,'MTAwMTQ=',1,NULL,NULL,NULL,NULL),(10015,'HN, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2021-07-24','Công Minh Idol',1,'2022-07-31','Mình nợ nhé bạn ơi','0987654321','2022-07-29',9400000,2,4,'minhncph13186@fpt.edu.vn',NULL,'MTAwMTU=',1,NULL,NULL,NULL,NULL),(10016,'a, Phường Phúc Tân, Quận Hoàn Kiếm, Thành phố Hà Nội','2022-07-24','Công Minh Idol',0,'2022-07-24','','0987654321','2022-07-29',4230000,2,3,'minhncph13186@fpt.edu.vn',NULL,'MTAwMTY=',1,NULL,NULL,NULL,NULL),(10017,'abc, Phường Thượng Cát, Quận Bắc Từ Liêm, Thành phố Hà Nội','2022-08-06','Tan Vu',0,'2022-08-06','zxc','0987654321','2022-08-11',1890000,11,5,'tanvx308@gmail.com',NULL,'MTAwMTc=',1,NULL,'AhaMove - Không thích',NULL,NULL),(10019,'qưe, Phường Phú Thượng, Quận Tây Hồ, Thành phố Hà Nội','2022-08-07','Tan Vu',0,'2022-08-07','qqq','0987654321','2022-08-12',980000,NULL,1,'tanvx308@gmail.com',NULL,'MTAwMTk=',1,NULL,NULL,NULL,NULL),(10020,'xxx, Phường Nguyễn Du, Quận Hai Bà Trưng, Thành phố Hà Nội','2022-08-07','Công Minh',0,'2022-08-07','xxx','0987654321','2022-08-12',980000,NULL,1,'minhncph13186@fpt.edu.vn',NULL,'MTAwMjA=',1,NULL,NULL,NULL,NULL),(10021,'xxx, Phường Phúc Tân, Quận Hoàn Kiếm, Thành phố Hà Nội','2022-08-07','Tan Vu',0,'2022-08-07','xxx','0987654321','2022-08-12',980000,NULL,1,'tanvx308@gmail.com',NULL,'MTAwMjE=',1,NULL,NULL,NULL,NULL),(10022,'xxx, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-07','Công Minh',0,'2022-08-07','xxx','0366202468','2022-08-12',980000,NULL,1,'minhncph13186@fpt.edu.vn',NULL,'MTAwMjI=',1,NULL,NULL,NULL,NULL),(10023,'xxx, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-07','Công Minh Idol',0,'2022-08-07','xxx','0987654321','2022-08-12',2590000,NULL,1,'tanvx308@gmail.com',NULL,'MTAwMjM=',1,NULL,NULL,NULL,NULL),(10024,'xxx, Phường Duyên Hải, Thành phố Lào Cai, Tỉnh Lào Cai','2022-08-07','Tan Vu',0,'2022-08-07','xxx','0987654321','2022-08-12',1840000,NULL,1,'tanvx308@gmail.com',NULL,'MTAwMjQ=',1,NULL,NULL,NULL,NULL),(10025,'xxx, Phường Phú Thượng, Quận Tây Hồ, Thành phố Hà Nội','2022-08-07','Tan Vu',1,'2022-08-27','xxx','0987654321','2022-08-31',2450000,NULL,4,'tanvx308@gmail.com',NULL,'MTAwMjU=',1,'Viettel123',NULL,'ViettelPost',NULL),(10026,'xxx, Phường Thượng Cát, Quận Bắc Từ Liêm, Thành phố Hà Nội','2022-08-07','Tan Vu',0,'2022-08-07','xxx','0987654321','2022-08-12',3625000,11,5,'tanvx308@gmail.com',NULL,'MTAwMjY=',1,NULL,NULL,NULL,NULL),(10027,'a, Phường Phúc Tân, Quận Hoàn Kiếm, Thành phố Hà Nội','2022-08-07','Công Minh Idol',0,'2022-08-07','a','0987654321','2022-08-12',1400000,NULL,1,'minhncph13186@fpt.edu.vn',NULL,'MTAwMjc=',1,NULL,NULL,NULL,NULL),(10028,'x, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-07','Công Minh Idol',0,'2022-08-07','a','0987654321','2022-08-12',1400000,NULL,1,'minhncph13186@fpt.edu.vn',NULL,'MTAwMjg=',1,NULL,NULL,NULL,NULL),(10029,'1, Thị trấn Phó Bảng, Huyện Đồng Văn, Tỉnh Hà Giang','2022-08-07','Tan Vu',0,'2022-08-07','1','0987654321','2022-08-12',1350000,NULL,1,'minhncph13186@fpt.edu.vn',NULL,'MTAwMjk=',1,NULL,NULL,NULL,NULL),(10030,'asdf, Phường Đồng Xuân, Quận Hoàn Kiếm, Thành phố Hà Nội','2022-08-08','Tan Vu',1,'2022-08-17','asd','0987654321','2022-08-20',1950000,NULL,4,'tanvx308@gmail.com',NULL,'MTAwMzA=',1,'JT123456',NULL,'J&T',NULL),(10031,'op, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-08','Tan Vu',1,'2022-08-09','po','0987654321','2022-08-13',1200000,NULL,4,'tanvx308@gmail.com',NULL,'MTAwMzE=',1,NULL,NULL,NULL,NULL),(10032,'j, Phường Đồng Xuân, Quận Hoàn Kiếm, Thành phố Hà Nội','2022-08-08','Công Minh Idol',0,'2022-08-18','Giao nhanh lên bạn ơi\n','0987654321','2022-08-13',1530000,NULL,2,'tanvx308@gmail.com',NULL,'MTAwMzI=',1,NULL,NULL,NULL,NULL),(10033,'kkk, Xã Nghĩa Thuận, Huyện Quản Bạ, Tỉnh Hà Giang','2022-08-08','Công Minh Idol',0,'2022-08-08','lkkk','0987654321','2022-08-13',1400000,NULL,1,'tanvx308@gmail.com',NULL,'MTAwMzM=',0,NULL,NULL,NULL,NULL),(10034,'ooo, Xã Đức Hạnh, Huyện Bảo Lâm, Tỉnh Cao Bằng','2022-08-08','Công Minh Idol',0,'2022-08-08','jjj','0987654321','2022-08-13',2450000,NULL,1,'tanvx308@gmail.com',NULL,'MTAwMzQ=',0,NULL,NULL,NULL,NULL),(10035,'69, Phường Thượng Cát, Quận Bắc Từ Liêm, Thành phố Hà Nội','2022-08-09','Tan Vu',0,'2022-08-09','96','0987654321','2022-08-14',1950000,11,3,'tanvx308@gmail.com',NULL,'MTAwMzU=',0,NULL,NULL,NULL,NULL),(10036,'22, Phường Thượng Cát, Quận Bắc Từ Liêm, Thành phố Hà Nội','2022-08-09','Tan Vu',1,'2022-08-09','abc','0366202468','2022-08-14',1645000,11,4,'tanvx308@gmail.com',NULL,'MTAwMzY=',0,NULL,NULL,NULL,NULL),(10037,'333, Thị trấn Văn Điển, Huyện Thanh Trì, Thành phố Hà Nội','2022-08-10','Tan Vu',0,'2022-08-16','333','0987654321','2022-08-15',350000,NULL,2,'tanvx308@gmail.com',NULL,'MTAwMzc=',0,NULL,NULL,NULL,NULL),(10038,'abc, Phường Thượng Cát, Quận Bắc Từ Liêm, Thành phố Hà Nội','2022-08-10','Tan Vu',0,'2022-08-16','abc','0987654321','2022-08-15',350000,NULL,2,'tanvx308@gmail.com',NULL,'MTAwMzg=',0,NULL,NULL,NULL,NULL),(10039,'abc, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-10','Công Minh Idol',0,'2022-08-22','Nhà Công Minh','0987654321','2022-08-15',1400000,NULL,5,'minhncph13186@fpt.edu.vn',NULL,'MTAwMzk=',0,NULL,'Đặt trùng - Mua lại',NULL,NULL),(10040,'aaa, Xã Hồ Bốn, Huyện Mù Căng Chải, Tỉnh Yên Bái','2022-08-10','Tan Vu',0,'2022-08-17','alo','0987654321','2022-08-15',1350000,NULL,5,'hunghvph12990@fpt.edu.vn',NULL,'MTAwNDA=',0,NULL,'Gojek - Khách hàng hủy',NULL,NULL),(10041,'abc, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-10','Công Minh Idol',0,'2022-08-16','abc','0987654321','2022-08-20',350000,NULL,3,'minhncph13186@fpt.edu.vn',NULL,'MTAwNDE=',0,'123456',NULL,'ViettelPost',NULL),(10042,'abc, Phường Cầu Diễn, Quận Nam Từ Liêm, Thành phố Hà Nội','2022-08-10','Công Minh Idol',1,'2022-08-10','abc','0987654321','2022-08-15',2350000,2,4,'minhncph13186@fpt.edu.vn',NULL,'MTAwNDI=',0,NULL,NULL,NULL,NULL),(10043,'aaa, Thị trấn Phó Bảng, Huyện Đồng Văn, Tỉnh Hà Giang','2022-08-11','Công Minh Idol',0,'2022-08-12','aaa','0987654321','2022-08-16',490000,NULL,3,'tanvx308@gmail.com',NULL,'MTAwNDM=',0,NULL,NULL,NULL,NULL),(10044,'a, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-11','Công Minh Idol',0,'2022-08-17','a','0987654321','2022-08-20',980000,NULL,5,'tanvx308@gmail.com',NULL,'MTAwNDQ=',0,'VIET123456','AhaMove - Hết xiền','ViettelPost',NULL),(10045,'a, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-11','Công Minh Idol',1,'2022-08-11','a','0987654321','2022-08-16',6300000,11,4,'tanvx308@gmail.com',NULL,'MTAwNDU=',0,NULL,NULL,NULL,NULL),(10046,'aaa, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-11','Công Minh Idol',1,'2022-08-11','aaa','0987654321','2022-08-16',1215000,11,4,'minhncph13186@fpt.edu.vn',NULL,'MTAwNDY=',0,NULL,NULL,NULL,NULL),(10047,'abc, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-11','Công Minh Idol',0,'2022-08-11','abc','0987654321','2022-08-16',1323000,11,5,'minhncph13186@fpt.edu.vn',NULL,'MTAwNDc=',0,NULL,NULL,NULL,NULL),(10049,'333, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-25','Tan Vu',1,'2022-08-28','abc','0366202468','2022-08-31',490000,NULL,4,'tanvx308@gmail.com',NULL,'MTAwNDk=',0,'abc',NULL,'J&T','Chuyển khoản qua ngân hàng'),(10051,'abc, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-25','Công Minh Idol',1,'2022-08-29','abc','0987654321','2022-09-01',980000,NULL,4,'minhncph13186@fpt.edu.vn',NULL,'MTAwNTE=',0,'123456',NULL,'ViettelPost','Thanh toán khi giao hàng(COD)'),(10053,'abc, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-25','Công Minh Idol',0,'2022-08-25','abc','0987654321','2022-08-30',441000,NULL,1,'minhncph13186@fpt.edu.vn',NULL,'MTAwNTM=',0,NULL,NULL,NULL,'Thanh toán khi giao hàng(COD)'),(10055,'abc, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-25','Công Minh Idol',1,'2022-08-28','abc','0987654321','2022-09-01',1560000,NULL,4,'minhncph13186@fpt.edu.vn',NULL,'MTAwNTU=',0,'123',NULL,'ViettelPost','Thanh toán khi giao hàng(COD)'),(10056,'abc, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-25','Công Minh Idol',1,'2022-08-29','abc','0987654321','2022-08-31',2450000,NULL,4,'minhncph13186@fpt.edu.vn',NULL,'MTAwNTY=',0,'123456',NULL,'ViettelPost','Thanh toán khi giao hàng(COD)'),(10057,'HN, Phường Cầu Diễn, Quận Nam Từ Liêm, Thành phố Hà Nội','2022-08-27','Vu Xuan Tan',0,'2022-08-27','Free ship nhớ','0987654321','2022-09-01',3850000,11,5,'minhncph6969@fpt.edu.vn',NULL,'MTAwNTc=',0,NULL,'Đặt trùng - abc',NULL,'Thanh toán khi giao hàng(COD)'),(10058,'abc, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-27','Công Minh Idol',0,'2022-08-27','abc','0987654321','2022-09-01',1400000,NULL,5,'minhncph13186@fpt.edu.vn',NULL,'MTAwNTg=',0,NULL,'AhaMove - Khách hàng không nghe máy',NULL,'Thanh toán khi giao hàng(COD)'),(10059,'HN, Phường Hàng Mã, Quận Hoàn Kiếm, Thành phố Hà Nội','2022-08-27','Vu Xuan Tan',0,'2022-08-27','abc','0987654321','2022-09-01',1365000,11,5,'minhncph6969@fpt.edu.vn',NULL,'MTAwNTk=',0,NULL,'Gojek - Mua cái khác',NULL,'Thanh toán khi giao hàng(COD)'),(10060,'HN, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-27','Vu Xuan Tan',0,'2022-08-27','abc','0987654321','2022-09-01',980000,11,5,'minhncph6969@fpt.edu.vn',NULL,'MTAwNjA=',0,NULL,'Gojek - mua cái khác',NULL,'Thanh toán khi giao hàng(COD)'),(10061,'HN, Thị trấn Sóc Sơn, Huyện Sóc Sơn, Thành phố Hà Nội','2022-08-27','Vu Xuan Tan',0,'2022-08-27','abc','0987654321','2022-09-01',3430000,11,5,'minhncph6969@fpt.edu.vn',NULL,'MTAwNjE=',0,NULL,'Gojek - Mua cái khác',NULL,'Thanh toán khi giao hàng(COD)'),(10062,'xxx, Phường Ngọc Thụy, Quận Long Biên, Thành phố Hà Nội, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-27','Nguyễn Công Minh',0,'2022-08-27','abc','0697856354','2022-09-01',280000,2,5,'minhminhnc@gmail.com',12,'MTAwNjI=',0,NULL,'Đặt trùng - Mua lại',NULL,'Thanh toán khi giao hàng(COD)'),(10063,'số 55 Tổ Dân Phố Đông Ba, Phường Phúc Tân, Quận Hoàn Kiếm, Thành phố Hà Nội','2022-08-27','Vu Xuan Tan',1,'2022-08-27','abc','0987654321','2022-08-30',980000,11,4,'tanvx308@gmail.com',3,'MTAwNjM=',0,'abc123456',NULL,'ViettelPost','Thanh toán khi giao hàng(COD)'),(10064,'333, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-27','Công Minh Idol',0,'2022-08-28','abc','0987654321','2022-09-01',2240000,NULL,5,'minhncph13186@fpt.edu.vn',1,'MTAwNjQ=',0,NULL,'Thêm bớt sản phẩm - abc',NULL,'Thanh toán khi giao hàng(COD)'),(10065,'123, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-28','Công Minh Idol',1,'2022-08-28','123','0987654321','2022-09-01',8800000,NULL,4,'minhncph13186@fpt.edu.vn',NULL,'MTAwNjU=',0,'JT123456',NULL,'J&T','Thanh toán khi giao hàng(COD)'),(10066,'số 55 Tổ Dân Phố Đông Ba, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-28','Vu Xuan Tan',1,'2022-08-28','333','0987654321','2022-08-31',7840000,11,4,'tanvx308@gmail.com',13,'MTAwNjY=',0,'abc',NULL,'ViettelPost','Thanh toán khi giao hàng(COD)'),(10067,'số 55 Tổ Dân Phố Đông Ba, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-28','Vu Xuan Tan',1,'2022-08-28','123','0987654321','2022-08-31',6720000,11,4,'tanvx308@gmail.com',10,'MTAwNjc=',0,'123456',NULL,'ViettelPost','Thanh toán khi giao hàng(COD)'),(10068,'số 55 Tổ Dân Phố Đông Ba, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-28','Vu Xuan Tan',1,'2022-08-28','','0987654321','2022-08-31',1400000,11,4,'tanvx308@gmail.com',NULL,'MTAwNjg=',0,'abc',NULL,'ViettelPost','Thanh toán khi giao hàng(COD)'),(10069,'số 55 Tổ Dân Phố Đông Ba, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-28','Vu Xuan Tan',0,'2022-08-28','Free ship nhớ','0987654321','2022-08-31',15200000,11,5,'tanvx308@gmail.com',NULL,'MTAwNjk=',0,'GJ123','Đặt trùng - alo','Gojek','Thanh toán khi giao hàng(COD)'),(10070,'số 55 Tổ Dân Phố Đông Ba, Xã Pải Lủng, Huyện Mèo Vạc, Tỉnh Hà Giang','2022-08-28','Vu Xuan Tan',1,'2022-08-29','abc','0987654321','2022-08-31',2700000,11,4,'tanvx308@gmail.com',NULL,'MTAwNzA=',0,'123',NULL,'ViettelPost','Thanh toán khi giao hàng(COD)'),(10071,'số 55 Tổ Dân Phố Đông Ba, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-29','Vu Xuan Tan',1,'2022-08-29','Free ship','0987654321','2022-08-31',12000000,11,4,'tanvx308@gmail.com',NULL,'MTAwNzE=',0,'123456',NULL,'ViettelPost','Thanh toán khi giao hàng(COD)'),(10072,'số 55 Tổ Dân Phố Đông Ba, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội','2022-08-29','Vu Xuan Tan',1,'2022-08-29','aaa','0987654321','2022-08-31',3850000,11,4,'tanvx308@gmail.com',NULL,'MTAwNzI=',0,'abc',NULL,'ViettelPost','Thanh toán khi giao hàng(COD)');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdswxvx2nl2032yjv609r29sdr` (`category_id`),
  KEY `FK5w81wp3eyugvi2lii94iao3fm` (`product_id`),
  CONSTRAINT `FK5w81wp3eyugvi2lii94iao3fm` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKdswxvx2nl2032yjv609r29sdr` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,1,7),(2,2,6),(3,3,5),(4,4,3),(5,5,4),(6,6,2),(7,7,1),(8,7,8),(9,6,9),(10,5,10),(11,4,11),(12,3,12),(13,2,13),(14,1,14),(15,1,15),(16,2,16),(17,3,17),(18,4,18),(19,5,19),(20,6,20),(21,7,21),(22,7,22),(23,6,23),(24,5,24),(25,4,25),(26,3,26),(27,2,27),(30,3,29),(31,7,29),(67,1,31),(68,4,31),(69,5,31),(70,7,31),(73,1,32),(74,7,32),(75,3,28),(76,6,28),(77,7,28),(78,1,30),(79,4,30),(80,5,30),(81,6,30),(82,7,30),(87,1,34),(88,5,34),(97,1,33),(98,5,33);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `create_date` date NOT NULL,
  `description` varchar(1000) NOT NULL,
  `modify_date` date NOT NULL,
  `name` varchar(50) NOT NULL,
  `view` bigint NOT NULL,
  `brand_id` bigint DEFAULT NULL,
  `sale_id` bigint DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_57ivhy5aj3qfmdvl6vxdfjs4p` (`code`),
  KEY `FKa3a4mpsfdf4d2y6r8ra3sc8mv` (`brand_id`),
  KEY `FKorwhur7undd0tdqkijmpf7882` (`sale_id`),
  CONSTRAINT `FKa3a4mpsfdf4d2y6r8ra3sc8mv` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `FKorwhur7undd0tdqkijmpf7882` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Fw2888','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Giày Sneaker Adidas Bravada NAM ANA',100,4,2,1),(2,'H00521','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Giày Sneaker Adidas Eq21 Triple Black',100,4,2,1),(3,'Fx5849','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân. ','2022-06-01','Giày Sneaker Adidas Stansmith Mule',100,4,2,1),(4,'Q46225','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Giày Sneaker Adidas 4d Fwd Pulse',100,4,1,1),(5,'MSN913','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','GIÀY NIKE RENEW RIDE 3 NỮ',100,3,2,1),(6,'MSN911','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','GIÀY NIKE AIR ZOOM PEGASUS NAM ',100,3,3,1),(7,'MSN910','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','GIÀY NIKE AIR ZOOM PEGASUS NỮ',100,3,1,1),(8,'MSN908','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','GIÀY NIKE AIR ZOOM RIVAL FLY',100,3,2,1),(9,'GV7412','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','REEBOK ROYAL TECHQUET DEPOR ACE NAE',100,2,3,1),(10,'EG9415','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','REEBOK ROYAL COMPLETE CLN2 HAZN AB',100,2,1,1),(11,'GY7749','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','LIQUIFECT 902 BR AUTMAX AB SN',100,2,2,1),(12,'GY8453','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','HIIT TR 2.0 FIFA ZATHER ONE',100,2,3,1),(13,'MSP215','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','GIÀY PUMA ANZARUB LITE NAM A1',100,1,1,1),(14,'MSP207','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','GIÀY PUMA CAVEN NỮ AB CAP',100,1,2,1),(15,'MSP223','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','GIÀY PUMA ELICTIRIFY NITRO NAM BB',100,1,3,1),(16,'MSP218','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','GIÀY PUMA RALPH SAMPSON LO JOKER',100,1,1,1),(17,'h04190','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Giày Fila Unisex Como Mule Trắng',100,5,2,1),(18,'h041919','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Giày Fila Unisex Scanline Mule Đen',100,5,3,1),(19,'h026064','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Giày Thể Thao Fila Shiny Pink ',100,5,1,1),(20,'M7650','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Chuck Taylor All Star Classic AB',100,6,2,1),(21,'A00416C','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Chuck Taylor All Star Crafted Stripes',100,6,3,1),(22,'A00621C','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Chuck 70 Seasonal Color CX CATER',100,6,1,1),(23,'A03175C','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Chuck Taylor All Star Lift Platform',100,6,2,1),(24,'ARVS001-5','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Giày Super Light 19 nam AB',100,7,3,1),(25,'ARMS003-2','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Giày chạy bộ nam SUPER ID',100,7,1,1),(26,'ARHR042-4','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Giày chạy bộ nữ SUPER ID',100,7,2,1),(27,'ARHR132-1','2022-06-01','Giày Nike SB Blazer Court là dòng giày sneaker rất được yêu thích của Nike trên toàn thế giới. Với thiết kế đơn giản nhưng đẹp mắt, Nike SB Blazer Court chắc chắn là đôi giày không thể thiếu với bất cứ ai.\nPhần upper của giày được làm từ chất liệu vải Canvas bền chắc, đế giày làm bằng cao su với công nghệ độc quyền của Nike, giúp nó cực kỳ êm ái và dễ chịu khi lên chân.','2022-06-01','Giày chạy bộ thể thao nữ',100,7,1,1),(28,'NEW888','2022-07-31','Giày siêu siêu đẹp','2022-08-27','Giày Adidas BOA',1,3,4,1),(29,'BOA888','2022-07-31','X','2022-07-31','ADIDAS BOA New',1,3,4,1),(30,'NIKE2022','2022-07-31','Sản phẩm mới nhất của NIKE','2022-08-27','NIKE 2022',1,3,3,1),(31,'SUPER2022','2022-07-31','Mẫu giày mới của ADIDAS năm 2022','2022-08-01','ADIDAS Super Ultra',1,8,3,1),(32,'ULT9999','2022-08-27','Kiểu dáng: Ôm vừa, có dây buộc. Đế ngoài: Đế ngoài bằng cao su chống trơn trượt','2022-08-27','Ultraboost',1,4,3,1),(33,'Gucci8888','2022-08-28','Big City Boyyyyyyy','2022-08-28','Gucci Gang',1,8,2,1),(34,'GC00000','2022-08-28','gucci','2022-08-28','Gucci000',1,8,3,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date NOT NULL,
  `modify_date` date NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'2022-06-01','2022-06-01','ADMIN'),(2,'2022-06-01','2022-06-01','EMP'),(3,'2022-06-01','2022-06-01','CUS');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `discount` int DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `modify_date` date NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2022-06-01','Chương trình mặc định',0,_binary '','2022-06-01','Mặc định'),(2,'2022-06-01','Thông thường',20,_binary '','2022-06-01','Thông thường'),(3,'2022-06-01','Siêu giảm giá',30,_binary '','2022-06-01','Siêu giảm giá'),(4,'2022-07-15','Công Minh Idol xả hàng',10,_binary '\0','2022-07-15','Công Minh Idol');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(12) NOT NULL,
  `count` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_30ftp2biebbvpik8e49wlmady` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES (1,'ADIDAS2022',1,'2022-08-28',50,'2022-08-30',1),(2,'NIKE2022',1,'2022-06-01',30,'2022-06-01',0),(3,'NIKE2021',0,'2022-08-27',30,'2022-08-30',1),(4,'ADIDAS888',0,'2022-08-25',30,'2022-08-31',1),(5,'ADIDAS8888',0,'2022-08-25',10,'2022-08-30',1),(6,'ADIDAS111',0,'2022-08-25',20,'2022-09-14',1),(7,'ADIDAS222',1,'2022-07-13',25,'2022-07-30',1),(8,'ADIDAS333',1,'2022-07-13',15,'2022-07-26',1),(9,'ADIDAS444',1,'2022-07-13',35,'2023-08-27',1),(10,'ADIDAS555',0,'2022-08-28',30,'2023-07-21',1),(11,'ADIDAS889',0,'2022-08-11',10,'2022-08-30',1),(12,'T8CgNF5jWG',1,'2022-08-27',20,'2023-08-27',1),(13,'6Mnmk6aOLU',0,'2022-08-28',30,'2023-08-28',1),(14,'o06jPeZuVA',1,'2022-08-28',30,'2023-08-28',1),(15,'KqqgfsnshW',1,'2022-08-28',10,'2023-08-28',1),(16,'HGWfw7VB6m',1,'2022-08-28',30,'2023-08-28',1),(17,'MST6X5lhBN',1,'2022-08-28',10,'2023-08-28',1),(18,'JwXNmZhgeS',1,'2022-08-29',20,'2023-08-29',1),(19,'AvCreVbd3E',1,'2022-08-29',20,'2023-08-29',1),(20,'ZrXi6OWrl8',1,'2022-08-29',30,'2023-08-29',1),(21,'k5BJAB5s8q',1,'2022-08-29',30,'2023-08-29',1);
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-30  0:39:18
