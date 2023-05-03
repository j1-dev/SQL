/*Realiza un cursor que recorra las editoriales, y para cada editorial
que tenga activado el flag de borrado de sus libros, se borrarán dichos
libros*/
drop database if exists libreria;
create database libreria;
use libreria;
create table libros(
  codigo int,
  titulo varchar(40),
  codigoeditorial int,
  precio decimal(5,2),
  primary key (codigo)
 );
 
create table log_libros_borrados(
  codigo int,
  titulo varchar(40),
  codigoeditorial int,
  precio decimal(5,2),
  fecha_borrado date,
  primary key (codigo)
 );
 
create table editoriales(
  codigo int,
  nombre varchar(20),
  flag_borrar bool,
  primary key(codigo)
 );
 
 insert into editoriales values(1, 'Emece', false);
 insert into editoriales values(2, 'Planeta', true);
 insert into editoriales values(3, 'Paidos', false);
 insert into libros values (1,'El aleph',1,23.5);
 insert into libros values (2,'Alicia en el pais de las maravillas',2,15);
 insert into libros values (3,'Matematica estas ahi',1,34.6);
 insert into libros values (4,'Martin Fierro',3,43.5);
 insert into libros values (5,'Martin Fierro',2,12);
 insert into libros values (6,'Aprenda PHP',3,21.8);
 insert into libros values (7,'Aprenda Java',3,55.4);
 insert into libros values (8,'Alicia a traves del espejo',1,18);
 insert into libros values (9,'Antologia poetica',3,47.9);
 
DROP TRIGGER IF EXISTS trigger_borrado_libros;
DELIMITER //
CREATE TRIGGER trigger_borrado_libros
AFTER DELETE ON libros
FOR EACH ROW
	BEGIN
		IF (SELECT flag_borrar FROM editoriales WHERE codigo = OLD.codigoeditorial) = true THEN
			INSERT INTO log_libros_borrados (codigo, titulo, codigoeditorial, precio, fecha_borrado)
			VALUES (OLD.codigo, OLD.titulo, OLD.codigoeditorial, OLD.precio, CURDATE());
		END IF;
	END //
DELIMITER ;


/*Reutiliza en la medida de lo posible la estructura de cursor siguiente*/
select * from libros;
DELIMITER //

DROP PROCEDURE IF EXISTS borra_libros_editoriales //

CREATE PROCEDURE borra_libros_editoriales()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE codigo_editorial INT;
    DECLARE cursor_editoriales CURSOR FOR SELECT codigo FROM editoriales WHERE flag_borrar = true;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cursor_editoriales;
    bucle_editoriales: LOOP
        FETCH cursor_editoriales INTO codigo_editorial;
        IF done THEN
            LEAVE bucle_editoriales;
        END IF;
        DELETE FROM libros WHERE codigoeditorial = codigo_editorial;
    END LOOP bucle_editoriales;
    CLOSE cursor_editoriales;
END //

DELIMITER ;

call borra_libros_editoriales();
select * from libros;
select * from log_libros_borrados;