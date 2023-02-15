drop table if exists usuarios;

create table usuarios (
  nombre varchar(20),
  clave varchar(10),
  primary key (nombre)
 );

describe usuarios;

insert into usuarios (nombre, clave) values ('Leonardo','payaso');
insert into usuarios (nombre, clave) values ('MarioPerez','Marito');
insert into usuarios (nombre, clave) values ('Marcelo','River');
insert into usuarios (nombre, clave) values ('Gustavo','River');

insert into usuarios (nombre, clave) values ('Gustavo','Boca');