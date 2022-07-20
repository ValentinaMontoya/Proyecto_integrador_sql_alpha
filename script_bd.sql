-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema proyecto_integrador_sql_alpha
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyecto_integrador_sql_alpha
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto_integrador_sql_alpha` DEFAULT CHARACTER SET utf8mb3 ;
USE `proyecto_integrador_sql_alpha` ;

-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`cities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`cities` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`cities` (
  `id_city` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_city`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`users` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(45) NOT NULL,
  `document_type` VARCHAR(45) NOT NULL,
  `document_number` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `birthday` DATE NOT NULL,
  `picture` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`addresses` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`addresses` (
  `id_address` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `city_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id_address`),
  INDEX `fk_address_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_address_city_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_city`
    FOREIGN KEY (`city_id`)
    REFERENCES `proyecto_integrador_sql_alpha`.`cities` (`id_city`),
  CONSTRAINT `fk_address_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `proyecto_integrador_sql_alpha`.`users` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`careers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`careers` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`careers` (
  `id_career` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `section` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `picture` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_career`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`asignatures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`asignatures` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`asignatures` (
  `id_asignature` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_asignature`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`modalities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`modalities` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`modalities` (
  `id_modality` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_modality`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`modules`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`modules` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`modules` (
  `id_module` INT NOT NULL AUTO_INCREMENT,
  `asignature_id` INT NOT NULL,
  `term` INT NOT NULL,
  `description` VARCHAR(300) NOT NULL,
  `modality_id` INT NOT NULL,
  PRIMARY KEY (`id_module`),
  INDEX `fk_asignature_module_idx` (`asignature_id` ASC) VISIBLE,
  INDEX `fk_modality_module_idx` (`modality_id` ASC) VISIBLE,
  CONSTRAINT `fk_asignature_module`
    FOREIGN KEY (`asignature_id`)
    REFERENCES `proyecto_integrador_sql_alpha`.`asignatures` (`id_asignature`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_modality_module`
    FOREIGN KEY (`modality_id`)
    REFERENCES `proyecto_integrador_sql_alpha`.`modalities` (`id_modality`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`careers_modules`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`careers_modules` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`careers_modules` (
  `id_career_module` INT NOT NULL AUTO_INCREMENT,
  `module_id` INT NOT NULL,
  `career_id` INT NOT NULL,
  PRIMARY KEY (`id_career_module`),
  INDEX `fk_career_module_career_idx` (`career_id` ASC) VISIBLE,
  INDEX `fk_career_module_module_idx` (`module_id` ASC) VISIBLE,
  CONSTRAINT `fk_career_module_career`
    FOREIGN KEY (`career_id`)
    REFERENCES `proyecto_integrador_sql_alpha`.`careers` (`id_career`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_career_module_module`
    FOREIGN KEY (`module_id`)
    REFERENCES `proyecto_integrador_sql_alpha`.`modules` (`id_module`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`journies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`journies` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`journies` (
  `id_journey` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_journey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`group_s`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`group_s` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`group_s` (
  `id_group` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NOT NULL,
  `journey_id` INT NOT NULL,
  `career_id` INT NOT NULL,
  PRIMARY KEY (`id_group`),
  INDEX `fk_group_career_idx` (`career_id` ASC) VISIBLE,
  INDEX `fk_journey_group_s_idx` (`journey_id` ASC) VISIBLE,
  CONSTRAINT `fk_grou_p_career`
    FOREIGN KEY (`career_id`)
    REFERENCES `proyecto_integrador_sql_alpha`.`careers` (`id_career`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_journey_group_s`
    FOREIGN KEY (`journey_id`)
    REFERENCES `proyecto_integrador_sql_alpha`.`journies` (`id_journey`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`news`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`news` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`news` (
  `id_new` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(300) NOT NULL,
  `description` VARCHAR(300) NOT NULL,
  `picture` VARCHAR(300) NOT NULL,
  `date` DATE NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id_new`),
  INDEX `fk_new_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_new_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `proyecto_integrador_sql_alpha`.`users` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`roles` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`roles` (
  `id_role` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_role`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`users_groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`users_groups` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`users_groups` (
  `id_user_group` INT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id_user_group`),
  INDEX `fk_user_group_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_group_group_idx` (`group_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_group_group`
    FOREIGN KEY (`group_id`)
    REFERENCES `proyecto_integrador_sql_alpha`.`group_s` (`id_group`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_group_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `proyecto_integrador_sql_alpha`.`users` (`id_user`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_alpha`.`users_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_integrador_sql_alpha`.`users_roles` ;

CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_alpha`.`users_roles` (
  `id_user_role` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id_user_role`),
  INDEX `fk_user_role_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_role_role_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_role_role`
    FOREIGN KEY (`role_id`)
    REFERENCES `proyecto_integrador_sql_alpha`.`roles` (`id_role`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `proyecto_integrador_sql_alpha`.`users` (`id_user`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
