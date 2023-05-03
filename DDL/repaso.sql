/* Realizar un cursor que se recorra todos los alumnos e inserte en la 
tabla de medias, la nota media*/

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
    primary key (id_alumno, id_modulo) 
);

CREATE TABLE notas_medias (
    id_alumno int primary key,
    nota decimal(4,2)
);

INSERT INTO alumnos VALUES (1, 'Pepe', 'López');
INSERT INTO alumnos VALUES (2, 'María', 'Sánchez');
INSERT INTO alumnos VALUES (3, 'Juan', 'Pérez');
INSERT INTO alumnos VALUES (4, 'Lola', 'Ruiz');

INSERT INTO notas VALUES (1,1,4);
INSERT INTO notas VALUES (1,2,6);
INSERT INTO notas VALUES (1,3,4);
INSERT INTO notas VALUES (2,3,4.5);
INSERT INTO notas VALUES (3,1,9);
INSERT INTO notas VALUES (4,5,2);

DELIMITER //
CREATE PROCEDURE insertar_medias()
BEGIN
  DECLARE id INT;
  DECLARE media DECIMAL(4,2);
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE cur CURSOR FOR SELECT id_alumno FROM alumnos;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;

  read_loop: LOOP
    FETCH cur INTO id;
    IF done THEN
      LEAVE read_loop;
    END IF;

    SELECT AVG(nota) INTO media FROM notas WHERE id_alumno = id GROUP BY id_alumno;

    INSERT INTO notas_medias VALUES (id, media);
  END LOOP;

  CLOSE cur;
END //
DELIMITER ;

call insertar_medias();
select * from notas_medias;
