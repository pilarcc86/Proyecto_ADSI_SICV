
CREATE SCHEMA IF NOT EXISTS proyect_sicv DEFAULT CHARACTER SET utf8 ;
USE proyect_sicv ;


CREATE TABLE persona (
	id_persona INT(11) NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(60),
	apellidos VARCHAR(50),
	genero VARCHAR(25),
	telefono VARCHAR(16),
	direccion VARCHAR(60),
	barrio VARCHAR(60),
	id_vendedor INT(11) NOT NULL,
	CONSTRAINT fk_persona_
	PRIMARY KEY (id_persona)
) 	ENGINE = InnoDB;


CREATE TABLE vendedor (
	id_vendedor INT(11) NOT NULL AUTO_INCREMENT,
	sueldo VARCHAR(50),
	cant_ventas VARCHAR(50),
	fecha_ingreso VARCHAR(25),
	PRIMARY KEY (id_vendedor),
	CONSTRAINT fk_vendedor_persona
	FOREIGN KEY (id_persona)
	REFERENCES persona (id_persona)
	ON DELETE CASCADE
	ON UPDATE CASCADE
) 	ENGINE = InnoDB;


CREATE TABLE cliente (
	id_persona INT(11) NOT NULL,
	id_cliente INT(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (id_cliente),
	CONSTRAINT fk_cliente_persona
	FOREIGN KEY (id_persona)
	REFERENCES persona (id_persona)
	ON DELETE CASCADE
	ON UPDATE CASCADE
) 	ENGINE = InnoDB;


CREATE TABLE factura (
	id_factura INT(11) NOT NULL AUTO_INCREMENT,
	total_pago VARCHAR(30),
	hora VARCHAR(30),
	fecha_expedicion DATE,
	PRIMARY KEY (id_factura)
) 	ENGINE = InnoDB;


CREATE TABLE pedido (
	id_vendedor INT(11) NOT NULL,
	id_cliente INT(11) NOT NULL,
	id_factura INT(11) NOT NULL,
	id_pedido INT(11) NOT NULL AUTO_INCREMENT,
	fecha_pedido DATE,
	cant_productos VARCHAR(50),
	PRIMARY KEY (id_pedido),
	CONSTRAINT fk_pedido_vendedor
	FOREIGN KEY (id_vendedor)
	REFERENCES vendedor (id_vendedor)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_pedido_cliente
	FOREIGN KEY (id_cliente)
	REFERENCES cliente (id_cliente)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_pedido_factura
	FOREIGN KEY (id_factura)
	REFERENCES factura (id_factura)
	ON DELETE CASCADE
	ON UPDATE CASCADE
) 	ENGINE = InnoDB;


CREATE TABLE producto (
	id_producto INT(11) NOT NULL AUTO_INCREMENT,
	nombre_producto VARCHAR(50),
	precio VARCHAR(50),
	fecha_vencimiento DATE,
	peso_neto VARCHAR(20),
	PRIMARY KEY (id_producto)
) 	ENGINE = InnoDB;


CREATE TABLE producto_pedido (
	id_producto INT(11) NOT NULL,
	id_pedido INT(11) NOT NULL,
	CONSTRAINT fk_producto_pedido_producto
	FOREIGN KEY (id_producto)
	REFERENCES producto (id_producto)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_producto_pedido_pedido
	FOREIGN KEY (id_pedido)
	REFERENCES pedido (id_pedido)
	ON DELETE CASCADE
	ON UPDATE CASCADE
) 	ENGINE = InnoDB;

