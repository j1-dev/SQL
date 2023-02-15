drop table if exists usuarios;

create table usuarios (
  nombre varchar(30),
  clave varchar(10)
);

describe usuarios;

insert into usuarios (nombre, clave) values ('Leonardo','payaso');
insert into usuarios (nombre, clave) values ('MarioPerez','Marito');
insert into usuarios (nombre, clave) values ('Marcelo','bocajunior');
insert into usuarios (nombre, clave) values ('Gustavo','bocajunior');

select nombre, clave from usuarios;

select nombre, clave from usuarios where nombre='Leonardo';

select nombre, clave from usuarios where clave='bocajunior';

select nombre, clave from usuarios where clave='river';