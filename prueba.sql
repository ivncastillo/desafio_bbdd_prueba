-------------------------------
------ CREACION DE TABLAS -----
-------------------------------
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


----------------------------
------ CARGA DE DATOS -----
----------------------------

-- 5 clientes
\copy clientes FROM 'C:\Users\icasl\OneDrive\DesafioLatam\desafio_bbdd\desafio_prueba/clientes.csv' csv header;

-- 3 categorias
\copy categorias FROM 'C:\Users\icasl\OneDrive\DesafioLatam\desafio_bbdd\desafio_prueba/categorias.csv' csv header;


-- 8 productos
\copy productos FROM 'C:\Users\icasl\OneDrive\DesafioLatam\desafio_bbdd\desafio_prueba/productos.csv' csv header;


-- 10 facturas
\copy facturas FROM 'C:\Users\icasl\OneDrive\DesafioLatam\desafio_bbdd\desafio_prueba/facturas.csv' csv header;


-- 2 para el cliente 1, con 2 y 3 productos
-- 3 para el cliente 2, con 3, 2 y 3 productos
-- 1 para el cliente 3, con 1 producto
-- 4 para el cliente 4, con 2, 3, 4 y 1 producto
\copy facturas_detalle FROM 'C:\Users\icasl\OneDrive\DesafioLatam\desafio_bbdd\desafio_prueba/facturas_detalle.csv' csv header;


----------------------
------ PREGUNTAS -----
----------------------

-- ¿Que cliente realizó la compra más cara?
select b.rut
, b.nombre
, sum(a.valor_total) as venta_total
from facturas a 
left join clientes b on a.id_cliente=b.id_cliente
group by b.rut, b.nombre
order by sum(a.valor_total) desc
limit 1
;

-- ¿Que cliente pagó sobre 100 de monto?
select a.numero as num_factura
, b.rut
, b.nombre
, a.valor_total
from facturas a 
left join clientes b on a.id_cliente=b.id_cliente
where a.valor_total>100
;

-- ¿Cuantos clientes han comprado el producto 6.
select b.rut
, b.nombre
, c.id_producto
, sum(c.valor_total) as monto_total
from facturas a 
left join clientes b on a.id_cliente=b.id_cliente
left join facturas_detalle c on a.numero=c.numero
where c.id_producto=6
group by b.rut
, b.nombre
, c.id_producto
;