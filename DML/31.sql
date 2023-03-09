drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2) unsigned,
  primary key(codigo)
 );

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Planeta',15.50);
insert into libros (titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',22.90);
insert into libros (titulo,autor,editorial,precio)
  values('Antologia poetica','J.L. Borges','Planeta',39);
insert into libros (titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Emece',19.50);
insert into libros (titulo,autor,editorial,precio)
  values('Cervantes y el quijote','Bioy Casare- J.L. Borges','Paidos',35.40);
insert into libros (titulo,autor,editorial,precio)
  values('Manual de PHP', 'J.C. Paez', 'Paidos',19);
insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00);
insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',36.00);

select * from libros
  where autor='Borges';

select * from libros
  where autor like '%Borges%';

select * from libros
 where titulo like 'A%';

select * from libros
  where titulo not like 'A%';

select * from libros
  where autor like '%Carrol_';

select * from libros
  where titulo like '%Harry Potter%';

select * from libros
  where titulo like '%PHP%';