/* Asocia a la tabla "notas" un Trigger para que una vez que se haya actualizado
una nota indique en el campo "diferencia" de la tabla "diferencia_notas" la diferencia 
entre la nota nueva que actualizo y la nota que tenía puesta anteriormente */

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
    nota decimal(4,2),
    diferencia decimal(4,2),
    primary key (id_alumno, id_modulo) 
);

CREATE TABLE diferencia_notas (
    id_alumno int,
    id_modulo int,
    diferencia decimal(4,2),
    primary key (id_alumno, id_modulo) 
);

DROP TRIGGER IF EXISTS mostrar_diferencia;
DELIMITER //
CREATE TRIGGER mostrar_diferencia
AFTER UPDATE
ON notas FOR EACH ROW
BEGIN
  insert into diferencia_notas values (new.id_alumno, new.id_modulo, new.nota - old.nota);
END //
DELIMITER ;


-- NOTAS(1,1,6);
-- NOTAS(1,3,4);
-- NOTAS(2,3,8);
-- NOTAS(4,5,2);

select * from notas; 
select * from notas_recuperaciones;
INSERT INTO alumnos VALUES (1, 'Pepe', 'López');
INSERT INTO alumnos VALUES (2, 'María', 'Sánchez');
INSERT INTO alumnos VALUES (3, 'Juan', 'Pérez');
INSERT INTO alumnos VALUES (4, 'Lola', 'Ruiz');

INSERT INTO notas VALUES (1,1,4 null);
INSERT INTO notas VALUES (1,2,6, null);
INSERT INTO notas VALUES (1,3,4, null);
INSERT INTO notas VALUES (2,3,4.5, null);
INSERT INTO notas VALUES (3,1,9, null);
INSERT INTO notas VALUES (3,2,10, null);
INSERT INTO notas VALUES (4,5,2, null);

update notas set nota = 8 where id_alumno = 1 and id_modulo = 2;

update notas set nota = 3 where id_alumno = 3 and id_modulo = 2;

select * from notas;
select * from diferencia_notas;
