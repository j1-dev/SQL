
create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2) unsigned,
  primary key (codigo)
 );

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Planeta',15);
insert into libros (titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',22.20);
insert into libros (titulo,autor,editorial,precio)
  values('Antologia poetica','Borges','Planeta',40);
insert into libros (titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Emece',18.20);
insert into libros (titulo,autor,editorial,precio)
  values('Cervantes y el quijote','Borges','Paidos',36.40);
insert into libros (titulo,autor,editorial,precio)
  values('Manual de PHP', 'J.C. Paez', 'Paidos',30.80);
insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00);
insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null);

-- recuperar 4 libros desde el registro cero:
select * from libros limit 0,4;

-- recuperar 4 libros a partir del registro 5
select * from libros limit 5,4;

-- recuperar 8 libros desde el principio
select * from libros limit 8;

-- para recuperar 10000 registros o hasta el final de la tabla a partir
-- del registro 6
select * from libros limit 6,10000;

-- para eliminar los 2 registros con precio más bajo
delete from libros
  order by precio
  limit 2;

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Planeta',15);

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Planeta',15);
insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Planeta',15);

select * from libros
  where titulo='El aleph' and
  autor='Borges' and
  editorial='Planeta';

-- eliminamos 2 registros
delete from libros
  where titulo='El aleph' and
  autor='Borges' and
  editorial='Planeta'
  limit 2;

select * from libros
  where titulo='El aleph' and
  autor='Borges' and
  editorial='Planeta';