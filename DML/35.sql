drop table if exists visitantes;

create table visitantes(
  nombre varchar(30),
  edad tinyint unsigned,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal (6,2) unsigned
 );

insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Susana Molina', 28,'f','Colon 123','Cordoba',null,45.50); 
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30);

-- Para saber la cantidad de visitantes que tenemos de cada ciudad tipeamos:
select ciudad, count(*)
  from visitantes
  group by ciudad;

-- Necesitamos conocer la cantidad visitantes con teléfono no nulo, de cada ciudad:
select ciudad, count(telefono)
 from visitantes
  group by ciudad;

-- Queremos conocer el total de las compras agrupadas por sexo:
select sexo, sum(montocompra) from visitantes
  group by sexo;

-- Para obtener el máximo y mínimo valor de compra agrupados por sexo:
select sexo, max(montocompra) from visitantes
  group by sexo;
select sexo, min(montocompra) from visitantes
  group by sexo;
  
-- Se pueden simplificar las 2 sentencias anteriores en una sola sentencia, ya que usan el mismo "group by":
select sexo, max(montocompra),
  min(montocompra)
  from visitantes
  group by sexo;

-- Queremos saber el promedio del valor de compra agrupados por ciudad:
select ciudad, avg(montocompra) from visitantes
  group by ciudad;

-- Contamos los registros y agrupamos por 2 campos, "ciudad" y "sexo":
select ciudad, sexo, count(*) from visitantes
  group by ciudad,sexo;

-- Limitamos la consulta, no incluimos los visitantes de "Cordoba", contamos y agrupar por ciudad:
select ciudad, count(*) from visitantes
  where ciudad<>'Cordoba'
  group by ciudad;
