/*
SQLyog Community v12.3.2 (64 bit)
MySQL - 5.5.53-log : Database - mpc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mpc` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mpc`;

/*Table structure for table `conversation` */

DROP TABLE IF EXISTS `conversation`;

CREATE TABLE `conversation` (
  `conversationId` int(10) NOT NULL AUTO_INCREMENT,
  `TopicId` int(10) DEFAULT NULL,
  `SubTopicId` int(10) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `ContentText` text,
  `StartedDate` varchar(60) DEFAULT NULL,
  `FollowedDate` varchar(60) DEFAULT NULL,
  `NoOfCon` int(10) DEFAULT NULL,
  PRIMARY KEY (`conversationId`),
  KEY `TopicId` (`TopicId`),
  KEY `SubTopicId` (`SubTopicId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `conversation_ibfk_1` FOREIGN KEY (`TopicId`) REFERENCES `topic` (`TopicId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `conversation_ibfk_2` FOREIGN KEY (`SubTopicId`) REFERENCES `subtopic` (`SubTopicId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `conversation_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `conversation` */

insert  into `conversation`(`conversationId`,`TopicId`,`SubTopicId`,`UserId`,`ContentText`,`StartedDate`,`FollowedDate`,`NoOfCon`) values 
(16,1,2,1,'Hello All','25/01/2017 02:43:48',NULL,NULL),
(17,1,2,3,'Hello All','25/01/2017 02:43:49',NULL,NULL),
(18,1,2,4,'Hello All','25/01/2017 02:43:49',NULL,NULL),
(19,1,2,5,'Hello All','25/01/2017 02:43:49',NULL,NULL),
(20,1,2,9,'Hello All','25/01/2017 02:43:49',NULL,NULL),
(21,1,2,11,'Hello All','25/01/2017 02:43:49',NULL,NULL),
(22,3,12,1,'Hiasdf','25/01/2017 02:44:29',NULL,NULL),
(23,3,12,4,'Hiasdf','25/01/2017 02:44:29',NULL,NULL),
(24,2,2,16,'sdfsdf','25/01/2017 02:51:23',NULL,NULL),
(25,1,3,1,'asdfasdf','25/01/2017 03:00:56',NULL,NULL),
(26,1,3,3,'asdfasdf','25/01/2017 03:00:57',NULL,NULL);

/*Table structure for table `conversationcomment` */

DROP TABLE IF EXISTS `conversationcomment`;

CREATE TABLE `conversationcomment` (
  `CommentId` int(10) NOT NULL AUTO_INCREMENT,
  `conversationId` int(10) DEFAULT NULL,
  `CommentText` text,
  `DateTime` varchar(30) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  PRIMARY KEY (`CommentId`),
  KEY `conversationId` (`conversationId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `conversationcomment_ibfk_1` FOREIGN KEY (`conversationId`) REFERENCES `conversation` (`conversationId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `conversationcomment_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `conversationcomment` */

insert  into `conversationcomment`(`CommentId`,`conversationId`,`CommentText`,`DateTime`,`UserId`) values 
(1,22,'                                              hellp','25/01/2017 02:45:13',2),
(2,17,'hiiii','25/01/2017 03:10:41',3),
(3,16,'sadfasdf','25/01/2017 03:11:06',5),
(4,17,'hello','25/01/2017 05:21:44',2),
(5,17,'hello','25/01/2017 05:21:44',4),
(6,17,'Hello','25/01/2017 06:31:45',3);

/*Table structure for table `subtopic` */

DROP TABLE IF EXISTS `subtopic`;

CREATE TABLE `subtopic` (
  `SubTopicId` int(10) NOT NULL AUTO_INCREMENT,
  `TopicId` int(10) DEFAULT NULL,
  `SubTopicName` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`SubTopicId`),
  KEY `TopicId` (`TopicId`),
  CONSTRAINT `subtopic_ibfk_1` FOREIGN KEY (`TopicId`) REFERENCES `topic` (`TopicId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `subtopic` */

insert  into `subtopic`(`SubTopicId`,`TopicId`,`SubTopicName`) values 
(1,1,'Ab'),
(2,2,'Ac'),
(3,3,'Ad'),
(4,4,'Ae'),
(5,5,'Af'),
(6,6,'Ag'),
(7,7,'Ah'),
(8,8,'Ai'),
(9,9,'Aj'),
(10,10,'Ak'),
(11,11,'Al'),
(12,12,'Am'),
(13,13,'An');

/*Table structure for table `topic` */

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `TopicId` int(10) NOT NULL AUTO_INCREMENT,
  `TopicName` varchar(60) DEFAULT NULL,
  `VesselName` varchar(60) DEFAULT NULL,
  `QCNO` int(10) DEFAULT NULL,
  `alertNo` int(10) DEFAULT NULL,
  PRIMARY KEY (`TopicId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `topic` */

insert  into `topic`(`TopicId`,`TopicName`,`VesselName`,`QCNO`,`alertNo`) values 
(1,'Vessel','Africa',12,1),
(2,'Vessel1','America',13,2),
(3,'Vessel2','Canada',14,3),
(4,'Vessel3','Mexico',15,2),
(5,'Vessel4','London',16,1),
(6,'Vessel5','Berlin',17,2),
(7,'Vessel6','China',18,3),
(8,'Vessel7','Delhi',19,2),
(9,'Vessel9','Kolkata',20,1),
(10,'Vessel10','Mumbai',21,2),
(11,'Vessel11','Chennai',22,1),
(12,'Vessel12','Banglore',23,2),
(13,'Vessel13','Nagpur',24,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `UserId` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`UserId`,`UserName`) values 
(1,'naman'),
(2,'jagmohan'),
(3,'faiz'),
(4,'pramod'),
(5,'himanshu'),
(6,'ashok'),
(7,'navdeep'),
(8,'priti'),
(9,'swati'),
(10,'rashi'),
(11,'parveen'),
(12,'Satya'),
(13,'JS'),
(14,'SS'),
(15,'FA'),
(16,'Singh'),
(17,'kaur');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
