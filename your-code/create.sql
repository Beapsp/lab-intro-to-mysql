-- MySQL Workbench Forward Engineering
DROP DATABASE IF EXISTS mydb;
CREATE DATABASE mydb;
USE mydb;


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`CARS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CARS` (
  `ID` INT NOT NULL,
  `VIN` VARCHAR(40) NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Year` INT NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMERS` (
  `IdCustomer` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NOT NULL,
  `State/Province` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Postal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SALESPERSONS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SALESPERSONS` (
  `IdStaff` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdStaff`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`INVOICE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`INVOICES` (
  `Invoice Number` INT NOT NULL,
  `Date` VARCHAR(10) NOT NULL,
  `CARS_ID` INT NOT NULL,
  `CUSTOMERS_ID` INT NOT NULL,
  `SALESPERSONS_ID` INT NOT NULL,
  PRIMARY KEY (`Invoice Number`),
  FOREIGN KEY (`CARS_ID`)         REFERENCES `mydb`.`CARS`(`ID`)              ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`CUSTOMERS_ID`)    REFERENCES `mydb`.`CUSTOMERS`(`IdCustomer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`SALESPERSONS_ID`) REFERENCES `mydb`.`SALESPERSONS`(`IdStaff`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;