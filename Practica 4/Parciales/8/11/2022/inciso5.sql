SELECT COUNT(DISTINCT s.nro_socio) AS numero_socios
FROM socio s
INNER JOIN prestamo p ON s.nro_socio = p.nro_socio
INNER JOIN copia c ON p.ISBN = c.ISBN
WHERE c.estado = 'Bueno'
