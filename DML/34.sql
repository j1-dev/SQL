drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2) unsigned,
  cantidad mediumint unsigned,
  primary key(codigo)
 );

insert into libros (titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Planeta',15,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Antologia poetica','J.L. Borges','Planeta',40,150);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Aprenda PHP','Mario Molina','Emece',18.20,200);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',36.40,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Manual de PHP', 'J.C. Paez', 'Paidos',30.80,120);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00,50);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null,200);

select sum(cantidad) from libros;

select sum(cantidad) from libros
  where editorial ='Planeta';

select max(precio) from libros;

select * from libros
  order by precio desc;

select min(precio) from libros
  where autor like '%Rowling%';

select * from libros
  where autor like '%Rowling%'
  order by 5;

select avg(precio) from libros
  where titulo like '%PHP%';

select * from libros
  where titulo like '%PHP%';

select count(*) from libros;

select count (*) from libros;