drop table if exists libros;

SET sql_mode = '';

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(20) not null,
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2) unsigned,
  cantidad mediumint unsigned not null,
  primary key(codigo)
 );

insert into libros (titulo,autor,precio)
  values('El aleph','Borges',23.6);

select * from libros;

insert into libros (autor,editorial,cantidad)
  values('Borges','Planeta',100);

select * from libros;