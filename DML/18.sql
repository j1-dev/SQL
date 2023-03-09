drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(20) not null,
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2) unsigned,
  cantidad smallint unsigned,
  primary key (codigo)
 );

describe libros;