drop table if exists libros, libros2, editoriales;

 create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial tinyint unsigned,
  precio decimal(5,2) unsigned,
  primary key(codigo)
 );

 create table editoriales(
  codigo tinyint unsigned auto_increment,
  nombre varchar(20),
  primary key(codigo)
 );

 insert into editoriales values(1,'Planeta');
 insert into editoriales values(2,'Emece');
 insert into editoriales values(3,'Paidos');
 insert into editoriales values(4,'Plaza & Janes');

 insert into libros values (1,'El aleph','Borges',2,44.20);
 insert into libros values (2,'Alicia en el pais de las maravillas','Lewis Carroll',1,12.33);
 insert into libros values (3,'Matematica estas ahi','Paenza',2,9.99);
 insert into libros values (4,'Martin Fierro','Jose Hernandez',3,17.22);
 insert into libros values (5,'Martin Fierro','Jose Hernandez',2,23.56);
 
 
 -- Crear tabla libros2 que contenga los mismos campos que la tabla libro
 -- pero con el precio reducido un 10% en los libros de las editoriales "Planeta" y "Emece"
 create table libros2
	select l.codigo, titulo, autor, codigoeditorial, precio * 0.9 as precio from libros l join editoriales e
	on l.codigoeditorial = e.codigo where e.nombre = "Planeta" or e.nombre = "Emece";
    
insert into libros2 
	select l.codigo, titulo, autor, codigoeditorial, precio from libros l join editoriales e
	on l.codigoeditorial = e.codigo where e.nombre <> "Planeta" and e.nombre <> "Emece"; 
    
select * from libros2;