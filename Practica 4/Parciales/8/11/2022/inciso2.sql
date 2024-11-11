SELECT apellido, nombre 
FROM socio 
WHERE fecha_ingreso BETWEEN '2022-09-01' AND '2022-09-30'
ORDER BY apellido, nombre;