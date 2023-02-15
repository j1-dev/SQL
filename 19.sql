drop table if exists vehiculos;

create table vehiculos(
  patente char(6) not null,
  tipo char (4),
  horallegada time not null,
  horasalida time
 );

insert into vehiculos (patente,tipo,horallegada) values ('ACD123','auto','8:30');
insert into vehiculos (patente,tipo,horallegada) values('BGF234','moto','8:35');
insert into vehiculos (patente,tipo,horallegada) values('KIU467','auto','9:40');

select * from vehiculos;

update vehiculos set horasalida='11:45'
  where patente='ACD123';

insert into vehiculos values('LIO987','auto','10',null);

select * from vehiculos;