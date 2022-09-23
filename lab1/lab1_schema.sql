-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab1_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab1_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab1_schema` DEFAULT CHARACTER SET utf8 ;
USE `lab1_schema` ;

-- -----------------------------------------------------
-- Table `lab1_schema`.`office`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab1_schema`.`office` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `city` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab1_schema`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab1_schema`.`room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `office_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_room_office1_idx` (`office_id` ASC) VISIBLE,
  CONSTRAINT `fk_room_office1`
    FOREIGN KEY (`office_id`)
    REFERENCES `lab1_schema`.`office` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab1_schema`.`workplace`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab1_schema`.`workplace` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `room_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_workplace_room1_idx` (`room_id` ASC) VISIBLE,
  CONSTRAINT `fk_workplace_room1`
    FOREIGN KEY (`room_id`)
    REFERENCES `lab1_schema`.`room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab1_schema`.`equipment_location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab1_schema`.`equipment_location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `workplace_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_equipment_location_workplace1_idx` (`workplace_id` ASC) VISIBLE,
  CONSTRAINT `fk_equipment_location_workplace1`
    FOREIGN KEY (`workplace_id`)
    REFERENCES `lab1_schema`.`workplace` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab1_schema`.`issue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab1_schema`.`issue` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(10000) NULL,
  `equipment_location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_issue_equipment_location1_idx` (`equipment_location_id` ASC) VISIBLE,
  CONSTRAINT `fk_issue_equipment_location1`
    FOREIGN KEY (`equipment_location_id`)
    REFERENCES `lab1_schema`.`equipment_location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab1_schema`.`initiator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab1_schema`.`initiator` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `surname` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab1_schema`.`application`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab1_schema`.`application` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `status` VARCHAR(25) NULL,
  `issue_id` INT NOT NULL,
  `initiator_id` INT NOT NULL,
  PRIMARY KEY (`id`, `issue_id`, `initiator_id`),
  INDEX `fk_application_issue1_idx` (`issue_id` ASC) VISIBLE,
  INDEX `fk_application_initiator1_idx` (`initiator_id` ASC) VISIBLE,
  CONSTRAINT `fk_application_issue1`
    FOREIGN KEY (`issue_id`)
    REFERENCES `lab1_schema`.`issue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_application_initiator1`
    FOREIGN KEY (`initiator_id`)
    REFERENCES `lab1_schema`.`initiator` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab1_schema`.`respondent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab1_schema`.`respondent` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `surname` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab1_schema`.`application_respondent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab1_schema`.`application_respondent` (
  `application_id` INT NOT NULL,
  `respondent_id` INT NOT NULL,
  PRIMARY KEY (`application_id`, `respondent_id`),
  INDEX `fk_application_has_respondent_respondent1_idx` (`respondent_id` ASC) VISIBLE,
  INDEX `fk_application_has_respondent_application1_idx` (`application_id` ASC) VISIBLE,
  CONSTRAINT `fk_application_has_respondent_application1`
    FOREIGN KEY (`application_id`)
    REFERENCES `lab1_schema`.`application` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_application_has_respondent_respondent1`
    FOREIGN KEY (`respondent_id`)
    REFERENCES `lab1_schema`.`respondent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
