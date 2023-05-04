/* Tenemos que hacer dos cursores, con uno nos recorreremos cada vehículo (cursor
externo) y para cada vehículo nos recorreremos cada una de sus visitas al taller
(cursor interno) para llevar a cabo la actualización de puntos de fidelización.*/
drop database if exists norauto;
create database norauto;
use norauto;
create table vehiculos (
	id_matricula char(7) primary key,
    marca varchar (10),
    modelo varchar (10),
    puntos int default 0);
    
create table visitas (
	id_matricula char(7),
    fecha_visita date,
    importe_factura decimal(7,2),
    primary key (id_matricula, fecha_visita));
    
insert into vehiculos (id_matricula, marca, modelo) values ('0978BLT', 'Seat', 'Ibiza Tdi');
insert into vehiculos (id_matricula, marca, modelo) values ('1234CFS', 'Ferrari', 'Testarazo');
insert into vehiculos (id_matricula, marca, modelo) values ('3342LRQ', 'Toyota', 'CHR 185');

insert into visitas values ('3342LRQ', '2021-04-02', 328);
insert into visitas values ('0978BLT', '2022-09-12', 122);
insert into visitas values ('1234CFS', '2022-11-05', 3482);

select * from vehiculos;
select * from visitas;

DELIMITER //
DROP PROCEDURE IF EXISTS actualiza_puntos //
CREATE PROCEDURE actualiza_puntos()
BEGIN
    DECLARE done INT;
    DECLARE var_id_matricula CHAR(7);
    DECLARE var_id_matricula2 CHAR(7);
    DECLARE var_importe_factura DECIMAL(7,2);
    DECLARE cursor_vehiculos CURSOR FOR SELECT id_matricula FROM vehiculos;
    DECLARE cursor_visitas CURSOR FOR SELECT id_matricula, importe_factura FROM visitas where id_matricula = var_id_matricula; 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    set done = false;
    OPEN cursor_vehiculos;
    bucle_vehiculos: LOOP
        FETCH cursor_vehiculos INTO var_id_matricula;
        IF done THEN
            LEAVE bucle_vehiculos;
        END IF;
        OPEN cursor_visitas;
		        bucle_visitas: LOOP
              FETCH cursor_visitas INTO var_id_matricula2, var_importe_factura;
              IF done THEN
                LEAVE bucle_visitas;
              END IF;
              IF var_id_matricula2 = var_id_matricula THEN
                update vehiculos set puntos = puntos + round(var_importe_factura / 10, 0) where (id_matricula = var_id_matricula);
			        END IF;
            END LOOP bucle_visitas;
        set done = false;
        CLOSE cursor_visitas;
    END LOOP bucle_vehiculos;
    CLOSE cursor_vehiculos;
END //

DELIMITER ;

call actualiza_puntos();
select * from vehiculos;
select * from visitas;