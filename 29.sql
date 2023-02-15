drop table if exists libros;

create table libros(
  codigo int unsigned  auto_increment,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2),
  primary key(codigo)
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


select * from libros
  where autor='Borges' and
  precio<=20;

select * from libros
  where autor='Paenza' or
  editorial='Planeta';

select * from libros
  where (autor='Borges') xor
  (editorial='Planeta');

select * from libros
  where not (editorial='Planeta');

select * from libros
  where (autor='Borges') or
  (editorial='Paidos' and precio<20);

select * from libros
  where (autor='Borges' or editorial='Paidos')
  and (precio<20);