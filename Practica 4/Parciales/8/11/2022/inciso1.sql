SELECT l.titulo, g.nombre_genero, l.descripcion 
FROM libro l
INNER JOIN genero g ON l.Cod_genero = g.Cod_genero
INNER JOIN libro-editorial le ON l.ISBN = le.ISBN
INNER JOIN editorial e ON le.Cod_editorial = e.Cod_editorial
WHERE e.nombre_editorial = 'Nueva Editorial'
ORDER BY l.titulo;
