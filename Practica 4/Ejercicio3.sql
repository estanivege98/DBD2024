/* Ejercicio 3
Banda = (codigoB, nombreBanda, genero_musical, año_creacion)
Integrante = (DNI, nombre, apellido, dirección, email, fecha_nacimiento, codigoB(fk))
Escenario = (nroEscenario, nombre_escenario, ubicación, cubierto, m2, descripción)
Recital = (fecha, hora, nroEscenario (fk), codigoB (fk))
*/

/*1. Listar DNI, nombre, apellido,dirección y email de integrantes nacidos entre 1980 y 1990 y que
hayan realizado algún recital durante 2023.*/
SELECT i.DNI, i.nombre, i.apellido, i.dirección, i.email
FROM Integrante i
INNER JOIN Recital r ON (i.codigoB = r.codigoB)
WHERE i.fecha_nacimiento BETWEEN '1980-01-01' AND '1990-12-31' AND r.fecha BETWEEN '2023-01-01' AND '2023-12-31';

/*2. Reportar nombre, género musical y año de creación de bandas que hayan realizado recitales
durante 2023, pero no hayan tocado durante 2022 .*/
SELECT b.nombreBanda, b.genero_musical, b.año_creacion
FROM Banda b
INNER JOIN recital r ON (b.codigoB = r.codigoB)
WHERE r.fecha BETWEEN '2023-01-01' AND '2023-12-31' AND b.codigoB NOT IN (
    SELECT b.codigoB
    FROM Banda b
    INNER JOIN recital r ON (b.codigoB = r.codigoB)
    WHERE r.fecha BETWEEN '2022-01-01' AND '2022-12-31'
);

/*3. Listar el cronograma de recitales del día 04/12/2023. Se deberá listar nombre de la banda que
ejecutará el recital, fecha, hora, y el nombre y ubicación del escenario correspondiente.*/
SELECT b.nombreBanda, r.fecha, r.hora, e.nombre_escenario, e.ubicación
FROM Banda b
INNER JOIN Recital r ON (b.codigoB = r.codigoB)
INNER JOIN Escenario e ON (r.nroEscenario = e.nroEscenario)
WHERE r.fecha = '2023-12-04';

/*4. Listar DNI, nombre, apellido,email de integrantes que hayan tocado en el escenario con nombre
‘Gustavo Cerati’ y en el escenario con nombre ‘Carlos Gardel’.*/
SELECT i.DNI, i.nombre, i.apellido, i.email
FROM Integrante i
INNER JOIN Recital r ON (i.codigoB = r.codigoB)
INNER JOIN Escenario e ON (r.nroEscenario = e.nroEscenario)
WHERE e.nombre_escenario = 'Gustavo Cerati' OR e.nombre_escenario = 'Carlos Gardel';

/*5. Reportar nombre, género musical y año de creación de bandas que tengan más de 8 integrantes.*/

/*6. Listar nombre de escenario, ubicación y descripción de escenarios que solo tuvieron recitales
con el género musical rock and roll. Ordenar por nombre de escenario*/

/*7. Listar nombre, género musical y año de creación de bandas que hayan realizado recitales en
escenarios cubiertos durante 2023.// cubierto es true, false según corresponda*/

/*8. Reportar para cada escenario, nombre del escenario y cantidad de recitales durante 2024.*/
SELECT e.nombre_escenario, COUNT(r.fecha) as cantidadRecitales
FROM Escenario e
INNER JOIN Recital r ON (e.nroEscenario = r.nroEscenario)
WHERE r.fecha BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY e.nroEscenario, e.nombre_escenario;


/*9. Modificar el nombre de la banda ‘Mempis la Blusera’ a: ‘Memphis la Blusera’.*/
UPDATE Banda SET nombreBanda = 'Memphis La Blusera' WHERE nombreBanda = 'Mempis la Blusera';
