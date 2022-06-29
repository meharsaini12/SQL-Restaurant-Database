CREATE DATABASE  IF NOT EXISTS `group8restaurants` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `group8restaurants`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: group8restaurants
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Temporary view structure for view `affordability_of_minority_owned`
--

DROP TABLE IF EXISTS `affordability_of_minority_owned`;
/*!50001 DROP VIEW IF EXISTS `affordability_of_minority_owned`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `affordability_of_minority_owned` AS SELECT 
 1 AS `restaurant_name`,
 1 AS `cuisine`,
 1 AS `affordability`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `alcoholic_drinks`
--

DROP TABLE IF EXISTS `alcoholic_drinks`;
/*!50001 DROP VIEW IF EXISTS `alcoholic_drinks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alcoholic_drinks` AS SELECT 
 1 AS `restaurant_name`,
 1 AS `drink_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dietary_restrictions`
--

DROP TABLE IF EXISTS `dietary_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietary_restrictions` (
  `dietary_id` int NOT NULL,
  `dietary_restriction` varchar(80) NOT NULL,
  PRIMARY KEY (`dietary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietary_restrictions`
--

LOCK TABLES `dietary_restrictions` WRITE;
/*!40000 ALTER TABLE `dietary_restrictions` DISABLE KEYS */;
INSERT INTO `dietary_restrictions` VALUES (1,'Vegetarian'),(2,'Halal'),(3,'Kosher'),(4,'Vegan');
/*!40000 ALTER TABLE `dietary_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinks`
--

DROP TABLE IF EXISTS `drinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drinks` (
  `drink_id` int NOT NULL,
  `drink_name` varchar(150) DEFAULT NULL,
  `alcoholic` tinyint(1) DEFAULT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`drink_id`),
  UNIQUE KEY `drink_id_UNIQUE` (`drink_id`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`),
  KEY `fk_drinks_menu1_idx` (`item_id`),
  CONSTRAINT `fk_drinks_menu1` FOREIGN KEY (`item_id`) REFERENCES `menu` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinks`
--

LOCK TABLES `drinks` WRITE;
/*!40000 ALTER TABLE `drinks` DISABLE KEYS */;
INSERT INTO `drinks` VALUES (1,'Oreo Latte',0,4),(2,'Fresh OJ',0,5),(3,'Dreamsicle Cider',1,6),(4,'Miller Lite',1,10),(5,'Pepsi',0,11),(6,'Plum Loco',1,12),(7,'Thai Iced Tea',0,16),(8,'Vietnamese Coffee',0,17),(9,'Fresh Limeade',0,18),(10,'Fruit Juice',0,22),(11,'Lemonade',0,23),(12,'Thai Iced Coffee',0,24),(13,'Agua Fresca',0,28),(14,'Mexican Bottled Soda',0,29),(15,'Cafe de Olla',0,30),(16,'Hot Coffee',0,34),(17,'Horchata',1,35),(18,'Coke Glass Bottle',0,36),(19,'Nantucket Nectae',0,40),(20,'Matcha Milk Tea',0,41),(21,'Unfiltered Snow Beauty',1,42),(22,'Fountain Drink',0,46),(23,'Canned Soda',0,47),(24,'Pelligrino',0,48),(25,'Ramune',0,52),(26,'Snapple',0,53),(27,'Green Tea',0,54),(28,'Peach Oolong Tea (M)',0,58),(29,'Taro Coconut Milk Tea (M)',0,59),(30,'Strawberry Green Tea Latte (M)',0,60),(31,'Water',0,64),(32,'Apple Juice',0,65),(33,'Cranberry Juice',0,66),(34,'Milk Tea With Bubble',0,70),(35,'Smoothie With Bubble',0,71),(36,'Oi Ocha',0,72),(37,'Horizon Milk',0,76),(38,'Mango Passion Fruit',0,77),(39,'Miracle Seltzer',0,78),(40,'Bottled Water',0,82),(41,'Arizona Tea',0,83),(42,'Bottled Beverage',0,84),(43,'Limonda',0,88),(44,'Inca Cola',0,89),(45,'Abena Fria',0,90);
/*!40000 ALTER TABLE `drinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has_dietary_restrictions`
--

DROP TABLE IF EXISTS `has_dietary_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has_dietary_restrictions` (
  `restaurant_id` int NOT NULL,
  `dietary_id` int NOT NULL,
  PRIMARY KEY (`restaurant_id`,`dietary_id`),
  KEY `fk_has_dietary_restrictions_restaurants1_idx` (`restaurant_id`),
  KEY `fk_has_dietary_restrictions_dietary_restrictions1_idx` (`dietary_id`),
  CONSTRAINT `fk_has_dietary_restrictions_dietary_restrictions1` FOREIGN KEY (`dietary_id`) REFERENCES `dietary_restrictions` (`dietary_id`),
  CONSTRAINT `fk_has_dietary_restrictions_restaurants1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has_dietary_restrictions`
--

LOCK TABLES `has_dietary_restrictions` WRITE;
/*!40000 ALTER TABLE `has_dietary_restrictions` DISABLE KEYS */;
INSERT INTO `has_dietary_restrictions` VALUES (1,1),(1,3),(1,4),(2,1),(2,4),(3,1),(3,4),(4,1),(4,4),(5,1),(5,4),(6,1),(6,4),(7,1),(7,3),(7,4),(8,1),(8,3),(8,4),(9,1),(9,4),(10,1),(10,3),(10,4),(11,1),(11,2),(12,1),(12,2),(12,3),(13,1),(13,2),(13,3),(13,4),(14,1),(14,2),(14,4),(15,1),(15,4);
/*!40000 ALTER TABLE `has_dietary_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `item_prices_avg_sum`
--

DROP TABLE IF EXISTS `item_prices_avg_sum`;
/*!50001 DROP VIEW IF EXISTS `item_prices_avg_sum`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `item_prices_avg_sum` AS SELECT 
 1 AS `item_name`,
 1 AS `price`,
 1 AS `item_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `meals`
--

DROP TABLE IF EXISTS `meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meals` (
  `meal_id` int NOT NULL,
  `meal_name` varchar(150) DEFAULT NULL,
  `meal_type` varchar(45) DEFAULT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`meal_id`),
  UNIQUE KEY `meal_id_UNIQUE` (`meal_id`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`),
  KEY `fk_meals_menu1_idx` (`item_id`),
  CONSTRAINT `fk_meals_menu1` FOREIGN KEY (`item_id`) REFERENCES `menu` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals`
--

LOCK TABLES `meals` WRITE;
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` VALUES (1,'Egg and Cheese','Breakfast',1),(2,'Mac and Cheese','Entree',2),(3,'Brownie Sundae','Dessert',3),(4,'Fast Food Nachos','Appetizer',7),(5,'Old Fashioned Burger','Entree',8),(6,'Half Bakes Blondie','Dessert',9),(7,'Chicken Red Curry','Entree',13),(8,'Vegetarian Dumpling','Appetizer',14),(9,'Thom Yum Goong','Soup',15),(10,'Pad Thai','Entree',19),(11,'Spicy Basil Fried Rice','Entree',20),(12,'Veggie Spring Roll','Appetizer',21),(13,'Flautas','Appetizer',25),(14,'Huevos A La Mexicana','Entree',26),(15,'Mexican Flan','Dessert',27),(16,'Churrasco Familiar','Entree',31),(17,'Chips Guanacos ','Appetizer',32),(18,'Nuegados Con Chilate','Dessert',33),(19,'Gyoza','Appetizer',37),(20,'Torio Sushi','Entree',38),(21,'Katsu Don','Entree',39),(22,'Spanakopita','Appetizer',43),(23,'Chicken Souvlaki Platter','Entree',44),(24,'Big Fat Gyro (Lamb)','Entree',45),(25,'Shrimp Shumai','Appetizer',49),(26,'Tonkotsu Shoyu Ramen','Entree',50),(27,'Matcha Cheesecake','Dessert',51),(28,'Gyudon','Entree',55),(29,'Salmon Teriyaki Bento','Entree',56),(30,'Karaage','Appetizer',57),(31,'The Kingdom Cheese Pizza (M)','Entree',61),(32,'The Kingdom Steak Pizza (M)','Entree',62),(33,'Mozarella Sticks','Appetizer',63),(34,'Maki Combo','Entree',67),(35,'Sushi Combo','Entree',68),(36,'Unagi Don','Entree',69),(37,'Buffalo 66','Entree',73),(38,'Garlic Knots','Appetizer',74),(39,'Simp','Entree',75),(40,'Gyro Platter','Entree',79),(41,'Marathon Fries with marathon sauce','Side',80),(42,'Baklava','Dessert',81),(43,'Pasteles de Pollo y Espinaca','Appetizer',85),(44,'Trucha Frita','Entree',86),(45,'Ritchie\'s the Crepe','Entree',87);
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `item_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`),
  KEY `fk_menu_restaurants1_idx` (`restaurant_id`),
  CONSTRAINT `fk_menu_restaurants1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,5),(2,1,6.5),(3,1,7.5),(4,1,6.5),(5,1,4),(6,1,10),(7,2,11),(8,2,15),(9,2,8),(10,2,4),(11,2,2.75),(12,2,14),(13,3,13.95),(14,3,6.95),(15,3,6.5),(16,3,5.95),(17,3,5.95),(18,3,5.95),(19,4,12.95),(20,4,12.95),(21,4,5.95),(22,4,4),(23,4,3),(24,4,4),(25,5,9),(26,5,12),(27,5,9),(28,5,4),(29,5,4),(30,5,3),(31,6,17.29),(32,6,9.99),(33,6,5.99),(34,6,1.95),(35,6,2.75),(36,6,2.59),(37,7,5),(38,7,24.95),(39,7,13.5),(40,7,3.25),(41,7,4.25),(42,7,15),(43,8,9),(44,8,14.5),(45,8,9.5),(46,8,2.25),(47,8,1.5),(48,8,2.25),(49,9,5.99),(50,9,13.99),(51,9,5.5),(52,9,3.5),(53,9,2),(54,9,3),(55,10,12.5),(56,10,13.75),(57,10,7.75),(58,10,4.55),(59,10,6.25),(60,10,5.35),(61,11,9.99),(62,11,14.99),(63,11,5.99),(64,11,2),(65,11,2),(66,11,2),(67,12,15.95),(68,12,20.95),(69,12,17.45),(70,12,4.45),(71,12,5),(72,12,2.45),(73,13,11.79),(74,13,6.5),(75,13,11.79),(76,13,2.5),(77,13,2.75),(78,13,2.5),(79,14,12.25),(80,14,3.75),(81,14,4.25),(82,14,1.85),(83,14,1),(84,14,2.75),(85,15,4.25),(86,15,16.95),(87,15,9.5),(88,15,6.15),(89,15,2.25),(90,15,5.5);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `restaurant_total_rating`
--

DROP TABLE IF EXISTS `restaurant_total_rating`;
/*!50001 DROP VIEW IF EXISTS `restaurant_total_rating`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `restaurant_total_rating` AS SELECT 
 1 AS `restaurant_name`,
 1 AS `Total Rating Out of 25`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `restaurant_id` int NOT NULL,
  `restaurant_name` varchar(85) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `cuisine` varchar(150) DEFAULT NULL,
  `affordability` varchar(45) DEFAULT NULL,
  `wheelchair_accessible` tinyint(1) DEFAULT NULL,
  `minority_owned` tinyint(1) DEFAULT NULL,
  `women_owned` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`),
  UNIQUE KEY `restaurant_id_UNIQUE` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'The Board & Brew','8150 Baltimore Ave. College Park, MD 20740','American','$$',1,0,0),(2,'The Hall CP','4656 Hotel Drive, College Park, MD 20742','American','$$',1,0,0),(3,'Pho Thom','F, 7313 Baltimore Ave, College Park, MD 20740','Vietnamese','$',0,1,0),(4,'Aroy Thai Restaurant','4511 College Ave, College Park, MD 20740','Thai','$',1,0,0),(5,'Taqueria Habanero','8145 Baltimore Ave Suite A&B, College Park, MD 20740','Mexican','$$',1,1,0),(6,'Pupuseria La Familiar','8145 Baltimore Ave K, College Park, MD 20740','Salvadoran','$',1,1,1),(7,'Hanami Japanese Restaurant','8145 Baltimore Ave M, College Park, MD 20740','Japanese','$$',1,1,1),(8,'Yia Yia\'s Kitchen','10413 Baltimore Ave, Beltsville, MD 20705','Greek, Mediterranean','$',1,1,0),(9,'Qu Japan','7406 Baltimore Ave, College Park, MD 20740','Japanese','$$',1,1,1),(10,'The Spot Mini','4207 Knox Rd, College Park, MD 20740','Japanese, East Asian','$$',1,1,1),(11,'Pizza Kingdom','4439 Lehigh Rd, College Park, MD 20740','Italian','$',1,1,0),(12,'Wasabi Bistro','4505 College Ave, College Park, MD 20740','Japanese','$$',1,1,1),(13,'&pizza','7236 Baltimore Avenue, College Park, MD 20740','Italian','$$',1,0,0),(14,'Marathon Deli','7412 Baltimore Ave, College Park, MD 20740','Greek','$',1,1,0),(15,'Ritchie\'s Colombian Restaurant','7313 Baltimore Ave suite H, College Park, MD 20740','Colombian','$$',1,1,0);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  `source` varchar(150) DEFAULT NULL,
  `restaurant_id` int NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_reviews_restaurants1_idx` (`restaurant_id`),
  CONSTRAINT `fk_reviews_restaurants1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,5,'Yelp',1),(2,3,'Yelp',1),(3,4,'Tripadvisor',1),(4,1,'Tripadvisor',1),(5,5,'Restaurantji',1),(6,4,'Yelp',2),(7,5,'Yelp',2),(8,3,'Restaurantji',2),(9,4,'Restaurantji',2),(10,3,'Tripadvisor',2),(11,4,'Yelp',3),(12,4,'Google Review',3),(13,4,'Zomato',3),(14,4,'Restaurantji',3),(15,4,'MenuPix',3),(16,4,'Yelp',4),(17,4,'GrubHub',4),(18,4,'Google Review',4),(19,4,'Restaurantji',4),(20,5,'Facebook',4),(21,5,'Google Review',5),(22,5,'Facebook',5),(23,4,'Yelp',5),(24,4,'Restaurantji',5),(25,5,'Tripadvisor',5),(26,4,'Yelp',6),(27,4,'Yelp',6),(28,2,'Tripadvisor',6),(29,4,'Tripadvisor',6),(30,4,'Restaurantji',6),(31,4,'Yelp',7),(32,4,'Tripadvisor',7),(33,5,'GrubHub',7),(34,4,'Restaurantji',7),(35,4,'Google Review',7),(36,5,'Yelp',8),(37,4,'GrubHub',8),(38,4,'Tripadvisor',8),(39,4,'MenuPix',8),(40,5,'Google Review',8),(41,4,'Restaurantji',9),(42,5,'GrubHub',9),(43,4,'Yelp',9),(44,5,'Postmates',9),(45,5,'Google Review',9),(46,4,'Yelp',10),(47,5,'Ubereats',10),(48,4,'Restaurantji',10),(49,5,'Postmates',10),(50,5,'Google Review',10),(51,4,'Google Review',11),(52,4,'Facebook',11),(53,4,'GrubHub',11),(54,5,'Slice',11),(55,3,'Restaurantji',11),(56,4,'Google Review',12),(57,4,'Yelp',12),(58,5,'GrubHub',12),(59,4,'Restaurantji',12),(60,5,'Ubereats',12),(61,1,'Yelp',13),(62,4,'Yelp',13),(63,4,'Restaurantji',13),(64,5,'Restaurantji',13),(65,3,'GrubHub',13),(66,4,'Yelp',14),(67,4,'Restaurantji',14),(68,4,'GrubHub',14),(69,4,'Seamless',14),(70,4,'Resturantguru',14),(71,5,'Restaurantji',15),(72,5,'Restaurant Guru',15),(73,5,'MenuPix',15),(74,5,'Yelp',15),(75,5,'Google Reviews',15);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vegan_restaurants`
--

DROP TABLE IF EXISTS `vegan_restaurants`;
/*!50001 DROP VIEW IF EXISTS `vegan_restaurants`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vegan_restaurants` AS SELECT 
 1 AS `restaurant_name`,
 1 AS `dietary_restriction`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `affordability_of_minority_owned`
--

/*!50001 DROP VIEW IF EXISTS `affordability_of_minority_owned`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `affordability_of_minority_owned` AS select `restaurants`.`restaurant_name` AS `restaurant_name`,`restaurants`.`cuisine` AS `cuisine`,`restaurants`.`affordability` AS `affordability` from `restaurants` where `restaurants`.`restaurant_id` in (select `restaurants`.`restaurant_id` from `restaurants` where (`restaurants`.`minority_owned` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `alcoholic_drinks`
--

/*!50001 DROP VIEW IF EXISTS `alcoholic_drinks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alcoholic_drinks` AS select `restaurants`.`restaurant_name` AS `restaurant_name`,`drinks`.`drink_name` AS `drink_name` from ((`restaurants` join `menu` on((`restaurants`.`restaurant_id` = `menu`.`restaurant_id`))) join `drinks` on((`menu`.`item_id` = `drinks`.`item_id`))) where (`drinks`.`alcoholic` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `item_prices_avg_sum`
--

/*!50001 DROP VIEW IF EXISTS `item_prices_avg_sum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `item_prices_avg_sum` AS select `meals`.`meal_name` AS `item_name`,concat('$',`menu`.`price`) AS `price`,`meals`.`item_id` AS `item_id` from (`meals` join `menu` on((`meals`.`item_id` = `menu`.`item_id`))) union select `drinks`.`drink_name` AS `item_name`,concat('$',`menu`.`price`) AS `price`,`drinks`.`item_id` AS `item_id` from (`drinks` join `menu` on((`drinks`.`item_id` = `menu`.`item_id`))) union select 'Total' AS `Total`,concat('$',round(sum(`menu`.`price`),2)) AS `CONCAT('$', ROUND(SUM(price), 2))`,NULL AS `NULL` from `menu` union select 'Average' AS `Average`,concat('$',round(avg(`menu`.`price`),2)) AS `CONCAT('$', ROUND(AVG(price), 2))`,NULL AS `NULL` from `menu` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `restaurant_total_rating`
--

/*!50001 DROP VIEW IF EXISTS `restaurant_total_rating`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `restaurant_total_rating` AS select `restaurants`.`restaurant_name` AS `restaurant_name`,concat(sum(`reviews`.`rating`)) AS `Total Rating Out of 25` from (`restaurants` join `reviews` on((`restaurants`.`restaurant_id` = `reviews`.`restaurant_id`))) group by `restaurants`.`restaurant_id` having (`Total Rating Out of 25` >= 17) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vegan_restaurants`
--

/*!50001 DROP VIEW IF EXISTS `vegan_restaurants`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vegan_restaurants` AS select `restaurants`.`restaurant_name` AS `restaurant_name`,`dietary_restrictions`.`dietary_restriction` AS `dietary_restriction` from ((`restaurants` join `has_dietary_restrictions` on((`restaurants`.`restaurant_id` = `has_dietary_restrictions`.`restaurant_id`))) join `dietary_restrictions` on((`has_dietary_restrictions`.`dietary_id` = `dietary_restrictions`.`dietary_id`))) where (`dietary_restrictions`.`dietary_restriction` = 'Vegan') order by `restaurants`.`restaurant_name` */;
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

-- Dump completed on 2022-05-10 18:38:02
