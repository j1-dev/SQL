drop table if exists vehiculos;

create table vehiculos(
  patente char(6) not null,
  tipo char(4),
  horallegada time not null,
  horasalida time,
  primary key(patente,horallegada)
 );

describe vehiculos;

insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('ACD123','auto','8:30','9:40');
insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('AKL098','auto','8:45','11:10');
insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('HGF123','auto','9:30','11:40');
insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('DRT123','auto','15:30',null);
insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('FRT545','moto','19:45',null);
insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('GTY154','auto','20:30','21:00');

describe vehiculos;

insert into vehiculos (patente,tipo,horallegada,horasalida)
   values('ACD123','auto','16:00',null);

-- Intentamos ingresar un vehículo con clave primaria repetida:
insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('ACD123','auto','16:00',null);

-- Si ingresamos un registro con hora de ingreso repetida, no hay problemas,
-- siempre que la patente sea diferente
insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('ADF123','moto','8:30','10:00');

-- Intentamos eliminar el campo "horallegada"
-- No se puede porque quedarían registros con clave repetida.
alter table vehiculos drop horallegada;

-- Elimine los registros con patente "ACD123":
delete from vehiculos
  where patente='ACD123';

-- Intentamos nuevamente eliminar el campo "horallegada"
-- Ahora si lo permite.
alter table vehiculos drop horallegada;

describe vehiculos;