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
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `DNI` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Dirección` VARCHAR(45) NOT NULL,
  `Dia_nacimiento` VARCHAR(45) NOT NULL,
  `Edad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tiket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tiket` (
  `ID` INT NOT NULL,
  `Numero_Factura` VARCHAR(45) NOT NULL,
  `Empleado` VARCHAR(45) NOT NULL,
  `Dia` VARCHAR(45) NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `IVA` VARCHAR(45) NOT NULL,
  `Empleado_DNI` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Tiket_Empleado_idx` (`Empleado_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Tiket_Empleado`
    FOREIGN KEY (`Empleado_DNI`)
    REFERENCES `mydb`.`Empleado` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lineas_tikets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lineas_tikets` (
  `ID` INT NOT NULL,
  `Codigo_producto` VARCHAR(45) NOT NULL,
  `Descripción_producto` VARCHAR(45) NOT NULL,
  `unidad` VARCHAR(45) NOT NULL,
  `Descuento` VARCHAR(45) NOT NULL,
  `Precio_unidad(IVA)` VARCHAR(45) NOT NULL,
  `Precio_total(IVA)` VARCHAR(45) NOT NULL,
  `Tiket_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Lineas_tikets_Tiket1_idx` (`Tiket_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Lineas_tikets_Tiket1`
    FOREIGN KEY (`Tiket_ID`)
    REFERENCES `mydb`.`Tiket` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producto` (
  `Codigo_interno` INT NOT NULL,
  `Descripción` VARCHAR(45) NOT NULL,
  `Codigo_barras` VARCHAR(45) NOT NULL,
  `Precio_Unidad` VARCHAR(45) NOT NULL,
  `IVA` VARCHAR(45) NOT NULL,
  `Preció_Venta_Publico(IVA)` VARCHAR(45) NOT NULL,
  `Lineas_tikets_ID` INT NOT NULL,
  PRIMARY KEY (`Codigo_interno`),
  INDEX `fk_Producto_Lineas_tikets1_idx` (`Lineas_tikets_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Lineas_tikets1`
    FOREIGN KEY (`Lineas_tikets_ID`)
    REFERENCES `mydb`.`Lineas_tikets` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '\n';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
