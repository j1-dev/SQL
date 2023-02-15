drop table if exists comidas, postres;

 create table comidas(
  codigo tinyint unsigned auto_increment,
  nombre varchar(30),
  precio decimal(4,2) unsigned,
  primary key (codigo)
 );

 create table postres(
  codigo tinyint unsigned auto_increment,
  nombre varchar(30),
  precio decimal(4,2) unsigned,
  primary key (codigo)
 );

 insert into comidas values(1,'milanesa y fritas',3.4);
 insert into comidas values(2,'arroz primavera',2.5);
 insert into comidas values(3,'pollo',2.8);

 insert into postres values(1,'flan',1);
 insert into postres values(2,'porcion de torta',2.1);
 insert into postres values(3,'gelatina',0.9);

 -- Empleamos "cross join" para obtener el producto cartesiano de ambas tablas:
 select c.*,p.*
  from comidas as c
  cross join postres as p;

 -- Retorna el mismo resultado que un simple "join" sin parte "on",
 -- es decir, si condición de enlace:
 select c.*,p.*
  from comidas as c
  join postres as p;

 -- Para obtener el nombre del plato principal, del postre y el precio total de 
 -- cada combinación (menú) tipeamos la siguiente sentencia:
 select c.nombre,p.nombre,
  c.precio+p.precio as total
  from comidas as c
  cross join postres as p;


 drop table comidas;

 -- Creamos la tabla "comidas" con la siguiente estructura:
 create table comidas(
  codigo tinyint unsigned auto_increment,
  nombre varchar(30),
  rubro varchar(20),/*plato principal y postre*/
  precio decimal (5,2) unsigned,
  primary key(codigo)
 );

 -- Ingresamos algunos registros:
 insert into comidas values(1,'milanesa y fritas','plato principal',3.4);
 insert into comidas values(2,'arroz primavera','plato principal',2.5);
 insert into comidas values(3,'pollo','plato principal',2.8);
 insert into comidas values(4,'flan','postre',1);
 insert into comidas values(5,'porcion de torta','postre',2.1);
 insert into comidas values(6,'gelatina','postre',0.9);

-- Podemos obtener la combinación de platos principales con postres
-- empleando un "cross join" con una sola tabla:
 select c1.nombre,c1.precio,c2.nombre,c2.precio
  from comidas as c1
  cross join comidas as c2
  where c1.rubro='plato principal' and
  c2.rubro='postre';
 -- Note que utilizamos 2 alias para la misma tabla y empleamos
 -- un "where" para combinar el "plato principal" con el "postre".

 -- Si queremos el monto total de cada combinación:
 select c1.nombre,c2.nombre,
  c1.precio+c2.precio as total
  from comidas as c1
  cross join comidas as c2
  where c1.rubro='plato principal' and
  c2.rubro='postre';