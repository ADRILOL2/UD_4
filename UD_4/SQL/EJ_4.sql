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
  `Apellido` VARCHAR(45) NOT NULL,
  `Dirección` VARCHAR(45) NOT NULL,
  `Mobil` VARCHAR(45) NOT NULL,
  `VIP` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor` (
  `DNI_Cliente` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Mobil` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI_Cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo de Poliza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo de Poliza` (
  `ID` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Poliza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Poliza` (
  `NºPoliza` INT NOT NULL,
  `Datos_inicio` VARCHAR(45) NOT NULL,
  `Datos_Final` VARCHAR(45) NOT NULL,
  `Pago` VARCHAR(45) NOT NULL,
  `Cliente_DNI` INT NOT NULL,
  `Vendedor_DNI_Cliente` INT NOT NULL,
  `Tipo de Poliza_ID` INT NOT NULL,
  PRIMARY KEY (`NºPoliza`),
  INDEX `fk_Poliza_Cliente_idx` (`Cliente_DNI` ASC) VISIBLE,
  INDEX `fk_Poliza_Vendedor1_idx` (`Vendedor_DNI_Cliente` ASC) VISIBLE,
  INDEX `fk_Poliza_Tipo de Poliza1_idx` (`Tipo de Poliza_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Poliza_Cliente`
    FOREIGN KEY (`Cliente_DNI`)
    REFERENCES `mydb`.`Cliente` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Vendedor1`
    FOREIGN KEY (`Vendedor_DNI_Cliente`)
    REFERENCES `mydb`.`Vendedor` (`DNI_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Tipo de Poliza1`
    FOREIGN KEY (`Tipo de Poliza_ID`)
    REFERENCES `mydb`.`Tipo de Poliza` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
