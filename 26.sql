drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar (20),
  precio decimal(5,2) unsigned,
  primary key(codigo)
 );

insert into libros (titulo,autor,editorial,precio)
  values('El alehp','Borges','Paidos',33.46);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','L. Carroll','Planeta',16.31);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia a traves del espejo','L. Carroll','Planeta',18.89);

select titulo, ceiling(precio),floor(precio)
  from libros;

select titulo, round(precio)
  from libros;

select titulo,truncate(precio,1)
  from libros;