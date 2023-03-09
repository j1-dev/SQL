 -- Eliminamos la tabla, si existe y la creamos:
 drop table if exists empleados;

 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos int,
  seccion varchar(20),
  primary key(documento)
 );

--  Ingrese algunos registros:
 insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
 insert into empleados values('22333333','Luis','Lopez',700,0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',1200,3,'Secretaria');


 drop procedure if exists pa_cantidad_hijos;
 
 -- Creamos un procedimiento que recibe un número de documento y un entero 
 -- como parámetro de entrada y salida
 delimiter //
 create procedure pa_cantidad_hijos(
   in p_documento char(8),
   inout cantidad int)
 begin
   select cantidadhijos+cantidad into cantidad 
     from empleados
     where documento=p_documento;
 end //
 delimiter ;
 
 -- Iniciamos un acumulador en cero
 set @cant=0;
 -- Calculamos la cantidad de hijos que tiene '22222222'
 call pa_cantidad_hijos('22222222',@cant); 
 select @cant; -- muestra un 2
 
 -- Acumulamos en @cant la cantidad de hijos de '22222222' y '22666666'
 call pa_cantidad_hijos('22666666',@cant);
 select @cant; -- muestra un 5