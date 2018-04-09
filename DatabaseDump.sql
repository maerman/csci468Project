CREATE DATABASE  IF NOT EXISTS `affablebean` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `affablebean`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: affablebean
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(8000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`, `description`) VALUES (1,'Earthy',NULL),(2,'Fresh',NULL),(3,'Floral',NULL),(4,'Musk',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(8000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` (`id`, `name`, `description`) VALUES (1,'Orange',NULL),(2,'White',NULL),(3,'Dark Green',NULL),(4,'Black',NULL),(5,'Red',NULL),(6,'Blue',NULL);
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `user_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_region` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_number` varchar(19) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maintains customer details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(6,2) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmation_number` int(10) unsigned NOT NULL,
  `customer_id` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_order_customer_idx` (`customer_id`),
  CONSTRAINT `fk_customer_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`user_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderd_product`
--

DROP TABLE IF EXISTS `orderd_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderd_product` (
  `customer_order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` smallint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`customer_order_id`,`product_id`),
  KEY `fk_customer_order_has_product_product1_idx` (`product_id`),
  KEY `fk_customer_order_has_product_customer_order1_idx` (`customer_order_id`),
  CONSTRAINT `fk_ordered_product_customer_order` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_product_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderd_product`
--

LOCK TABLES `orderd_product` WRITE;
/*!40000 ALTER TABLE `orderd_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderd_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `description` varchar(8000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `review_adv` float unsigned DEFAULT NULL,
  `sold` int(10) unsigned NOT NULL DEFAULT '0',
  `type_id` tinyint(4) unsigned NOT NULL,
  `color_id` tinyint(4) unsigned NOT NULL,
  `scent_id` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_scent_idx` (`scent_id`),
  KEY `fk_color_idx` (`color_id`),
  KEY `fk_type_idx` (`type_id`),
  CONSTRAINT `fk_color` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_scent` FOREIGN KEY (`scent_id`) REFERENCES `scent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_type` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `name`, `price`, `description`, `last_update`, `review_adv`, `sold`, `type_id`, `color_id`, `scent_id`) VALUES (1,'Autumn Walk',1.49,'Walk through the fallign leaves with this enchanting scent.  Combining notes of Apple, cinnamon, and patchouli, once the candle is lit you will be transported to a forest on a crisp autumn day.','2018-04-09 02:15:46',NULL,0,1,1,1),(2,'Autumn Walk',12.49,'Walk through the fallign leaves with this enchanting scent.  Combining notes of Apple, cinnamon, and patchouli, once the candle is lit you will be transported to a forest on a crisp autumn day.','2018-04-09 02:15:46',NULL,0,2,1,1),(3,'Autumn Walk',19.99,'Walk through the fallign leaves with this enchanting scent.  Combining notes of Apple, cinnamon, and patchouli, once the candle is lit you will be transported to a forest on a crisp autumn day.','2018-04-09 02:15:46',NULL,0,3,1,1),(4,'Beach Day',1.49,'No day compares to a day at the beach!  Feel the ocean come alive with the scents of Tangerine, salt water, and musk to deliver a captivating scent of the beach…just don\'t forget your beach blanket!','2018-04-09 02:17:01',NULL,0,1,2,2),(5,'Beach Day',12.49,'No day compares to a day at the beach!  Feel the ocean come alive with the scents of Tangerine, salt water, and musk to deliver a captivating scent of the beach…just don\'t forget your beach blanket!','2018-04-09 08:17:11',NULL,0,2,2,2),(6,'Beach Day',19.99,'No day compares to a day at the beach!  Feel the ocean come alive with the scents of Tangerine, salt water, and musk to deliver a captivating scent of the beach…just don\'t forget your beach blanket!','2018-04-09 08:17:35',NULL,0,3,2,2),(7,'Boughs of Holly',1.49,'Deck your halls with this traditional holiday scent.  If you need a little help getting into the holiday spirit, allow us to help with warm enveloping scents of holly, cinnamon, and musk.  Perfect for your Holidays!','2018-04-09 02:18:19',NULL,0,1,3,3),(8,'Boughs of Holly',12.49,'Deck your halls with this traditional holiday scent.  If you need a little help getting into the holiday spirit, allow us to help with warm enveloping scents of holly, cinnamon, and musk.  Perfect for your Holidays!','2018-04-09 02:18:19',NULL,0,2,3,3),(9,'Boughs of Holly',19.99,'Deck your halls with this traditional holiday scent.  If you need a little help getting into the holiday spirit, allow us to help with warm enveloping scents of holly, cinnamon, and musk.  Perfect for your Holidays!','2018-04-09 02:18:19',NULL,0,3,3,3),(10,'Campfire',1.49,'Want to hang out around the campfire in the country, but you are stuck in the city?  Our notes of smoke, clove, and vanilla will make it feel as if you are right there at the fire telling stories and roasting marshmallows!','2018-04-09 02:20:28',NULL,0,1,4,4),(11,'Campfire',12.49,'Want to hang out around the campfire in the country, but you are stuck in the city?  Our notes of smoke, clove, and vanilla will make it feel as if you are right there at the fire telling stories and roasting marshmallows!','2018-04-09 02:20:28',NULL,0,2,4,4),(12,'Campfire',19.99,'Want to hang out around the campfire in the country, but you are stuck in the city?  Our notes of smoke, clove, and vanilla will make it feel as if you are right there at the fire telling stories and roasting marshmallows!','2018-04-09 02:20:28',NULL,0,3,4,4),(13,'Double Date',1.49,'Bring the romance home tonight with this blissful scent.  The grapefruit and ginger notes are reminiscent of a freshly uncorked bottle of bubbly, and of course what date night would be complete without a bouquet of roses?','2018-04-09 09:03:08',NULL,0,1,5,5),(14,'Double Date',12.49,'Bring the romance home tonight with this blissful scent.  The grapefruit and ginger notes are reminiscent of a freshly uncorked bottle of bubbly, and of course what date night would be complete without a bouquet of roses?','2018-04-09 09:03:08',NULL,0,2,5,5),(15,'Double Date',19.99,'Bring the romance home tonight with this blissful scent.  The grapefruit and ginger notes are reminiscent of a freshly uncorked bottle of bubbly, and of course what date night would be complete without a bouquet of roses?','2018-04-09 09:03:08',NULL,0,3,5,5),(16,'Emerald Isle',1.49,'Bring home the enchantment of the Emerald Isle, Ireland.  The musky leather notes mingle perfectly with the scent of Clover, Ireland\'s national flower, and the Irish Cream will make you feel as if you\'ve nipped in to the pub for a pint!','2018-04-09 09:04:38',NULL,0,1,3,6),(17,'Emerald Isle',12.49,'Bring home the enchantment of the Emerald Isle, Ireland.  The musky leather notes mingle perfectly with the scent of Clover, Ireland\'s national flower, and the Irish Cream will make you feel as if you\'ve nipped in to the pub for a pint!','2018-04-09 09:04:38',NULL,0,2,3,6),(18,'Emerald Isle',19.99,'Bring home the enchantment of the Emerald Isle, Ireland.  The musky leather notes mingle perfectly with the scent of Clover, Ireland\'s national flower, and the Irish Cream will make you feel as if you\'ve nipped in to the pub for a pint!','2018-04-09 09:04:38',NULL,0,3,3,6),(19,'Evergreen',1.49,'Real trees are lovely, but needles get everywhere!  With this candle you can have the scent of a real Christmas tree without the hassle of all those pesky needles!   Just allow the scents of orange, pine, and cedar to fill your home and you\'ll almost forget you\'re not trimming a real tree!','2018-04-09 09:13:35',NULL,0,1,3,7),(20,'Evergreen',12.49,'Real trees are lovely, but needles get everywhere!  With this candle you can have the scent of a real Christmas tree without the hassle of all those pesky needles!   Just allow the scents of orange, pine, and cedar to fill your home and you\'ll almost forget you\'re not trimming a real tree! ','2018-04-09 09:13:35',NULL,0,2,3,7),(21,'Evergreen',19.99,'Real trees are lovely, but needles get everywhere!  With this candle you can have the scent of a real Christmas tree without the hassle of all those pesky needles!   Just allow the scents of orange, pine, and cedar to fill your home and you\'ll almost forget you\'re not trimming a real tree! ','2018-04-09 09:13:35',NULL,0,3,3,7),(22,'Pumpkin Spice',1.49,'When fall comes around, everyone craves pumpkin spice!  With a combination of pumpkin, clove, and vanilla, our candle smells as good as your favorite autumn coffee drink! ','2018-04-09 09:08:06',NULL,0,1,1,1),(23,'Pumpkin Spice',12.49,'When fall comes around, everyone craves pumpkin spice!  With a combination of pumpkin, clove, and vanilla, our candle smells as good as your favorite autumn coffee drink! ','2018-04-09 09:08:06',NULL,0,2,1,1),(24,'Pumpkin Spice',19.99,'When fall comes around, everyone craves pumpkin spice!  With a combination of pumpkin, clove, and vanilla, our candle smells as good as your favorite autumn coffee drink! ','2018-04-09 09:08:06',NULL,0,3,1,1),(25,'Spring Rain',1.49,'April showers and May flowers come together in this beautiful floral scent of Lemon, rose, and moss.  At last you can walk through a fresh spring rain and not even need an umbrella! ','2018-04-09 09:09:23',NULL,0,1,6,8),(26,'Spring Rain',12.49,'April showers and May flowers come together in this beautiful floral scent of Lemon, rose, and moss.  At last you can walk through a fresh spring rain and not even need an umbrella! ','2018-04-09 09:09:23',NULL,0,2,6,8),(27,'Spring Rain',19.99,'April showers and May flowers come together in this beautiful floral scent of Lemon, rose, and moss.  At last you can walk through a fresh spring rain and not even need an umbrella! ','2018-04-09 09:09:23',NULL,0,3,6,8);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reivew`
--

DROP TABLE IF EXISTS `product_reivew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_reivew` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `review` varchar(8000) COLLATE utf8_unicode_ci NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rating` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_idx` (`product_id`),
  KEY `fk_customer_idx` (`customer_id`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`user_name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reivew`
--

LOCK TABLES `product_reivew` WRITE;
/*!40000 ALTER TABLE `product_reivew` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reivew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scent`
--

DROP TABLE IF EXISTS `scent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scent` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(8000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fk_scent_family` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_scent_family_idx` (`fk_scent_family`),
  CONSTRAINT `fk_scent_family` FOREIGN KEY (`fk_scent_family`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scent`
--

LOCK TABLES `scent` WRITE;
/*!40000 ALTER TABLE `scent` DISABLE KEYS */;
INSERT INTO `scent` (`id`, `name`, `description`, `fk_scent_family`) VALUES (1,'Pumpkin',NULL,1),(2,'Tangerine',NULL,2),(3,'Holly',NULL,3),(4,'Colve',NULL,4),(5,'Grapefuit',NULL,2),(6,'Leather',NULL,4),(7,'Pine',NULL,1),(8,'Rose',NULL,3);
/*!40000 ALTER TABLE `scent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(8000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` (`id`, `name`, `description`) VALUES (1,'Votive',NULL),(2,'Medium Jar',NULL),(3,'Large Jar',NULL);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-09  5:25:39
