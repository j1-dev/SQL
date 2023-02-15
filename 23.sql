drop table if exists libros;

create table libros(
  codigo int(6) zerofill auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2) unsigned,
  cantidad smallint zerofill,
  primary key (codigo)
 );

insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Martin Fierro','Jose Hernandez','Planeta',34.5,200);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Aprenda PHP','Mario Molina','Emece',45.7,50);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Cervantes y el quijote','Borges','Paidos',23,40);

select * from libros;

insert into libros (codigo,titulo,autor,editorial,precio,cantidad)
  values('545','El aleph', 'Borges', 'Emece',33,20);

select * from libros;

-- genera un error en versiones nuevas de MySQL 8.0 ya que no permite valores negativos con zerofill
insert into libros (codigo,titulo,autor,editorial,precio,cantidad)
  values(-400,'Matematica estas ahi', 'Paenza', 'Paidos',15.2,-100);

select * from libros;