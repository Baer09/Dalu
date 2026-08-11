CREATE SEQUENCE sec_productos
MINVALUE 1
INCREMENT BY 1; 

CREATE TABLE marca(
	id_marca SEQUENCE NOT NULL PRIMARY KEY,
	siglas VARCHAR(10) UNIQUE,
	nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE categorias(
	id_categoria SEQUENCE NOT NULL PRIMARY KEY,
	nombre VARCHAR(100),
	descripcion VARCHAR(400),
	edad_min_meses INT NOT NULL CHECK(edad_min_meses >=0),
	edad_max_meses INT NOT NULL CHECK(edad_max_meses >= edad_min_meses)
);

CREATE TABLE productos (
	id_producto INT DEFAULT NEXTVAL('sec_productos') NOT NULL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	descripcion VARCHAR(400),
	lavable BOOLEAN,
	fecha_creacion DATE NOT NULL,
	stock INT NOT NULL CHECK (tock >= 0),
	precio_costo NUMERIC (12,4) NOT NULL CHECK (precio_costo > 0),
	precio_venta NUMERIC (12,4) NOT NULL CHECK (precio_venta > precio_costo),
	usa_baterias BOOLEAN NOT NULL,
	id_categoria INT NOT NULL REFERENCES categorias(id_categoria) ON DELETE RESTRICT,
	id_marca INT NOT NULL REFERENCES marca(id_marca) ON DELETE RESTRICT
);

