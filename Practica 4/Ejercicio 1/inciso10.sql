/*10. Listar DNI, apellido y nombre de clientes donde el monto total comprado, teniendo en cuenta todas sus facturas, supere $10.000.000.*/

SELECT c.DNI, c.apellido, c.nombre
FROM Cliente c
INNER JOIN Factura f ON c.idCliente = f.idCliente
GROUP BY c.DNI, c.apellido, c.nombre
HAVING SUM(f.total) > 10000000;