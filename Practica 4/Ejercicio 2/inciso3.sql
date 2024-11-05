-- Tabla Localidad
CREATE TABLE Localidad (
    codigoPostal INT PRIMARY KEY,
    nombreL VARCHAR(100),
    descripcion TEXT,
    habitantes INT
);

-- Tabla Arbol
CREATE TABLE Arbol (
    nroArbol INT PRIMARY KEY,
    especie VARCHAR(100),
    años INT,
    calle VARCHAR(100),
    nro INT,
    codigoPostal INT,
    FOREIGN KEY (codigoPostal) REFERENCES Localidad(codigoPostal)
);

-- Tabla Podador
CREATE TABLE Podador (
    DNI INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(20),
    fnac DATE,
    codigoPostalVive INT,
    FOREIGN KEY (codigoPostalVive) REFERENCES Localidad(codigoPostal)
);

-- Tabla Poda
CREATE TABLE Poda (
    codPoda INT PRIMARY KEY,
    fecha DATE,
    DNI INT,
    nroArbol INT,
    FOREIGN KEY (DNI) REFERENCES Podador(DNI),
    FOREIGN KEY (nroArbol) REFERENCES Arbol(nroArbol)
);

-- Insertar datos
INSERT INTO Localidad VALUES (1, 'San Miguel de Tucumán', 'Capital de Tucumán', 800000);
INSERT INTO Localidad VALUES (2, 'Yerba Buena', 'Localidad vecina a San Miguel de Tucumán', 50000);
INSERT INTO Localidad VALUES (3, 'Tafí Viejo', 'Localidad vecina a San Miguel de Tucumán', 100000);

INSERT INTO Arbol VALUES (1, 'Palo Borracho', 10, 'Av. Aconquija', 100, 1);
INSERT INTO Arbol VALUES (2, 'Palo Borracho', 5, 'Av. Aconquija', 200, 1);
INSERT INTO Arbol VALUES (3, 'Palo Borracho', 3, 'Av. Aconquija', 300, 1);

INSERT INTO Podador VALUES (1, 'Juan', 'Perez', '3811234567', '1990-01-01', 1);
INSERT INTO Podador VALUES (2, 'Pedro', 'Gomez', '3811234567', '1995-01-01', 2);
INSERT INTO Podador VALUES (3, 'Maria', 'Gonzalez', '3811234567', '1993-01-01', 3);

INSERT INTO Poda VALUES (1, '2023-01-01', 1, 1);
INSERT INTO Poda VALUES (2, '2023-01-01', 2, 2);
INSERT INTO Poda VALUES (3, '2023-01-01', 3, 3);

-- Listar especie, años, calle, nro y localidad de árboles que no fueron podados nunca.

SELECT especie, años, calle, nro, nombreL FROM arbol a
INNER JOIN localidad l ON a.codigoPostal = l.codigoPostal
WHERE a.nroArbol NOT IN (SELECT nroArbol FROM poda);