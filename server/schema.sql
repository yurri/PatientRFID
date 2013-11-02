CREATE DATABASE  IF NOT EXISTS `med_student_app` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `med_student_app`;
-- MySQL dump 10.13  Distrib 5.6.11, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: med_student_app
-- ------------------------------------------------------
-- Server version	5.6.11

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
-- Table structure for table `assignment_tasks`
--

DROP TABLE IF EXISTS `assignment_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `accomplished` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_tasks`
--

LOCK TABLES `assignment_tasks` WRITE;
/*!40000 ALTER TABLE `assignment_tasks` DISABLE KEYS */;
INSERT INTO `assignment_tasks` VALUES (1,1,1,NULL),(2,1,2,NULL),(3,1,3,NULL),(4,1,4,NULL),(5,1,5,NULL),(6,1,6,NULL),(7,1,7,NULL),(8,1,8,NULL),(9,1,9,NULL),(10,1,10,NULL),(11,1,11,NULL),(12,1,12,NULL),(13,1,13,NULL),(14,1,14,NULL),(16,4,1,'2013-05-25 22:07:04'),(17,4,2,'2013-05-25 22:07:10'),(18,4,3,'2013-05-25 22:07:07'),(19,4,4,NULL),(20,4,6,NULL),(21,4,7,NULL),(22,5,5,NULL),(23,5,6,'2013-05-26 08:37:58'),(24,5,7,'2013-05-26 08:38:00'),(25,5,8,NULL),(26,5,9,NULL),(27,6,1,NULL),(28,6,2,NULL),(29,6,3,NULL),(30,6,4,NULL),(31,6,5,'2013-05-26 09:30:52'),(32,6,6,NULL),(33,6,7,NULL),(34,6,8,NULL),(35,6,9,NULL),(36,6,10,NULL),(37,6,11,NULL),(38,6,12,NULL),(39,6,13,NULL),(40,6,14,NULL),(41,7,1,NULL),(42,7,2,NULL),(43,7,3,NULL),(44,7,4,NULL),(45,7,5,NULL),(46,8,1,NULL),(47,8,2,NULL),(48,8,3,NULL);
/*!40000 ALTER TABLE `assignment_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,1,1,'2013-05-25 21:40:46','2013-05-25 21:40:46'),(2,1,2,'2013-05-25 21:53:08','2013-05-25 21:53:08'),(3,1,1,'2013-05-25 21:53:19','2013-05-25 21:53:19'),(4,1,1,'2013-05-26 08:37:49','2013-05-26 08:37:49'),(5,1,2,'2013-05-26 10:11:48','2013-05-26 10:11:48'),(6,2,1,'2013-05-26 09:30:39',NULL),(7,3,2,'2013-05-26 09:34:21',NULL),(8,1,1,'2013-05-26 10:11:48',NULL);
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_comments`
--

DROP TABLE IF EXISTS `case_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` varchar(512) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_comments`
--

LOCK TABLES `case_comments` WRITE;
/*!40000 ALTER TABLE `case_comments` DISABLE KEYS */;
INSERT INTO `case_comments` VALUES (1,1,'2013-05-25 23:01:05','Does everyone use SOCRATES for pain?',1),(2,1,'2013-05-25 23:01:14','Yes, I find it helpful to ensure I have asked all the relevant questions',1),(3,1,'2013-05-25 23:01:21','Do you document it as SOCRATES in the notes?',1),(4,1,'2013-05-25 23:01:27','I only use it as a memory aid, I think it depends of personal preference.',1),(5,1,'2013-05-25 23:01:36','Anyone know of any other useful mneumonics?',1),(6,1,'2013-05-25 23:01:42','VITAMIN D',1),(7,3,'2013-05-26 09:51:35','Comment by Daniel',1),(8,4,'2013-05-26 09:51:52','Comment by John',3),(9,4,'2013-05-26 09:52:09','Comment by Daniel',1);
/*!40000 ALTER TABLE `case_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` varchar(45) NOT NULL,
  `specialty_id` int(11) NOT NULL,
  `complaint` varchar(45) DEFAULT NULL,
  `description` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (1,'1',1,'Chest pain','56 year old gentleman presented to A&E on 20/4/13 with sudden onset, left sided, crushing chest pain which started at 11am this morning.','2013-05-25 22:30:30',1),(2,'1',2,'Weakness','Saw patient with neuro signs. Recent Right MCA stroke. Increased tone, greater in UL vs LL. Spastic in right arm. Upgoing plantars on right foot.','2013-05-26 08:22:25',1),(3,'2',1,'Chest pain','56 year old gentleman presented to A&E on 20/4/13 with sudden onset, left sided, crushing chest pain which started at 11am this morning.','2013-05-26 08:38:38',1),(4,'2',1,'Case in UCH','Test case','2013-05-26 09:35:08',3),(5,'1',1,'Nothing','Test case details','2013-05-26 11:27:16',2);
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitals`
--

DROP TABLE IF EXISTS `hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospitals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitals`
--

LOCK TABLES `hospitals` WRITE;
/*!40000 ALTER TABLE `hospitals` DISABLE KEYS */;
INSERT INTO `hospitals` VALUES (1,'Kings College Hospital'),(2,'University College Hospital');
/*!40000 ALTER TABLE `hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialties`
--

DROP TABLE IF EXISTS `specialties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialties`
--

LOCK TABLES `specialties` WRITE;
/*!40000 ALTER TABLE `specialties` DISABLE KEYS */;
INSERT INTO `specialties` VALUES (1,'Cardiac'),(2,'Geriatric'),(3,'General Medicine'),(4,'General Surgery'),(5,'A&E'),(6,'Respiratory'),(7,'Gastroentestinal'),(8,'Neurology'),(9,'Stroke'),(10,'Obstetrics and Gynaecology'),(11,'Paediatrics'),(12,'Psychiatry'),(13,'Ophthalmology'),(14,'Vascular Surgery'),(15,'Urology'),(16,'Trauma and Orthopaedics'),(17,'GI Surgery'),(18,'Plastic Surgery'),(19,'Intensive Care'),(20,'Endocrinology'),(21,'Renal');
/*!40000 ALTER TABLE `specialties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Daniel Wang','daniel.yijian.wang@gmail.com'),(2,'Jane Doe','jane.doe@gmail.com'),(3,'John Doe','john.doe@gmail.com');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Venepuncture'),(2,'IV Cannulation'),(3,'Preparation and administration of IV medication and injections and fluids'),(4,'Arterial puncture in an adult'),(5,'Blood culture (peripheral)'),(6,'IV infusion including the prescription of fluids'),(7,'IV infusion of blood and blood products'),(8,'Injection of local anaesthetic to skin'),(9,'Subcutaneous injection'),(10,'Intramuscular injection'),(11,'Perform and interpret an ECG'),(12,'Perform and interpret peak flow'),(13,'Urethral catheterisation (in adult males and females)'),(14,'Airway care including simple adjuncts');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-26 12:33:44
