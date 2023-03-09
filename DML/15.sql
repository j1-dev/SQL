drop table if exists libros;

create table libros(
  codigo integer unsigned auto_increment,
  titulo varchar(20) not null,
  autor varchar(30),
  editorial varchar(15),
  precio float unsigned,
  cantidad integer unsigned,
  primary key (codigo)
 );

describe libros;