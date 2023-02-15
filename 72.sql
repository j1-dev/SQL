drop table if exists libros, editoriales;

 create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40),
  autor varchar(20),
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

 insert into libros values (1,'El aleph','Borges',2,23);
 insert into libros values (2,'Alicia en el pais de las maravillas',
                            'Lewis Carroll',1,15);
 insert into libros values (3,'Matematica estas ahi','Paenza',2,12);
 insert into libros values (4,'Martin Fierro','Jose Hernandez',3,34);
 insert into libros values (5,'Martin Fierro','Jose Hernandez',2,55);
 insert into libros values (6,'Aprenda PHP','Molina Mario',1,45);
 insert into libros values (7,'Java en 10 minutos','Molina Mario',3,42);

 -- Guardamos en una variable el valor de precio más alto:
 select @mayorprecio:=max(precio) from libros;

 -- Mostramos todos los datos de dicho libro empleando la variable anterior:
 select * from libros
  where precio=@mayorprecio;

 -- Empleamos ahora un "join" para ver, además, el nombre de la editorial:
 select l.titulo,l.autor,e.nombre
  from libros as l
  join editoriales as e
  on l.codigoeditorial=e.codigo
  where l.precio = @mayorprecio;

 select @mayorprecio:=max(precio) from libros;

 select @editorial:=e.nombre
  from libros as l
  join editoriales as e
  on l.codigoeditorial=e.codigo
  where precio=@mayorprecio;

 select l.titulo,l.autor,e.nombre
  from libros as l
  join editoriales as e
  on l.codigoeditorial=e.codigo
  where e.nombre=@editorial;