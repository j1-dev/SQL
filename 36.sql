drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(60) not null,
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

-- Queremos averiguar la cantidad de libros agrupados por editorial:
select editorial, count(*) from libros
  group by editorial;

-- Queremos conocer la cantidad de libros agrupados por editorial pero considerando
-- sólo los que devuelvan un valor mayor a 2
select editorial, count(*) from libros
  group by editorial
  having count(*)>2;

-- Necesitamos el promedio de los precios de los libros agrupados por editorial:
select editorial, avg(precio)
  from libros
  group by editorial;

-- sólo queremos aquellos cuyo promedio supere los 25 pesos:
select editorial, avg(precio)
  from libros
  group by editorial
  having avg(precio)>25;

-- Queremos contar los registros agrupados por editorial sin tener en cuenta
-- a la editorial "Planeta"
select editorial, count(*) from libros
  where editorial<>'Planeta'
  group by editorial;
select editorial, count(*) from libros
  group by editorial
  having editorial<>'Planeta';

 -- Queremos la cantidad de libros, sin tener en cuenta los que tienen precio nulo,
 -- agrupados por editorial, rechazando los de editorial "Planeta"
select editorial, count(*) from libros
  where precio is not null
  group by editorial
  having editorial<>'Planeta';

-- promedio de los precios agrupados por editorial, de aquellas editoriales
-- que tienen más de 2 libros 
select editorial, avg(precio) from libros
  group by editorial
  having count(*) > 2; 

-- mayor valor de los libros agrupados por editorial y luego seleccionar las filas
-- que tengan un valor mayor o igual a 30 
select editorial, max(precio)
  from libros
  group by editorial
  having max(precio)>=30; 

-- Para esta misma sentencia podemos utilizar un "alias" para hacer referencia a la
-- columna de la expresión
select editorial, max(precio) as 'mayor'
  from libros
  group by editorial
  having mayor>=30; 