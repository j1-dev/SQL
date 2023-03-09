drop table if exists visitantes;

create table visitantes(
  nombre varchar(30),
  edad integer unsigned,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra float unsigned
 );

describe visitantes;