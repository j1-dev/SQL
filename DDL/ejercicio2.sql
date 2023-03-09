drop table if exists libros, editoriales,cantidadporeditorial;

 create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30) not null default 'Desconocido',
  codigoeditorial tinyint unsigned,
  precio decimal(5,2) unsigned,
  primary key (codigo)
 );

 create table editoriales(
  codigo tinyint unsigned auto_increment,
  nombre varchar(20),
  primary key(codigo)
 );

 insert into editoriales (nombre) values('Emece');
 insert into editoriales (nombre) values('Planeta');
 insert into editoriales (nombre) values('Paidos');

 insert into libros values (1,'El aleph','Borges',1,20);
 insert into libros values (2,'Alicia en el pais de las maravillas',
                            'Lewis Carroll',2,30);
 insert into libros values (3,'Matematica estas ahi','Paenza',1,40);
 insert into libros values (4,'Martin Fierro','Jose Hernandez',3,20);
 insert into libros values (5,'Martin Fierro','Jose Hernandez',2,30);
 insert into libros values (6,'Aprenda PHP','Mario Molina',3,40);
 insert into libros values (7,'Aprenda Java','Mario Molina',3,50);
 insert into libros values (8,'Alicia a traves del espejo','Lewis Carroll',1,20);
 insert into libros values (9,'Antologia poetica','Borges',3,30);


 -- Crearemos la tabla "cantidadporeditorial" con los campos necesarios 
 -- consultando la tabla "libros" y "editoriales" y
 -- en el mismo momento insertaremos los registros:
 create table cantidadporeditorial
  select e.nombre,count(*) as cantidad
  from libros as l
  join editoriales as e
  on l.codigoeditorial=e.codigo    	
  group by e.nombre;

 select * from cantidadporeditorial;

 describe cantidadporeditorial;
 
create table librosporprecio
	select l.precio as precio, count(*) as cantidad 
    from libros as l group by l.precio;
    
select * from librosporprecio;

describe librosporprecio;