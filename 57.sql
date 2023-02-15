drop table if exists postulantes;

create table postulantes(
  numero int unsigned auto_increment,
  documento char(8),
  nombre varchar(30),
  sexo char(1),
  estudios enum('ninguno','primario','secundario', 'terciario','universitario') not null,
  primary key(numero)
 );

insert into postulantes (documento,nombre,sexo,estudios)
  values('22333444','Ana Acosta','f','primario');
insert into postulantes (documento,nombre,sexo,estudios)
  values('22433444','Mariana Mercado','m','universitario');
-- Ingresamos un registro sin especificar valor para "estudios", guardará el valor por defecto:
insert into postulantes (documento,nombre,sexo)
  values('24333444','Luis Lopez','m');

select * from postulantes;

insert into postulantes (documento,nombre,sexo,estudios)
   values('2455566','Juana Pereyra','f',5);

-- Si ingresamos un valor no presente en la lista produce error en las nuevas versiones
-- de MySQL
insert into postulantes (documento,nombre,sexo,estudios)
  values('24678907','Pedro Perez','m','Post Grado');

insert into postulantes (documento,nombre,sexo,estudios)
   values('22222333','Susana Pereyra','f',6);
insert into postulantes (documento,nombre,sexo,estudios)
  values('25676567','Marisa Molina','f',0);

select * from postulantes
  where estudios=0;

select * from postulantes
  where estudios='universitario';

insert into postulantes (documento,nombre,sexo,estudios)
  values('25676567','Marisa Molina','f',null);

select * from postulantes;