
SELECT DISTINCT s.apellido, s.nombre, s.DNI 
FROM socio s
WHERE s.nro_socio NOT IN(
    SELECT s.nro_socio
    FROM socio s1
    INNER JOIN prestamo p ON s1.nro_socio = p.nro_socio
    INNER JOIN libro_editorial le ON p.ISBN = le.ISBN
    INNER JOIN editorial e ON le.Cod_editorial = e.Cod_editorial
    WHERE e.denominacion = 'Gran Editorial'
)
ORDER BY s.apellido, s.nombre;

-- version con Execpt

SELECT DISTINCT s.apellido, s.nombre, s.DNI 
FROM socio s
EXCEPT
SELECT DISTINCT s.apellido, s.nombre, s.DNI
FROM socio s1
INNER JOIN prestamo p ON s1.nro_socio = p.nro_socio
INNER JOIN libro_editorial le ON p.ISBN = le.ISBN
INNER JOIN editorial e ON le.Cod_editorial = e.Cod_editorial
WHERE e.denominacion = 'Gran Editorial'