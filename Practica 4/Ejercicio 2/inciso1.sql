-- Listar especie, años, calle, nro y localidad de árboles podados por el podador ‘Juan Perez’ y 
-- por el podador ‘Jose Garcia’.--

SELECT a.especie, a.años, a.calle, a.nro, l.nombreL 
FROM arbol a
INNER JOIN poda p ON a.nroArbol = p.nroArbol
INNER JOIN podador po ON p.idPodador = po.idPodador
INNER JOIN localidad l ON a.idLocalidad = l.idLocalidad
WHERE (po.nombre = 'Juan' AND po.apellido = 'Perez')
OR (po.nombre = 'Jose' AND po.apellido = 'Garcia');