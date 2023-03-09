drop table if exists libros, editoriales;

 create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30) not null default 'Desconocido',
  codigoeditorial tinyint unsigned not null,
  precio decimal(5,2) unsigned,
  cantidad tinyint unsigned default 0,
  primary key (codigo)
 );

 create table editoriales(
  codigoeditorial tinyint unsigned auto_increment,
  nombre varchar(20) not null,
  primary key(codigoeditorial)
 );

 insert into editoriales (nombre) values('Planeta');
 insert into editoriales (nombre) values('Emece');
 insert into editoriales (nombre) values('Paidos');
 insert into editoriales (nombre) values('Sudamericana');

 insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
  values('El Aleph','Borges',1,43.5,200);
 insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll',2,33.5,100);
 insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
  values('Martin Fierro','Jose Hernandez',1,55.8,50);

 -- Como en ambas tablas, el código de la editorial se denomina "codigoeditorial",
 -- podemos omitir la parte "on" que indica los nombres de los campos por el cual
 -- se enlazan las tablas, empleando "natural join",
 -- se unirán por el campo que tienen en común:
 select titulo,nombre
  from libros as l
  natural join editoriales as e;

 -- La siguiente sentencia tiene la misma salida anterior:
 select titulo,nombre
  from libros as l
  join editoriales as e
  on l.codigoeditorial=e.codigoeditorial;

 -- También se puede usar "natural" con "left join" y "right join":
 select nombre,titulo
  from editoriales as e
  natural left join libros as l;

 -- que tiene la misma salida que:
 select nombre,titulo
  from editoriales as e
  left join libros as l
  on e.codigoeditorial=l.codigoeditorial;