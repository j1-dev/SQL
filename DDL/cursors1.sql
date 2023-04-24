/* PASO 1: Realizar un Trigger de forma que cada vez que se inserte en la base de datos una
nota suspensa, se creará en la tabla de alumnos a recuperar la información del alumno y 
el modulo que debe recuperar*/
/* PASO 2: Realizar otro Trigger, de nombre "alumno_recuperado", de forma que cada vez que se
actualice la nota de un alumno porque haya recuperado el mólulo, se eliminará dicha ocurrencia
de la tabla "alumnos_a_recuperar"*/

DROP DATABASE IF EXISTS alumnos;
CREATE DATABASE alumnos;
USE alumnos;

CREATE TABLE alumnos (
    id_alumno int PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL
);
CREATE TABLE notas (
    id_alumno int,
    id_modulo int,
    nota FLOAT,
    primary key (id_alumno, id_modulo) 
);
CREATE TABLE alumnos_a_recuperar (
    id_alumno int,
    id_modulo int,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL
);

-- Carga Inicial
INSERT INTO alumnos VALUES (1, 'Pepe', 'López');
INSERT INTO alumnos VALUES (2, 'María', 'Sánchez');
INSERT INTO alumnos VALUES (3, 'Juan', 'Pérez');
INSERT INTO alumnos VALUES (4, 'Lola', 'Ruiz');

-- Solución del PASO 1:

DROP TRIGGER IF EXISTS pendientes_recuperar;
DELIMITER //
CREATE TRIGGER pendientes_recuperar
AFTER INSERT ON notas
FOR EACH ROW
BEGIN
IF NEW.nota < 5 THEN
INSERT INTO alumnos_a_recuperar (id_alumno, id_modulo, nombre, apellido1)
SELECT alumnos.id_alumno, NEW.id_modulo, alumnos.nombre, alumnos.apellido1
FROM alumnos
WHERE alumnos.id_alumno = NEW.id_alumno;
END IF;
END//

DELIMITER ;

-- Carga de datos:
INSERT INTO notas VALUES (1,1,4);
INSERT INTO notas VALUES (1,2,6);
INSERT INTO notas VALUES (1,3,4);
INSERT INTO notas VALUES (2,3,4.5);
INSERT INTO notas VALUES (3,1,9);
INSERT INTO notas VALUES (4,5,2);

-- Comprobación del 1er. Trigger:
select * from alumnos;
select * from notas;
select * from alumnos_a_recuperar;


-- Solución del PASO 2:

DROP TRIGGER IF EXISTS alumno_recuperado;
DELIMITER //
CREATE TRIGGER alumno_recuperado
AFTER UPDATE ON notas
FOR EACH ROW
BEGIN
IF NEW.nota >= 5 THEN
DELETE FROM alumnos_a_recuperar
WHERE id_alumno = NEW.id_alumno AND id_modulo = NEW.id_modulo;
END IF;
END//
DELIMITER ;



-- Comprobación del 2º trigger:
UPDATE notas set nota = 5 where id_alumno = 1 and id_modulo = 1;
UPDATE notas set nota = 8 where id_alumno = 1 and id_modulo = 3;


select * from alumnos;
select * from notas;
select * from alumnos_a_recuperar;

