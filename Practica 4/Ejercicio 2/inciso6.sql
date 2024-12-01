/* 6. Listar nombre, apellido, dirección y teléfono de clientes que viajaron con todas las agencias. */
SELECT c.nombre, c.apellido, c.direccion, c.telefono
FROM Cliente c
WHERE NOT EXISTS (
    SELECT *
    FROM Agencia a
    WHERE NOT EXISTS (
        SELECT *
        FROM Viaje v
        WHERE v.idCliente = c.idCliente AND v.idAgencia = a.idAgencia
    )
);