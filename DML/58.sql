drop table if exists postulantes;

create table postulantes(
  numero int unsigned auto_increment,
  documento char(8),
  nombre varchar(30),
  idioma set('ingles','italiano','portuges'),
  primary key(numero)
 );

insert into postulantes (documento,nombre,idioma)
  values('22555444','Ana Acosta','ingles');

insert into postulantes (documento,nombre,idioma)
  values('23555444','Juana Pereyra','ingles,italiano');

insert into postulantes (documento,nombre,idioma)
  values('25555444','Andrea Garcia','italiano,ingles');

insert into postulantes (documento,nombre,idioma)
  values('27555444','Diego Morales','italiano,ingles,italiano');

insert into postulantes (documento,nombre,idioma)
  values('27555464','Diana Herrero','frances');

insert into postulantes (documento,nombre,idioma)
  values('28255265','Pedro Perez',0);
insert into postulantes (documento,nombre,idioma)
  values('22255260','Nicolas Duarte',8);

insert into postulantes (documento,nombre)
  values('28555464','Ines Figueroa');

insert into postulantes (documento,nombre,idioma)
  values('29255265','Esteban Juarez',7);

select * from postulantes
  where idioma like '%ingles%';

select * from postulantes
  where idioma like '%ingles,italiano%';

select * from postulantes
  where idioma like '%italiano,ingles%';

select * from postulantes
  where find_in_set('ingles',idioma)>0;

select * from postulantes
  where idioma='ingles';

select * from postulantes
  where idioma=1;

select * from postulantes
  where idioma=7;

select * from postulantes
  where idioma not like '%ingles%';
select * from postulantes
  where not find_in_set('ingles',idioma)>0;