drop table if exists libros;

create table libros(
  codigo integer auto_increment,
  titulo varchar(50),
  autor varchar(50),
  editorial varchar(25),
  primary key (codigo)
 );

describe libros;

insert into libros (titulo,autor,editorial)
  values('El aleph','Borges','Planeta');

select * from libros libros;

insert into libros (titulo,autor,editorial)
  values('Martin Fierro','Jose Hernandez','Emece');
insert into libros (titulo,autor,editorial)
  values('Aprenda PHP','Mario Molina','Emece');
insert into libros (titulo,autor,editorial)
  values('Cervantes y el quijote','Borges','Paidos');
insert into libros (titulo,autor,editorial)
  values('Matematica estas ahi', 'Paenza', 'Paidos');

select codigo,titulo,autor,editorial from libros;

insert into libros (codigo,titulo,autor,editorial)
  values(6,'Martin Fierro','Jose Hernandez','Paidos');

insert into libros (codigo,titulo,autor,editorial)
  values(2,'Martin Fierro','Jose Hernandez','Planeta');

insert into libros (codigo,titulo,autor,editorial)
  values(15,'Harry Potter y la piedra filosofal','J.K. Rowling','Emece');

insert into libros (titulo,autor,editorial)
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece');

insert into libros (codigo,titulo,autor,editorial)
  values(0,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');

insert into libros (codigo,titulo,autor,editorial)
  values(-5,'Alicia a traves del espejo','Lewis Carroll','Planeta');

select * from libros;