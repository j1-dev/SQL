drop table if exists libros, editoriales;
 
 create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30) not null default 1,
  codigoeditorial tinyint unsigned not null,
  precio decimal(5,2) unsigned,
  primary key (codigo)
 );
 
 create table editoriales ( 
  codigo tinyint unsigned auto_increment,
  nombre varchar(20),
  primary key (codigo) 
 );

 insert into editoriales (nombre) values ('Planeta');
 insert into editoriales (nombre) values ('Emece');
 insert into editoriales (nombre) values ('Paidos');

 insert into libros (titulo, autor,codigoeditorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll',1,23.5);
 insert into libros (titulo, autor,codigoeditorial,precio)
  values('Alicia a traves del espejo','Lewis Carroll',2,25);
 insert into libros (titulo, autor,codigoeditorial,precio) 
  values('El aleph','Borges',2,15);
 insert into libros (titulo, autor,codigoeditorial,precio)
  values('Matemática estas ahi','Paenza',1,10);

 -- Para ver todas las editoriales, agrupadas por nombre, con una columna llamada "cantidad de libros"
 -- en la que aparece la cantidad calculada con "count()" de todos los libros de cada editorial tipeamos:
 select e.nombre,count(l.codigoeditorial) as 'cantidad de libros'
  from editoriales as e
  left join libros as l
  on l.codigoeditorial=e.codigo
  group by e.nombre;

 select e.nombre,count(l.codigoeditorial) as 'cantidad de libros'
  from editoriales as e
  join libros as l
  on l.codigoeditorial=e.codigo
  group by e.nombre;

 -- Para conocer el mayor precio de los libros de cada editorial usamos la función "max()", 
 -- hacemos un "join" y agrupamos por nombre de la editorial:
 select e.nombre,
  max(l.precio) as 'mayor precio'
  from editoriales as e
  left join libros as l
  on l.codigoeditorial=e.codigo
  group by e.nombre;

 select e.nombre,
  max(l.precio) as 'mayor precio'
  from editoriales as e
  join libros as l
  on l.codigoeditorial=e.codigo
  group by e.nombre;