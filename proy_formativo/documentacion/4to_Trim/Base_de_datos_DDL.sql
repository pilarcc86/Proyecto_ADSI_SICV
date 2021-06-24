

-- -----------------------------------------------------
-- Schema MR_Proyecto_SICV
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Proyecto_SICV` DEFAULT CHARACTER SET utf8 ;
USE `Proyecto_SICV` ;

-- -----------------------------------------------------
-- Table `Proyecto_SICV`.`roles`
-- -----------------------------------------------------

CREATE TABLE roles (
  idroles INT(11) NOT NULL AUTO_INCREMENT,
  nombre_rol VARCHAR(45) NULL,
  PRIMARY KEY (idroles))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_SICV`.`personas`
-- -----------------------------------------------------

CREATE TABLE personas (
  idpersonas INT NOT NULL AUTO_INCREMENT,
  nombres VARCHAR(45) NULL,
  apellidos VARCHAR(45) NULL,
  genero VARCHAR(45) NULL,
  barrio VARCHAR(45) NULL,
  idroles INT NOT NULL,
  PRIMARY KEY (idpersonas),
  CONSTRAINT fk_personas_roles
    FOREIGN KEY (idroles)
    REFERENCES roles (idroles)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_SICV_`.`sesion_usuario`
-- -----------------------------------------------------

CREATE TABLE sesion_usuario (
  usuario VARCHAR(45) NULL,
  password VARCHAR(45) NULL,
  id_usuario INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id_usuario),
  CONSTRAINT fk_sesion_usuario_personas
    FOREIGN KEY (id_usuario)
    REFERENCES personas (idpersonas)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_SICV`.`clientes`
-- -----------------------------------------------------


CREATE TABLE clientes (
  idclientes INT NOT NULL AUTO_INCREMENT,
  telefono VARCHAR(16) NULL,
  direccion VARCHAR(45) NULL,
  PRIMARY KEY (idclientes),
  CONSTRAINT fk_clientes_personas
    FOREIGN KEY (idclientes)
    REFERENCES personas (idpersonas)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_SICV`.`vendedores`
-- -----------------------------------------------------

CREATE TABLE vendedores (
  idvendedores INT NOT NULL AUTO_INCREMENT,
  sueldo VARCHAR(45) NULL,
  cantidad_ventas VARCHAR(45) NULL,
  PRIMARY KEY (idvendedores),
  CONSTRAINT fk_vendedores_personas
    FOREIGN KEY (idvendedores)
    REFERENCES personas (idpersonas)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_SICV`.`productos`
-- -----------------------------------------------------

CREATE TABLE productos (
  idproductos INT NOT NULL AUTO_INCREMENT,
  idvendedores INT NOT NULL,
  nombre VARCHAR(45) NULL,
  gramos VARCHAR(45) NULL,
  precio VARCHAR(45) NULL,
  PRIMARY KEY (idproductos),
  CONSTRAINT fk_productos_vendedores
    FOREIGN KEY (idvendedores)
    REFERENCES vendedores (idvendedores)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_SICV`.`pedidos`
-- -----------------------------------------------------

CREATE TABLE pedidos (
  idpedidos INT NOT NULL AUTO_INCREMENT,
  idclientes INT NOT NULL,
  cantidad_productos VARCHAR(45) NULL,
  PRIMARY KEY (idpedidos),
  CONSTRAINT fk_pedidos_clientes
    FOREIGN KEY (idclientes)
    REFERENCES clientes (idclientes)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_SICV`.`factura`
-- -----------------------------------------------------

CREATE TABLE factura (
  idfactura INT NOT NULL AUTO_INCREMENT,
  idpedidos INT NOT NULL,
  total_pago VARCHAR(45) NULL,
  hora TIME NULL,
  fecha_expedicion DATE NULL,
  PRIMARY KEY (idfactura),
  CONSTRAINT fk_factura_pedidos
    FOREIGN KEY (idpedidos)
    REFERENCES pedidos (idpedidos)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_SICV`.`pedidos_has_productos`
-- -----------------------------------------------------

CREATE TABLE pedidos_has_productos (
  pedidos_idpedidos INT NOT NULL,
  productos_idproductos INT NOT NULL,
  CONSTRAINT fk_pedidos_has_productos_pedidos
    FOREIGN KEY (pedidos_idpedidos)
    REFERENCES pedidos (idpedidos)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_pedidos_has_productos_productos
    FOREIGN KEY (productos_idproductos)
    REFERENCES productos (idproductos)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


