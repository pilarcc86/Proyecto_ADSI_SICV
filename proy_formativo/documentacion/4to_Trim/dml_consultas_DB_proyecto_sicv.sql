--------------------------------------------------------
--------------------------------------------------------
--- CONSULTAS DEL PROYECTO SICV ---
--------------------------------------------------------
--------------------------------------------------------

-----------------------------------------------
---//consultas de la tabla personas//----
-----------------------------------------------

-----------------------------------------------
-- 1 - Seleccionar los campos de nombre, genero y barrio de la tabla 
--     personas
-----------------------------------------------

SELECT nombres, genero, barrio FROM personas;

-----------------------------------------------
-- 2 - Seleccionar los campo nombre, genero 
--     y barrio de la tabla personas donde la seccion sea igual 'FEMENINO'
-----------------------------------------------

SELECT nombres, genero, barrio FROM personas WHERE genero = 'FEMENINO'

-----------------------------------------------
-- 3 - Seleccionar los campos nombres, genero, y barrio 
--     de la tabla personas donde barrio sea igual a
--	   'MADRID' 'Y' (realmente es O) 'BARCELONA'
-----------------------------------------------

SELECT nombres, genero, barrio FROM personas WHERE barrio = 'MADRID' OR barrio = 'BARCELONA'

-----------------------------------------------
-- 4 - Seleccionar todos los campos de la tabla personas donde
-- 	   EL genero sea igual a 'FEMENINO' y su barrio sea 'GIJÓN'
-----------------------------------------------

SELECT * FROM personas WHERE genero = 'FEMENINO' AND barrio = 'GIJÓN';

-----------------------------------------------
-- 5 - Seleccionar todos los campo barrio de la tabla personas donde barrio sea igual 
--	   'MADRID' 'Y' 'BARCELONA' y que lo ordene por la forma (Ascendente)
-----------------------------------------------
SELECT * FROM personas WHERE barrio = 'MADRID'
OR barrio = 'BARCELONA' ORDER BY  barrio  ASC

-----------------------------------------------
-- 6 - Seleccionar todos los campo barrio de la tabla personas donde barrio sea igual 
--	   'MADRID' 'Y' 'BARCELONA' y que lo ordene por la forma (Descendente)
-----------------------------------------------
SELECT * FROM personas WHERE barrio = 'MADRID'
OR barrio = 'BARCELONA' ORDER BY  barrio  DESC

-----------------------------------------------
-- 7 - Seleccionar todos los campo barrio de la tabla personas donde barrio sea igual 
--	   'MADRID' 'Y' 'BARCELONA' y que lo ordene por los apellidos (Ascendente o Descendente)
-----------------------------------------------
SELECT * FROM personas WHERE barrio = 'MADRID'
OR barrio = 'BARCELONA' ORDER BY  nombres ASC


-----------------------------------------------
-- 8 - Seleccionar todos los campo barrio de la tabla personas donde barrio sea igual 
--	   'MADRID' 'Y' 'BARCELONA' y que lo ordene por barrio y luego por
--      los apellidos 
-----------------------------------------------
SELECT * FROM personas WHERE barrio = 'MADRID'
OR barrio = 'BARCELONA' ORDER BY  barrio, apellidos;

-----------------------------------------------
-- 8 - Seleccionar todos los campo barrio de la tabla personas donde barrio sea igual 
--	   'MADRID' 'Y' 'BARCELONA' y que lo ordene por barrio, nombres y luego por
--      los apellidos 
-----------------------------------------------
SELECT * FROM personas WHERE barrio = 'MADRID' OR barrio = 'BARCELONA' 
ORDER BY barrio, nombres, apellidos;

-----------------------------------------------
-- 10 - Seleccionar el campo barrio de la tabla personas para agrupar el campo barrio
-----------------------------------------------
SELECT barrio FROM personas GROUP BY barrio;


-----------consultas INNER JOIN. OUTER JOINS (RIGT JOIN, LEFT JOIN {composiciones externas}	

-----------------------------------------------
-- 11 -  INNER JOIN: solo la informacion comun entre las tablas: personas y clientes
-------	 personas de madrid 
-----------------------------------------------

SELECT * FROM personas INNER JOIN clientes 
ON personas.idpersonas = clientes.idclientes 
WHERE barrio = 'BARCELONA' ORDER BY clientes.idclientes















-----------------------------------
--- INSERTAR SOLOMENTE UN DATO ----
-----------------------------------
INSERT INTO personas VALUES (null,'GERARDO','CEPEDA ALVAREZ','MASCULINO','LA VILLA', 17)

----

INSERT INTO personas VALUES (null, 'RICARDO', 'CAPERA YATE', 'MASCULINO', 'CASETAS' 5)

----


INSERT INTO `sesion_usuario`(`usuario`, `password`, `id_usuario`) VALUES ('AUGUISmO@gmail.com
','k2H@rnTPXaiq',1)