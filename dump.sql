-- MySQL dump 10.13  Distrib 5.1.63, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: goonjDB
-- ------------------------------------------------------
-- Server version	5.1.63-0ubuntu0.10.04.1

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
-- Table structure for table `goonj_loc_country`
--

DROP TABLE IF EXISTS `goonj_loc_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goonj_loc_country` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goonj_loc_country`
--

LOCK TABLES `goonj_loc_country` WRITE;
/*!40000 ALTER TABLE `goonj_loc_country` DISABLE KEYS */;
INSERT INTO `goonj_loc_country` VALUES (1,'India');
/*!40000 ALTER TABLE `goonj_loc_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goonj_loc_state`
--

DROP TABLE IF EXISTS `goonj_loc_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goonj_loc_state` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country` (`country_id`),
  CONSTRAINT `fk_country` FOREIGN KEY (`country_id`) REFERENCES `goonj_loc_country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goonj_loc_state`
--

LOCK TABLES `goonj_loc_state` WRITE;
/*!40000 ALTER TABLE `goonj_loc_state` DISABLE KEYS */;
INSERT INTO `goonj_loc_state` VALUES (2,'Jharkhand',1);
/*!40000 ALTER TABLE `goonj_loc_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goonj_loc_district`
--

DROP TABLE IF EXISTS `goonj_loc_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goonj_loc_district` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_state` (`state_id`),
  CONSTRAINT `fk_state` FOREIGN KEY (`state_id`) REFERENCES `goonj_loc_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goonj_loc_district`
--

LOCK TABLES `goonj_loc_district` WRITE;
/*!40000 ALTER TABLE `goonj_loc_district` DISABLE KEYS */;
INSERT INTO `goonj_loc_district` VALUES (1,'Bokaro',2),(2,'Giridih',2),(3,'Chatra',2),(4,'Not Known',2),(5,'Dhanbad',2),(6,'Ranchi',2),(7,'Latehar',2),(8,'Garhwa',2),(9,'Deoghar',2),(10,'Ramgarh',2),(11,'West Singhbhum',2),(12,'Sahibganj',2),(13,'East Singhbhum',2),(14,'Hazaribagh',2),(15,'Seraikella-Kharsawan',2),(16,'Dumka',2),(17,'Palamu',2),(18,'Lohardaga',2),(19,'Simdega',2),(20,'Jamtara',2),(21,'Godda',2),(22,'Koderma',2),(23,'Pakur',2),(24,'Gumla',2),(25,'Khunti',2);
/*!40000 ALTER TABLE `goonj_loc_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goonj_loc_village`
--

DROP TABLE IF EXISTS `goonj_loc_village`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goonj_loc_village` (
  `id` int(11) NOT NULL DEFAULT '0',
  `village` varchar(50) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `block_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vilfk_country` (`country_id`),
  KEY `vilfk_state` (`state_id`),
  KEY `vilfk_district` (`district_id`),
  KEY `vilfk_block` (`block_id`),
  CONSTRAINT `vilfk_block` FOREIGN KEY (`block_id`) REFERENCES `goonj_loc_block` (`id`),
  CONSTRAINT `vilfk_country` FOREIGN KEY (`country_id`) REFERENCES `goonj_loc_country` (`id`),
  CONSTRAINT `vilfk_district` FOREIGN KEY (`district_id`) REFERENCES `goonj_loc_district` (`id`),
  CONSTRAINT `vilfk_state` FOREIGN KEY (`state_id`) REFERENCES `goonj_loc_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goonj_loc_village`
--

LOCK TABLES `goonj_loc_village` WRITE;
/*!40000 ALTER TABLE `goonj_loc_village` DISABLE KEYS */;
INSERT INTO `goonj_loc_village` VALUES (4,'Not Known',1,2,1,1),(5,'Not Known',1,2,1,2),(7,'Not Known',1,2,1,3),(8,'Not Known',1,2,1,4),(9,'Not Known',1,2,1,5),(10,'Not Known',1,2,1,6),(11,'Not Known',1,2,1,7),(12,'Not Known',1,2,1,8),(13,'Not Known',1,2,4,10),(14,'Not Known',1,2,1,9),(15,'Not Known',1,2,2,11),(16,'Not Known',1,2,2,12),(17,'Not Known',1,2,2,13),(18,'Not Known',1,2,2,14),(19,'Not Known',1,2,2,15),(20,'Not Known',1,2,2,16),(21,'Not Known',1,2,2,17),(22,'Not Known',1,2,2,18),(23,'Not Known',1,2,2,19),(24,'Not Known',1,2,2,20),(25,'Not Known',1,2,2,21),(26,'Not Known',1,2,2,22),(27,'Not Known',1,2,2,23),(28,'Not Known',1,2,3,24),(29,'Not Known',1,2,3,25),(30,'Not Known',1,2,3,26),(31,'Not Known',1,2,3,27),(32,'Not Known',1,2,3,28),(33,'Not Known',1,2,3,29),(34,'Not Known',1,2,3,30),(35,'Not Known',1,2,3,31),(36,'Not Known',1,2,3,32),(37,'Not Known',1,2,3,33),(38,'Not Known',1,2,5,34),(39,'Not Known',1,2,5,35),(40,'Not Known',1,2,5,36),(41,'Not Known',1,2,5,37),(42,'Not Known',1,2,5,38),(43,'Not Known',1,2,5,39),(44,'Not Known',1,2,5,40),(45,'Not Known',1,2,5,41),(46,'Not Known',1,2,5,42),(47,'Pawapur Panchayat',1,2,5,40),(48,'Karmatand Village, Pawapur Panchayat',1,2,5,40),(49,'Jaruwadih Village, Pawapur Panchayat',1,2,5,40),(50,'Amalkhori Village, Pawapur Panchayat',1,2,5,40),(51,'Singhdih Village, Pawapur Panchayat',1,2,5,40),(52,'Kalyanpur Village, Pawapur Panchayat',1,2,5,40),(53,'Batto Urph Barahgora Village, Pawapur Panchayat',1,2,5,40),(54,'Dhanaigariya Village, Pawapur Panchayat ',1,2,5,40),(55,'Chinpur Village, Pawapur Panchayat',1,2,5,40),(56,'Satkira Village, Pawapur Panchayat',1,2,5,40),(57,'Pawapur Village, Pawapur Panchayat',1,2,5,40),(58,'Piparadih Village, Pawapur Panchayat',1,2,5,40),(59,'Topchanchi Village, Topchanchi Panchayat',1,2,5,40),(62,'Korkota Panchayat',1,2,5,40),(63,'Duwrajpur Village, Korkota Panchayat',1,2,5,40),(64,'Phatehpur Urph Khatdih Village, Korkota Panchayat',1,2,5,40),(65,'Lakhanpur Village, Korkota Panchayat',1,2,5,40),(66,'Korkata Village, Korkota Panchayat',1,2,5,40),(67,'Machchedaha Village, Korkota Panchayat',1,2,5,40),(68,'Kanadih Urph Markachcho Village, Korkota Panchayat',1,2,5,40),(69,'Chaurapatti Village, Korkota Panchayat',1,2,5,40),(70,'Hariharpur Village, Hariharpur Panchayat',1,2,5,40),(71,'Bishanpur Panchayat',1,2,5,40),(72,'Bishanpur Village, Bishanpur Panchayat',1,2,5,40),(73,'Laxmipur Village, Bishanpur Panchayat',1,2,5,40),(74,'Jeetpur Panchayat',1,2,5,40),(75,'Jeetpur Village, Jeetpur Panchayat',1,2,5,40),(76,'Laludih Village, Jeetpur Panchayat',1,2,5,40),(77,'Gomo Part, Gomo South Panchayat',1,2,5,40),(78,'Gomo Part, Gomo North Panchayat',1,2,5,40),(79,'Khesmi Village, Khesmi Panchayat',1,2,5,40),(80,'Bhuiya Chitro Panchayat',1,2,5,40),(81,'Ratanpur Village, Bhuiya Chitro Panchayat',1,2,5,40),(82,'Raghunathpur Village, Bhuiya Chitro Panchayat',1,2,5,40),(83,'Bhuiya Chitro Village, Bhuiya Chitro Panchayat',1,2,5,40),(84,'Paharpur Village, Bhuiya Chitro Panchayat',1,2,5,40),(85,'Dumdumi Panchayat',1,2,5,40),(86,'Dadu Bhangath Village, Dumdumi Panchayat',1,2,5,40),(87,'Dumdumi Village, Dumdumi Panchayat',1,2,5,40),(88,'Bhanwar Daha Village, Dumdumi Panchayat',1,2,5,40),(89,'Chalkari Village, Dumdumi Panchayat',1,2,5,40),(90,'Chhota Kanadih Village, Dumdumi Panchayat',1,2,5,40),(91,'Belatand Village, Dumdumi Panchayat',1,2,5,40),(92,'Dharampur Village, Dumdumi Panchayat',1,2,5,40),(93,'Rajdaha Village, Dumdumi Panchayat',1,2,5,40),(94,'Bhanghath Village, Dumdumi Panchayat',1,2,5,40),(95,'Karmatand Village, Dumdumi Panchayat',1,2,5,40),(96,'Chitarpur Panchayat',1,2,5,40),(97,'Chitarpur Village, Chitarpur Panchayat',1,2,5,40),(98,'Manjhiladih Village, Chitarpur Panchayat',1,2,5,40),(99,'Ambadih Village, Chitarpur Panchayat',1,2,5,40),(100,'Katuabad Village, Chitarpur Panchayat',1,2,5,40),(101,'Piparadih Village, Chitarpur Panchayat',1,2,5,40),(102,'Madaidih Panchayat',1,2,5,40),(103,'Madaidih Village, Madaidih Panchayat',1,2,5,40),(104,'Ganeshpur Village, Madaidih Panchayat',1,2,5,40),(105,'Khanwadih Village, Madaidih Panchayat',1,2,5,40),(106,'SahuBahiar Village, Madaidih Panchayat',1,2,5,40),(107,'Kalajhar Village, Madaidih Panchayat',1,2,5,40),(108,'Kusumdiha Village, Madaidih Panchayat',1,2,5,40),(109,'Ghunghasa Village, Ghunghasa Panchayat',1,2,5,40),(110,'Khariyo Panchayat',1,2,5,40),(111,'Khariyo Village, Khariyo Panchayat',1,2,5,40),(112,'Barwadih Village, Khariyo Panchayat',1,2,5,40),(113,'Chaita Panchayat',1,2,5,40),(114,'Chaita Village, Chaita Panchayat',1,2,5,40),(115,'Kherabera Village, Chaita Panchayat',1,2,5,40),(116,'Kesalpur Village, Chaita Panchayat',1,2,5,40),(117,'Tantri Panchayat',1,2,5,40),(118,'Tantri Village, Tantri Panchayat',1,2,5,40),(119,'Mango Village, Tantri Panchayat',1,2,5,40),(120,'Kuramu Village, Tantri Panchayat',1,2,5,40),(121,'ChalMundri Village, Tantri Panchayat',1,2,5,40),(122,'Bakaspura Village, Tantri Panchayat',1,2,5,40),(123,'Chirudih Village, Tantri Panchayat',1,2,5,40),(124,'Chinpun Village, Tantri Panchayat',1,2,5,40),(125,'Ramakunda Panchayat',1,2,5,40),(126,'Ramakunda Village, Ramakunda Panchayat',1,2,5,40),(127,'Mathadih Village, Ramakunda Panchayat',1,2,5,40),(128,'Tursabad Village, Ramakunda Panchayat',1,2,5,40),(129,'Damodarpur Village, Ramakunda Panchayat',1,2,5,40),(130,'Gendanawadih Panchayat',1,2,5,40),(131,'Gendanawadih Village, Gendanawadih Panchayat',1,2,5,40),(132,'Mohanpur Village, Gendanawadih Panchayat',1,2,5,40),(133,'Karnagora Village, Gendanawadih Panchayat',1,2,5,40),(134,'Bhikhanidih Village, Gendanawadih Panchayat',1,2,5,40),(135,'Bhelwatand Village, Gendanawadih Panchayat',1,2,5,40),(136,'Sri Rampur Panchayat',1,2,5,40),(137,'SriRampur Village, Sri Rampur Panchayat',1,2,5,40),(138,'Khurmo Village, Sri Rampur Panchayat',1,2,5,40),(139,'Dignagar Village, Sri Rampur Panchayat',1,2,5,40),(140,'Manpur Village, Sri Rampur Panchayat',1,2,5,40),(141,'Pandeydih Village, Sri Rampur Panchayat',1,2,5,40),(142,'Hirapur Village, Sri Rampur Panchayat',1,2,5,40),(143,'Ledatand Panchayat',1,2,5,40),(144,'Belmi Village, Ledatand Panchayat',1,2,5,40),(145,'Pipratand Village, Ledatand Panchayat',1,2,5,40),(146,'Ledadih Village, Ledatand Panchayat',1,2,5,40),(147,'Kamta Village, Ledatand Panchayat',1,2,5,40),(148,'Gormara Village, Ledatand Panchayat',1,2,5,40),(149,'Lokbad Panchayat',1,2,5,40),(150,'Lokbad Village, Lokbad Panchayat',1,2,5,40),(151,'Kandedih Village, Lokbad Panchayat',1,2,5,40),(152,'Belatand Village, Lokbad Panchayat',1,2,5,40),(153,'Simriatand Village, Dumdumi Panchayat',1,2,5,40),(154,'Gorgoro Village, Dumdumi Panchayat',1,2,5,40),(155,'Nero Panchayat',1,2,5,40),(156,'Nero Village, Nero Panchayat',1,2,5,40),(157,'Domanpur Village, Nero Panchayat',1,2,5,40),(158,'Madanpur Village, Nero Panchayat',1,2,5,40),(159,'Khurdih Village, Nero Panchayat',1,2,5,40),(160,'Laxmanpur Village, Nero Panchayat',1,2,5,40),(161,'Dayabans Pahar Village, Nero Panchayat',1,2,5,40),(162,'Singhdaha Panchayat',1,2,5,40),(163,'Ranidih Village, Singhdaha Panchayat',1,2,5,40),(165,'Singhdaha Village, Singhdaha Panchayat',1,2,5,40),(166,'Sirsagara Village, Singhdaha Panchayat',1,2,5,40),(167,'Telodih Village, Singhdaha Panchayat',1,2,5,40),(168,'Patherchapra Village, Singhdaha Panchayat',1,2,5,40),(169,'Matari Panchayat',1,2,5,40),(170,'Matari Village, Matari Panchayat',1,2,5,40),(171,'Pakarbera Village, Matari Panchayat',1,2,5,40),(172,'Sonariyatand Village, Matari Panchayat',1,2,5,40),(173,'Pradhankhanta Panchayat',1,2,5,40),(174,'Pradhankhanta Village, Pradhankhanta Panchayat',1,2,5,40),(175,'Lodwadih Village, Pradhankhanta Panchayat',1,2,5,40),(176,'Rangadih Village, Pradhankhanta Panchayat',1,2,5,40),(177,'Kodadih Village, Pradhankhanta Panchayat',1,2,5,40),(178,'Dhangi Panchayat',1,2,5,40),(179,'Dhangi Village, Dhangi Panchayat',1,2,5,40),(180,'Kharni Village, Dhangi Panchayat',1,2,5,40),(181,'Ramkanali Village, Dhangi Panchayat',1,2,5,40),(182,'Roam Village, Dhangi Panchayat',1,2,5,40),(183,'Baghmara Village, Dhangi Panchayat',1,2,5,40),(184,'Bishanour Village, Dhangi Panchayat',1,2,5,40),(185,'Brahamandiha Panchayat',1,2,5,40),(186,'Nepaidih Village, Brahamandiha Panchayat',1,2,5,40),(187,'Brahamandih Village, Brahamandiha Panchayat',1,2,5,40),(188,'Morhadih Village, Brahamandiha Panchayat',1,2,5,40),(189,'Bagodih Village, Brahamandiha Panchayat',1,2,5,40),(190,'Pathakdih Village, Brahamandiha Panchayat',1,2,5,40),(191,'Asanasingha Village, Brahamandiha Panchayat',1,2,5,40),(192,'Sighabad Village, Brahamandiha Panchayat',1,2,5,40),(193,'Kotaldih Village, Brahamandiha Panchayat',1,2,5,40),(195,'Not Known',1,2,2,4),(196,'Not Known',1,2,7,67),(197,'Not Known',1,2,7,60),(198,'Not Known',1,2,7,61),(199,'Not Known',1,2,7,62),(200,'Not Known',1,2,7,63),(201,'Not Known',1,2,7,64),(202,'Not Known',1,2,7,65),(203,'Not Known',1,2,7,66),(204,'Not Known',1,2,25,241),(205,'Not Known',1,2,25,242),(206,'Not Known',1,2,25,243),(207,'Not Known',1,2,25,244),(208,'Not Known',1,2,25,245),(209,'Not Known',1,2,25,246),(210,'Not known',1,2,2,11),(211,'Not Known',1,2,6,43),(212,'Not Known',1,2,6,44),(213,'Not Known',1,2,6,45),(214,'Not Known',1,2,6,47),(215,'Not Known',1,2,6,46),(216,'Not Known',1,2,6,48),(217,'Not Known',1,2,6,49),(218,'Not Known',1,2,6,50),(219,'Not Known',1,2,6,51),(220,'Not Known',1,2,6,52),(221,'Not Known',1,2,6,53),(222,'Not Known',1,2,6,54),(223,'Not Known',1,2,6,55),(224,'Not Known',1,2,6,56),(225,'Not Known',1,2,6,57),(226,'Not Known',1,2,8,69),(227,'Not Known',1,2,8,70),(228,'Not Known',1,2,8,71),(229,'Not Known',1,2,8,72),(230,'Not Known',1,2,8,73),(231,'Not Known',1,2,8,74),(232,'Not Known',1,2,8,75),(233,'Not Known',1,2,8,76),(234,'Not Known',1,2,8,77),(235,'Not Known',1,2,8,78),(236,'Not Known',1,2,8,79),(237,'Not Known',1,2,8,80),(238,'Not Known',1,2,8,81),(239,'Not Known',1,2,8,85),(240,'Not Known',1,2,8,84),(241,'Not Known',1,2,8,82),(242,'Not Known',1,2,8,83),(243,'Not Known',1,2,8,86),(244,'Not Known',1,2,8,87),(245,'Not Known',1,2,9,88),(246,'Not Known',1,2,9,89),(247,'Not Known',1,2,9,90),(248,'Not Known',1,2,9,91),(249,'Not Known',1,2,9,92),(250,'Not Known',1,2,9,93),(251,'Not Known',1,2,9,94),(252,'Not Known',1,2,9,95),(253,'Not Known',1,2,9,96),(254,'Not Known',1,2,10,97),(255,'Not Known',1,2,10,98),(256,'Not Known',1,2,10,99),(257,'Not known',1,2,10,100),(258,'Not Known',1,2,23,223),(259,'Not Known',1,2,23,224),(260,'Not Known',1,2,23,225),(261,'Not Known',1,2,23,226),(262,'Not Known',1,2,23,227),(263,'Not Known',1,2,23,228),(264,'Not Known',1,2,12,119),(265,'Not Known',1,2,12,120),(266,'Not Known',1,2,12,121),(267,'Not Known',1,2,12,123),(268,'Not Known',1,2,12,122),(269,'Not Known',1,2,12,125),(270,'Not Known',1,2,12,127),(271,'Not Known',1,2,24,240),(272,'Not Known',1,2,24,239),(273,'Not Known',1,2,24,238),(274,'Not Known',1,2,24,237),(275,'Not Known',1,2,24,236),(276,'Not Known',1,2,24,235),(277,'Not Known',1,2,24,234),(278,'Not Known',1,2,24,233),(279,'Not Known',1,2,24,232),(280,'Not Known',1,2,24,231),(281,'Not Known',1,2,24,229),(282,'Not Known',1,2,24,230),(283,'Not Known',1,2,22,217),(284,'Not Known',1,2,22,218),(285,'Not Known',1,2,22,219),(286,'Not Known',1,2,22,221),(287,'Not Known',1,2,22,220),(288,'Not Known',1,2,22,222),(289,'Not Known',1,2,21,209),(290,'Not Known',1,2,21,210),(291,'Not Known',1,2,21,211),(292,'Not Known',1,2,21,212),(293,'Not Known',1,2,21,213),(294,'Not Known',1,2,21,214),(295,'Not Known',1,2,21,215),(296,'Not Known',1,2,21,216),(297,'Not Known',1,2,20,203),(298,'Not Known',1,2,20,204),(299,'Not Known',1,2,20,205),(300,'Not Known',1,2,20,206),(301,'Not Known',1,2,20,207),(302,'Not Known',1,2,20,208),(303,'Not Known',1,2,11,101),(304,'Not Known',1,2,11,102),(305,'Not Known',1,2,11,103),(306,'Not Known',1,2,11,104),(307,'Not Known',1,2,11,105),(308,'Not Known',1,2,11,106),(309,'Not Known',1,2,11,107),(310,'Not Known',1,2,11,108),(311,'Not Known',1,2,11,109),(312,'Not Known',1,2,11,110),(314,'Not Known',1,2,11,111),(315,'Not Known',1,2,11,112),(316,'Not Known',1,2,11,113),(317,'Not Known',1,2,11,114),(318,'Not Known',1,2,11,116),(319,'Not Known',1,2,11,117),(320,'Not Known',1,2,11,118),(321,'Not Known',1,2,13,128),(322,'Not Known',1,2,13,129),(323,'Not Known',1,2,13,130),(324,'Not Known',1,2,13,131),(325,'Not Known',1,2,13,132),(326,'Not Known',1,2,13,133),(327,'Not Known',1,2,13,134),(328,'Not Known',1,2,13,135),(329,'Not Known',1,2,13,136),(330,'Not Known',1,2,13,137),(331,'Not Known',1,2,13,138),(332,'Not Known',1,2,19,193),(333,'Not Known',1,2,19,194),(334,'Not Known',1,2,19,195),(335,'Not Known',1,2,19,196),(336,'Not known',1,2,19,197),(337,'Not Known',1,2,19,198),(338,'Not Known',1,2,19,199),(339,'Not Known',1,2,19,200),(340,'Not Known',1,2,19,201),(341,'Not Known',1,2,19,202),(342,'Not Known',1,2,18,186),(343,'Not Known',1,2,18,187),(344,'Not Known',1,2,18,188),(345,'Not Known',1,2,18,189),(346,'Not Known',1,2,18,190),(347,'Not Known',1,2,18,191),(348,'Not Known',1,2,18,192),(349,'Not Known',1,2,17,173),(350,'Not Known',1,2,17,174),(351,'Not Known',1,2,17,175),(352,'Not Known',1,2,17,176),(353,'Not Known',1,2,17,177),(354,'Not Known',1,2,17,178),(355,'Not Known',1,2,17,179),(356,'Not Known',1,2,17,180),(357,'Not Known',1,2,17,181),(358,'Not Known',1,2,17,182),(359,'Not Known',1,2,17,183),(360,'Not Known',1,2,17,184),(361,'Not Known',1,2,17,185),(362,'Not Known',1,2,16,163),(363,'Not Known',1,2,16,164),(364,'Not Known',1,2,16,166),(365,'Not Known',1,2,16,165),(366,'Not Known',1,2,16,167),(367,'Not Known',1,2,16,168),(368,'Not Known',1,2,16,169),(370,'Not Known',1,2,16,170),(371,'Not Known',1,2,16,171),(372,'Not Known',1,2,16,172),(373,'Not Known',1,2,15,155),(374,'Not Known',1,2,15,156),(375,'Not Known',1,2,15,157),(376,'Not Known',1,2,15,158),(377,'Not Known',1,2,15,159),(378,'Not Known',1,2,15,160),(379,'Not Known',1,2,15,161),(380,'Not Known',1,2,15,162),(381,'Not Known',1,2,14,139),(382,'Not Known',1,2,14,140),(383,'Not Known',1,2,14,141),(384,'Not Known',1,2,14,142),(385,'Not Known',1,2,14,143),(386,'Not Known',1,2,14,144),(387,'Not Known',1,2,14,145),(388,'Not Known',1,2,14,147),(389,'Not Known',1,2,14,149),(390,'Not Known',1,2,14,148),(391,'Not known',1,2,14,150),(392,'Not Known',1,2,14,151),(393,'Not Known',1,2,14,152),(394,'Not Known',1,2,14,153),(395,'Not Known',1,2,14,154),(397,'Not Known',1,2,6,248),(398,'Not Known',1,2,15,247),(399,'Not Known',1,2,1,249),(400,'Not Known',1,2,1,10),(401,'Not Known',1,2,2,10),(402,'Not Known',1,2,3,10),(403,'Not Known',1,2,7,10),(404,'Not Known',1,2,5,10),(405,'Not Known',1,2,6,10),(406,'Not Known',1,2,8,10),(407,'Not Known',1,2,9,10),(408,'Not Known',1,2,10,10),(409,'Not Known',1,2,11,10),(410,'Not Known',1,2,12,10),(411,'Not Known',1,2,13,10),(412,'Not Known',1,2,14,10),(413,'Not Known',1,2,15,10),(414,'Not Known',1,2,16,10),(415,'Not Known',1,2,17,10),(416,'Not Known',1,2,18,10),(417,'Not Known',1,2,19,10),(418,'Not Known',1,2,20,10),(419,'Not Known',1,2,21,10),(420,'Not Known',1,2,22,10),(421,'Not Known',1,2,23,10),(422,'Not Known',1,2,24,10),(423,'Not Known',1,2,25,10),(425,'Not Known',1,2,1,251),(426,'Not Known',1,2,1,250),(427,'Not Known',1,2,5,252);
/*!40000 ALTER TABLE `goonj_loc_village` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goonj_loc_block`
--

DROP TABLE IF EXISTS `goonj_loc_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goonj_loc_block` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `district_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_district` (`district_id`),
  CONSTRAINT `fk_district` FOREIGN KEY (`district_id`) REFERENCES `goonj_loc_district` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goonj_loc_block`
--

LOCK TABLES `goonj_loc_block` WRITE;
/*!40000 ALTER TABLE `goonj_loc_block` DISABLE KEYS */;
INSERT INTO `goonj_loc_block` VALUES (1,'Bermo',1),(2,'Chas',1),(3,'Chandrapura',1),(4,'Chandankiyari',1),(5,'Gomia',1),(6,'Jaridih',1),(7,'Kasmar',1),(8,'Nawadih',1),(9,'Petrawar',1),(10,'Not Known',4),(11,'Bagodar',2),(12,'Bengabad',2),(13,'Birni',2),(14,'Deori',2),(15,'Dhanwar',2),(16,'Dumri',2),(17,'Gandey',2),(18,'Gawan',2),(19,'Giridih',2),(20,'Jamua',2),(21,'Pirtand',2),(22,'Suriya',2),(23,'Tisri',2),(24,'Chatra',3),(25,'Simaria',3),(26,'Patrappur',3),(27,'Huntergunj',3),(28,'Itkhori',3),(29,'Tandwa',3),(30,'Kunda',3),(31,'Lawalong',3),(32,'Giddhor',3),(33,'Pratapgarha',3),(34,'Baghmara',5),(35,'Baliapur',5),(36,'Dhanbad',5),(37,'Govindpur',5),(38,'Jharia',5),(39,'Nirsa',5),(40,'Topchanchi',5),(41,'Tundi',5),(42,'Purbi Tundi',5),(43,'Bero',6),(44,'Angara',6),(45,'Bundu',6),(46,'Burmu',6),(47,'Chanho',6),(48,'Lapung',6),(49,'Ratu',6),(50,'Silli',6),(51,'Ormanjhi',6),(52,'Sonahatu',6),(53,'Tamar',6),(54,'Itki',6),(55,'Nagri',6),(56,'Khalari',6),(57,'Rahe',6),(58,'Mandar',6),(59,'Namkum',6),(60,'Chandwa',7),(61,'Latehar',7),(62,'Balumath',7),(63,'Bariyatu',7),(64,'Herhanj',7),(65,'Manika',7),(66,'Barwadih',7),(67,'Garu',7),(68,'Mahuadar',7),(69,'Bhandaria',8),(70,'Bhawnathpur',8),(71,'Chinia',8),(72,'Danda',8),(73,'Dandai',8),(74,'Dhurki',8),(75,'Garhwa',8),(76,'Kandi',8),(77,'Kharaundhi',8),(78,'Manjhiaon',8),(79,'Meral',8),(80,'Nagaruntari',8),(81,'Ramkanda',8),(82,'Ramna',8),(83,'Ranka',8),(84,'Bishunpura',8),(85,'Ketar',8),(86,'Bardiha',8),(87,'Sagma',8),(88,'Jasidih',9),(89,'Mohanpur',9),(90,'Sarawan',9),(91,'Sarath',9),(92,'Palojori',9),(93,'Madhupur',9),(94,'Karon',9),(95,'Sonarai Thari',9),(96,'Budhai',9),(97,'Ramgarh',10),(98,'Gola',10),(99,'Patratu',10),(100,'Mandu',10),(101,'Sadar Chaibasa',11),(102,'Khuntpani',11),(103,'Jhinkpani',11),(104,'Tonto',11),(105,'Manjhari',11),(106,'Tantnagar',11),(107,'Haatgamharia',11),(108,'Chakradharpur',11),(109,'Bandgaon',11),(110,'Sonua',11),(111,'Goelkera',11),(112,'Manoharpur',11),(113,'Anandpur',11),(114,'Gurdi',11),(115,'Jagannathpur',11),(116,'Noamundi',11),(117,'Majhgaon',11),(118,'Kumardungi',11),(119,'Sahibganj',12),(120,'Mandra',12),(121,'Borio',12),(122,'Barhait',12),(123,'Taljhari',12),(124,'Rajmahal',12),(125,'Udhwa',12),(126,'Pathna',12),(127,'Barharwa',12),(128,'Jamshedpur',13),(129,'Potka',13),(130,'Patamda',13),(131,'Boram',13),(132,'Ghatshila',13),(133,'Musabani',13),(134,'Dumaria',13),(135,'Baharagora',13),(136,'Dhalbhumgarh',13),(137,'Chakulia',13),(138,'Gurabandha',13),(139,'Barhi',14),(140,'Barkhatha',14),(141,'Bishnugarh',14),(142,'Barkagaon',14),(143,'Chouparan',14),(144,'Ichak',14),(145,'Churchu',14),(146,'Chalkusha',14),(147,'Dadi',14),(148,'Daru',14),(149,'Katkamdag',14),(150,'Katkamsandi',14),(151,'Keredari',14),(152,'Padma',14),(153,'Sadar',14),(154,'Tatijhariya',14),(155,'Saraikela',15),(156,'Rajnagar',15),(157,'Ichagarh',15),(158,'Nimdih',15),(159,'Kharsawan',15),(160,'Gamharia',15),(161,'Kuchai',15),(162,'Chandil',15),(163,'Saraiyahat',16),(164,'Ramgarh',16),(165,'Jarmundi',16),(166,'Kathikund',16),(167,'Gopikandar',16),(168,'Jama',16),(169,'Dumka',16),(170,'Masalia',16),(171,'Ranishwar',16),(172,'Shikaripara',16),(173,'Bishrampur',17),(174,'Chatarpur',17),(175,'Hariharganj',17),(176,'Pandu',17),(177,'Lesliganj',17),(178,'Patan',17),(179,'Haidernagar',17),(180,'Chainpur',17),(181,'Daltanganj',17),(182,'Hassainabad',17),(183,'Manatu',17),(184,'Panki',17),(185,'Satbarwa',17),(186,'Lohardaga',18),(187,'Kuru',18),(188,'Bhandra',18),(189,'Kairo',18),(190,'Kisko',18),(191,'Peshrar',18),(192,'Senha',18),(193,'Simdega',19),(194,'Kurdeg',19),(195,'Bolba',19),(196,'Thethaitangar',19),(197,'Kolebira',19),(198,'Bano',19),(199,'Jaldega',19),(200,'Pakartanr',19),(201,'Kersai',19),(202,'Bansjore',19),(203,'Jamtara',20),(204,'Kundhit',20),(205,'Nala',20),(206,'Narayanpur',20),(207,'Karmatanr Vidyasagar',20),(208,'Fatehpur',20),(209,'Boarijore',21),(210,'Godda',21),(211,'Mahagama',21),(212,'Meharama',21),(213,'Pathargama',21),(214,'Poraiyahat',21),(215,'Sunderpahari',21),(216,'Thakurgangti',21),(217,'Koderma',22),(218,'Jainagar',22),(219,'Chandwara',22),(220,'Markachho',22),(221,'Domchanch',22),(222,'Satgawan',22),(223,'Pakur',23),(224,'Maheshpur',23),(225,'Hiranpur',23),(226,'Littipara',23),(227,'Amrapara',23),(228,'Pakuria',23),(229,'Gumla',24),(230,'Bishunpur',24),(231,'Ghaghra',24),(232,'Chainpur',24),(233,'Dumri',24),(234,'Jari',24),(235,'Raidih',24),(236,'Sisai',24),(237,'Bherno',24),(238,'Basia',24),(239,'Kamdara',24),(240,'Palkot',24),(241,'Arki',25),(242,'Karra',25),(243,'Murhu',25),(244,'Rania',25),(245,'Torpa',25),(246,'Khunti',25),(247,'Kukdu',15),(248,'Kanke',6),(249,'Bhandaridah',1),(250,'Bokaro City',1),(251,'Telo',1),(252,'Kastras',5);
/*!40000 ALTER TABLE `goonj_loc_block` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-14 15:33:02
