drop table if exists libros;

create table libros(
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15),
  precio float
);

insert into libros (titulo,autor,editorial,precio) values ('El aleph','Borges','Planeta',12.50);
insert into libros (titulo,autor,editorial,precio) values ('Martin Fierro','Jose Hernandez','Emece',16.00);
insert into libros (titulo,autor,editorial,precio) values ('Aprenda PHP','Mario Molina','Emece',35.40);
insert into libros (titulo,autor,editorial,precio) values ('Cervantes','Borges','Paidos',50.90);

select titulo, autor,editorial,precio from libros;

select titulo, autor,editorial,precio from libros where autor<>'Borges';

select titulo, autor,editorial,precio from libros where precio>20;

select titulo,autor,editorial,precio from libros where precio<=30;