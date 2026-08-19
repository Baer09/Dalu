
ALTER SEQUENCE sec_productos OWNED BY  productos.id_producto;
ALTER SEQUENCE sec_categorias OWNED BY categorias.id_categoria;
ALTER SEQUENCE sec_marca OWNED BY marca.id_marca;


CREATE SEQUENCE sec_productos 
MINVALUE 1
INCREMENT BY 1; 

CREATE SEQUENCE sec_categorias
MINVALUE 1
INCREMENT BY 1;

CREATE SEQUENCE sec_marca
MINVALUE 1
INCREMENT BY 1;

CREATE TABLE marca(
	id_marca INT DEFAULT NEXTVAL('sec_marca') NOT NULL PRIMARY KEY,
	siglas VARCHAR(10) UNIQUE,
	nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE categorias(
	id_categoria INT DEFAULT NEXTVAL('sec_categorias') NOT NULL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL UNIQUE,
	descripcion VARCHAR(400),
	edad_min_meses INT NOT NULL CHECK(edad_min_meses >=0),
	edad_max_meses INT NOT NULL CHECK(edad_max_meses >= edad_min_meses)
);

CREATE TABLE productos (
	id_producto INT DEFAULT NEXTVAL('sec_productos') NOT NULL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	descripcion VARCHAR(400),
	lavable BOOLEAN,
	fecha_creacion DATE NOT NULL DEFAULT CURRENT_DATE,
	stock INT NOT NULL CHECK (stock >= 0),
	precio_costo NUMERIC (12,4) NOT NULL CHECK (precio_costo > 0),
	precio_venta NUMERIC (12,4) NOT NULL CHECK (precio_venta > precio_costo),
	usa_baterias BOOLEAN NOT NULL,
	id_categoria INT NOT NULL REFERENCES categorias(id_categoria) ON DELETE RESTRICT,
	id_marca INT NOT NULL REFERENCES marca(id_marca) ON DELETE RESTRICT
);

CREATE TABLE imagenes_producto(
	id_producto INT NOT NULL REFERENCES productos(id_producto) ON DELETE CASCADE,
	num_imagen SMALLINT NOT NULL CHECK (num_imagen BETWEEN 1 AND 5),
	file_id VARCHAR(100) NOT NULL,
	creado_en DATE NOT NULL DEFAULT CURRENT_DATE,
	PRIMARY KEY (id_producto,num_imagen)
);




CREATE INDEX idx_productos_categoria ON productos(id_categoria);
CREATE INDEX idx_productos_marca ON productos(id_marca);

EXPLAIN analyze SELECT * FROM productos;



-- EXPLAIN ANALYZE