-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema affablebean
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema affablebean
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `affablebean` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `affablebean` ;

-- -----------------------------------------------------
-- Table `affablebean`.`color`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`color` ;

CREATE TABLE IF NOT EXISTS `affablebean`.`color` (
  `id` TINYINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `description` VARCHAR(8000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `affablebean`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`customer` ;

CREATE TABLE IF NOT EXISTS `affablebean`.`customer` (
  `user_name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `password` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `email` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `phone` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `address` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `city_region` VARCHAR(2) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `cc_number` VARCHAR(19) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`user_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'maintains customer details';


-- -----------------------------------------------------
-- Table `affablebean`.`customer_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`customer_order` ;

CREATE TABLE IF NOT EXISTS `affablebean`.`customer_order` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL(6,2) NOT NULL,
  `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmation_number` INT(10) UNSIGNED NOT NULL,
  `customer_id` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_order_customer_idx` (`customer_id` ASC),
  CONSTRAINT `fk_customer_order_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `affablebean`.`customer` (`user_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `affablebean`.`type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`type` ;

CREATE TABLE IF NOT EXISTS `affablebean`.`type` (
  `id` TINYINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `description` VARCHAR(8000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `affablebean`.`scent_family`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`scent_family` ;

CREATE TABLE IF NOT EXISTS `affablebean`.`scent_family` (
  `id` TINYINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `description` VARCHAR(8000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `affablebean`.`scent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`scent` ;

CREATE TABLE IF NOT EXISTS `affablebean`.`scent` (
  `id` TINYINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `description` VARCHAR(8000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `fk_scent_family` TINYINT(4) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_scent_family_idx` (`fk_scent_family` ASC),
  CONSTRAINT `fk_scent_family`
    FOREIGN KEY (`fk_scent_family`)
    REFERENCES `affablebean`.`scent_family` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `affablebean`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`category` ;

CREATE TABLE IF NOT EXISTS `affablebean`.`category` (
  `id` TINYINT(4) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `affablebean`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`product` ;

CREATE TABLE IF NOT EXISTS `affablebean`.`product` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `description` VARCHAR(8000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `review_adv` FLOAT UNSIGNED NULL DEFAULT NULL,
  `sold` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `type_id` TINYINT(4) UNSIGNED NOT NULL,
  `color_id` TINYINT(4) UNSIGNED NOT NULL,
  `scent_id` TINYINT(4) UNSIGNED NOT NULL,
  `category_id` TINYINT(4) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_scent_idx` (`scent_id` ASC),
  INDEX `fk_color_idx` (`color_id` ASC),
  INDEX `fk_type_idx` (`type_id` ASC),
  INDEX `fk_product_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_type`
    FOREIGN KEY (`type_id`)
    REFERENCES `affablebean`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_scent`
    FOREIGN KEY (`scent_id`)
    REFERENCES `affablebean`.`scent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_color`
    FOREIGN KEY (`color_id`)
    REFERENCES `affablebean`.`color` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `affablebean`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `affablebean`.`orderd_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`orderd_product` ;

CREATE TABLE IF NOT EXISTS `affablebean`.`orderd_product` (
  `customer_order_id` INT(10) UNSIGNED NOT NULL,
  `product_id` INT(10) UNSIGNED NOT NULL,
  `quantity` SMALLINT(3) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`customer_order_id`, `product_id`),
  INDEX `fk_customer_order_has_product_product1_idx` (`product_id` ASC),
  INDEX `fk_customer_order_has_product_customer_order1_idx` (`customer_order_id` ASC),
  CONSTRAINT `fk_ordered_product_customer_order`
    FOREIGN KEY (`customer_order_id`)
    REFERENCES `affablebean`.`customer_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_product_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `affablebean`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `affablebean`.`product_reivew`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`product_reivew` ;

CREATE TABLE IF NOT EXISTS `affablebean`.`product_reivew` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `review` VARCHAR(8000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rating` TINYINT(1) UNSIGNED NOT NULL DEFAULT '5',
  `product_id` INT(10) UNSIGNED NOT NULL,
  `customer_id` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_idx` (`product_id` ASC),
  INDEX `fk_customer_idx` (`customer_id` ASC),
  CONSTRAINT `fk_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `affablebean`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `affablebean`.`customer` (`user_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
