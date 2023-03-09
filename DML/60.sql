drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(30),
  precio decimal(5,2) unsigned,
  primary key (codigo)
 );

insert into libros (titulo, autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',50.5);
insert into libros (titulo, autor,editorial,precio)
  values('Alicia a traves del espejo','Lewis Carroll','Emece',25);
insert into libros (titulo, autor,editorial,precio) 
  values('El aleph','Borges','Paidos',15);
insert into libros (titulo, autor,editorial,precio)
  values('Matemática estas ahi','Paenza','Paidos',10);
insert into libros (titulo, autor,editorial)
  values('Antologia','Borges','Paidos');
insert into libros (titulo, editorial)
  values('El gato con botas','Paidos');
insert into libros (titulo, autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',90);

select titulo from libros
  where precio<50;

select titulo from libros
  where precio >=50;

select titulo,
  if(precio>50,'caro','economico')
  from libros;

select autor, count(*)
  from libros
  group by autor;

select autor, count(*)
  from libros
  group by autor
  having count(*)>1;

-- mostrar cada autor y un mensaje si tiene 1 o más de un libro
select autor,
  if (count(*)>1,'Más de 1','1')
  from libros
  group by autor;

select autor,
  if (count(*)>1,'Más de 1','1') as cantidad
  from libros
  group by autor
  order by cantidad;

select editorial,
  if (count(*)>4,'5 o más','menos de 5') as cantidad
  from libros
  group by editorial
  order by cantidad;