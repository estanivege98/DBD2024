SELECT s.nombre, s.apellido, s.fecha_nacimiento COUNT(*) AS cantidad_prestamos
FROM socio s
INNER JOIN prestamo p ON s.nro_socio = p.nro_socio
GROUP BY s.nro_socio
HAVING COUNT(*) > 5
ORDER BY s.apellido