CREATE DATABASE prueba;

CREATE TABLE clientes(
id_cliente INT
,nombre VARCHAR(50)
,rut VARCHAR(25)
,direccion VARCHAR(50)
, PRIMARY KEY (id_cliente)
);

CREATE TABLE categorias(
id_categoria INT
,nombre VARCHAR(50)
,descripcion VARCHAR(50)
, PRIMARY KEY (id_categoria)
);

CREATE TABLE productos(
id_producto INT
,nombre VARCHAR(50)
,descripcion VARCHAR(50)
,valor_unitario INT
,id_categoria INT
, PRIMARY KEY (id_producto)
, FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);



CREATE TABLE facturas(
numero INT
,fecha date
,subtotal INT
,valor_total INT
,iva INT
,id_cliente INT
, PRIMARY KEY (numero)
, FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE facturas_detalle(
numero INT
,id_producto INT
,precio_unitario INT
,cantidad INT
,valor_total INT
, PRIMARY KEY (numero, id_producto)
);

-- 5 clientes
\copy clientes FROM 'C:\Users\icasl\OneDrive\DesafioLatam\desafio_bbdd\desafio_prueba/clientes.csv' csv header;

INSERT INTO clientes
(id_cliente, nombre, rut, direccion)
VALUES ('1', 'nombre1', '1-1' , 'direccion1');

INSERT INTO clientes
(id_cliente, nombre, rut, direccion)
VALUES ('2', 'nombre2', '2-2' , 'direccion2');

INSERT INTO clientes
(id_cliente, nombre, rut, direccion)
VALUES ('3', 'nombre3', '3-3' , 'direccion3');

INSERT INTO clientes
(id_cliente, nombre, rut, direccion)
VALUES ('4', 'nombre4', '4-4' , 'direccion4');

INSERT INTO clientes
(id_cliente, nombre, rut, direccion)
VALUES ('5', 'nombre5', '5-5' , 'direccion5');


-- 8 productos
INSERT INTO productos
(id_producto, nombre, descripcion, valor_unitario, id_categoria)
VALUES ('1', 'nombre1', 'descripcion1' , '100', '1');

INSERT INTO productos
(id_producto, nombre, descripcion, valor_unitario, id_categoria)
VALUES ('2', 'nombre2', 'descripcion2' , '200', '1');

INSERT INTO productos
(id_producto, nombre, descripcion, valor_unitario, id_categoria)
VALUES ('3', 'nombre3', 'descripcion3' , '300', '1');

INSERT INTO productos
(id_producto, nombre, descripcion, valor_unitario, id_categoria)
VALUES ('4', 'nombre4', 'descripcion4' , '400', '2');

INSERT INTO productos
(id_producto, nombre, descripcion, valor_unitario, id_categoria)
VALUES ('5', 'nombre5', 'descripcion5' , '500', '2');

INSERT INTO productos
(id_producto, nombre, descripcion, valor_unitario, id_categoria)
VALUES ('6', 'nombre6', 'descripcion6' , '600', '2');

INSERT INTO productos
(id_producto, nombre, descripcion, valor_unitario, id_categoria)
VALUES ('7', 'nombre7', 'descripcion7' , '700', '3');

INSERT INTO productos
(id_producto, nombre, descripcion, valor_unitario, id_categoria)
VALUES ('8', 'nombre8', 'descripcion8' , '800', '3');


-- 3 categorias
INSERT INTO categorias
(id_categoria, nombre, descripcion)
VALUES (1, 'nombre1', 'categoria1');

INSERT INTO categorias
(id_categoria, nombre, descripcion)
VALUES ('2', 'nombre2', 'categoria2');

INSERT INTO categorias
(id_categoria, nombre, descripcion)
VALUES ('3', 'nombre3', 'categoria3');

-- 10 facturas
INSERT INTO facturas
(numero, fecha, subtotal, valor_total, iva, id_cliente)
VALUES ('6', 'nombre1', 'descripcion1' , '100', '1');


CREATE TABLE facturas(
numero INT
,fecha date
,subtotal INT
,valor_total INT
,iva INT
,id_cliente INT
, PRIMARY KEY (numero)
, FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


-- 2 para el cliente 1, con 2 y 3 productos
-- 3 para el cliente 2, con 3, 2 y 3 productos
-- 1 para el cliente 3, con 1 producto
-- 4 para el cliente 4, con 2, 3, 4 y 1 producto