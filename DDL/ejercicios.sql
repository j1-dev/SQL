drop table if exists libros;

create table libros(
  codigo int,
  nombre varchar(30),
  autor varchar(30),
  editorial varchar (20),
  costo decimal(5,2),
  cantidad int,
  primary key(codigo)
 );

insert into libros values (1,'El aleph','Borges','Emece',23.5);
 insert into libros values (2,'Alicia en el pais de las maravillas',
                              'Lewis Carroll','Planeta',15);
 insert into libros values (3,'Matematica estas ahi','Paenza','Emece',34.6);
 insert into libros values (4,'Martin Fierro','Jose Hernandez','Paidos',43.5);
 insert into libros values (5,'Martin Fierro','Jose Hernandez','Planeta',12);
 insert into libros values (6,'Aprenda PHP','Mario Molina','Paidos',21.8);
 insert into libros values (7,'Aprenda Java','Mario Molina','Paidos',55.4);
 insert into libros values (8,'Alicia a traves del espejo','Lewis Carroll','Emece',18);
 insert into libros values (9,'Antologia poetica','Borges','Paidos',47.9);
 
-- Añadir una clave primaria para el campo código. Muestra su describe.

ALTER TABLE libros ADD CONSTRAINT unico_codigo UNIQUE (codigo);
DESCRIBE  libros;

-- Añadir un índice múltiple (índice normal) para el campo autor.

CREATE INDEX autor_index ON libros(autor, codigo);
DESCRIBE  libros;

-- Suponemos que no debe repetirse en la tabla valores duplicados para los títulos.

ALTER TABLE libros
ADD CONSTRAINT uq_titulo UNIQUE (nombre);
DESCRIBE  libros;

-- Cambia el nombre del campo "costo" por "precio" y el de "nombre" por "título"

ALTER TABLE libros
RENAME COLUMN costo TO precio,
RENAME COLUMN nombre TO titulo;
DESCRIBE  libros;

-- Cambia la longitud en del campo título a 50 caracteres máximo

ALTER TABLE libros MODIFY titulo VARCHAR(50);
DESCRIBE  libros;

-- Añade un nuevo campo llamado "stock" cuyo valor por defecto será 1

ALTER TABLE libros ADD stock INT DEFAULT 1;
DESCRIBE  libros;

-- generar una tabla llamada libros_v2 a partir de la tabla libros, obtenida a partir de una consulta que 
-- recorra la tabla libros descendentemente por clave y obtenga la nueva tabla con el campo código autoincremental y no aparezcan las editoriales

CREATE TABLE libros_v2 SELECT titulo, autor, precio, cantidad, stock FROM libros ORDER BY codigo DESC;
DESCRIBE libros_v2;