-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jiuzhou
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house` (
  `houseId` int(11) NOT NULL AUTO_INCREMENT,
  `saleType` int(11) DEFAULT NULL,
  `houseType` varchar(45) DEFAULT NULL,
  `area` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `communityName` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `authorTel` varchar(45) DEFAULT NULL,
  `authorName` varchar(45) DEFAULT NULL,
  `des` varchar(45) DEFAULT NULL,
  `imgSrc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`houseId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES (1,1,'一室户',77,4000,'金领国际','川沙路188号','17791891233','中尉','抢房啦',NULL),(3,2,'3',3,3,'3','3','3','3','3',NULL);
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `loginType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1','1','admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'jiuzhou'
--

--
-- Dumping routines for database 'jiuzhou'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-17  0:16:24
 ALTER TABLE user ADD COLUMN phone varchar(11);

 ALTER TABLE user ADD COLUMN address varchar(50);

 ALTER TABLE user ADD COLUMN email varchar(50);

 ALTER TABLE house ADD COLUMN houseToken int(11);

 ALTER TABLE house ADD COLUMN imgNum int(3);

 ALTER TABLE house ADD COLUMN useId int(11);

 ALTER TABLE house ADD COLUMN city varchar(20);

 ALTER TABLE house ADD COLUMN county varchar(20);

ALTER TABLE house ADD COLUMN province varchar(20);

CREATE TABLE rentHouse (
  `houseId` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `saleType` int(11) DEFAULT NULL,
  `houseType` varchar(45) DEFAULT NULL,
  `area` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `communityName` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `authorTel` varchar(45) DEFAULT NULL,
  `authorName` varchar(45) DEFAULT NULL,
  `des` varchar(45) DEFAULT NULL,
  `imgSrc` varchar(45) DEFAULT NULL,
  province VARCHAR (45) DEFAULT NULL ,
  city VARCHAR (45) DEFAULT NULL ,
  county VARCHAR (45) DEFAULT NULL ,
  houseToken int(2) DEFAULT NULL
)

CREATE TABLE secondHouse (
  `houseId` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `saleType` int(11) DEFAULT NULL,
  `houseType` varchar(45) DEFAULT NULL,
  `area` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `communityName` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `authorTel` varchar(45) DEFAULT NULL,
  `authorName` varchar(45) DEFAULT NULL,
  `des` varchar(45) DEFAULT NULL,
  `imgSrc` varchar(45) DEFAULT NULL,
  province VARCHAR (45) DEFAULT NULL ,
  city VARCHAR (45) DEFAULT NULL ,
  county VARCHAR (45) DEFAULT NULL ,
  houseToken int(2) DEFAULT NULL
)