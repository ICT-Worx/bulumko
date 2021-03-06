-- MySQL Script generated by MySQL Workbench
-- 03/14/16 11:47:54
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema isodb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema isodb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `isodb` DEFAULT CHARACTER SET ascii ;
USE `isodb` ;

-- -----------------------------------------------------
-- Table `isodb`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`address` (
  `Address_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Address_street_number` VARCHAR(10) NOT NULL,
  `Address_street_name` VARCHAR(20) NOT NULL,
  `Address_surbarb` VARCHAR(30) NOT NULL,
  `Address_city` VARCHAR(30) NOT NULL,
  `Address_province` VARCHAR(45) NOT NULL,
  `Address_country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Address_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`answer` (
  `Answer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Answer_doc` BLOB NOT NULL,
  `Question_Question_id` INT(11) NOT NULL,
  `Answer_Date_Last_Modified` DATE NOT NULL,
  `Author_Author_id` INT(11) NOT NULL,
  PRIMARY KEY (`Answer_id`),
  INDEX `Question_Question_id` (`Question_Question_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`contactdetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`contactdetail` (
  `ContactDetail_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ContactDetail_cell_number` VARCHAR(13) NOT NULL,
  `ContactDetail_email_address` VARCHAR(25) NOT NULL,
  `ContactDetail_alternative_mail` VARCHAR(25) NULL DEFAULT NULL,
  `ContactDetail_alternative_cell number` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ContactDetail_id`),
  UNIQUE INDEX `ContactDetails_id_UNIQUE` (`ContactDetail_id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`auditor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`auditor` (
  `Auditor_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Address_Address_id` INT(11) NOT NULL,
  `ContactDetail_ContactDetail_id` INT(11) NOT NULL,
  PRIMARY KEY (`Auditor_id`),
  UNIQUE INDEX `Auditor_id_UNIQUE` (`Auditor_id` ASC),
  INDEX `fk_Auditor_Address1_idx` (`Address_Address_id` ASC),
  INDEX `fk_Auditor_ContactDetail1_idx` (`ContactDetail_ContactDetail_id` ASC),
  INDEX `Address_Address_id` (`Address_Address_id` ASC),
  INDEX `ContactDetail_ContactDetail_id` (`ContactDetail_ContactDetail_id` ASC),
  CONSTRAINT `fk_Auditor_Address1`
    FOREIGN KEY (`Address_Address_id`)
    REFERENCES `isodb`.`address` (`Address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Auditor_ContactDetail1`
    FOREIGN KEY (`ContactDetail_ContactDetail_id`)
    REFERENCES `isodb`.`contactdetail` (`ContactDetail_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`audits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`audits` (
  `Audits_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Auditor_Auditor_id` INT(11) NOT NULL,
  PRIMARY KEY (`Audits_id`),
  UNIQUE INDEX `Audits_id_UNIQUE` (`Audits_id` ASC),
  INDEX `fk_Audits_Auditor1_idx` (`Auditor_Auditor_id` ASC),
  INDEX `Auditor_Auditor_id` (`Auditor_Auditor_id` ASC),
  CONSTRAINT `fk_Audits_Auditor1`
    FOREIGN KEY (`Auditor_Auditor_id`)
    REFERENCES `isodb`.`auditor` (`Auditor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`author` (
  `Author_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ContactDetail_ContactDetail_id` INT(11) NOT NULL,
  `Address_Address_id` INT(11) NOT NULL,
  `Information_Information_id` INT(11) NOT NULL,
  PRIMARY KEY (`Author_id`),
  UNIQUE INDEX `Author_id_UNIQUE` (`Author_id` ASC),
  INDEX `fk_Author_ContactDetail1_idx` (`ContactDetail_ContactDetail_id` ASC),
  INDEX `fk_Author_Address1_idx` (`Address_Address_id` ASC),
  INDEX `ContactDetail_ContactDetail_id` (`ContactDetail_ContactDetail_id` ASC),
  INDEX `Address_Address_id` (`Address_Address_id` ASC),
  INDEX `Information_Information_id` (`Information_Information_id` ASC),
  CONSTRAINT `fk_Author_Address1`
    FOREIGN KEY (`Address_Address_id`)
    REFERENCES `isodb`.`address` (`Address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Author_ContactDetail1`
    FOREIGN KEY (`ContactDetail_ContactDetail_id`)
    REFERENCES `isodb`.`contactdetail` (`ContactDetail_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`iso_standard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`iso_standard` (
  `ISO_Standard_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ISO_Standard_name` VARCHAR(50) NOT NULL,
  `ISO_Standard_link` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ISO_Standard_id`),
  UNIQUE INDEX `ISO_Standard_id_UNIQUE` (`ISO_Standard_id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`record` (
  `Record_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Record_description` VARCHAR(350) NULL DEFAULT NULL,
  `Record_documents` BLOB NULL DEFAULT NULL,
  `Record_archived_period` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Record_id`),
  UNIQUE INDEX `Records_id_UNIQUE` (`Record_id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`processdata`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`processdata` (
  `ProcessData_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ProcessData_description` VARCHAR(350) NULL DEFAULT NULL,
  `ProcessData_review_frequency` VARCHAR(45) NULL DEFAULT NULL,
  `ProcessData_archive_period` VARCHAR(45) NULL DEFAULT NULL,
  `ProcessData_auth` INT(45) NULL DEFAULT NULL,
  `ProcessData_document` BLOB NULL DEFAULT NULL,
  `Record_Record_id` INT(11) NOT NULL,
  PRIMARY KEY (`ProcessData_id`),
  UNIQUE INDEX `ProcessData_id_UNIQUE` (`ProcessData_id` ASC),
  INDEX `fk_ProcessData_Record1_idx` (`Record_Record_id` ASC),
  INDEX `ProcessData_auth` (`ProcessData_auth` ASC),
  INDEX `Record_Record_id` (`Record_Record_id` ASC),
  CONSTRAINT `fk_ProcessData_Record1`
    FOREIGN KEY (`Record_Record_id`)
    REFERENCES `isodb`.`record` (`Record_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`process`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`process` (
  `Process_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ProcessData_ProcessData_id` INT(11) NOT NULL,
  `ISO_Standard_ISO_Standard_id` INT(11) NOT NULL,
  `ProcessRisk_ProcessRisk_id` INT(11) NOT NULL,
  `Process_type` VARCHAR(30) NOT NULL,
  `Period_Period_id` INT(11) NOT NULL,
  PRIMARY KEY (`Process_id`),
  UNIQUE INDEX `Process_id_UNIQUE` (`Process_id` ASC),
  INDEX `fk_Process_ProcessData1_idx` (`ProcessData_ProcessData_id` ASC),
  INDEX `fk_Process_ISO_Standard1_idx` (`ISO_Standard_ISO_Standard_id` ASC),
  INDEX `fk_Process_ProcessRisk1_idx` (`ProcessRisk_ProcessRisk_id` ASC),
  INDEX `ProcessData_ProcessData_id` (`ProcessData_ProcessData_id` ASC),
  INDEX `ISO_Standard_ISO_Standard_id` (`ISO_Standard_ISO_Standard_id` ASC),
  INDEX `ProcessRisk_ProcessRisk_id` (`ProcessRisk_ProcessRisk_id` ASC),
  INDEX `Period_Period_id` (`Period_Period_id` ASC),
  CONSTRAINT `fk_Process_ISO_Standard1`
    FOREIGN KEY (`ISO_Standard_ISO_Standard_id`)
    REFERENCES `isodb`.`iso_standard` (`ISO_Standard_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Process_ProcessData1`
    FOREIGN KEY (`ProcessData_ProcessData_id`)
    REFERENCES `isodb`.`processdata` (`ProcessData_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`measurable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`measurable` (
  `Measurable_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Measurable_decription` VARCHAR(45) NOT NULL,
  `Measurable_type` VARCHAR(50) NOT NULL,
  `Measurable_owner` INT(11) NULL DEFAULT NULL,
  `Measurable_documents` BLOB NULL DEFAULT NULL,
  `Process_Process_id` INT(11) NOT NULL,
  PRIMARY KEY (`Measurable_id`),
  UNIQUE INDEX `Measurable_id_UNIQUE` (`Measurable_id` ASC),
  INDEX `fk_Measurable_Process1_idx` (`Process_Process_id` ASC),
  INDEX `Process_Process_id` (`Process_Process_id` ASC),
  CONSTRAINT `fk_Measurable_Process1`
    FOREIGN KEY (`Process_Process_id`)
    REFERENCES `isodb`.`process` (`Process_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`customer` (
  `Customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Address_Address_id` INT(11) NOT NULL,
  `Measurable_Measurable_id` INT(11) NOT NULL,
  PRIMARY KEY (`Customer_id`),
  UNIQUE INDEX `Customer_id_UNIQUE` (`Customer_id` ASC),
  INDEX `fk_Customer_Address1_idx` (`Address_Address_id` ASC),
  INDEX `fk_Customer_Measurable1_idx` (`Measurable_Measurable_id` ASC),
  INDEX `Address_Address_id` (`Address_Address_id` ASC),
  INDEX `Measurable_Measurable_id` (`Measurable_Measurable_id` ASC),
  CONSTRAINT `fk_Customer_Address1`
    FOREIGN KEY (`Address_Address_id`)
    REFERENCES `isodb`.`address` (`Address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_Measurable1`
    FOREIGN KEY (`Measurable_Measurable_id`)
    REFERENCES `isodb`.`measurable` (`Measurable_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`department` (
  `Department_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Department_name` INT(11) NOT NULL,
  `Department_manager_id` INT(11) NOT NULL,
  PRIMARY KEY (`Department_id`),
  UNIQUE INDEX `Department_id_UNIQUE` (`Department_id` ASC),
  INDEX `Department_manager_id` (`Department_manager_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`job` (
  `Job_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Job_title` VARCHAR(35) NOT NULL,
  `Job_descr` VARCHAR(50) NOT NULL,
  `Department_Department_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Job_id`),
  UNIQUE INDEX `Job_id_UNIQUE` (`Job_id` ASC),
  INDEX `fk_Job_Department1_idx` (`Department_Department_id` ASC),
  INDEX `Department_Department_id` (`Department_Department_id` ASC),
  CONSTRAINT `fk_Job_Department1`
    FOREIGN KEY (`Department_Department_id`)
    REFERENCES `isodb`.`department` (`Department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`employee` (
  `Employee_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Employee_contract` BLOB NOT NULL,
  `Employee_documents` BLOB NOT NULL,
  `Address_Address_id` INT(11) NOT NULL,
  `ContactDetail_ContactDetail_id` INT(11) NOT NULL,
  `Job_Job_id` INT(11) NOT NULL,
  `Information_Information_id` INT(11) NOT NULL,
  PRIMARY KEY (`Employee_id`),
  UNIQUE INDEX `Employee_id_UNIQUE` (`Employee_id` ASC),
  INDEX `fk_Employee_Address_idx` (`Address_Address_id` ASC),
  INDEX `fk_Employee_ContactDetail1_idx` (`ContactDetail_ContactDetail_id` ASC),
  INDEX `fk_Employee_Job1_idx` (`Job_Job_id` ASC),
  INDEX `Address_Address_id` (`Address_Address_id` ASC),
  INDEX `ContactDetail_ContactDetail_id` (`ContactDetail_ContactDetail_id` ASC),
  INDEX `Job_Job_id` (`Job_Job_id` ASC),
  INDEX `Information_Information_id` (`Information_Information_id` ASC),
  CONSTRAINT `fk_Employee_Address`
    FOREIGN KEY (`Address_Address_id`)
    REFERENCES `isodb`.`address` (`Address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_ContactDetail1`
    FOREIGN KEY (`ContactDetail_ContactDetail_id`)
    REFERENCES `isodb`.`contactdetail` (`ContactDetail_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Job1`
    FOREIGN KEY (`Job_Job_id`)
    REFERENCES `isodb`.`job` (`Job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`goal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`goal` (
  `Goal_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Department_Department_id` INT(11) NOT NULL,
  `Process_Process_id` INT(11) NOT NULL,
  PRIMARY KEY (`Goal_id`),
  UNIQUE INDEX `Goal_id_UNIQUE` (`Goal_id` ASC),
  INDEX `fk_Goal_Department1_idx` (`Department_Department_id` ASC),
  INDEX `fk_Goal_Process1_idx` (`Process_Process_id` ASC),
  INDEX `Department_Department_id` (`Department_Department_id` ASC),
  INDEX `Process_Process_id` (`Process_Process_id` ASC),
  CONSTRAINT `fk_Goal_Department1`
    FOREIGN KEY (`Department_Department_id`)
    REFERENCES `isodb`.`department` (`Department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Goal_Process1`
    FOREIGN KEY (`Process_Process_id`)
    REFERENCES `isodb`.`process` (`Process_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`information` (
  `Information_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Information_name` VARCHAR(30) NOT NULL,
  `Information_surname` VARCHAR(30) NOT NULL,
  `Information_id_number` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`Information_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`instruction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`instruction` (
  `Instruction_id` INT(11) NOT NULL,
  `Instruction_old_number` VARCHAR(45) NULL DEFAULT NULL,
  `Instruction_description` VARCHAR(45) NULL DEFAULT NULL,
  `Instruction_archived_period` VARCHAR(45) NULL DEFAULT NULL,
  `Author_Author_id` INT(11) NOT NULL,
  `process_Process_id` INT(11) NOT NULL,
  PRIMARY KEY (`Instruction_id`),
  UNIQUE INDEX `Instruction_id_UNIQUE` (`Instruction_id` ASC),
  INDEX `fk_Instruction_Author1_idx` (`Author_Author_id` ASC),
  INDEX `Author_Author_id` (`Author_Author_id` ASC),
  INDEX `fk_instruction_process1_idx` (`process_Process_id` ASC),
  CONSTRAINT `fk_Instruction_Author1`
    FOREIGN KEY (`Author_Author_id`)
    REFERENCES `isodb`.`author` (`Author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instruction_process1`
    FOREIGN KEY (`process_Process_id`)
    REFERENCES `isodb`.`process` (`Process_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`manager` (
  `Manager_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Employee_Employee_id` INT(11) NOT NULL,
  PRIMARY KEY (`Manager_id`),
  UNIQUE INDEX `Manager_id_UNIQUE` (`Manager_id` ASC),
  INDEX `fk_Manager_Employee1_idx` (`Employee_Employee_id` ASC),
  INDEX `Employee_Employee_id` (`Employee_Employee_id` ASC),
  CONSTRAINT `fk_Manager_Employee1`
    FOREIGN KEY (`Employee_Employee_id`)
    REFERENCES `isodb`.`employee` (`Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`period`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`period` (
  `Period_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Period_start_date` DATE NOT NULL,
  `Period_end_date` DATE NOT NULL,
  `Period_completion_percent` DOUBLE NOT NULL,
  PRIMARY KEY (`Period_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`processrisk`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`processrisk` (
  `ProcessRisk_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ProcessRisk_description` VARCHAR(50) NOT NULL,
  `ProcessRisk_type` VARCHAR(45) NOT NULL,
  `ProcessRisk_response` VARCHAR(50) NOT NULL,
  `ProcessRisk_due_date` DATE NULL DEFAULT NULL,
  `ProcessRisk_closed_date` DATE NULL DEFAULT NULL,
  `ProcessRisk_current_controls` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`ProcessRisk_id`),
  UNIQUE INDEX `ProcessRisk_id_UNIQUE` (`ProcessRisk_id` ASC),
  CONSTRAINT `processrisk_ibfk_1`
    FOREIGN KEY (`ProcessRisk_id`)
    REFERENCES `isodb`.`process` (`ProcessRisk_ProcessRisk_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`product` (
  `Product_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Customer_Customer_id` INT(11) NOT NULL,
  `Product_name` VARCHAR(45) NOT NULL,
  `Product_price` DOUBLE NOT NULL,
  PRIMARY KEY (`Product_id`),
  UNIQUE INDEX `Product_id_UNIQUE` (`Product_id` ASC),
  INDEX `fk_Product_Customer1_idx` (`Customer_Customer_id` ASC),
  INDEX `Customer_Customer_id` (`Customer_Customer_id` ASC),
  CONSTRAINT `fk_Product_Customer1`
    FOREIGN KEY (`Customer_Customer_id`)
    REFERENCES `isodb`.`customer` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`question` (
  `Question_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Question_data` VARCHAR(100) NOT NULL,
  `Tab_Tab_id` INT(11) NOT NULL,
  PRIMARY KEY (`Question_id`),
  INDEX `Tab_Tab_id` (`Tab_Tab_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`supplier` (
  `Supplier_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Audits_Audits_id` INT(11) NOT NULL,
  PRIMARY KEY (`Supplier_id`),
  UNIQUE INDEX `Supplier_id_UNIQUE` (`Supplier_id` ASC),
  INDEX `fk_Supplier_Audits1_idx` (`Audits_Audits_id` ASC),
  INDEX `Audits_Audits_id` (`Audits_Audits_id` ASC),
  CONSTRAINT `fk_Supplier_Audits1`
    FOREIGN KEY (`Audits_Audits_id`)
    REFERENCES `isodb`.`audits` (`Audits_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`tab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`tab` (
  `Tab_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Tab_Title` VARCHAR(50) NOT NULL,
  `ISO_Standard_ISO_Standard_id` INT(11) NOT NULL,
  PRIMARY KEY (`Tab_id`),
  INDEX `ISO_Standard_ISO_Standard_id` (`ISO_Standard_ISO_Standard_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `isodb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `isodb`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` DATE NULL DEFAULT NULL,
  `Employee_Employee_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `Employee_Employee_id` (`Employee_Employee_id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
