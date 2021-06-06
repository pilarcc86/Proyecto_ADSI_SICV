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
---//consultas de la tabla vendedores//----
-----------------------------------------------

-----------------------------------------------
-- 5 - Seleccionar todos los campos de la tabla vendedores donde
-- 	   el precio sea mayor a 80000
-----------------------------------------------
SELECT * FROM vendedores WHERE sueldo > 80000;














































-----------------------------------
--- INSERTAR SOLOMENTE UN DATO ----
-----------------------------------
INSERT INTO personas VALUES (null,'GERARDO','CEPEDA ALVAREZ','MASCULINO','LA VILLA', 17)

----

INSERT INTO personas VALUES (null, 'RICARDO', 'CAPERA YATE', 'MASCULINO', 'CASETAS' 5)

----


INSERT INTO `sesion_usuario`(`usuario`, `password`, `id_usuario`) VALUES ('AUGUISmO@gmail.com
','k2H@rnTPXaiq',1)