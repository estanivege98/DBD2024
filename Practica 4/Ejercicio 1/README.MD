# Ejercicio 1

## Tablas

- **Cliente** (___idCliente___, nombre, apellido, DNI, telefono, direccion)
- **Factura** (___nroTicket___, total, fecha, hora, idCliente (fk))
- **Detalle** (___nroTicket (fk), idProducto (fk)___, cantidad, preciounitario)
- **Producto** (___idProducto___, nombreP, descripcion, precio, stock)

## Consultas

1. **Listar datos personales de clientes cuyo apellido comience con el string ‘Pe’. Ordenar por DNI.**
2. **Listar nombre, apellido, DNI, teléfono y dirección de clientes que realizaron compras solamente durante 2017.**
3. **Listar nombre, descripción, precio y stock de productos vendidos al cliente con DNI 45789456, pero que no fueron vendidos a clientes de apellido ‘Garcia’.**
4. **Listar nombre, descripción, precio y stock de productos no vendidos a clientes que tengan teléfono con característica 221 (la característica está al comienzo del teléfono). Ordenar por nombre.**
5. **Listar para cada producto nombre, descripción, precio y cuantas veces fue vendido. Tenga en cuenta que puede no haberse vendido nunca el producto.**
6. **Listar nombre, apellido, DNI, teléfono y dirección de clientes que compraron los productos con nombre ‘prod1’ y ‘prod2’ pero nunca compraron el producto con nombre ‘prod3’.**
7. **Listar nroTicket, total, fecha, hora y DNI del cliente, de aquellas facturas donde se haya comprado el producto ‘prod38’ o la factura tenga fecha de 2019.**
8. **Agregar un cliente con los siguientes datos:**
   - nombre: ‘Jorge Luis’
   - apellido: ‘Castor’
   - DNI: 40578999
   - teléfono: ‘221-4400789’
   - dirección: ‘11 entre 500 y 501 nro:2587’
   - idCliente: 500002
   - Se supone que el idCliente 500002 no existe.
9. **Listar nroTicket, total, fecha, hora para las facturas del cliente ‘Jorge Pérez’ donde no haya comprado el producto ‘Z’.**
10. **Listar DNI, apellido y nombre de clientes donde el monto total comprado, teniendo en cuenta todas sus facturas, supere $10.000.000.**