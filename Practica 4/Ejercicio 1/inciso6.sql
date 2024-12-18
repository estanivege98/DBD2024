CREATE TABLE cliente (
    idCliente VARCHAR(100),
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    DNI VARCHAR(100),
    telefono VARCHAR(100),
    direccion VARCHAR(100)
);

CREATE TABLE factura (
    nroTicket VARCHAR(100),
    total VARCHAR(100),
    fecha VARCHAR(100),
    hora VARCHAR(100),
    idCliente VARCHAR(100)
);

CREATE TABLE detalle ( 
  nroTicket VARCHAR(100),
  idProducto VARCHAR(100),
  cantidad VARCHAR(100),
  preciounitario VARCHAR(100)
); 

CREATE TABLE producto (
  idProducto VARCHAR(100),
  nombreP VARCHAR(100),
  descripcion VARCHAR(100),
  precio VARCHAR(100),
  stock VARCHAR(100)
);

-- Tablas generadas en Copilot -- 

-- Insertar datos en la tabla cliente
INSERT INTO cliente (idCliente, nombre, apellido, DNI, telefono, direccion) VALUES
('1', 'Juan', 'Perez', '12345678', '221-1234567', 'Calle Falsa 123'),
('2', 'Maria', 'Gomez', '87654321', '221-7654321', 'Avenida Siempre Viva 742'),
('3', 'Pedro', 'Peña', '11223344', '221-1122334', 'Calle Luna 456');

-- Insertar datos en la tabla factura
INSERT INTO factura (nroTicket, total, fecha, hora, idCliente) VALUES
('1001', '1500', '2023-01-01', '10:00', '1'),
('1002', '2000', '2023-01-02', '11:00', '2'),
('1003', '2500', '2023-01-03', '12:00', '3');

-- Insertar datos en la tabla detalle
INSERT INTO detalle (nroTicket, idProducto, cantidad, preciounitario) VALUES
('1001', '1', '2', '500'),
('1001', '2', '1', '500'),
('1002', '1', '1', '1000'),
('1003', '3', '5', '500');

-- Insertar datos en la tabla producto
INSERT INTO producto (idProducto, nombreP, descripcion, precio, stock) VALUES
('1', 'Producto A', 'Descripcion A', '500', '10'),
('2', 'Producto B', 'Descripcion B', '1000', '20'),
('3', 'Producto C', 'Descripcion C', '500', '30');

-- Listar nombre, apellido, DNI, teléfono y dirección de clientes que compraron los productos con --
-- nombre ‘prod1’ y ‘prod2’ pero nunca compraron el producto con nombre ‘prod3’. --

SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion FROM producto p
INNER JOIN detalle d ON p.idProducto = d.idProducto
INNER JOIN factura f ON f.nroTicket = d.nroTicket
INNER JOIN cliente c ON c.idCliente = f.idCliente
WHERE p.nombreP IN ('Producto A', 'Producto B') AND c.idCliente NOT IN (
    SELECT c.idCliente FROM producto p
    INNER JOIN detalle d on p.idProducto = d.idProducto
    INNER JOIN factura f on f.nroTicket = d.nroTicket
    inner join cliente c ON c.idCliente = f.idCliente
    WHERE p.nombreP = 'Producto C'
)