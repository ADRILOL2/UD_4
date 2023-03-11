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
-- Table `mydb`.`Pasajero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pasajero` (
  `DNI` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Gmail` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Dirección` VARCHAR(45) NOT NULL,
  `Pasaporte` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Avión`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avión` (
  `ID` INT NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Capacidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vuelo` (
  `ID` INT NOT NULL,
  `Numero Vuelo` VARCHAR(45) NOT NULL,
  `Avion` VARCHAR(45) NOT NULL,
  `Origen` VARCHAR(45) NOT NULL,
  `Destino` VARCHAR(45) NOT NULL,
  `Dia_Salida` VARCHAR(45) NOT NULL,
  `Dia_Llegada` VARCHAR(45) NOT NULL,
  `Hora_Salida` VARCHAR(45) NOT NULL,
  `Hora_Llegada` VARCHAR(45) NOT NULL,
  `Avión_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Vuelo_Avión1_idx` (`Avión_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vuelo_Avión1`
    FOREIGN KEY (`Avión_ID`)
    REFERENCES `mydb`.`Avión` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reserva` (
  `ID` INT NOT NULL,
  `Pasajero` VARCHAR(45) NOT NULL,
  `Numero Vuelo` VARCHAR(45) NOT NULL,
  `Dia_Reserva` VARCHAR(45) NOT NULL,
  `Importe Total` VARCHAR(45) NOT NULL,
  `Pasajero_DNI` INT NOT NULL,
  `Vuelo_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Reserva_Pasajero_idx` (`Pasajero_DNI` ASC) VISIBLE,
  INDEX `fk_Reserva_Vuelo1_idx` (`Vuelo_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Pasajero`
    FOREIGN KEY (`Pasajero_DNI`)
    REFERENCES `mydb`.`Pasajero` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Vuelo1`
    FOREIGN KEY (`Vuelo_ID`)
    REFERENCES `mydb`.`Vuelo` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
