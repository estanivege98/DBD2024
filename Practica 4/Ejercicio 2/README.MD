# Ejercicio 2

## Tablas

### Localidad
- `___codigoPostal___`
- `nombreL`
- `descripcion`
- `#habitantes`

### Arbol
- `___nroArbol___`
- `especie`
- `años`
- `calle`
- `nro`
- `codigoPostal(fk)`

### Podador
- `___DNI___`
- `nombre`
- `apellido`
- `telefono`
- `fnac`
- `codigoPostalVive(fk)`

### Poda
- `___codPoda___`
- `fecha`
- `DNI(fk)`
- `nroArbol(fk)`

## Consultas

1. **Listar especie, años, calle, nro y localidad de árboles podados por el podador ‘Juan Perez’ y por el podador ‘Jose Garcia’.**
2. **Reportar DNI, nombre, apellido, fecha de nacimiento y localidad donde viven de aquellos podadores que tengan podas realizadas durante 2023.**
3. **Listar especie, años, calle, nro y localidad de árboles que no fueron podados nunca.**
4. **Reportar especie, años, calle, nro y localidad de árboles que fueron podados durante 2022 y no fueron podados durante 2023.**
5. **Reportar DNI, nombre, apellido, fecha de nacimiento y localidad donde viven de aquellos podadores con apellido terminado con el string ‘ata’ y que tengan al menos una poda durante 2024. Ordenar por apellido y nombre.**
6. **Listar DNI, apellido, nombre, teléfono y fecha de nacimiento de podadores que solo podaron árboles de especie ‘Coníferas’.**
7. **Listar especies de árboles que se encuentren en la localidad de ‘La Plata’ y también en la localidad de ‘Salta’.**
8. **Eliminar el podador con DNI 22234566.**
9. **Reportar nombre, descripción y cantidad de habitantes de localidades que tengan menos de 100 árboles.**