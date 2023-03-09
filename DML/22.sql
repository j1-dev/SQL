drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  editorial varchar(15),
  autor varchar(30) default 'Desconocido',
  precio decimal(5,2) unsigned default 1.11,
  cantidad mediumint unsigned not null,
  primary key (codigo)
 );

insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Java en 10 minutos','Juan Pereyra','Paidos',25.7,100);

-- error debido a que el campo titulo es de tipo not null
insert into libros (autor,editorial,precio,cantidad)
  values('Juan Perez','Planeta',28.50,50);

-- se guarda null en el campo editorial
insert into libros (titulo,autor,precio,cantidad)
  values('Aprenda PHP','Alberto Lopez',55.40,150);

-- se guarda el valor por defecto 'Desconocido' en el campo autor
insert into libros (titulo,editorial,precio,cantidad)
  values ('El gato con botas','Emece',15.6,150);

-- se guarda en precio el valor definido en default
insert into libros (titulo,autor,editorial,cantidad)
  values ('El aleph','Borges','Emece',200);

-- error debido a que no indicamos el campo cantidad que es not null
insert into libros (titulo,autor,editorial,precio)
  values('Alicia a traves del espejo','Lewis Carroll', 'Emece',34.5);

-- Se guarda en precio 1.11 porque indicamos almacenar default
insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('El gato con botas',default,'Planeta',default,100);

select * from libros;