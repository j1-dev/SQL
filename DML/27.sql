create table prestamos(
  titulo varchar(40) not null,
  documento char(8) not null,
  fechaprestamo date not null,
  fechadevolucion date,
  devuelto char(1) default 'n'
 );

insert into prestamos (titulo,documento,fechaPrestamo,fechaDevolucion)
  values ('Manual de 1 grado','23456789','2006-08-10',date_add('2006-08-10', interval 5 day));

select * from prestamos;

insert into prestamos (titulo,documento,fechaPrestamo,fechaDevolucion)
  values ('Alicia en el pais de las maravillas','23456789',
'2006-08-12',date_add('2006-08-12', interval 5 day));
insert into prestamos (titulo,documento,fechaPrestamo,fechaDevolucion)
  values ('El aleph','22543987','2006-08-15',date_add('2006-08-15', interval 5 day));
insert into prestamos (titulo,documento,fechaPrestamo,fechaDevolucion)
  values ('Manual de geografia 5 grado','25555666','2006-08-30',
date_add('2006-08-30', interval 5 day));

select * from prestamos;

insert into prestamos (titulo,documento,fechaPrestamo,fechaDevolucion)
  values ('Atlas universal','24000111',current_date,date_add(current_date, interval 5 day));

select * from prestamos;