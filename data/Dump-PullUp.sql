CREATE DATABASE  IF NOT EXISTS `pullup` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `PULLUP`;
-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (i386)
--
-- Host: localhost    Database: PULLUP
-- ------------------------------------------------------
-- Server version	5.5.53

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
-- Table structure for table `PARKINGLISTING`
--

DROP TABLE IF EXISTS `PARKINGLISTING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARKINGLISTING` (
  `listingID` int(11) NOT NULL AUTO_INCREMENT,
  `listingName` varchar(40) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `parkingType` varchar(30) DEFAULT NULL,
  `timeAvailable` varchar(30) DEFAULT NULL,
  `availableTill` varchar(30) DEFAULT NULL,
  `renterID` int(11) DEFAULT NULL,
  `tenantID` int(11) DEFAULT NULL,
  PRIMARY KEY (`listingID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARKINGLISTING`
--

LOCK TABLES `PARKINGLISTING` WRITE;
/*!40000 ALTER TABLE `PARKINGLISTING` DISABLE KEYS */;
INSERT INTO `PARKINGLISTING` VALUES (1,'Hot Parking','1 Washington square',8,'SUV','2017-01-08T09:00:00','2017-01-09T09:00:00',12,NULL),(2,'Hot Parking2','2 Washington square',10,'Car','2017-01-12T09:00:00','2017-01-13T09:00:00',13,NULL),(3,'Crappy Parking','3 Washington square',19,'Truck','2017-01-14T09:00:00','2017-01-15T09:00:00',14,NULL),(4,'terrible Parking','4 Washington square',9,'Truck/SUV','2017-01-16T09:00:00','2017-01-17T09:00:00',15,NULL),(5,'Parking near campus','5 Washington square',9,'Truck/SUV','2017-01-18T09:00:00','2017-01-19T09:00:00',12,NULL),(6,'1 mile from campus','30 Santa Clara Street',3,'Car','2017-01-12T08:00:00','2017-01-13T11:00:00',13,NULL),(7,'Sweet Parking Spot','31 Santa Clara Street',5,'Truck/Car/SUV','2017-01-12T08:30:00','2017-01-13T23:00:00',14,NULL),(8,'Close to Campus','90 San Salvador st',30,'Truck/SUV/Car','2017-01-20T08:30:00','2017-01-20T23:00:00',15,NULL),(9,'Near Campus','101 North 10th Street',10,'Car','2017-01-02T08:30:00','2017-01-02T23:00:00',12,NULL),(10,'Quiet Parking','227 South 12th Street',7,'Car','2017-01-03T09:00:00','2017-01-03T23:00:00',13,NULL),(11,'Good Neighborhood','245 South 12th Street',7,'Car','2017-01-19T09:00:00','2017-01-20T09:00:00',14,NULL),(12,'Close to SJSU','345 South 12th Street',8,'Truck/Car/SUV','2017-01-21T09:00:00','2017-01-22T09:00:00',15,NULL),(13,'Green Grass','122 South 12th Street',5,'Car','2017-01-23T09:00:00','2017-01-24T09:00:00',12,NULL),(14,'Spot at Apartment Complex','1 south 7th street',13,'Truck/SUV','2017-01-25T09:00:00','2017-01-26T09:00:00',13,NULL),(15,'Grass Parking At Frat House','22 south 7th street',11,'Truck','2017-01-27T09:00:00','2017-01-30T09:00:00',14,NULL),(16,'1 Parking spot for Rent','33 San Salvador Street',9,'SUV','2017-02-01T09:00:00','2017-02-03T09:00:00',15,NULL),(17,'Driveway Parking','444 Santa Clara Street',3,'Car','2017-01-01T09:00:00','2017-01-02T09:00:00',12,NULL),(18,'Small Driveway Parking','99 North 10th Street',5,'SUV','2017-01-02T09:00:00','2017-01-03T09:00:00',13,NULL),(19,'Large Driveway Parking','66 Seventh Street',11,'Truck/Van','2017-01-03T09:00:00','2017-01-04T09:00:00',14,NULL),(20,'**Hot** Parking','77 Seventh Street',10,'Truck','2017-01-04T09:00:00','2017-01-05T09:00:00',15,NULL),(21,'Close to Duncan Hall','111 San Pedro Street',19,'Truck/SUV','2017-01-05T09:00:00','2017-01-06T09:00:00',12,NULL),(22,'Close to MLK','112 San Fernando Street',19,'Truck','2017-01-06T09:00:00','2017-01-07T09:00:00',13,NULL),(23,'Across From MLK','116 San Fernando Street',14,'Car','2017-01-07T09:00:00','2017-01-08T09:00:00',14,NULL),(24,'Across from Duncan Hall','132 San Pedro Street',12,'Car','2017-01-08T09:00:00','2017-01-09T09:00:00',15,NULL),(25,'Driveway Parking','456 South 10th Street',9,'Truck','2017-01-09T09:00:00','2017-01-10T09:00:00',12,NULL),(26,'All Day Driveway Parking','123 Seventh St.',12,'Car','2017-01-10T06:00:00','2017-01-11T23:00:00',13,NULL),(27,'Morning Parking','987 Santa Clara Street',9,'Truck','2017-01-12T09:00:00','2017-01-13T14:00:00',14,NULL),(28,'Afternoon Parking','987 Santa Clara Street',3,'Car','2017-01-13T14:00:00','2017-01-13T23:00:00',15,NULL),(29,'Driveway Parking','456 South 10th Street',9,'Truck','2017-01-13T09:00:00','2017-01-14T09:00:00',12,NULL),(30,'Parking Across from Campus','999 San Pedro Street',10,'Car','2017-01-14T06:00:00','2017-01-14T23:00:00',13,NULL),(31,'Car Parking','333 Tenth Street',6,'Car','2017-01-14T06:00:00','2017-01-15T23:00:00',14,NULL),(32,'Truck Parking','444 Seventh Street',5,'Car','2017-01-15T06:00:00','2017-01-16T23:00:00',15,NULL),(33,'Safe Parking','777 Seventh Street',7,'Car','2017-01-16T06:00:00','2017-01-17T23:00:00',12,NULL),(34,'Parking Spot In Sketchy Area','89 Sketchy Avenue',10,'Truck','2017-01-17T06:00:00','2017-01-17T23:00:00',13,NULL),(35,'Shade Parking','98  South Street',7,'Car','2017-01-17T06:00:00','2017-01-18T23:00:00',14,NULL),(36,'Close to Campus Parking Spot','222 San Fernando Street',7,'Truck','2017-01-18T06:00:00','2017-01-18T23:00:00',15,NULL),(37,'Grass Parking','333 Seventh St',10,'Car','2017-01-19T06:00:00','2017-01-19T23:00:00',12,NULL),(38,'**Sweet** Spot','77 Seventh Street',8,'Truck','2017-01-01T06:00:00','2017-01-30T23:00:00',13,NULL),(39,'**Close** TO Campus','111 San Pedro Street',7,'Truck','2016-12-01T06:00:00','2016-12-31T23:00:00',14,NULL),(40,'Close To Library','55 10th Street',12,'Car','2017-01-28T06:00:00','2017-05-26T23:00:00',15,NULL),(41,'14 Street Parking','251 South 14th Street',6,'Truck/SUV/Car','2017-01-19T09:00:00','2017-01-20T09:00:00',12,NULL),(42,'13 Street Parking','201 South 13th Street',7,'Truck/SUV/Car','2017-01-20T09:00:00','2017-01-21T09:00:00',13,NULL),(43,'12 Street Parking','285 South 12th Street',7,'Car','2017-01-21T09:00:00','2017-01-28T09:00:00',14,NULL),(44,'House Behind Hobags','292 South 12th Street',8,'Car','2017-01-21T09:00:00','2017-01-22T09:00:00',15,NULL),(45,'Close To Naglee Garage','315 S 12th Street',8,'Car','2017-01-22T09:00:00','2017-01-23T09:00:00',12,NULL),(46,'8 minute walk to SJSU','316 South 12th Street',8,'Truck/SUV/Car','2017-01-23T09:00:00','2017-01-24T09:00:00',13,NULL),(47,'Big for One Sedan','173 South 13th Street',9,'Car','2017-02-01T09:00:00','2017-02-28T09:00:00',14,NULL),(48,'International House Parking','383 South 11th Street',7,'Car','2017-02-12T09:00:00','2017-02-19T09:00:00',15,NULL),(49,'Nearby SJSU','335 South 11th Street',7,'Car','2017-02-12T09:00:00','2017-03-10T09:00:00',12,NULL);
/*!40000 ALTER TABLE `PARKINGLISTING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RENTER`
--

DROP TABLE IF EXISTS `RENTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RENTER` (
  `uID` int(11) DEFAULT NULL,
  `rRenterID` int(11) NOT NULL AUTO_INCREMENT,
  `rStreet` varchar(30) DEFAULT NULL,
  `rCity` varchar(30) DEFAULT NULL,
  `rState` varchar(30) DEFAULT NULL,
  `rZip` int(11) DEFAULT NULL,
  PRIMARY KEY (`rRenterID`),
  KEY `uID` (`uID`),
  CONSTRAINT `renter_ibfk_1` FOREIGN KEY (`uID`) REFERENCES `USER` (`uID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RENTER`
--

LOCK TABLES `RENTER` WRITE;
/*!40000 ALTER TABLE `RENTER` DISABLE KEYS */;
INSERT INTO `RENTER` VALUES (12,1,'1 washington square','San Jose','California',95101),(13,2,'2 washington square','San Jose','California',95101),(14,3,'3 washington square','San Jose','California',95101),(15,4,'4 washington square','San Jose','California',95101);
/*!40000 ALTER TABLE `RENTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `uID` int(11) NOT NULL AUTO_INCREMENT,
  `uUsername` varchar(30) DEFAULT NULL,
  `uEmail` varchar(50) DEFAULT NULL,
  `uPWord` varchar(50) DEFAULT NULL,
  `uRenter` tinyint(4) DEFAULT '0',
  `uFname` varchar(20) DEFAULT NULL,
  `uLname` varchar(20) DEFAULT NULL,
  `uPhoneNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'student1','student1@sjsu.edu','cs160',0,'student1','sjsu','123-456-7890\r'),(2,'student2','student2@sjsu.edu','cs160',0,'student2','sjsu','123-456-7890\r'),(3,'student2','student3@sjsu.edu','cs160',0,'student3','sjsu','123-456-7890\r'),(4,'student4','student4@sjsu.edu','cs160',0,'student4','sjsu','123-456-7890\r'),(5,'student5','student5@sjsu.edu','cs160',0,'student5','sjsu','123-456-7890\r'),(6,'student6','student6@sjsu.edu','cs160',0,'student6','sjsu','123-456-7890\r'),(7,'student7','student7@sjsu.edu','cs160',0,'student7','sjsu','123-456-7890\r'),(8,'student8','student8@sjsu.edu','cs160',0,'student8','sjsu','123-456-7890\r'),(9,'student9','student9@sjsu.edu','cs160',0,'student9','sjsu','123-456-7890\r'),(10,'student10','student10@sjsu.edu','cs160',0,'student10','sjsu','123-456-7890\r'),(11,'student11','student11@sjsu.edu','cs160',0,'student11','sjsu','123-456-7890\r'),(12,'pullup1','calvintruong26@live.com ','cs160',1,'Calvin','Truong','415-613-5632\r'),(13,'pullup2','bkchhay@gmail.com','cs160',1,'Borum','Chhay','408-343-3425\r'),(14,'pullup3','gabrielorellana448@gmail.com','cs160',1,'Gabriel','Orellana','619-234-2342\r'),(15,'pullup4','s.gonzzo25@gmail.com','cs160',1,'Steven','Gonzalez','626-245-2452');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-07 23:10:29
