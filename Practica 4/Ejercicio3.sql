/* 3:
Club=(codigoClub, nombre, anioFundacion, codigoCiudad(FK))
Ciudad=(codigoCiudad, nombre)
Estadio=(codigoEstadio, codigoClub(FK), nombre, direccion)
Jugador=(DNI, nombre, apellido, edad, codigoCiudad(FK))
ClubJugador(codigoClub, DNI, desde, hasta) */

/* 1. Reportar nombre y anioFundacion de aquellos clubes de la ciudad de La Plata que no
poseen estadio. */

SELECT c.nombre, c.anioFundacion
FROM Club C
LEFT JOIN Estadio e ON (c.codigoClub = e.codigoClub)
INNER JOIN Ciudad ciu ON (c.codigoCiudad = ciu.codigoCiudad)
Where ciu.nombre = 'La Plata' AND e.codigoEstadio IS NULL;

/* 2. Listar nombre de los clubes que no hayan tenido ni tengan jugadores de la ciudad de
Berisso. */

SELECT c.nombre
FROM Club c
INNER JOIN ClubJugador cj ON (c.codigoClub = cj.codigoClub)
WHERE cj.DNI NOT IN (
    SELECT j.DNI
    FROM Jugador j
    INNER JOIN Ciudad ciu ON (j.codigoCiudad = ciu.codigoCiudad)
    WHERE ciu.nombre = 'Berisso'
)

