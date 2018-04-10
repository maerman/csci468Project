-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: affablebean
-- ------------------------------------------------------
-- Server version	5.1.72-community

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
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'earthy'),(2,'musk'),(3,'floral'),(4,'fresh');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `city_region` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `cc_number` varchar(19) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_order_customer1_idx` (`customer_id`),
  CONSTRAINT `fk_customer_order_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `ordered_product`
--

DROP TABLE IF EXISTS `ordered_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordered_product` (
  `customer_order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`customer_order_id`,`product_id`),
  KEY `fk_customer_order_has_product_product1_idx` (`product_id`),
  KEY `fk_customer_order_has_product_customer_order1_idx` (`customer_order_id`),
  CONSTRAINT `fk_ordered_product_customer_order1` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_product`
--

LOCK TABLES `ordered_product` WRITE;
/*!40000 ALTER TABLE `ordered_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordered_product` ENABLE KEYS */;
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
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category_idx` (`category_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Autumn Walk',12.49,'Walk through the fallign leaves with this enchanting scent.  Combining notes of Apple, cinnamon, and patchouli, once the candle is lit you will be transported to a forest on a crisp autumn day. ','2018-04-10 01:03:15',1),(2,'Beach Day',12.49,'No day compares to a day at the beach!  Feel the ocean come alive with the scents of Tangerine, salt water, and musk to deliver a captivating scent of the beach…just don\'t forget your beach blanket! ','2018-04-10 01:03:15',4),(3,'Boughs of Holly',12.49,'Deck your halls with this traditional holiday scent.  If you need a little help getting into the holiday spirit, allow us to help with warm enveloping scents of holly, cinnamon, and musk.  Perfect for your Holidays! ','2018-04-10 00:39:20',3),(4,'Campfire',12.49,'Want to hang out around the campfire in the country, but you are stuck in the city?  Our notes of smoke, clove, and vanilla will make it feel as if you are right there at the fire telling stories and roasting marshmallows! ','2018-04-10 00:39:20',2),(5,'Double Date',12.49,'Bring the romance home tonight with this blissful scent.  The grapefruit and ginger notes are reminiscent of a freshly uncorked bottle of bubbly, and of course what date night would be complete without a bouquet of roses? ','2018-04-10 00:39:20',4),(6,'Emerald Isle',12.49,'Bring home the enchantment of the Emerald Isle, Ireland.  The musky leather notes mingle perfectly with the scent of Clover, Ireland\'s national flower, and the Irish Cream will make you feel as if you\'ve nipped in to the pub for a pint! ','2018-04-10 00:56:15',1),(7,'Evergreen',12.49,'Real trees are lovely, but needles get everywhere!  With this candle you can have the scent of a real Christmas tree without the hassle of all those pesky needles!   Just allow the scents of orange, pine, and cedar to fill your home. ','2018-04-10 00:56:15',1),(8,'Spring Rain',12.49,'April showers and May flowers come together in this beautiful floral scent of Lemon, rose, and moss.  At last you can walk through a fresh spring rain and not even need an umbrella! ','2018-04-10 00:39:20',3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-09 21:16:06
