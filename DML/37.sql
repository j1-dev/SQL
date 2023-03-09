drop table if exists libros;

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
  values('Martin Fierro','Jose Hernandez','Planeta',42.20);
insert into libros (titulo,autor,editorial,precio)
  values('Antologia poetica','Borges','Planeta',40);
insert into libros (titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Emece',18.20);
insert into libros (titulo,autor,editorial,precio)
  values('Cervantes y el quijote','Bioy Casares- Borges','Paidos',36.40);
insert into libros (titulo,autor,editorial,precio)
  values('Manual de PHP', null, 'Paidos',30.80);
insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Planeta',45.00);
insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la camara secreta','J.K. Rowling','Planeta',46.00);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',12.10);

-- Para obtener la lista de autores sin repetición usamos "distinct"
select distinct autor
  from libros;

-- Si sólo queremos la lista de autores conocidos, es decir, 
-- no queremos incluir "null" en la lista
select distinct autor
  from libros
  where autor is not null;

-- Para contar los distintos autores, sin considerar el valor "null"
select count(distinct autor)
  from libros;

-- contamos los autores sin "distinct", no incluirá los valores "null"
-- pero si los repetidos:
select count(autor)
  from libros;

-- los nombres de las editoriales 
select editorial
  from libros;

-- Nombres de las editoriales sin repetición
select distinct editorial
  from libros;

--  cantidad de editoriales distintas 
select count(distinct editorial)
 from libros;

-- distintos autores de la editorial "Planeta"
select distinct autor from libros
  where editorial='Planeta';

-- contar la cantidad de autores distintos de cada editorial 
-- podemos usar "distinct" y "group by"
select editorial,count(distinct autor)
  from libros
  group by editorial;

-- mostrar los títulos y editoriales de los libros sin repetir
-- títulos ni editoriales
select distinct titulo,editorial
  from libros
  order by titulo;