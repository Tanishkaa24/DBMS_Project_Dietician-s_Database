-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: dieticiandb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dieticiandb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dieticiandb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dieticiandb`;

--
-- Table structure for table `blood_test_result`
--

DROP TABLE IF EXISTS `blood_test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_test_result` (
  `test_no` int NOT NULL,
  `platelets` int DEFAULT NULL,
  `hemoglobin` int DEFAULT NULL,
  `urine_test` int DEFAULT NULL,
  `calcium` int DEFAULT NULL,
  PRIMARY KEY (`test_no`),
  CONSTRAINT `blood_test_result_ibfk_1` FOREIGN KEY (`test_no`) REFERENCES `testbooking` (`test_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_test_result`
--

LOCK TABLES `blood_test_result` WRITE;
/*!40000 ALTER TABLE `blood_test_result` DISABLE KEYS */;
INSERT INTO `blood_test_result` VALUES (1,4,3,5,6),(2,4,1,5,6),(3,1,3,5,6),(4,1,1,1,6);
/*!40000 ALTER TABLE `blood_test_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `dietappt_no` int DEFAULT NULL,
  `test_no` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `dietappt_no` (`dietappt_no`),
  KEY `test_no` (`test_no`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`dietappt_no`) REFERENCES `dietbooking` (`dietappt_no`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`test_no`) REFERENCES `testbooking` (`test_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (2,1,1111),(1,2,2222),(3,4,3333),(4,3,4444);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breakfast`
--

DROP TABLE IF EXISTS `breakfast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breakfast` (
  `b_no` int NOT NULL,
  `group_no` int DEFAULT NULL,
  PRIMARY KEY (`b_no`),
  KEY `group_no` (`group_no`),
  CONSTRAINT `breakfast_ibfk_1` FOREIGN KEY (`group_no`) REFERENCES `food_groups` (`group_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breakfast`
--

LOCK TABLES `breakfast` WRITE;
/*!40000 ALTER TABLE `breakfast` DISABLE KEYS */;
INSERT INTO `breakfast` VALUES (630,1900),(631,1901),(632,1902),(633,1903),(634,1904),(635,1905);
/*!40000 ALTER TABLE `breakfast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carbs`
--

DROP TABLE IF EXISTS `carbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carbs` (
  `c_no` int NOT NULL,
  `c_name` varchar(100) DEFAULT NULL,
  `c_desc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`c_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carbs`
--

LOCK TABLES `carbs` WRITE;
/*!40000 ALTER TABLE `carbs` DISABLE KEYS */;
INSERT INTO `carbs` VALUES (70,'simple ','apples, oranges, banana,pineapple,berries, milk'),(71,'starchy','whole grains, grain bread, beans, potatoes, cereals'),(72,'fibrous','pumpkin, carrot, tomatoes, beans, broccoli, cucumber'),(73,'complex','peas, barley, oats, rice');
/*!40000 ALTER TABLE `carbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `c_firstname` varchar(30) DEFAULT NULL,
  `c_lastname` varchar(30) DEFAULT NULL,
  `c_address` varchar(50) DEFAULT NULL,
  `c_phone` varchar(10) DEFAULT NULL,
  `c_age` int DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `dietician_id` int NOT NULL,
  `meal_no` int NOT NULL,
  `pay_no` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`dietician_id`),
  KEY `dietician_id` (`dietician_id`),
  KEY `meal_no` (`meal_no`),
  KEY `pay_no` (`pay_no`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`dietician_id`) REFERENCES `dietician` (`dietician_id`),
  CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`meal_no`) REFERENCES `meal_chart` (`meal_no`),
  CONSTRAINT `customer_ibfk_4` FOREIGN KEY (`pay_no`) REFERENCES `payment` (`pay_no`),
  CONSTRAINT `customer_chk_1` CHECK ((length(`c_phone`) = 10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1111,'Tanishkaa','Chaturvedi','Andheri','8764859324',19,'B+',1002,12,2),(2222,'Bhagyashree','Birje','Bandra','7654378213',17,'A+',1004,11,1),(3333,'Neha','Grandhi','Wadala','7654981247',19,'O+',1001,13,3),(4444,'Krish','Ahuja','Vile Parle','8763986253',18,'B+',1005,10,4);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dietbooking`
--

DROP TABLE IF EXISTS `dietbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietbooking` (
  `dietappt_no` int NOT NULL,
  `d_date` date DEFAULT NULL,
  `d_time` time DEFAULT NULL,
  PRIMARY KEY (`dietappt_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietbooking`
--

LOCK TABLES `dietbooking` WRITE;
/*!40000 ALTER TABLE `dietbooking` DISABLE KEYS */;
INSERT INTO `dietbooking` VALUES (1,'2022-10-10','12:00:00'),(2,'2022-10-11','01:00:00'),(3,'2022-10-10','02:00:00'),(4,'2022-10-11','12:00:00');
/*!40000 ALTER TABLE `dietbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dietician`
--

DROP TABLE IF EXISTS `dietician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietician` (
  `dietician_id` int NOT NULL,
  `exp_code` int DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `issue_code` int NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dietician_id`,`issue_code`),
  KEY `issue_code` (`issue_code`),
  KEY `exp_code` (`exp_code`),
  CONSTRAINT `dietician_ibfk_1` FOREIGN KEY (`issue_code`) REFERENCES `issue` (`issue_code`),
  CONSTRAINT `dietician_ibfk_2` FOREIGN KEY (`exp_code`) REFERENCES `experience` (`exp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietician`
--

LOCK TABLES `dietician` WRITE;
/*!40000 ALTER TABLE `dietician` DISABLE KEYS */;
INSERT INTO `dietician` VALUES (1001,4,70000,1020,'Vile Parle'),(1002,2,20000,1020,'Vile Parle'),(1003,1,10000,1050,'Bandra'),(1004,4,70000,1040,'Vile Parle'),(1005,3,30000,1030,'Bandra'),(1006,3,25000,1010,'Vile Parle'),(1007,4,60000,1010,'Bandra'),(1008,2,20000,1060,'Bandra'),(1009,4,70000,1020,'Vile Parle'),(1010,2,20000,1070,'Bandra');
/*!40000 ALTER TABLE `dietician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dinner`
--

DROP TABLE IF EXISTS `dinner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dinner` (
  `d_no` int NOT NULL,
  `group_no` int DEFAULT NULL,
  PRIMARY KEY (`d_no`),
  KEY `group_no` (`group_no`),
  CONSTRAINT `dinner_ibfk_1` FOREIGN KEY (`group_no`) REFERENCES `food_groups` (`group_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dinner`
--

LOCK TABLES `dinner` WRITE;
/*!40000 ALTER TABLE `dinner` DISABLE KEYS */;
INSERT INTO `dinner` VALUES (830,1900),(831,1901),(832,1902),(833,1903),(834,1904),(835,1905);
/*!40000 ALTER TABLE `dinner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `exp_code` int NOT NULL,
  `fees` int DEFAULT NULL,
  PRIMARY KEY (`exp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,20000),(2,30000),(3,40000),(4,50000);
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fibers`
--

DROP TABLE IF EXISTS `fibers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fibers` (
  `f_no` int NOT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `f_desc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`f_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fibers`
--

LOCK TABLES `fibers` WRITE;
/*!40000 ALTER TABLE `fibers` DISABLE KEYS */;
INSERT INTO `fibers` VALUES (30,'soluble ','oatmeal,chia,lentils,apples,blueberries'),(31,'starchy','whole wheat, quinoa, brown rice, leafy greens, walnuts, seeds, pear, apples');
/*!40000 ALTER TABLE `fibers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_groups`
--

DROP TABLE IF EXISTS `food_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_groups` (
  `group_no` int NOT NULL,
  `group_name` varchar(30) DEFAULT NULL,
  `group_desc` varchar(1000) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `m_no` int DEFAULT NULL,
  `v_no` int DEFAULT NULL,
  `p_no` int DEFAULT NULL,
  `c_no` int DEFAULT NULL,
  `f_no` int DEFAULT NULL,
  PRIMARY KEY (`group_no`),
  KEY `m_no` (`m_no`),
  KEY `v_no` (`v_no`),
  KEY `p_no` (`p_no`),
  KEY `c_no` (`c_no`),
  KEY `f_no` (`f_no`),
  CONSTRAINT `food_groups_ibfk_1` FOREIGN KEY (`m_no`) REFERENCES `minerals` (`m_no`),
  CONSTRAINT `food_groups_ibfk_2` FOREIGN KEY (`v_no`) REFERENCES `vitamins` (`v_no`),
  CONSTRAINT `food_groups_ibfk_3` FOREIGN KEY (`p_no`) REFERENCES `proteins` (`p_no`),
  CONSTRAINT `food_groups_ibfk_4` FOREIGN KEY (`c_no`) REFERENCES `carbs` (`c_no`),
  CONSTRAINT `food_groups_ibfk_5` FOREIGN KEY (`f_no`) REFERENCES `fibers` (`f_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_groups`
--

LOCK TABLES `food_groups` WRITE;
/*!40000 ALTER TABLE `food_groups` DISABLE KEYS */;
INSERT INTO `food_groups` VALUES (1900,'Vitamin packed non-veg','Healthy foods enriched with vitamins and minerals',3,92,64,54,72,30),(1901,'Vitamin packed veg','healthy veg food enrichd with vitamins and minerals',3,94,63,50,70,31),(1902,'Calcium rich','Calcium rich food with necessary supplements for healthy bones',2,91,61,53,70,30),(1903,'Sattvic food','Foods for clean and toxin free body',6,94,63,51,70,31),(1904,'Iron man','Iron-rich food for anemia and other similar conditions',3,94,63,50,70,31),(1905,'Carbohydrate rich','Food for higher energy and carbohydrates',3,94,63,50,70,31);
/*!40000 ALTER TABLE `food_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `hospital_no` int NOT NULL,
  `issue_code` int DEFAULT NULL,
  `h_location` varchar(30) DEFAULT NULL,
  `h_phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`hospital_no`),
  KEY `issue_code` (`issue_code`),
  CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`issue_code`) REFERENCES `issue` (`issue_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (800,1030,'Andheri East','9876543672'),(801,1040,'Malad','8758643829'),(803,1020,'Kanjurmarg','6478352672'),(804,1010,'Malad','675432685');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue` (
  `issue_code` int NOT NULL,
  `issue_desc` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`issue_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES (1010,'Anemia'),(1020,'Weight gain'),(1030,'Weight loss '),(1040,'Diabetic'),(1050,'Kid'),(1060,'Clear skin'),(1070,'Women');
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lunch`
--

DROP TABLE IF EXISTS `lunch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lunch` (
  `l_no` int NOT NULL,
  `group_no` int DEFAULT NULL,
  PRIMARY KEY (`l_no`),
  KEY `group_no` (`group_no`),
  CONSTRAINT `lunch_ibfk_1` FOREIGN KEY (`group_no`) REFERENCES `food_groups` (`group_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lunch`
--

LOCK TABLES `lunch` WRITE;
/*!40000 ALTER TABLE `lunch` DISABLE KEYS */;
INSERT INTO `lunch` VALUES (730,1900),(731,1901),(732,1902),(733,1903),(734,1904),(735,1905);
/*!40000 ALTER TABLE `lunch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_chart`
--

DROP TABLE IF EXISTS `meal_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_chart` (
  `issue_code` int DEFAULT NULL,
  `meal_no` int NOT NULL,
  `b_no` int DEFAULT NULL,
  `l_no` int DEFAULT NULL,
  `d_no` int DEFAULT NULL,
  PRIMARY KEY (`meal_no`),
  KEY `issue_code` (`issue_code`),
  KEY `b_no` (`b_no`),
  KEY `l_no` (`l_no`),
  KEY `d_no` (`d_no`),
  CONSTRAINT `meal_chart_ibfk_1` FOREIGN KEY (`issue_code`) REFERENCES `issue` (`issue_code`),
  CONSTRAINT `meal_chart_ibfk_2` FOREIGN KEY (`b_no`) REFERENCES `breakfast` (`b_no`),
  CONSTRAINT `meal_chart_ibfk_3` FOREIGN KEY (`l_no`) REFERENCES `lunch` (`l_no`),
  CONSTRAINT `meal_chart_ibfk_4` FOREIGN KEY (`d_no`) REFERENCES `dinner` (`d_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_chart`
--

LOCK TABLES `meal_chart` WRITE;
/*!40000 ALTER TABLE `meal_chart` DISABLE KEYS */;
INSERT INTO `meal_chart` VALUES (1010,10,634,733,831),(1010,11,635,734,830),(1020,12,635,732,830),(1030,13,631,733,832),(1040,14,633,731,834),(1050,15,632,732,833),(1060,16,630,733,833),(1070,17,634,734,835),(1050,18,632,735,831),(1020,19,632,732,831);
/*!40000 ALTER TABLE `meal_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minerals`
--

DROP TABLE IF EXISTS `minerals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `minerals` (
  `m_no` int NOT NULL,
  `m_name` varchar(100) DEFAULT NULL,
  `m_desc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`m_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minerals`
--

LOCK TABLES `minerals` WRITE;
/*!40000 ALTER TABLE `minerals` DISABLE KEYS */;
INSERT INTO `minerals` VALUES (90,'Calcium','Almonds, carrots, milk broccoli'),(91,'Chloride','Salt,soy sauce, milk, peanuts'),(92,'Iodine','Seafood, iodised salt'),(93,'Iron','Meat, eggs, beans, potato, green vegetables, dried fruits'),(94,'Magnesium','Honey, almonds,seafood, chocolates, pineapple, leafy vegetables');
/*!40000 ALTER TABLE `minerals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `pay_no` int NOT NULL,
  `pay_date` date DEFAULT NULL,
  `pay_amt` int DEFAULT NULL,
  PRIMARY KEY (`pay_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'2022-10-10',2000),(2,'2022-10-11',1000),(3,'2022-10-11',4000),(4,'2022-10-12',3000),(5,'2022-10-14',2000);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proteins`
--

DROP TABLE IF EXISTS `proteins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proteins` (
  `p_no` int NOT NULL,
  `p_name` varchar(100) DEFAULT NULL,
  `p_desc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`p_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proteins`
--

LOCK TABLES `proteins` WRITE;
/*!40000 ALTER TABLE `proteins` DISABLE KEYS */;
INSERT INTO `proteins` VALUES (50,'plant protein legume','lentils, beans, peas, soybean'),(51,'plant protein nuts','almonds,cashews,walnuts,sunflower seeds, sesame, chia'),(52,'plant protein grain','rice, quinoa, oats, millet'),(53,'plant protein veggies','corn, broccoli, asparagus, sprouts'),(54,'animal protein meat','fish, crabs, chicken'),(55,'animal protein dairy','eggs, yogurt, milk,cheese');
/*!40000 ALTER TABLE `proteins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testbooking`
--

DROP TABLE IF EXISTS `testbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testbooking` (
  `test_no` int NOT NULL,
  `t_date` date DEFAULT NULL,
  `t_time` time DEFAULT NULL,
  `hospital_no` int DEFAULT NULL,
  PRIMARY KEY (`test_no`),
  KEY `hospital_no` (`hospital_no`),
  CONSTRAINT `testbooking_ibfk_1` FOREIGN KEY (`hospital_no`) REFERENCES `hospital` (`hospital_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testbooking`
--

LOCK TABLES `testbooking` WRITE;
/*!40000 ALTER TABLE `testbooking` DISABLE KEYS */;
INSERT INTO `testbooking` VALUES (1,'2022-10-10','03:00:00',803),(2,'2022-10-10','04:00:00',804),(3,'2022-10-11','05:00:00',804),(4,'2022-10-12','12:00:00',800);
/*!40000 ALTER TABLE `testbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `vendor_no` int NOT NULL,
  `vendor_name` varchar(30) DEFAULT NULL,
  `v_contact` varchar(10) DEFAULT NULL,
  `v_location` varchar(50) DEFAULT NULL,
  `group_no` int DEFAULT NULL,
  PRIMARY KEY (`vendor_no`),
  KEY `group_no` (`group_no`),
  CONSTRAINT `vendors_ibfk_1` FOREIGN KEY (`group_no`) REFERENCES `food_groups` (`group_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1111,'Ashapura ','4567894569','Vile Parle West',1904),(2222,'Delomite ','3468975342','Andheri West',1902),(3333,'Nageshwar ','9456231834','Bandra',1903),(4444,'Onega ','8726519854','Bhandup',1904),(5555,'Kinara ','5984573526','Bandra',1903),(6666,'Gorai ','7459853462','Thane',1901),(7777,'Ussi ','9823675213','Dadar',1900),(8888,'Firangi ','8763459263','Powai',1905),(9999,'Unity','6754987634','Juhu',1900);
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vitamins`
--

DROP TABLE IF EXISTS `vitamins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vitamins` (
  `v_no` int NOT NULL,
  `v_name` varchar(100) DEFAULT NULL,
  `v_desc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`v_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitamins`
--

LOCK TABLES `vitamins` WRITE;
/*!40000 ALTER TABLE `vitamins` DISABLE KEYS */;
INSERT INTO `vitamins` VALUES (60,'A','Potato, carrots, pumpkins, spinach, eggs'),(61,'D','Milk, cheese,dahi'),(62,'E','Cereals, leafy green vegetables, seeds, nuts'),(63,'K','Green leafy vegetables, turnip, beet green'),(64,'B','Grains,broccoli, fruits, fish,milk,cheese'),(65,'C','Orange, grapes');
/*!40000 ALTER TABLE `vitamins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vwhospi`
--

DROP TABLE IF EXISTS `vwhospi`;
/*!50001 DROP VIEW IF EXISTS `vwhospi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwhospi` AS SELECT 
 1 AS `test_no`,
 1 AS `customer_id`,
 1 AS `t_date`,
 1 AS `t_time`,
 1 AS `hospital_no`,
 1 AS `h_location`,
 1 AS `h_phone`,
 1 AS `issue_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwvend`
--

DROP TABLE IF EXISTS `vwvend`;
/*!50001 DROP VIEW IF EXISTS `vwvend`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwvend` AS SELECT 
 1 AS `l_no`,
 1 AS `group_no`,
 1 AS `vendor_no`,
 1 AS `vendor_name`,
 1 AS `v_contact`,
 1 AS `v_location`,
 1 AS `group_name`,
 1 AS `group_desc`,
 1 AS `qty`,
 1 AS `m_no`,
 1 AS `v_no`,
 1 AS `p_no`,
 1 AS `c_no`,
 1 AS `f_no`,
 1 AS `issue_code`,
 1 AS `meal_no`,
 1 AS `b_no`,
 1 AS `d_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwvendor`
--

DROP TABLE IF EXISTS `vwvendor`;
/*!50001 DROP VIEW IF EXISTS `vwvendor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwvendor` AS SELECT 
 1 AS `vendor_no`,
 1 AS `vendor_name`,
 1 AS `v_contact`,
 1 AS `v_location`,
 1 AS `group_no`,
 1 AS `meal_no`,
 1 AS `issue_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwvendor1`
--

DROP TABLE IF EXISTS `vwvendor1`;
/*!50001 DROP VIEW IF EXISTS `vwvendor1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwvendor1` AS SELECT 
 1 AS `vendor_name`,
 1 AS `v_location`,
 1 AS `vendor_no`,
 1 AS `group_name`,
 1 AS `issue_code`,
 1 AS `meal_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwvendors`
--

DROP TABLE IF EXISTS `vwvendors`;
/*!50001 DROP VIEW IF EXISTS `vwvendors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwvendors` AS SELECT 
 1 AS `vendor_no`,
 1 AS `vendor_name`,
 1 AS `v_contact`,
 1 AS `v_location`,
 1 AS `group_no`,
 1 AS `meal_no`,
 1 AS `issue_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `dieticiandb`
--

USE `dieticiandb`;

--
-- Final view structure for view `vwhospi`
--

/*!50001 DROP VIEW IF EXISTS `vwhospi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwhospi` AS select `booking`.`test_no` AS `test_no`,`booking`.`customer_id` AS `customer_id`,`testbooking`.`t_date` AS `t_date`,`testbooking`.`t_time` AS `t_time`,`testbooking`.`hospital_no` AS `hospital_no`,`hospital`.`h_location` AS `h_location`,`hospital`.`h_phone` AS `h_phone`,`hospital`.`issue_code` AS `issue_code` from (((`booking` join `customer` on((`booking`.`customer_id` = `customer`.`customer_id`))) join `testbooking` on((`booking`.`test_no` = `testbooking`.`test_no`))) join `hospital` on((`testbooking`.`hospital_no` = `hospital`.`hospital_no`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwvend`
--

/*!50001 DROP VIEW IF EXISTS `vwvend`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwvend` AS select `lunch`.`l_no` AS `l_no`,`vendors`.`group_no` AS `group_no`,`vendors`.`vendor_no` AS `vendor_no`,`vendors`.`vendor_name` AS `vendor_name`,`vendors`.`v_contact` AS `v_contact`,`vendors`.`v_location` AS `v_location`,`food_groups`.`group_name` AS `group_name`,`food_groups`.`group_desc` AS `group_desc`,`food_groups`.`qty` AS `qty`,`food_groups`.`m_no` AS `m_no`,`food_groups`.`v_no` AS `v_no`,`food_groups`.`p_no` AS `p_no`,`food_groups`.`c_no` AS `c_no`,`food_groups`.`f_no` AS `f_no`,`meal_chart`.`issue_code` AS `issue_code`,`meal_chart`.`meal_no` AS `meal_no`,`meal_chart`.`b_no` AS `b_no`,`meal_chart`.`d_no` AS `d_no` from (((`vendors` join `lunch` on((`vendors`.`group_no` = `lunch`.`group_no`))) join `food_groups` on((`vendors`.`group_no` = `food_groups`.`group_no`))) join `meal_chart` on((`lunch`.`l_no` = `meal_chart`.`l_no`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwvendor`
--

/*!50001 DROP VIEW IF EXISTS `vwvendor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwvendor` AS select `vendors`.`vendor_no` AS `vendor_no`,`vendors`.`vendor_name` AS `vendor_name`,`vendors`.`v_contact` AS `v_contact`,`vendors`.`v_location` AS `v_location`,`vendors`.`group_no` AS `group_no`,`meal_chart`.`meal_no` AS `meal_no`,`meal_chart`.`issue_code` AS `issue_code` from (((((`vendors` join `food_groups` on((`vendors`.`group_no` = `food_groups`.`group_no`))) join `breakfast` on((`vendors`.`group_no` = `breakfast`.`group_no`))) join `lunch` on((`vendors`.`group_no` = `lunch`.`group_no`))) join `dinner` on((`vendors`.`group_no` = `dinner`.`group_no`))) join `meal_chart` on(((`breakfast`.`b_no` = `meal_chart`.`b_no`) and (`lunch`.`l_no` = `meal_chart`.`l_no`) and (`dinner`.`d_no` = `meal_chart`.`d_no`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwvendor1`
--

/*!50001 DROP VIEW IF EXISTS `vwvendor1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwvendor1` AS select `vendors`.`vendor_name` AS `vendor_name`,`vendors`.`v_location` AS `v_location`,`vendors`.`vendor_no` AS `vendor_no`,`food_groups`.`group_name` AS `group_name`,`meal_chart`.`issue_code` AS `issue_code`,`meal_chart`.`meal_no` AS `meal_no` from (((`vendors` join `lunch` on((`vendors`.`group_no` = `lunch`.`group_no`))) join `food_groups` on((`vendors`.`group_no` = `food_groups`.`group_no`))) join `meal_chart` on((`lunch`.`l_no` = `meal_chart`.`l_no`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwvendors`
--

/*!50001 DROP VIEW IF EXISTS `vwvendors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwvendors` AS select `vendors`.`vendor_no` AS `vendor_no`,`vendors`.`vendor_name` AS `vendor_name`,`vendors`.`v_contact` AS `v_contact`,`vendors`.`v_location` AS `v_location`,`vendors`.`group_no` AS `group_no`,`meal_chart`.`meal_no` AS `meal_no`,`meal_chart`.`issue_code` AS `issue_code` from (((((`vendors` join `breakfast` on((`vendors`.`group_no` = `breakfast`.`group_no`))) join `lunch` on((`vendors`.`group_no` = `lunch`.`group_no`))) join `dinner` on((`vendors`.`group_no` = `dinner`.`group_no`))) join `meal_chart` on(((`breakfast`.`b_no` = `meal_chart`.`b_no`) and (`lunch`.`l_no` = `meal_chart`.`l_no`) and (`dinner`.`d_no` = `meal_chart`.`d_no`)))) join `food_groups` on((`vendors`.`group_no` = `food_groups`.`group_no`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-21 18:22:05
