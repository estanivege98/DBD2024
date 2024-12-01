/*
AGENCIA (RAZON_SOCIAL, dirección, telef, e-mail)
CIUDAD (CODIGOPOSTAL, nombreCiudad, añoCreación)
CLIENTE (DNI, nombre, apellido, teléfono, dirección)
VIAJE( FECHA,HORA,DNI, cpOrigen(fk), cpDestino(fk), razon_social(fk), descripcion)
//cpOrigen y cpDestino corresponden a la ciudades origen y destino del viaje */


/* 8. Listar razon_social, dirección y teléfono de la/s agencias que tengan mayor cantidad de
viajes realizados. */

SELECT a.razon_social, a.dirección, a.telef
FROM Agencia a
INNER JOIN Viaje v ON (a.razon_social = v.razon_social)
GROUP BY a.razon_social, a.dirección, a.telef
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*)
    FROM Viaje
    GROUP BY razon_social
);