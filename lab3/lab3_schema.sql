-- -----------------------------------------------------
-- Schema lab3_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab3_schema` DEFAULT CHARACTER SET utf8 ;
USE `lab3_schema` ;


-- -----------------------------------------------------
-- Table `lab3_schema`.`office`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3_schema`.`office`;
CREATE TABLE IF NOT EXISTS `lab3_schema`.`office` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `city` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `lab3_schema`.`room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3_schema`.`room`;
CREATE TABLE IF NOT EXISTS `lab3_schema`.`room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `office_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_room_office_id`
    FOREIGN KEY (`office_id`)
    REFERENCES `lab1_schema`.`office` (`id`)
);


-- -----------------------------------------------------
-- Table `lab1_schema`.`workplace`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3_schema`.`workplace`;
CREATE TABLE IF NOT EXISTS `lab3_schema`.`workplace` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `room_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_workplace_room_id`
    FOREIGN KEY (`room_id`)
    REFERENCES `lab1_schema`.`room` (`id`)
);


-- -----------------------------------------------------
-- Table `lab3_schema`.`equipment_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3_schema`.`equipment_location`;
CREATE TABLE IF NOT EXISTS `lab3_schema`.`equipment_location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `workplace_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_equipment_location_workplace_id`
    FOREIGN KEY (`workplace_id`)
    REFERENCES `lab1_schema`.`workplace` (`id`)
);


-- -----------------------------------------------------
-- Table `lab3_schema`.`issue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3_schema`.`issue`;
CREATE TABLE IF NOT EXISTS `lab3_schema`.`issue` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(10000) NULL,
  `equipment_location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_issue_equipment_location_id`
    FOREIGN KEY (`equipment_location_id`)
    REFERENCES `lab1_schema`.`equipment_location` (`id`)
);


-- -----------------------------------------------------
-- Table `lab3_schema`.`initiator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3_schema`.`initiator`;
CREATE TABLE IF NOT EXISTS `lab3_schema`.`initiator` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `surname` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `lab3_schema`.`application`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3_schema`.`application`;
CREATE TABLE IF NOT EXISTS `lab3_schema`.`application` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `status` VARCHAR(25) NULL,
  `issue_id` INT NOT NULL,
  `initiator_id` INT NOT NULL,
  PRIMARY KEY (`id`, `issue_id`, `initiator_id`),
  CONSTRAINT `fk_application_issue_id`
    FOREIGN KEY (`issue_id`)
    REFERENCES `lab1_schema`.`issue` (`id`),
  CONSTRAINT `fk_application_initiator_id`
    FOREIGN KEY (`initiator_id`)
    REFERENCES `lab1_schema`.`initiator` (`id`)
);



-- -----------------------------------------------------
-- Table `lab3_schema`.`respondent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3_schema`.`respondent`;
CREATE TABLE IF NOT EXISTS `lab3_schema`.`respondent` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `surname` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `lab3_schema`.`application_respondent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab3_schema`.`application_respondent`;
CREATE TABLE IF NOT EXISTS `lab3_schema`.`application_respondent` (
  `application_id` INT NOT NULL,
  `respondent_id` INT NOT NULL,
  PRIMARY KEY (`application_id`, `respondent_id`),
  CONSTRAINT `fk_application_respondent_application_id`
    FOREIGN KEY (`application_id`)
    REFERENCES `lab1_schema`.`application` (`id`),
  CONSTRAINT `fk_application_respondent_respondent_id`
    FOREIGN KEY (`respondent_id`)
    REFERENCES `lab1_schema`.`respondent` (`id`)
);


-- -----------------------------------------------------
-- Table `lab3_schema`.`office`
-- -----------------------------------------------------
INSERT INTO `office`(`number`, `city`) VALUES
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


-- -----------------------------------------------------
-- Table `lab3_schema`.`room`
-- -----------------------------------------------------
INSERT INTO `room`(`number`, `office_id`) VALUES
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


-- -----------------------------------------------------
-- Table `lab3_schema`.`workplace`
-- -----------------------------------------------------
INSERT INTO `workplace`(`number`, `room_id`) VALUES
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


-- -----------------------------------------------------
-- Table `lab3_schema`.`equipment_location`
-- -----------------------------------------------------
INSERT INTO `equipment_location`(`workplace_id`) VALUES
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


-- -----------------------------------------------------
-- Table `lab3_schema`.`initiator`
-- -----------------------------------------------------
INSERT INTO `initiator`(`name`, `surname`) VALUES
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


-- -----------------------------------------------------
-- Table `lab3_schema`.`respondent`
-- -----------------------------------------------------
INSERT INTO `respondent`(`name`, `surname`) VALUES
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


-- -----------------------------------------------------
-- Table `lab3_schema`.`issue`
-- -----------------------------------------------------
INSERT INTO `issue`(`description`, `equipment_location_id`) VALUES
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


-- -----------------------------------------------------
-- Table `lab3_schema`.`application`
-- -----------------------------------------------------
INSERT INTO `application`(`date`, `status`, `issue_id`, `initiator_id`) VALUES
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


-- -----------------------------------------------------
-- Table `lab3_schema`.`application_respondent`
-- -----------------------------------------------------
INSERT INTO `application_respondent`(`application_id`, `respondent_id`) VALUES
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


CREATE INDEX `initiator_surname_name_idx` ON `initiator`(`surname`, `name`);
CREATE INDEX `respondent_surname_name_idx` ON `respondent`(`surname`, `name`);