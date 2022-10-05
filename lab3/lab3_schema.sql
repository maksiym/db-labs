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

USE lab1_schema;


-- Office
INSERT INTO office(number, city) VALUES
(1, 'Rivne'),
(2, 'Kyiv'),
(3, 'Lviv'),
(4, 'Lutsk'),
(5, 'Miami'),
(6, 'Los Angeles'),
(7, 'Makiivka'),
(8, 'Ternopil'),
(9, 'Odesa'),
(10, 'Kherson');

-- Room
INSERT INTO room(number, office_id) VALUES
(501, 1),
(503, 2),
(503, 3),
(101, 4),
(102, 5),
(205, 6),
(206, 6),
(207, 1),
(307, 7),
(907, 8);

-- Workplace
INSERT INTO workplace(number, room_id) VALUES
(11, 1),
(12, 4),
(13, 3),
(13, 6),
(13, 5),
(14, 7),
(15, 8),
(16, 1),
(17, 7),
(18, 8);

-- Equipment location
INSERT INTO equipment_location(workplace_id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- Initiator 
INSERT INTO initiator(name, surname) VALUES
('Tolik', 'Sharii'),
('Jay', 'A'),
('Jay', 'B'),
('Jay', 'C'),
('Nazar', 'Bylen'),
('Jay', 'Bylen'),
('Nazar', 'Jobhelper'),
('Zenoviy', 'Veres'),
('Zinoviy', 'Mychuda'),
('Zynoviy', 'Nytrebych');

-- Respondent
INSERT INTO respondent(name, surname) VALUES
('Eminem', 'Bylen'),
('Jack', 'Gorobets'),
('Anatolii', 'Petrovych'),
('Leonardo', 'Turtle'),
('Rafael', 'Turtle'),
('Donatello', 'Turtle'),
('Michelangelo', 'Turtle'),
('Volodymyr', 'Zelenskiy'),
('Svyat', 'Lord'),
('Svyat', 'Must-have');

-- Issue
INSERT INTO issue(description, equipment_location_id) VALUES
('SW-failure', 1),
('SW-failure', 2),
('SW-failure', 3),
('PC-failure', 4),
('PC-change', 5),
('PC-change', 6),
('SW-update', 7),
('SW-update', 8),
('PC-failure', 9),
('PC-failure', 10);

-- Application
INSERT INTO application(date, status, issue_id, initiator_id) VALUES
('2022-09-13', 'NEW', 1, 10),
('2022-09-14', 'NEW', 2, 1),
('2022-09-15', 'NEW', 3, 6),
('2022-09-16', 'NEW', 4, 3),
('2022-08-13', 'NEW', 5, 4),
('2022-07-13', 'NEW', 6, 2),
('2022-09-20', 'NEW', 7, 8),
('2022-09-21', 'NEW', 8, 7),
('2022-09-23', 'NEW', 9, 9),
('2022-09-30', 'NEW', 10, 5);

-- Application respondent
INSERT INTO application_respondent(application_id, respondent_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9);
