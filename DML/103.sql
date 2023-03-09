drop procedure if exists pa_sumar;

delimiter //
create procedure pa_sumar(
  in v1 int,
  in v2 int)
begin
  declare suma int;
  set suma=v1+v2;
  select suma;  
end //
delimiter ;

call pa_sumar(4,5);