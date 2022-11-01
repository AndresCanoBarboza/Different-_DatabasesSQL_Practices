-- MySQL Workbench Forward Engineering

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
-- Table `mydb`.`Programa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Programa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Programa` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Duracion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hemisora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Hemisora` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Hemisora` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Modalidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Modalidad` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Modalidad` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `TipoM` VARCHAR(45) NOT NULL,
  `Venta_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Modalidad_Venta1_idx` (`Venta_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Modalidad_Venta1`
    FOREIGN KEY (`Venta_ID`)
    REFERENCES `mydb`.`Venta` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Venta` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Venta` (
  `ID` INT NOT NULL,
  `Costo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Modalidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Modalidad` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Modalidad` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `TipoM` VARCHAR(45) NOT NULL,
  `Venta_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Modalidad_Venta1_idx` (`Venta_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Modalidad_Venta1`
    FOREIGN KEY (`Venta_ID`)
    REFERENCES `mydb`.`Venta` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FranjaHoraria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FranjaHoraria` ;

CREATE TABLE IF NOT EXISTS `mydb`.`FranjaHoraria` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(255) NOT NULL,
  `TipoF` VARCHAR(45) NOT NULL,
  `Venta_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_FranjaHoraria_Venta1_idx` (`Venta_ID` ASC) VISIBLE,
  CONSTRAINT `fk_FranjaHoraria_Venta1`
    FOREIGN KEY (`Venta_ID`)
    REFERENCES `mydb`.`Venta` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CortesComerciales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CortesComerciales` ;

CREATE TABLE IF NOT EXISTS `mydb`.`CortesComerciales` (
  `ID` INT NOT NULL,
  `Duracion` VARCHAR(45) NOT NULL,
  `CantidadComer` VARCHAR(45) NOT NULL,
  `Programa_ID` INT NOT NULL,
  `FranjaHoraria_ID` INT NOT NULL,
  `Modalidad_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_CortesComerciales_Programa_idx` (`Programa_ID` ASC) VISIBLE,
  INDEX `fk_CortesComerciales_FranjaHoraria1_idx` (`FranjaHoraria_ID` ASC) VISIBLE,
  INDEX `fk_CortesComerciales_Modalidad1_idx` (`Modalidad_ID` ASC) VISIBLE,
  CONSTRAINT `fk_CortesComerciales_Programa`
    FOREIGN KEY (`Programa_ID`)
    REFERENCES `mydb`.`Programa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CortesComerciales_FranjaHoraria1`
    FOREIGN KEY (`FranjaHoraria_ID`)
    REFERENCES `mydb`.`FranjaHoraria` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CortesComerciales_Modalidad1`
    FOREIGN KEY (`Modalidad_ID`)
    REFERENCES `mydb`.`Modalidad` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hemisora_has_CortesComerciales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Hemisora_has_CortesComerciales` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Hemisora_has_CortesComerciales` (
  `Hemisora_ID` INT NOT NULL,
  `CortesComerciales_ID` INT NOT NULL,
  INDEX `fk_Hemisora_has_CortesComerciales_Hemisora1_idx` (`Hemisora_ID` ASC) VISIBLE,
  INDEX `fk_Hemisora_has_CortesComerciales_CortesComerciales1_idx` (`CortesComerciales_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Hemisora_has_CortesComerciales_Hemisora1`
    FOREIGN KEY (`Hemisora_ID`)
    REFERENCES `mydb`.`Hemisora` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hemisora_has_CortesComerciales_CortesComerciales1`
    FOREIGN KEY (`CortesComerciales_ID`)
    REFERENCES `mydb`.`CortesComerciales` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
