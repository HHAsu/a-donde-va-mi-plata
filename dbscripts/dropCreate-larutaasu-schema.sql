SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `larutaasu` ;
CREATE SCHEMA IF NOT EXISTS `larutaasu` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `larutaasu` ;

-- -----------------------------------------------------
-- Table `larutaasu`.`anhos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `larutaasu`.`anhos` (
  `id_anho` INT NOT NULL AUTO_INCREMENT,
  `value_anho` INT NULL,
  PRIMARY KEY (`id_anho`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `larutaasu`.`entidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `larutaasu`.`entidades` (
  `nivel_id` INT NOT NULL,
  `id_entidad` INT NOT NULL AUTO_INCREMENT,
  `value_entidad` VARCHAR(100) NULL,
  PRIMARY KEY (`id_entidad`, `nivel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `larutaasu`.`objetos_de_gasto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `larutaasu`.`objetos_de_gasto` (
  `id_objeto_de_gasto` INT NOT NULL AUTO_INCREMENT,
  `name_objetos_de_gasto` INT NULL,
  `code_objeto_de_gasto` VARCHAR(100) NULL,
  PRIMARY KEY (`id_objeto_de_gasto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `larutaasu`.`valor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `larutaasu`.`valor` (
  `id_valor` INT NOT NULL AUTO_INCREMENT,
  `value_valor` VARCHAR(45) NULL,
  `anhos_id` INT NOT NULL,
  `objeto_de_gasto_id` INT NOT NULL,
  `entidad_id` INT NOT NULL,
  `nivel_id` INT NOT NULL,
  INDEX `fk_valor_anhos_idx` (`anhos_id` ASC),
  INDEX `fk_valor_objetos_de_gasto1_idx` (`objeto_de_gasto_id` ASC),
  PRIMARY KEY (`id_valor`),
  INDEX `fk_valor_entidades1_idx` (`entidad_id` ASC, `nivel_id` ASC),
  CONSTRAINT `fk_valor_anhos`
    FOREIGN KEY (`anhos_id`)
    REFERENCES `larutaasu`.`anhos` (`id_anho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_valor_objetos_de_gasto1`
    FOREIGN KEY (`objeto_de_gasto_id`)
    REFERENCES `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_valor_entidades1`
    FOREIGN KEY (`entidad_id` , `nivel_id`)
    REFERENCES `larutaasu`.`entidades` (`id_entidad` , `nivel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `larutaasu`.`funciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `larutaasu`.`funciones` (
  `id_funcion` INT NOT NULL AUTO_INCREMENT,
  `name_funcion` VARCHAR(100) NULL,
  PRIMARY KEY (`id_funcion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `larutaasu`.`valor_funcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `larutaasu`.`valor_funcion` (
  `idvalor_funcion` INT NOT NULL AUTO_INCREMENT,
  `value_valor_funcion` VARCHAR(100) NULL,
  `funcion_id` INT NULL,
  `anho_id` INT NULL,
  PRIMARY KEY (`idvalor_funcion`),
  INDEX `fk_valor_funcion_funciones1_idx` (`funcion_id` ASC),
  INDEX `fk_valor_funcion_anhos1_idx` (`anho_id` ASC),
  CONSTRAINT `fk_valor_funcion_funciones1`
    FOREIGN KEY (`funcion_id`)
    REFERENCES `larutaasu`.`funciones` (`id_funcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_valor_funcion_anhos1`
    FOREIGN KEY (`anho_id`)
    REFERENCES `larutaasu`.`anhos` (`id_anho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `larutaasu`.`anhos`
-- -----------------------------------------------------
START TRANSACTION;
USE `larutaasu`;
INSERT INTO `larutaasu`.`anhos` (`id_anho`, `value_anho`) VALUES (1, 2003);
INSERT INTO `larutaasu`.`anhos` (`id_anho`, `value_anho`) VALUES (2, 2004);
INSERT INTO `larutaasu`.`anhos` (`id_anho`, `value_anho`) VALUES (3, 2005);
INSERT INTO `larutaasu`.`anhos` (`id_anho`, `value_anho`) VALUES (4, 2006);
INSERT INTO `larutaasu`.`anhos` (`id_anho`, `value_anho`) VALUES (5, 2007);
INSERT INTO `larutaasu`.`anhos` (`id_anho`, `value_anho`) VALUES (6, 2008);
INSERT INTO `larutaasu`.`anhos` (`id_anho`, `value_anho`) VALUES (7, 2009);
INSERT INTO `larutaasu`.`anhos` (`id_anho`, `value_anho`) VALUES (8, 2010);
INSERT INTO `larutaasu`.`anhos` (`id_anho`, `value_anho`) VALUES (9, 2011);
INSERT INTO `larutaasu`.`anhos` (`id_anho`, `value_anho`) VALUES (10, 2012);

COMMIT;


-- -----------------------------------------------------
-- Data for table `larutaasu`.`entidades`
-- -----------------------------------------------------
START TRANSACTION;
USE `larutaasu`;
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (11, 1, 'CONGRESO NACIONAL');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (11, 2, 'CÁMARA DE SENADORES');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (11, 3, 'CÁMARA DE DIPUTADOS');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (12, 1, 'PRESIDENCIA DE LA REPÚBLICA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (12, 2, 'VICEPRESIDENCIA DE LA REPÚBLICA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (12, 3, 'MINISTERIO DEL INTERIOR');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (12, 4, 'MINISTERIO DE RELACIONES EXTERIORES');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (12, 5, 'MINISTERIO DE DEFENSA NACIONAL');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (12, 6, 'MINISTERIO DE HACIENDA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (12, 7, 'MINISTERIO DE EDUCACIÓN Y CULTURA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (12, 8, 'MINISTERIO DE SALUD PÚBLICA Y BIENESTAR SOCIAL');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (12, 9, 'MINISTERIO DE JUSTICIA Y TRABAJO');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (12, 10, 'MINISTERIO DE AGRICULTURA Y GANADERÍA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (12, 11, 'MINISTERIO DE INDUSTRIA Y COMERCIO');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (12, 13, 'MINISTERIO DE OBRAS PÚBLICAS Y COMUNICACIONES');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (13, 1, 'CORTE SUPREMA DE JUSTICIA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (13, 2, 'JUSTICIA ELECTORAL');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (13, 3, 'MINISTERIO PÚBLICO');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (13, 4, 'CONSEJO DE LA MAGISTRATURA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (13, 5, 'JURADO DE ENJUICIAMIENTO DE MAGISTRADOS');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (13, 6, 'DEFENSORÍA PÚBLICA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (14, 1, 'CONTRALORÍA GENERAL DE LA REPÚBLICA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (15, 1, 'DEFENSORÍA DEL PUEBLO');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (21, 1, 'BANCO CENTRAL DEL PARAGUAY');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 1, 'GOBIERNO DEPARTAMENTAL DE CONCEPCIÓN');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 2, 'GOBIERNO DEPARTAMENTAL DE SAN PEDRO');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 3, 'GOBIERNO DEPARTAMENTAL DE CORDILLERA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 4, 'GOBIERNO DEPARTAMENTAL DE GUAIRÁ');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 5, 'GOBIERNO DEPARTAMENTAL DE CAAGUAZÚ');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 6, 'GOBIERNO DEPARTAMENTAL DE CAAZAPÁ');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 7, 'GOBIERNO DEPARTAMENTAL DE ITAPÚA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 8, 'GOBIERNO DEPARTAMENTAL DE MISIONES');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 9, 'GOBIERNO DEPARTAMENTAL DE PARAGUARÍ');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 10, 'GOBIERNO DEPARTAMENTAL DE ALTO PARANÁ');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 11, 'GOBIERNO DEPARTAMENTAL DE CENTRAL');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 12, 'GOBIERNO DEPARTAMENTAL DE ÑEEMBUCÚ');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 13, 'GOBIERNO DEPARTAMENTAL DE AMAMBAY');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 14, 'GOBIERNO DEPARTAMENTAL DE CANINDEYÚ');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 15, 'GOBIERNO DEPARTAMENTAL DE PRESIDENTE HAYES');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 16, 'GOBIERNO DEPARTAMENTAL DE BOQUERÓN');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (22, 17, 'GOBIERNO DEPARTAMENTAL DE ALTO PARAGUAY');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 1, 'INSTITUTO NACIONAL DE TECNOLOGÍA, NORMALIZACIÓN Y METROLOGIA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 3, 'INSTITUTO NACIONAL DE DESARROLLO RURAL Y DE LA TIERRA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 4, 'DIRECCIÓN DE BENEFICENCIA Y AYUDA SOCIAL');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 6, 'INSTITUTO PARAGUAYO DEL INDÍGENA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 8, 'FONDO NACIONAL DE LA CULTURA Y LAS ARTES');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 9, 'COMISIÓN NACIONAL DE VALORES');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 10, 'COMISIÓN NACIONAL DE TELECOMUNICACIONES');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 11, 'DIRECCIÓN NACIONAL DE TRANSPORTE');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 12, 'SECRETARÍA DE TRANSPORTE ÁREA METROPOLITANA DE ASUNCIÓN');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 13, 'ENTE REGULADOR DE SERVICIOS SANITARIOS');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 14, 'INSTITUTO NACIONAL DE COOPERATIVISMO');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 15, 'DIRECCIÓN NACIONAL DE ADUANAS');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 16, 'SERVICIO NACIONAL DE CALIDAD Y SALUD ANIMAL');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 17, 'INSTITUTO PARAGUAYO DE ARTESANÍA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 18, 'SERVICIO NACIONAL DE CALIDAD Y SANIDAD VEGETAL Y DE SEMILLAS');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 19, 'DIRECCIÓN NACIONAL DE CONTRATACIONES PÚBLICAS');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 20, 'INSTITUTO FORESTAL NACIONAL');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 21, 'SECRETARÍA DEL AMBIENTE');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 22, 'INSTITUTO PARAGUAYO DE TECNOLOGÍA  AGRARIA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 23, 'SECRETARÍA NACIONAL DE LA VIVIENDA Y EL HABITAT');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (23, 24, 'DIRECCIÓN NACIONAL DE CORREOS DEL PARAGUAY');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (24, 1, 'INSTITUTO DE PREVISIÓN SOCIAL');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (24, 2, 'CAJA DE SEGURIDAD SOCIAL DE EMPLEADOS Y OBREROS FERROVIARIOS');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (24, 3, 'CAJA DE JUBILACIONES Y PENSIONES DEL PERSONAL DE LA ANDE');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (24, 4, 'CAJA DE JUBILACIONES Y PENSIONES DE EMPL');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (24, 5, 'CAJA DE JUBILACIONES Y PENSIONES DEL PERSONAL MUNICIPAL');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (25, 2, 'ADMINISTRACIÓN NACIONAL DE ELECTRICIDAD');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (25, 4, 'ADMINISTRACIÓN NACIONAL DE NAVEGACIÓN Y PUERTOS');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (25, 5, 'DIRECCIÓN NACIONAL DE AERONAÚTICA CIVIL');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (25, 6, 'PETRÓLEOS PARAGUAYOS');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (25, 7, 'INDUSTRIA NACIONAL DEL CEMENTO');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (27, 1, 'BANCO NACIONAL DE FOMENTO (BNF)');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (27, 3, 'CRÉDITO AGRÍCOLA DE HABILITACIÓN');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (27, 4, 'FONDO GANADERO');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (27, 5, 'CAJA DE PRÉSTAMOS DEL MINISTERIO DE DEFENSA NACIONAL');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (27, 7, 'AGENCIA FINANCIERA DE DESARROLLO');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (28, 1, 'UNIVERSIDAD NACIONAL DE ASUNCIÓN');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (28, 2, 'UNIVERSIDAD NACIONAL DEL ESTE');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (28, 3, 'UNIVERSIDAD NACIONAL DE PILAR');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (28, 4, 'UNIVERSIDAD NACIONAL DE ITAPÚA');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (28, 5, 'UNIVERSIDAD NACIONAL DE CONCEPCIÓN');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (28, 6, 'UNIVERSIDAD NACIONAL DE VILLARRICA DEL ESPÍRITU SANTO');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (28, 7, 'UNIVERSIDAD NACIONAL DE CAAGUAZÚ');
INSERT INTO `larutaasu`.`entidades` (`nivel_id`, `id_entidad`, `value_entidad`) VALUES (28, 8, 'UNIVERSIDAD NACIONAL DE CANINDEYÚ');

COMMIT;


-- -----------------------------------------------------
-- Data for table `larutaasu`.`objetos_de_gasto`
-- -----------------------------------------------------
START TRANSACTION;
USE `larutaasu`;
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (111, 111, 'SUELDOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (112, 112, 'DIETAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (113, 113, 'GASTOS DE REPRESENTACIÓN');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (114, 114, 'AGUINALDO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (122, 122, 'GASTOS DE RESIDENCIA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (123, 123, 'REMUNERACIÓN EXTRAORDINARIA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (125, 125, 'REMUNERACION ADICIONAL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (131, 131, 'SUBSIDIO FAMILIAR');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (132, 132, 'ESCALAFÓN DOCENTE');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (133, 133, 'BONIFICACIONES Y GRATIFICACIONES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (134, 134, 'APORTE JUBILATORIO DEL EMPLEADOR');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (135, 135, 'BONIFICACIONES POR VENTAS Y COBRANZAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (136, 136, 'BONIFICACIÒN POR EXPOSICIÒN AL PELIGRO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (137, 137, 'GRATIFICACIONES POR SERVICIOS ESPECIALES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (138, 138, 'UNIDAD BÁSICA ALIMENTARIA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (139, 139, 'ESCALAFÓN DIPLOMATICO Y ADMINISTRATIVO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (141, 141, 'CONTRATACIÓN DE PERSONAL TÉCNICO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (142, 142, 'CONTRATACIÓN DE PERSONAL DE SALUD');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (143, 143, 'CONTRATACIÓN OCASIONAL DEL PERSONAL DOCENTE Y DE BLANCO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (144, 144, 'JORNALES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (145, 145, 'HONORARIOS PROFESIONALES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (161, 161, 'SUELDOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (162, 162, 'GASTOS DE REPRESENTACIÓN');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (163, 163, 'AGUINALDO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (191, 191, 'SUBSIDIO PARA LA SALUD');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (192, 192, 'SEGURO DE VIDA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (199, 199, 'OTROS GASTOS DEL PERSONAL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (210, 210, 'SERVICIOS BÁSICOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (220, 220, 'TRANSPORTE Y ALMACENAJE');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (230, 230, 'PASAJES Y VIÁTICOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (240, 240, 'GASTOS POR SERVICIOS DE ASEO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (250, 250, 'ALQUILERES Y DERECHOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (260, 260, 'SERVICIOS TÉCNICOS Y PROFESIONALES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (270, 270, 'SERVICIO  SOCIAL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (280, 280, 'OTROS SERVICIOS EN GENERAL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (290, 290, 'SERVICIOS DE CAPACITACIÓN Y ADIESTRAMIENTO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (310, 310, 'PRODUCTOS ALIMENTICIOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (320, 320, 'TEXTILES  Y  VESTUARIOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (330, 330, 'PRODUCTOS DE PAPEL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (340, 340, 'BIENES DE CONSUMO DE OFICINAS E INSUMOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (350, 350, 'PRODUCTOS E INSTRUM. QUÍMICOS Y MEDICINALES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (360, 360, 'COMBUSTIBLES Y LUBRICANTES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (390, 390, 'OTROS BIENES DE  CONSUMO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (410, 410, 'BIENES E INSUMOS DEL SECTOR AGROPECUARIO Y FORESTAL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (420, 420, 'MINERALES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (430, 430, 'INSUMOS INDUSTRIALES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (440, 440, 'ENERGÍA Y COMBUSTIBLES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (450, 450, 'TIERRAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (490, 490, 'OTRAS MATERIAS PRIMAS Y PRODUCTOS SEMIELABORADOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (510, 510, 'ADQUISICIÓN DE INMUEBLES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (520, 520, 'CONSTRUCCIÓNES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (530, 530, 'ADQUISICIONES DE MAQUINARIAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (540, 540, 'ADQUISICIONES DE EQUIPOS DE OFICINA Y COMPUTACION');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (550, 550, 'ADQUISICIONES DE EQUIPOS MILITARES Y DE SEGURIDAD');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (560, 560, 'ADQUISICIONES DE SEMOVIENTES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (570, 570, 'ADQUISICIÓN DE ACTIVOS INTANGIBLES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (580, 580, 'ESTUDIOS Y  PROYECTOS DE INVERSIÓN');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (590, 590, 'OTROS GASTOS DE INVERSIÓN Y REPARAC. MAYORES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (610, 610, 'ACCIONES Y PARTICIPACIONES DE CAPITAL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (630, 630, 'PRÉSTAMOS AL SECTOR PRIVADO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (640, 640, 'ADQUISICIÓN DE TÍTULOS Y VALORES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (650, 650, 'DEPÓSITOS A PLAZO FIJO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (660, 660, 'PRESTAMOS A INSTITUCIONES FINANCIERAS INTERMEDIARIAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (711, 711, 'INTERESES  DEUDA CON EL SECTOR PÚBLICO FINACIERO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (712, 712, 'INTERESES DEUDA CON SECTOR PÚBLICO NO FINANC.');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (715, 715, 'INTERESES POR DEUDA BONIFICADA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (719, 719, 'INTERESES DEUDA PÚBLICA INTERNA VARIOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (721, 721, 'INTERESES DE LA DEUDA CON ORGANISMO MULTILATERALES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (722, 722, 'INTERESES DE LA DEUDA CON GOBIERNOS EXTRANJEROS Y SUS AGENCIAS FINANCIERAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (723, 723, 'INTERESES  DE LA DEUDA CON ENTES FINANCIEROS PRIVADOS DEL EXTERIOR');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (725, 725, 'INTERESES POR DEUDA EXTERNA BONIFICADA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (731, 731, 'AMORTIZACION DE LA DEUDA CON EL SECTOR PÚBLICO FINACIERO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (732, 732, 'AMORTIZACION  DE LA DEUDA CON EL SECTOR PÚBLICO NO FINANCIERO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (735, 735, 'AMORTIZACION POR DEUDA BONIFICADA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (739, 739, 'AMORTIZACIONES DE LA DEUDA PÚBLICA INTERNA VARIAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (741, 741, 'AMORTIZACION DE LA DEUDA CON ORGANISMOS MULTILATERALES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (742, 742, 'AMORTIZACION DE LA DEUDA CON GOBIERNOS EXTRANJEROS Y SUS AGENCIAS FINANCIERAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (743, 743, 'AMORTIZACION DE LA DEUDA CON ENTES FINANC. PRIVADOS  EXTERIOR');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (745, 745, 'AMORTIZACIÓN POR DEUDA EXTERNA BONIFICADA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (751, 751, 'COMISIÓNES Y OTROS GASTOS DE LA DEUDA INTERNA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (752, 752, 'COMISIÓNES Y OTROS GASTOS DE LA DEUDA EXTERNA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (753, 753, 'COMISIÓNES Y OTROS GASTOS DE LA DEUDA INTERNA BONIFICADA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (761, 761, 'AMORTIZACIONES DE LA DEUDA PÚBLICA EXTERNA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (763, 763, 'INTERESES DE LA DEUDA PÚBLICA EXTERNA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (765, 765, 'COMISIÓNES Y OTROS GASTOS DE LA DEUDA PÚBLICA EXTERNA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (811, 811, 'TRANSFERENCIAS CONSOLIDABLES DE LA ADM. CENTRAL A ENTIDADES DESCENT.');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (812, 812, 'TRANSFERENCIAS CONSOLIDABLES DE ENTIDADES DESCENT. A LA TESORERÍA GENERAL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (813, 813, 'TRANFERENCIAS CONSOLIDABLES POR COPARTICIPACIÓN I V A');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (814, 814, 'TRANSFERENCIAS CONSOLIDABLES POR COPARTICIPACIÓN JUEGOS DE AZAR');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (815, 815, 'TRANSFERENCIAS CONSOLIDABLES POR COPARTICIPACIÓN ROYALTIES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (816, 816, 'TRANSFERENCIAS CONSOLIDABLES ENTRE ENTIDADES DESCENTRALIZADAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (818, 818, 'TRANSFERENCIAS CONSOLIDABLES DE ENTIDADES DESCENT. A LA ADMINIST. CENTRAL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (821, 821, 'JUBILACIONES Y PENSIONES FUNCIONARIOS Y  EMPLEADOS DEL SECTOR PÚBLICO Y PRIVADO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (822, 822, 'PENSIONES Y JUBILACIONES MAGISTRADOS JUDICIALES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (823, 823, 'JUBILACIONES Y PENSIONES MAGISTERIO NACIONAL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (824, 824, 'JUBILACIONES Y PENSIONES DOCENTES UNIVERSITARIOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (825, 825, 'JUBILACIONES Y PENSIONES FUERZAS ARMADAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (826, 826, 'JUBILACIONES Y PENSIONES FUERZAS POLICIALES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (827, 827, 'PENSIONES GRACIABLES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (828, 828, 'PENSIONES VARIAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (829, 829, 'OTRAS TRANSFERENCIAS A JUBILADOS  Y PENSIONADOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (831, 831, 'APORTES A ENTIDADES CON FINES SOCIALES O DE EMERGENCIA NACIONAL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (833, 833, 'TRANSFERENCIAS A MUNICIPALIDADES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (834, 834, 'OTRAS TRANSFERENCIAS AL SECTOR PÚBLICO Y A ORGANISMOS REGIONALES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (838, 838, 'TRANSFERENCIAS POR SUBSIDIO DE TARIFA SOCIAL A LA ANDE');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (839, 839, 'OTRAS TRANSFERENCIAS CORRIENTES AL SECTOR PÚBLICO O PRIVADO VARIAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (841, 841, 'BECAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (842, 842, 'APORTES A ENTIDADES EDUCATIVAS E INSTITUCIONES SIN FINES DE LUCRO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (843, 843, 'APORTES A LOS PARTIDOS POLITICOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (844, 844, 'SUBSIDIOS A LOS PARTIDOS POLITICOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (845, 845, 'INDEMNIZACIONES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (846, 846, 'SUBSIDIOS Y ASISTENCIA SOCIAL A PERSONAS Y FAMILIAS DEL SECTOR PRIVADO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (847, 847, 'APORTES A PROGRAMAS DE EDUCACIÓN PÚBLICA');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (848, 848, 'TRANSF. PARA COMPLEMENTO NUTRICIONAL EN LAS ESCUELAS PÚBLICAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (849, 849, 'OTRAS TRANSFERENCIAS CORRIENTES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (851, 851, 'TRANSFERENCIAS CORRIENTES AL SECTOR EXTERNO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (852, 852, 'TRANSFERENCIAS CORRIENTES A ENTIDADES DEL SECTOR PRIVADO EXTERNO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (853, 853, 'TRANSFERENCIAS CORRIENTES A ORGANISMOS Y AGENCIAS ESPECIALIZADAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (854, 854, 'TRANSFERENCIAS A REPRESENTACIONES DIPLOMÁTICAS Y CONSULARES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (859, 859, 'TRANSFERENCIAS CORRIENTES AL SECTOR EXTERNO VARIAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (861, 861, 'TRANSFERENCIAS CONSOLIDABLES DE LA ADMINIST. CENTRAL A ENT. DESCENT.');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (863, 863, 'TRANSFERENCIAS CONSOLIDABLES POR COPARTICIPACIÓN I V A');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (864, 864, 'TRANSFERENCIAS CONSOLIDABLES POR COPARTICIPACIÓN JUEGOS DE AZAR');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (865, 865, 'TRANSFERENCIAS CONSOLIDABLES POR COPARTICAPACIÓN ROYALTIES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (871, 871, 'TRANSFERENCIAS DE CAPITAL AL SECTOR PRIVADO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (872, 872, 'TRANSFERENCIAS DEL FONDO DE SERVICIOS UNIVERSALES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (873, 873, 'TRANSFERENCIAS DEL PROGRAMA APOYO DE CERTIFICADO AGRONÓMICO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (874, 874, 'APORTES Y SUBSIDIOS A ENT. EDUCATIVAS E INSTITUCIONES PRIVADAS S/ FINES DE LUCRO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (876, 876, 'TRANSFERENCIA AL SECTOR PRIVADO EMPRESARIAL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (877, 877, 'TRANSF. AL FONDO NACIONAL DE LA VIVIENDA SOCIAL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (879, 879, 'TRANSFERENCIAS DE CAPITAL AL SECTOR PRIVADO VARIAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (881, 881, 'TRANSFERENCIAS DE CAPITAL AL SECTOR EXTERNO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (891, 891, 'TRANSFERENCIAS DE CAPITAL AL BANCO CENTRAL DEL PARAGUAY');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (893, 893, 'TRANSFERENCIA A MUNICIPALIDADES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (894, 894, 'OTRAS TRANSFERENCIAS AL SECTOR PÚBLICO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (895, 895, 'OTROS APORTES DE LA TESORERÍA GENERAL');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (897, 897, 'TRANSF. DE CAPITAL AL FONDO DE JUBILAC. Y PENS.P/ MIEMBROS DEL PODER LEGISLATIVO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (898, 898, 'TRANSF. DE CAPITAL DEL B.C.P. AL FONDO DE GARANTÍA DE DESARROLLO');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (910, 910, 'PAGO DE IMPUESTOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (920, 920, 'DEVOLUCIÓN DE IMPUESTOS Y OTROS INGRESOS NO TRIBUTARIOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (930, 930, 'INTERESES DE LAS ENTIDADES FINANCIERAS PÚBLICAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (950, 950, 'RESERVAS TECNICAS Y CAMBIARIAS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (960, 960, 'DEUDAS PENDIENTES DE PAGO DE GASTOS CORRIENTES DE EJERCICIOS ANTERIORES');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (970, 970, 'GASTOS RESERVADOS');
INSERT INTO `larutaasu`.`objetos_de_gasto` (`id_objeto_de_gasto`, `name_objetos_de_gasto`, `code_objeto_de_gasto`) VALUES (980, 980, 'DEUDAS PENDIENTES DE PAGO DE GASTOS DE CAPITAL DE EJERCICIOS ANTERIORES ');

COMMIT;


-- -----------------------------------------------------
-- Data for table `larutaasu`.`funciones`
-- -----------------------------------------------------
START TRANSACTION;
USE `larutaasu`;
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (110, 'LEGISLATIVA');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (120, 'JUDICIAL');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (130, 'CONDUCCION SUPERIOR');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (140, 'ADMINISTRACIÓN FINANCIERA Y CONTROL GUBERNAMENTAL');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (150, 'CONTROL FISCAL');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (160, 'CULTO');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (170, 'APOYO A LOS GOBIERNOS DEPARTAMENTALES Y LOCALES');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (180, 'INVERSIÓN EN ADMINISTRACIÓN GUBERNAMENTAL');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (210, 'SEGURIDAD NACIONAL');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (220, 'SEGURIDAD INTERIOR');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (230, 'RECLUSION Y CORRECCION');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (240, 'INVERSIÓN SECTOR SEGURIDAD');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (290, 'SEGURIDAD SIN DISCRIMINAR');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (310, 'SALUD');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (320, 'PROMOCION Y ACCION SOCIAL');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (330, 'SEGURIDAD SOCIAL');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (340, 'EDUCACION Y CULTURA');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (350, 'CIENCIA, TECNOLOGÍA Y DIFUSIÓN');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (360, 'RELACIONES LABORALES');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (370, 'VIVIENDA, URBANISMO Y SERVICIOS COMUNITARIOS');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (380, 'AGUA POTABLE, ALCANTARILLADO Y OTROS SERVICIOS URBANOS');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (390, 'OTROS SERVICIOS SOCIALES');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (410, 'ENERGIA, COMBUSTIBLES Y MINERIA');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (420, 'COMUNICACIONES');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (430, 'TRANSPORTE');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (440, 'ECOLOGIA Y MEDIO AMBIENTE');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (450, 'AGRICULTURA, GANADERIA, CAZA Y PESCA');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (460, 'INDUSTRIA');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (470, 'COMERCIO, ALMACENAJE Y TURISMO');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (480, 'SEGUROS Y FINANZAS');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (490, 'SERVICIOS ECONOMICOS Y OBRAS PÚBLICAS');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (510, 'SERVICIOS DE LA DEUDA PUBLICA');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (600, 'REGULACION Y CONTROL');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (610, 'REGULACIÓN Y CONTROL DEL SERVICIO DE TELECOMUNICACIONES');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (620, 'REGULACION Y CONTROL  DE SERVICIOS DE TRANSPORTE');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (630, 'REG. Y CONTROL DE SERV. DE AGUA POTAB. Y ALCANTARILLADO');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (640, 'REGULACION Y CONTROL DE SERVICIOS BURSATILES Y COMERCIALES');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (650, 'REGULACIÓN Y CONTROL DE LAS COOPERATIVAS');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (660, 'REGULACIÓN  Y CONTROL DEL SISTEMA  FINANCIERO');
INSERT INTO `larutaasu`.`funciones` (`id_funcion`, `name_funcion`) VALUES (670, 'SERVICIO DE REG. Y CONT DEL SISTEMA NAC. CONTRATAC PÚB');

COMMIT;


-- -----------------------------------------------------
-- Data for table `larutaasu`.`valor_funcion`
-- -----------------------------------------------------
START TRANSACTION;
USE `larutaasu`;
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (1, '112,405,471,146', 110, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (2, '83,459,144,104', 110, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (3, '88,766,755,489', 110, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (4, '106,389,205,427', 110, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (5, '120,147,814,331', 110, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (6, '148,419,516,426', 110, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (7, '179,718,158,302', 110, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (8, '214,957,546,026', 110, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (9, '342,366,770,335', 110, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (10, '302,201,662,438', 110, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (11, '315,423,468,750', 120, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (12, '338,863,511,434', 120, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (13, '508,246,765,801', 120, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (14, '642,257,161,733', 120, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (15, '665,505,126,888', 120, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (16, '826,698,913,565', 120, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (17, '993,212,344,945', 120, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (18, '1,232,799,968,299', 120, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (19, '1,527,010,347,632', 120, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (20, '1,881,838,990,144', 120, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (21, '1,770,427,852,680', 130, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (22, '1,449,492,605,814', 130, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (23, '1,000,776,108,829', 130, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (24, '841,650,458,962', 130, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (25, '877,279,527,833', 130, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (26, '1,346,651,324,732', 130, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (27, '813,951,844,098', 130, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (28, '860,174,960,977', 130, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (29, '1,155,826,017,119', 130, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (30, '5,974,895,995,543', 130, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (31, '92,266,224,854', 140, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (32, '16,223,582,103', 140, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (33, '166,006,870,746', 140, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (34, '270,021,992,298', 140, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (35, '249,909,386,466', 140, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (36, '296,793,595,521', 140, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (37, '567,437,342,079', 140, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (38, '674,489,150,455', 140, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (39, '771,909,010,731', 140, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (40, '699,527,057,571', 140, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (41, '', 150, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (42, '', 150, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (43, '', 150, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (44, '', 150, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (45, '', 150, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (46, '', 150, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (47, '', 150, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (48, '', 150, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (49, '', 150, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (50, '', 150, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (51, '24,569,645,997', 160, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (52, '82,679,730,586', 160, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (53, '', 160, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (54, '', 160, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (55, '', 160, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (56, '', 160, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (57, '', 160, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (58, '', 160, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (59, '', 160, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (60, '', 160, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (61, '409,681,971', 170, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (62, '', 170, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (63, '593,344,465', 170, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (64, '592,230,240', 170, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (65, '592,042,000', 170, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (66, '602,058,632', 170, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (67, '42,781,688', 170, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (68, '1,174,278,555', 170, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (69, '794,153,702', 170, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (70, '1,067,673,954', 170, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (71, '99,198,935,622', 180, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (72, '184,592,644,484', 180, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (73, '245,881,299,008', 180, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (74, '2,502,392,209', 180, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (75, '2,030,076,068', 180, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (76, '', 180, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (77, '4,860,000,000', 180, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (78, '158,794,380', 180, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (79, '0', 180, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (80, '', 180, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (81, '', 210, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (82, '', 210, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (83, '70,251,999,284', 210, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (84, '77,529,208,410', 210, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (85, '25,135,100,781', 210, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (86, '46,488,357,691', 210, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (87, '52,523,363,801', 210, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (88, '43,164,355,814', 210, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (89, '41,624,532,498', 210, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (90, '30,535,116,650', 210, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (91, '295,542,140,529', 220, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (92, '311,094,028,845', 220, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (93, '334,023,222,138', 220, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (94, '423,416,648,006', 220, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (95, '474,129,090,685', 220, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (96, '533,368,526,433', 220, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (97, '612,785,526,546', 220, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (98, '735,396,016,833', 220, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (99, '939,367,075,951', 220, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (100, '1,112,868,472,766', 220, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (101, '386,773,700,330', 230, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (102, '435,093,160,948', 230, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (103, '499,124,948,674', 230, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (104, '575,331,005,094', 230, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (105, '636,733,643,598', 230, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (106, '728,243,053,448', 230, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (107, '959,024,795,343', 230, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (108, '1,153,782,193,018', 230, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (109, '1,283,585,961,883', 230, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (110, '1,608,729,623,658', 230, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (111, '34,182,120,251', 240, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (112, '50,127,578,134', 240, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (113, '39,713,784,371', 240, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (114, '45,120,392,056', 240, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (115, '42,792,116,568', 240, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (116, '57,325,437,895', 240, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (117, '65,477,284,164', 240, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (118, '72,525,727,592', 240, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (119, '83,600,805,124', 240, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (120, '96,600,868,139', 240, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (121, '61,131,390,265', 290, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (122, '44,963,845,514', 290, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (123, '7,432,814,518', 290, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (124, '4,430,456,713', 290, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (125, '11,454,494,507', 290, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (126, '5,683,941,750', 290, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (127, '19,881,503,226', 290, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (128, '18,485,395,920', 290, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (129, '28,483,826,890', 290, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (130, '31,127,887,503', 290, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (131, '', 310, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (132, '38,206,073,203', 310, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (133, '', 310, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (134, '', 310, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (135, '', 310, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (136, '', 310, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (137, '25,743,108,588', 310, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (138, '26,626,191,298', 310, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (139, '29,333,506,056', 310, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (140, '', 310, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (141, '692,016,484,234', 320, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (142, '780,476,687,810', 320, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (143, '1,106,376,868,656', 320, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (144, '1,366,449,398,632', 320, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (145, '1,622,218,688,645', 320, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (146, '1,793,698,277,124', 320, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (147, '2,500,039,096,329', 320, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (148, '2,855,714,632,316', 320, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (149, '3,597,153,378,362', 320, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (150, '4,609,804,413,801', 320, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (151, '1,549,034,592,425', 330, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (152, '1,449,789,327,805', 330, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (153, '85,031,350,900', 330, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (154, '986,111,555,682', 330, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (155, '1,127,900,193,573', 330, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (156, '1,161,238,335,473', 330, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (157, '2,177,152,635,173', 330, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (158, '1,966,668,141,934', 330, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (159, '2,945,087,216,892', 330, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (160, '3,448,814,172,326', 330, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (161, '', 340, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (162, '185,911,215,748', 340, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (163, '2,048,647,620,267', 340, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (164, '2,123,035,020,105', 340, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (165, '2,438,578,125,127', 340, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (166, '2,707,630,231,857', 340, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (167, '3,022,915,910,262', 340, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (168, '3,121,124,282,434', 340, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (169, '3,575,974,530,361', 340, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (170, '4,435,589,532,887', 340, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (171, '1,363,159,511,948', 350, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (172, '1,783,946,769,781', 350, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (173, '2,132,085,730,616', 350, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (174, '2,514,332,504,117', 350, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (175, '2,938,106,642,551', 350, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (176, '3,469,717,754,837', 350, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (177, '3,977,896,306,359', 350, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (178, '4,315,240,250,311', 350, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (179, '5,112,977,873,878', 350, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (180, '6,205,924,077,834', 350, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (181, '9,163,975,274', 360, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (182, '13,655,698,095', 360, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (183, '20,604,008,950', 360, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (184, '23,778,971,426', 360, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (185, '29,032,784,062', 360, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (186, '29,830,550,588', 360, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (187, '40,101,944,523', 360, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (188, '58,455,826,705', 360, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (189, '95,446,726,163', 360, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (190, '131,162,298,813', 360, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (191, '3,453,984,468', 370, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (192, '4,524,376,268', 370, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (193, '4,519,315,730', 370, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (194, '5,045,125,537', 370, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (195, '5,569,694,389', 370, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (196, '7,065,638,835', 370, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (197, '6,449,702,767', 370, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (198, '9,476,806,695', 370, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (199, '15,611,319,515', 370, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (200, '20,416,814,381', 370, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (201, '17,029,539,780', 380, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (202, '22,974,265,073', 380, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (203, '37,497,520,733', 380, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (204, '99,497,774,028', 380, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (205, '135,575,942,244', 380, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (206, '221,542,074,914', 380, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (207, '214,773,441,199', 380, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (208, '251,820,636,267', 380, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (209, '422,991,020,090', 380, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (210, '565,947,385,721', 380, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (211, '', 390, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (212, '', 390, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (213, '', 390, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (214, '', 390, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (215, '', 390, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (216, '', 390, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (217, '', 390, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (218, '0', 390, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (219, '', 390, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (220, '', 390, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (221, '143,138,455,829', 410, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (222, '107,293,108,061', 410, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (223, '74,601,266,984', 410, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (224, '113,932,290,288', 410, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (225, '222,843,337,049', 410, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (226, '104,381,853,466', 410, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (227, '15,589,316,796', 410, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (228, '3,361,145,312', 410, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (229, '0', 410, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (230, '', 410, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (231, '3,075,548,076,366', 420, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (232, '3,975,300,761,182', 420, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (233, '4,507,465,520,320', 420, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (234, '4,631,526,540,906', 420, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (235, '4,686,726,068,255', 420, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (236, '5,692,137,404,821', 420, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (237, '6,490,203,133,169', 420, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (238, '6,312,998,511,600', 420, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (239, '7,157,464,272,035', 420, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (240, '7,551,119,306,393', 420, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (241, '16,411,965,300', 430, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (242, '17,681,356,572', 430, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (243, '19,599,339,023', 430, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (244, '22,974,105,140', 430, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (245, '26,943,393,806', 430, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (246, '29,376,793,045', 430, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (247, '33,501,229,754', 430, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (248, '34,514,186,400', 430, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (249, '41,354,027,432', 430, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (250, '58,448,405,971', 430, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (251, '66,634,125,314', 440, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (252, '37,625,291,810', 440, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (253, '142,197,963,965', 440, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (254, '157,809,912,113', 440, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (255, '148,868,827,887', 440, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (256, '182,946,325,378', 440, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (257, '242,525,694,557', 440, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (258, '253,283,514,683', 440, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (259, '315,522,378,172', 440, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (260, '320,801,458,127', 440, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (261, '14,692,557,299', 450, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (262, '12,151,700', 450, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (263, '10,722,654,028', 450, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (264, '21,151,103,007', 450, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (265, '15,820,033,244', 450, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (266, '22,094,756,283', 450, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (267, '24,087,310,326', 450, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (268, '23,391,962,579', 450, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (269, '31,455,739,777', 450, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (270, '35,173,972,325', 450, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (271, '138,177,754,796', 460, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (272, '247,176,393,949', 460, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (273, '399,785,288,587', 460, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (274, '276,771,631,378', 460, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (275, '369,748,796,369', 460, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (276, '466,836,467,922', 460, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (277, '580,781,568,815', 460, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (278, '766,262,484,615', 460, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (279, '673,618,994,036', 460, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (280, '747,554,321,889', 460, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (281, '136,632,711,679', 470, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (282, '169,406,107,854', 470, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (283, '214,302,220,012', 470, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (284, '247,020,113,686', 470, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (285, '253,164,401,792', 470, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (286, '340,209,168,549', 470, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (287, '432,743,793,262', 470, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (288, '524,489,240,926', 470, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (289, '353,789,735,368', 470, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (290, '483,084,195,930', 470, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (291, '4,762,326,272', 480, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (292, '11,489,780,422', 480, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (293, '25,808,331,239', 480, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (294, '32,490,622,105', 480, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (295, '43,084,058,988', 480, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (296, '50,897,183,440', 480, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (297, '57,667,087,549', 480, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (298, '62,224,392,323', 480, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (299, '78,200,746,468', 480, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (300, '104,784,279,036', 480, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (301, '455,817,017,087', 490, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (302, '558,062,659,547', 490, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (303, '703,566,891,484', 490, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (304, '752,032,701,620', 490, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (305, '1,097,558,209,785', 490, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (306, '1,176,581,592,178', 490, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (307, '1,409,817,763,293', 490, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (308, '1,497,698,544,532', 490, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (309, '1,816,649,847,364', 490, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (310, '6,218,275,955,357', 490, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (311, '933,987,192,648', 510, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (312, '1,001,157,471,283', 510, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (313, '1,202,360,140,246', 510, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (314, '1,092,148,025,137', 510, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (315, '958,846,389,670', 510, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (316, '625,659,684,991', 510, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (317, '1,080,357,574,528', 510, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (318, '1,167,380,603,717', 510, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (319, '1,238,071,101,902', 510, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (320, '1,715,692,307,955', 510, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (321, '1,876,492,230,804', 600, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (322, '1,820,527,003,953', 600, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (323, '2,086,601,537,545', 600, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (324, '1,991,113,893,366', 600, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (325, '1,970,122,015,866', 600, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (326, '1,757,341,156,074', 600, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (327, '2,314,700,337,123', 600, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (328, '2,055,652,957,236', 600, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (329, '1,929,075,254,377', 600, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (330, '1,790,421,082,370', 600, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (331, '', 610, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (332, '29,696,951,496', 610, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (333, '', 610, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (334, '', 610, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (335, '', 610, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (336, '', 610, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (337, '', 610, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (338, '', 610, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (339, '', 610, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (340, '', 610, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (341, '62,407,191,393', 620, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (342, '88,272,255,107', 620, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (343, '65,944,744,722', 620, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (344, '57,343,596,085', 620, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (345, '101,083,752,943', 620, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (346, '82,300,507,027', 620, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (347, '95,677,769,513', 620, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (348, '141,058,357,775', 620, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (349, '140,409,317,031', 620, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (350, '216,165,114,295', 620, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (351, '7,460,300,563', 630, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (352, '7,601,172,857', 630, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (353, '14,836,647,154', 630, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (354, '11,686,050,932', 630, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (355, '12,449,384,253', 630, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (356, '16,061,710,075', 630, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (357, '19,599,647,530', 630, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (358, '19,614,964,880', 630, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (359, '50,424,149,504', 630, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (360, '34,037,742,476', 630, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (361, '2,197,891,863', 640, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (362, '3,141,880,595', 640, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (363, '3,451,820,302', 640, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (364, '3,174,758,774', 640, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (365, '3,577,546,540', 640, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (366, '4,526,472,933', 640, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (367, '4,705,820,406', 640, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (368, '5,676,539,772', 640, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (369, '5,717,959,095', 640, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (370, '5,771,880,452', 640, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (371, '893,168,458', 650, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (372, '943,161,570', 650, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (373, '1,240,527,966', 650, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (374, '1,222,079,525', 650, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (375, '1,374,978,229', 650, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (376, '1,673,023,025', 650, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (377, '1,845,436,541', 650, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (378, '2,108,738,613', 650, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (379, '2,068,366,850', 650, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (380, '2,777,370,094', 650, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (381, '', 660, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (382, '', 660, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (383, '3,914,981,906', 660, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (384, '5,127,789,356', 660, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (385, '5,705,234,273', 660, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (386, '7,252,488,292', 660, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (387, '8,731,201,002', 660, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (388, '10,902,733,230', 660, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (389, '12,352,907,628', 660, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (390, '15,887,711,819', 660, 10);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (391, '', 670, 1);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (392, '', 670, 2);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (393, '', 670, 3);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (394, '', 670, 4);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (395, '51,700,000,000', 670, 5);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (396, '47,800,000,000', 670, 6);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (397, '30,000,000,000', 670, 7);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (398, '30,000,000,000', 670, 8);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (399, '50,000,000,000', 670, 9);
INSERT INTO `larutaasu`.`valor_funcion` (`idvalor_funcion`, `value_valor_funcion`, `funcion_id`, `anho_id`) VALUES (400, '21,000,000,000', 670, 10);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
