/* Ejercicio 4:
PERSONA = (DNI, Apellido, Nombre, Fecha_Nacimiento, Estado_Civil, Genero)
ALUMNO = (DNI (fk), Legajo, Año_Ingreso)
PROFESOR = (DNI (fk), Matricula, Nro_Expediente)
TITULO = (Cod_Titulo, Nombre, Descripción)
TITULO-PROFESOR = (Cod_Titulo (fk), DNI (fk), Fecha)
CURSO = (Cod_Curso, Nombre, Descripción, Fecha_Creacion, Duracion)
ALUMNO-CURSO = (DNI (fk), Cod_Curso (fk), Año, Desempeño, Calificación)
PROFESOR-CURSO = (DNI (fk), Cod_Curso (fk), Fecha_Desde, Fecha_Hasta)
 */

/* 1. Listar DNI, legajo y apellido y nombre de todos los alumnos que tengan año de ingreso inferior a
2014. */

SELECT a.DNI, a.Legajo, p.Apellido, p.Nombre
FROM Alumno a
INNER JOIN Persona p ON (a.DNI = p.DNI)
WHERE a.Año_Ingreso < 2014;

/* 2. Listar DNI, matrícula, apellido y nombre de los profesores que dictan cursos que tengan más de
100 horas de duración. Ordenar por DNI. */
SELECT p.DNI, pr.Matricula, p.Apellido, p.Nombre 
FROM Profesor pr
INNER JOIN Persona p ON (pr.DNI = p.DNI)
INNER JOIN Profesor-Curso pc ON (pr.DNI = pc.DNI)
INNER JOIN Curso c ON (pc.Cod_Curso = c.Cod_Curso)
WHERE c.Duracion > 100

/*3. Listar el DNI, Apellido, Nombre, Género y Fecha de nacimiento de los alumnos inscriptos al
curso con nombre “Diseño de Bases de Datos” en 2023.*/
SELECT p.DNI, p.Apellido, p.Nombre, p.Genero, p.Fecha_Nacimiento
FROM Persona p 
INNER JOIN Alumno a ON (p.DNI = a.DNI)
INNER JOIN Alumno-Curso ac ON (a.DNI = ac.DNI)
INNER JOIN Curso c ON (ac.Cod_Curso = c.Cod_Curso)
WHERE c.Nombre = 'Diseño de Bases de Datos' AND ac.Año = 2023;

/*4. Listar el DNI, Apellido, Nombre y Calificación de aquellos alumnos que obtuvieron una
calificación superior a 8 en algún curso que dicta el profesor “Juan Garcia”. Dicho listado deberá
estar ordenado por Apellido y nombre.*/
SELECT p.DNI, p.Apellido, p.Nombre, ac.Calificación
FROM Persona p
INNER JOIN Alumno a ON (p.DNI = a.DNI)
INNER JOIN Alumno-Curso ac ON (a.DNI = ac.DNI)
INNER JOIN Curso c ON (ac.Cod_Curso = c.Cod_Curso)
INNER JOIN Profesor-Curso pc ON (c.Cod_Curso = pc.Cod_Curso)
INNER JOIN Profesor pr ON (pc.DNI = pr.DNI)
WHERE pr.Nombre = 'Juan Garcia' AND ac.Calificación > 8

/*5. Listar el DNI, Apellido, Nombre y Matrícula de aquellos profesores que posean más de 3 títulos.
Dicho listado deberá estar ordenado por Apellido y Nombre.*/
SELECT p.DNI, p.Apellido, p.Nombre, pr.Matricula
FROM Persona p
INNER JOIN Profesor pr ON (p.DNI = pr.DNI)
INNER JOIN Titulo-Profesor tp ON (pr.DNI = tp.DNI)
GROUP BY p.DNI, p.Apellido, p.Nombre, pr.Matricula
HAVING COUNT(tp.Cod_Titulo) > 3
ORDER BY p.Apellido, p.Nombre;

/*6. Listar el DNI, Apellido, Nombre, Cantidad de horas y Promedio de horas que dicta cada profesor.
La cantidad de horas se calcula como la suma de la duración de todos los cursos que dicta.*/
SELECT p.DNI, p.Apellido, p.Nombre, SUM(c.Duracion) as Cantidad_Horas, AVG(c.Duracion) as Promedio_Horas
FROM Persona p
INNER JOIN Profesor pr ON (p.DNI = pr.DNI)
INNER JOIN Profesor-Curso pc ON (pr.DNI = pc.DNI)
INNER JOIN Curso c ON (pc.Cod_Curso = c.Cod_Curso)
GROUP BY p.DNI, p.Apellido, p.Nombre;

/*7. Listar Nombre y Descripción del curso que posea más alumnos inscriptos y del que posea
menos alumnos inscriptos durante 2024.*/
SELECT c.Nombre, c.Descripción
FROM Curso c
INNER JOIN Alumno-Curso ac ON (c.Cod_Curso = ac.Cod_Curso)
WHERE ac.Año = 2024
GROUP BY c.Cod_Curso, c.Nombre, c.Descripción
HAVING COUNT(ac.DNI) = (SELECT MAX(COUNT(ac.DNI)) FROM Alumno-Curso WHERE Año = 2024)
OR COUNT(ac.DNI) = (SELECT MIN(COUNT(ac.DNI)) FROM Alumno-Curso WHERE Año = 2024);

/*8. Listar el DNI, Apellido, Nombre y Legajo de alumnos que realizaron cursos con nombre
conteniendo el string ‘BD’ durante 2022 pero no realizaron ningún curso durante 2023.*/
SELECT p.DNI, p.Apellido, p.Nombre, a.Legajo
FROM Persona p
INNER JOIN Alumno a ON (p.DNI = a.DNI)
INNER JOIN Alumno-Curso ac ON (a.DNI = ac.DNI)
INNER JOIN Curso c ON (ac.Cod_Curso = c.Cod_Curso)
WHERE c.Nombre LIKE '%BD%' AND ac.Año = 2022
AND p.DNI NOT IN (SELECT DNI FROM Alumno-Curso WHERE Año = 2023);

/*9. Agregar un profesor con los datos que prefiera y agregarle el título con código: 25.*/
INSERT INTO Persona VALUES (12345678, 'Perez', 'Juan', '1990-01-01', 'Soltero', 'Masculino');
INSERT INTO Profesor VALUES (12345678, 123456, 123456);
INSERT INTO Titulo-Profesor VALUES (25, 12345678, '2022-01-01');

/*10. Modificar el estado civil del alumno cuyo legajo es ‘2020/09’, el nuevo estado civil es divorciado.*/
UPDATE Persona SET Estado_Civil = 'Divorciado' WHERE DNI = (SELECT dni FROM Alumno WHERE legago = '2020/09');

/*11. Dar de baja el alumno con DNI 30568989. Realizar todas las bajas necesarias para no dejar el
conjunto de relaciones en un estado inconsistente.*/
DELETE FROM Alumno-Curso WHERE DNI = 30568989;
DELETE FROM Alumno WHERE DNI = 30568989;
DELETE FROM Persona WHERE DNI = 30568989;

