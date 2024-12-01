/*
AGENCIA (RAZON_SOCIAL, dirección, telef, e-mail)
CIUDAD (CODIGOPOSTAL, nombreCiudad, añoCreación)
CLIENTE (DNI, nombre, apellido, teléfono, dirección)
VIAJE( FECHA,HORA,DNI, cpOrigen(fk), cpDestino(fk), razon_social(fk), descripcion)
//cpOrigen y cpDestino corresponden a la ciudades origen y destino del viaje */

/* 9. Reportar nombre, apellido, dirección y teléfono de clientes con al menos 10 viajes. */

SELECT c.nombre, c.apellido, c.direccion, c.telefono
FROM Cliente c
INNER JOIN Viaje v ON c.DNI = v.DNI
GROUP BY c.nombre, c.apellido, c.direccion, c.telefono
HAVING COUNT(*) >= 10;