drop function if exists f_estrellas;

delimiter //
create function f_estrellas(
  cant tinyint)
  returns varchar(15)
  deterministic
 begin
   declare estrellas varchar(15) default '';
   declare x int default 0;
   while x<cant do
     set estrellas=concat(estrellas,'*');
     set x=x+1;
   end while;
   return estrellas;
 end //
 delimiter ; 
 
 select url,f_estrellas(estrellas) from sitios;