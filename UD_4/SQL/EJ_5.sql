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
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `DNI` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Num.Vehiculo` VARCHAR(45) NOT NULL,
  `Población` VARCHAR(45) NOT NULL,
  `Gmail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo de vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo de vehiculo` (
  `ID` INT NOT NULL,
  `Numero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cita` (
  `Matricula_Vehiculo` INT NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `Dia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Matricula_Vehiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vehiculo` (
  `Matricula` INT NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Cliente_DNI` INT NOT NULL,
  `Tipo de vehiculo_ID` INT NOT NULL,
  `Cita_Matricula_Vehiculo` INT NOT NULL,
  PRIMARY KEY (`Matricula`),
  INDEX `fk_Vehiculo_Cliente_idx` (`Cliente_DNI` ASC) VISIBLE,
  INDEX `fk_Vehiculo_Tipo de vehiculo1_idx` (`Tipo de vehiculo_ID` ASC) VISIBLE,
  INDEX `fk_Vehiculo_Cita1_idx` (`Cita_Matricula_Vehiculo` ASC) VISIBLE,
  CONSTRAINT `fk_Vehiculo_Cliente`
    FOREIGN KEY (`Cliente_DNI`)
    REFERENCES `mydb`.`Cliente` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehiculo_Tipo de vehiculo1`
    FOREIGN KEY (`Tipo de vehiculo_ID`)
    REFERENCES `mydb`.`Tipo de vehiculo` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehiculo_Cita1`
    FOREIGN KEY (`Cita_Matricula_Vehiculo`)
    REFERENCES `mydb`.`Cita` (`Matricula_Vehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
