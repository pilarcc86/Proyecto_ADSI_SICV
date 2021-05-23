CREATE SCHEMA IF NOT EXISTS proyect_sicv DEFAULT CHARACTER SET utf8 ;
USE proyect_sicv ;

CREATE TABLE vendedor (
	id_vendedor INT(11) NOT NULL AUTO_INCREMENT,
	sueldo VARCHAR(50),
	cant_ventas VARCHAR(50),
	fecha_ingreso VARCHAR(25),
	PRIMARY KEY (id_vendedor)
) 	ENGINE = InnoDB;

CREATE TABLE cliente (
	id_cliente INT(11) NOT NULL AUTO_INCREMENT,
	telefono VARCHAR(16),
	direccion VARCHAR(60),
	PRIMARY KEY (id_cliente)
) 	ENGINE = InnoDB;

CREATE TABLE sesion (
	id_usuario INT(11) NOT NULL AUTO_INCREMENT,
	nombre_rol VARCHAR(50),
	password_usuario VARCHAR(50),
	PRIMARY KEY (id_usuario)
)	ENGINE = InnoDB;

CREATE TABLE persona (
	id_persona INT(11) NOT NULL AUTO_INCREMENT,
	id_vendedor INT(11) NOT NULL,
	id_usuario INT(11) NOT NULL,
	id_cliente INT(11) NOT NULL,
	nombre VARCHAR(60),
	apellidos VARCHAR(50),
	genero VARCHAR(25),
	barrio VARCHAR(60),
	PRIMARY KEY (id_persona),
	CONSTRAINT fk_persona_vendedor
	FOREIGN KEY (id_vendedor)
	REFERENCES vendedor (id_vendedor)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_persona_cliente
	FOREIGN KEY (id_cliente)
	REFERENCES cliente (id_cliente)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_persona_sesion
	FOREIGN KEY (id_usuario)
	REFERENCES sesion (id_usuario)
	ON DELETE CASCADE
	ON UPDATE CASCADE
) 	ENGINE = InnoDB;

CREATE TABLE producto (
	id_producto INT(11) NOT NULL AUTO_INCREMENT,
	id_vendedor INT(11) NOT NULL,
	nombre_producto VARCHAR(50),
	precio VARCHAR(50),
	fecha_vencimiento DATE,
	peso_neto VARCHAR(20),
	PRIMARY KEY (id_producto),
	CONSTRAINT fk_producto_vendedor
	FOREIGN KEY (id_vendedor)
	REFERENCES vendedor (id_vendedor)
	ON DELETE CASCADE
	ON UPDATE CASCADE
) 	ENGINE = InnoDB;


CREATE TABLE factura (
	id_factura INT(11) NOT NULL AUTO_INCREMENT,
	id_cliente INT(11) NOT NULL,
	total_pago VARCHAR(30),
	hora VARCHAR(30),
	fecha_expedicion DATE,
	PRIMARY KEY (id_factura),
	CONSTRAINT fk_factura_clente
	FOREIGN KEY (id_cliente)
	REFERENCES cliente (id_cliente)
	ON DELETE CASCADE
	ON UPDATE CASCADE
) 	ENGINE = InnoDB;


CREATE TABLE pedido (
	id_producto INT(11) NOT NULL,
	id_factura INT(11) NOT NULL,
	id_pedido INT(11) NOT NULL AUTO_INCREMENT,
	fecha_pedido DATE,
	cant_productos VARCHAR(50),
	PRIMARY KEY (id_pedido),
	CONSTRAINT fk_pedido_producto
	FOREIGN KEY (id_producto)
	REFERENCES producto (id_producto)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_pedido_factura
	FOREIGN KEY (id_factura)
	REFERENCES factura (id_factura)
	ON DELETE CASCADE
	ON UPDATE CASCADE
) 	ENGINE = InnoDB;


