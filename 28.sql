drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal (5,2) unsigned,
  primary key (codigo)
 );

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Planeta',15.50);
insert into libros (titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',22.90);
insert into libros (titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Planeta',39);
insert into libros (titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Emece',19.50);
insert into libros (titulo,autor,editorial,precio)
  values('Cervantes y el quijote','Borges','Paidos',35.40);
insert into libros (titulo,autor,editorial,precio)
  values('Matematica estas ahi', 'Paenza', 'Paidos',19);

select codigo,titulo,autor,editorial,precio
  from libros
  order by titulo;

select codigo,titulo,autor,editorial,precio
 from libros
 order by 5;

select codigo,titulo,autor,editorial,precio
  from libros
  order by titulo, editorial;

select codigo,titulo,autor,editorial,precio
  from libros
  order by titulo asc, editorial desc;