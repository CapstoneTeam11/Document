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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
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
  `MaterialId` int(11) NOT NULL,
  `StoredURL` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Classroom_library_material_idx` (`MaterialId`),
  KEY `FK_Classroom_library_user_idx` (`ManagerId`),
  CONSTRAINT `FK_Classroom_library_material` FOREIGN KEY (`MaterialId`) REFERENCES `material` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Classroom_library_user` FOREIGN KEY (`ManagerId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
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
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationDate` datetime(6) DEFAULT NULL,
  `OwnerClassId` int(11) DEFAULT NULL,
  `Size` double DEFAULT NULL,
  `FileURL` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'java',200),(2,'C#',300),(3,'PHP',100),(4,'javascript',100);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_post`
--

LOCK TABLES `tag_post` WRITE;
/*!40000 ALTER TABLE `tag_post` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2015-06-05 20:15:32
