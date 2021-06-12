
CREATE SCHEMA IF NOT EXISTS `MR_SICV` DEFAULT CHARACTER SET utf8 ;
USE `MR_SICV` ;

-- -----------------------------------------------------
-- Table `roles`
-- -----------------------------------------------------


CREATE TABLE roles (
  idroles INT(11) NOT NULL AUTO_INCREMENT,
  nombre_rol VARCHAR(45) NULL,
  PRIMARY KEY (idroles))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `personas`
-- -----------------------------------------------------

CREATE TABLE personas (
  idpersonas INT(11) NOT NULL AUTO_INCREMENT,
  nombres VARCHAR(45) NULL,
  apellidos VARCHAR(45) NULL,
  genero VARCHAR(45) NULL,
  barrio VARCHAR(45) NULL,
  idroles INT(11) NOT NULL,
  PRIMARY KEY (idpersonas),
  CONSTRAINT fk_personas_roles
    FOREIGN KEY (idroles)
    REFERENCES roles (idroles)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sesion_usuario`
-- -----------------------------------------------------

CREATE TABLE sesion_usuario (
  id_usuario INT(11) NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(45) NULL,
  password VARCHAR(45) NULL,
  PRIMARY KEY (id_usuario),
  CONSTRAINT fk_sesion_usuario_personas
    FOREIGN KEY (id_usuario)
    REFERENCES personas (idpersonas)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clientes`
-- -----------------------------------------------------

CREATE TABLE clientes (
  idclientes INT(11) NOT NULL AUTO_INCREMENT,
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
-- Table `vendedores`
-- -----------------------------------------------------

CREATE TABLE vendedores (
  idvendedores INT(11) NOT NULL AUTO_INCREMENT,
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
-- Table `productos`
-- -----------------------------------------------------

CREATE TABLE productos (
  idproductos INT(11) NOT NULL AUTO_INCREMENT,
  idvendedores INT(11) NOT NULL,
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
-- Table `pedidos`
-- -----------------------------------------------------

CREATE TABLE pedidos (
  idpedidos INT(11) NOT NULL AUTO_INCREMENT,
  idclientes INT(11) NOT NULL,
  cantidad_productos VARCHAR(45) NULL,
  fecha DATE NULL,
  PRIMARY KEY (idpedidos),
  CONSTRAINT fk_pedidos_clientes
    FOREIGN KEY (idclientes)
    REFERENCES clientes (idclientes)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `factura`
-- -----------------------------------------------------

CREATE TABLE factura (
  idfactura INT(11) NOT NULL AUTO_INCREMENT,
  idpedidos INT(11) NOT NULL,
  total_pago VARCHAR(45) NULL,
  fecha_expedicion DATE NULL,
  hora VARCHAR(45) NULL,
  PRIMARY KEY (idfactura),
  CONSTRAINT fk_factura_pedidos
    FOREIGN KEY (idpedidos)
    REFERENCES pedidos (idpedidos)
    ON DELETE CASCADE
    ON UPDATE CASCADE
  ) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `pedidos_has_productos`
-- -----------------------------------------------------



CREATE TABLE pedidos_has_productos (
  pedidos_idpedidos INT(11) NOT NULL,
  productos_idproductos INT(11) NOT NULL,
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


