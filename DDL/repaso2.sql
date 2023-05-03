/* Asociar a la tabla recuperaciones un trigger para que una vez que se 
haya insertado una nota de recuperación, actualice la nota del alumno en la nota extraordinaria
poniendo la mayor entre la ordinaria y la extraordinaria */

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
    nota_ord decimal(4,2),
    nota_ext decimal(4,2),
    primary key (id_alumno, id_modulo) 
);

CREATE TABLE notas_recuperaciones (
    id_alumno int,
    id_modulo int,
    nota_recuperacion decimal(4,2),
    primary key (id_alumno, id_modulo) 
);

DROP TRIGGER IF EXISTS actualizar_nota_ext;

DELIMITER //

CREATE TRIGGER actualizar_nota_ext 
AFTER INSERT ON notas_recuperaciones
FOR EACH ROW
BEGIN
    UPDATE notas 
    SET nota_ext = GREATEST(nota_ord, NEW.nota_recuperacion)
    WHERE id_alumno = NEW.id_alumno AND id_modulo = NEW.id_modulo;
END//

DELIMITER ;


INSERT INTO alumnos VALUES (1, 'Pepe', 'López');
INSERT INTO alumnos VALUES (2, 'María', 'Sánchez');
INSERT INTO alumnos VALUES (3, 'Juan', 'Pérez');
INSERT INTO alumnos VALUES (4, 'Lola', 'Ruiz');

INSERT INTO notas VALUES (1,1,4, null);
INSERT INTO notas VALUES (1,2,6, null);
INSERT INTO notas VALUES (1,3,4, null);
INSERT INTO notas VALUES (2,3,4.5, null);
INSERT INTO notas VALUES (3,1,9, null);
INSERT INTO notas VALUES (3,2,10, null);
INSERT INTO notas VALUES (4,5,2, null);

select * from alumnos;
select * from notas;
select * from notas_recuperaciones;

INSERT INTO notas_recuperaciones VALUES (1,1,6);
INSERT INTO notas_recuperaciones VALUES (1,3,3);
INSERT INTO notas_recuperaciones VALUES (2,3,8);
INSERT INTO notas_recuperaciones VALUES (4,5,1);

select * from alumnos;
select * from notas;
select * from notas_recuperaciones;
