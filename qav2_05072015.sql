CREATE DATABASE  IF NOT EXISTS `qav2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `qav2`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: qav2
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(150) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'IT',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClassroomName` varchar(250) DEFAULT NULL,
  `ClassroomDescription` varchar(2000) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `OwnerUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Classroom_Category_idx` (`CategoryId`),
  KEY `FK_Classroom_Owner_idx` (`OwnerUserId`),
  CONSTRAINT `FK_Classroom_Class_Category` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Classroom_Class_Owner` FOREIGN KEY (`OwnerUserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES (1,'class1','about class',1,1);
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom_user`
--

DROP TABLE IF EXISTS `classroom_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClassroomId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Type` int(11) DEFAULT NULL,
  `Approval` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Classroom_User_Classroom_idx` (`ClassroomId`),
  KEY `FK_Classroom_User_User_idx` (`UserId`),
  CONSTRAINT `FK_Classroom_ClassUser_Class` FOREIGN KEY (`ClassroomId`) REFERENCES `classroom` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Classroom_User_User` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom_user`
--

LOCK TABLES `classroom_user` WRITE;
/*!40000 ALTER TABLE `classroom_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `classroom_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ManagerId` int(11) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Classroom_library_user_idx` (`ManagerId`),
  CONSTRAINT `FK_Classroom_library_user` FOREIGN KEY (`ManagerId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (1,1,'sicacho'),(2,1,'java');
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follower`
--

DROP TABLE IF EXISTS `follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follower` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TeacherId` int(11) DEFAULT NULL,
  `FollowerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_follower_TeacherId_idx` (`TeacherId`),
  KEY `FK_follower_FollowerId_idx` (`FollowerId`),
  CONSTRAINT `FK_follower_FollowerId` FOREIGN KEY (`FollowerId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_follower_TeacherId` FOREIGN KEY (`TeacherId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follower`
--

LOCK TABLES `follower` WRITE;
/*!40000 ALTER TABLE `follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `StoredURL` varchar(255) DEFAULT NULL,
  `ManagerId` int(11) NOT NULL,
  `MaterialId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_9ov8s611btbtgjfm9fgi99syu` (`ManagerId`),
  KEY `FK_lewnxhxc15tu70yw67mw6hee0` (`MaterialId`),
  CONSTRAINT `FK_9ov8s611btbtgjfm9fgi99syu` FOREIGN KEY (`ManagerId`) REFERENCES `user` (`Id`),
  CONSTRAINT `FK_lewnxhxc15tu70yw67mw6hee0` FOREIGN KEY (`MaterialId`) REFERENCES `material` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(55) DEFAULT NULL,
  `FolderId` int(11) DEFAULT NULL,
  `OwnerClassId` int(11) DEFAULT NULL,
  `CreationDate` datetime(6) DEFAULT NULL,
  `Size` double DEFAULT NULL,
  `FileURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_material_folder_idx` (`FolderId`),
  KEY `FK_material_class_idx` (`OwnerClassId`),
  CONSTRAINT `FK_material_class` FOREIGN KEY (`OwnerClassId`) REFERENCES `classroom` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_material_folder` FOREIGN KEY (`FolderId`) REFERENCES `folder` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'I2EE',1,NULL,'2015-06-06 12:12:12.000000',3024,'/folder/1/I2EE'),(2,'I2ET',1,NULL,'2015-06-06 12:12:12.000000',6532,'/folder/1/I2EE'),(3,'C#',1,NULL,'2015-06-06 12:12:12.000000',9513,'/folder/1/I2EE');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ReceiverId` int(11) DEFAULT NULL,
  `SenderId` int(11) DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `NotificationType` int(11) DEFAULT NULL,
  `IsViewed` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Classroom_user_sender_idx` (`SenderId`),
  KEY `FK_Classroom_user_receiver_idx` (`ReceiverId`),
  CONSTRAINT `FK_Classroom_user_receiver` FOREIGN KEY (`ReceiverId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Classroom_user_sender` FOREIGN KEY (`SenderId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AcceptedAnswerId` int(11) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `CreationDate` datetime(6) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `Body` longtext,
  `PostType` int(11) DEFAULT NULL,
  `OwnerUserId` int(11) DEFAULT NULL,
  `OwnerClassId` int(11) DEFAULT NULL,
  `LastEditedDate` datetime(6) DEFAULT NULL,
  `ReplyCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Classroom_user_owner_idx` (`OwnerUserId`),
  KEY `FK_Classroom_post_class_idx` (`OwnerClassId`),
  CONSTRAINT `FK_Classroom_post_class` FOREIGN KEY (`OwnerClassId`) REFERENCES `classroom` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Classroom_post_owner` FOREIGN KEY (`OwnerUserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,NULL,NULL,NULL,'tesst','<p>khang test&nbsp;<span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span></p>\r\n',1,1,1,NULL,NULL),(2,NULL,NULL,'2015-06-06 14:36:48.323000','square','<p>Not to be confused with&nbsp;<a href=\"http://en.wikipedia.org/wiki/Square_Roots\">the music festival</a>&nbsp;or&nbsp;<a href=\"http://en.wikipedia.org/wiki/Square_Roots:_The_Story_of_SpongeBob_SquarePants\">the documentary</a>.</p>\r\n\r\n<p>&quot;&radic;&quot; redirects here. For the similar symbol &#10003;, see&nbsp;<a href=\"http://en.wikipedia.org/wiki/Check_mark\">Check mark</a>.</p>\r\n\r\n<p><a href=\"http://en.wikipedia.org/wiki/File:Nuvola_apps_edu_mathematics_blue-p.svg\"><img alt=\"\" src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Nuvola_apps_edu_mathematics_blue-p.svg/256px-Nuvola_apps_edu_mathematics_blue-p.svg.png\" style=\"height:256px; width:256px\" /></a></p>\r\n\r\n<p>The mathematical expression &#39;The (principal) square root of x&quot;</p>\r\n\r\n<p>In&nbsp;<a href=\"http://en.wikipedia.org/wiki/Mathematics\">mathematics</a>, a&nbsp;<strong>square root</strong>&nbsp;of a number&nbsp;<em>a</em>&nbsp;is a number&nbsp;<em>y</em>&nbsp;such that&nbsp;<em>y</em>2&nbsp;=&nbsp;<em>a</em>, in other words, a number&nbsp;<em>y</em>&nbsp;whose&nbsp;<em><a href=\"http://en.wikipedia.org/wiki/Square_(algebra)\">square</a></em>&nbsp;(the result of multiplying the number by itself, or&nbsp;<em>y</em>&nbsp;&times;&nbsp;<em>y</em>) is&nbsp;<em>a</em>.<a href=\"http://en.wikipedia.org/wiki/Square_root#cite_note-1\">[1]</a>&nbsp;For example, 4 and &minus;4 are square roots of 16 because&nbsp;42&nbsp;= (&minus;4)2&nbsp;= 16.</p>\r\n\r\n<p>Every non-negative&nbsp;<a href=\"http://en.wikipedia.org/wiki/Real_number\">real number</a>&nbsp;<em>a</em>&nbsp;has a unique non-negative square root, called the&nbsp;<em>principal square root</em>, which is denoted by&nbsp;&radic;<em>a</em>, where &radic; is called the&nbsp;<em><a href=\"http://en.wikipedia.org/wiki/Radical_sign\">radical sign</a></em>&nbsp;or&nbsp;<em>radix</em>. For example, the principal square root of 9 is 3, denoted&nbsp;&radic;9&nbsp;= 3, because&nbsp;32&nbsp;= 3 &times; 3 = 9and 3 is non-negative. The term whose root is being considered is known as the&nbsp;<em>radicand</em>. The radicand is the number or expression underneath the radical sign, in this example 9.</p>\r\n\r\n<p>Every positive number&nbsp;<em>a</em>&nbsp;has two square roots:&nbsp;&radic;<em>a</em>, which is positive, and &minus;&radic;<em>a</em>, which is negative. Together, these two roots are denoted &plusmn;&nbsp;&radic;<em>a</em>&nbsp;(see&nbsp;<a href=\"http://en.wikipedia.org/wiki/%C2%B1_shorthand\">&plusmn; shorthand</a>). Although the principal square root of a positive number is only one of its two square roots, the designation &quot;<em>the</em>&nbsp;square root&quot; is often used to refer to the&nbsp;<em>principal</em>&nbsp;square root. For positive&nbsp;<em>a</em>, the principal square root can also be written in&nbsp;<a href=\"http://en.wikipedia.org/wiki/Exponentiation\">exponent</a>&nbsp;notation, as&nbsp;<em>a</em>1/2.<a href=\"http://en.wikipedia.org/wiki/Square_root#cite_note-2\">[2]</a></p>\r\n\r\n<p>Square roots of negative numbers can be discussed within the framework of&nbsp;<a href=\"http://en.wikipedia.org/wiki/Complex_number\">complex numbers</a>. More generally, square roots can be considered in any context in which a notion of &quot;squaring&quot; of some mathematical objects is defined (including&nbsp;<a href=\"http://en.wikipedia.org/wiki/Matrix_(mathematics)\">algebras of matrices</a>,<a href=\"http://en.wikipedia.org/wiki/Endomorphism_ring\">endomorphism rings</a>, etc.)</p>\r\n',1,1,1,'2015-06-06 14:36:48.323000',NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_invitation`
--

DROP TABLE IF EXISTS `post_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_invitation` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TeacherId` int(11) DEFAULT NULL,
  `PostId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_PostInvitation_Teacher_idx` (`TeacherId`),
  KEY `FK_PostInvitation_Post_idx` (`PostId`),
  CONSTRAINT `FK_PostInvitation_Post` FOREIGN KEY (`PostId`) REFERENCES `post` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PostInvitation_Teacher` FOREIGN KEY (`TeacherId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_invitation`
--

LOCK TABLES `post_invitation` WRITE;
/*!40000 ALTER TABLE `post_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Student'),(2,'Teacher');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TagName` varchar(25) DEFAULT NULL,
  `TagCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'java',200),(2,'C#',300),(3,'PHP',100),(4,'javascript',100),(5,'javaEE',100);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_classroom`
--

DROP TABLE IF EXISTS `tag_classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_classroom` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TagId` int(11) NOT NULL,
  `ClassroomId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Classroom_tag_class_idx` (`ClassroomId`),
  KEY `FK_Classroom_tag_name_idx` (`TagId`),
  CONSTRAINT `FK_Classroom_tag_class` FOREIGN KEY (`ClassroomId`) REFERENCES `classroom` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Classroom_tag_name` FOREIGN KEY (`TagId`) REFERENCES `tag` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_classroom`
--

LOCK TABLES `tag_classroom` WRITE;
/*!40000 ALTER TABLE `tag_classroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_post`
--

DROP TABLE IF EXISTS `tag_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_post` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TagId` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Classroom_tag_post_idx` (`PostId`),
  KEY `FK_Classroom_tag_name_idx` (`TagId`),
  CONSTRAINT `FK_Classroom_tagPost_name` FOREIGN KEY (`TagId`) REFERENCES `tag` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Classroom_tagPost_postId` FOREIGN KEY (`PostId`) REFERENCES `post` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_post`
--

LOCK TABLES `tag_post` WRITE;
/*!40000 ALTER TABLE `tag_post` DISABLE KEYS */;
INSERT INTO `tag_post` VALUES (1,1,1),(2,3,1),(3,2,1),(4,1,2),(5,3,2),(6,4,2);
/*!40000 ALTER TABLE `tag_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_user`
--

DROP TABLE IF EXISTS `tag_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TagId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Classroom_TagUser_name_idx` (`UserId`),
  KEY `FK_Classroom_TagUser_Tagname_idx` (`TagId`),
  CONSTRAINT `FK_Classroom_TagUser_Tagname` FOREIGN KEY (`TagId`) REFERENCES `tag` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Classroom_TagUser_name` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_user`
--

LOCK TABLES `tag_user` WRITE;
/*!40000 ALTER TABLE `tag_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(50) DEFAULT NULL,
  `CreationDate` datetime(6) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `DisplayName` varchar(50) DEFAULT NULL,
  `AboutMe` varchar(2000) DEFAULT NULL,
  `ProfileImageURL` varchar(200) DEFAULT NULL,
  `RoleId` int(11) DEFAULT NULL,
  `Status` char(1) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Classroom_user_role_idx` (`RoleId`),
  KEY `FK_Classroom_user_category_idx` (`CategoryId`),
  CONSTRAINT `FK_Classroom_user_category` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Classroom_user_role` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'khang123',NULL,'trustme013@gmail.com','khang','hehe',NULL,2,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-07 20:47:27
