CREATE TABLE productos (
	id_producto SEQUENCE NOT NULL PRIMARY KEY,
	nombre CHAR(100) NOT NULL,
	descripcion CHAR(400),
	lavable BOOLEAN,
	fecha_creacion DATE NOT NULL,
	stock INT NOT NULL,
	precio_costo NUMERIC (12,4) NOT NULL CHECK (precio_costo > 0),
	precio_venta NUMERIC (12,4) NOT NULL CHECK (precio_venta > precio_costo),
	usa_baterias BOOLEAN NOT NULL
	id_categoria INT NOT NULL,
	id_marca INT NOT NULL	
);

CREATE TABLE marca(
	id_marca SEQUENCE NOT NULL PRIMARY KEY,
	siglas CHAR(10),
	nombre CHAR(100) NOT NULL
);

CREATE TABLE categorias(
	id_categoria SEQUENCE NOT NULL PRIMARY KEY,
	nombre CHAR(100),
	descripcion CHAR(400),
	edad_min_meses INT NOT NULL
	edad_max_meses INT NOT NULL
);