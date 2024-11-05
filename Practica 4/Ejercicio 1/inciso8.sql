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

-- Agregar un cliente con los siguientes datos:**
--   - nombre: ‘Jorge Luis’
--   - apellido: ‘Castor’
--   - DNI: 40578999
--   - teléfono: ‘221-4400789’
--  - dirección: ‘11 entre 500 y 501 nro:2587’
--   - idCliente: 500002
--   - Se supone que el idCliente 500002 no existe.

INSERT INTO cliente (idCliente, nombre, apellido, DNI, telefono, direccion) VALUES
('500002', 'Jorge Luis', 'Castor', '40578999', '221-4400789', '11 entre 500 y 501 nro:2587');