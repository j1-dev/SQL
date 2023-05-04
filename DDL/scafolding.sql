-- CURSORES

DELIMITER //
CREATE PROCEDURE cursor_ejemplo()
BEGIN
  -- Declarar variables
  DECLARE id INT;
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE cur CURSOR FOR SELECT id FROM whatever;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  -- Abrir cursor
  OPEN cur;

  -- Empezar bucle
  read_loop: LOOP
    -- Fetch del cursor a una de las variables
    FETCH cur INTO id;

    -- Si ha acabado, salir
    IF done THEN
      LEAVE read_loop;
    END IF;

    -- Funcionalidad del cursor
    SELECT AVG(nota) INTO media FROM notas WHERE id_alumno = id GROUP BY id_alumno;
    INSERT INTO notas_medias VALUES (id, media);

  END LOOP;

  -- Cerrar cursor
  CLOSE cur;
END //
DELIMITER ;

-- TRIGGERS

DROP TRIGGER IF EXISTS pendientes_recuperar;
DELIMITER //
-- Trigger despues de insert
CREATE TRIGGER pendientes_recuperar
  AFTER INSERT ON notas
    -- Bucle que maneja cada fila cambiada
    FOR EACH ROW
    BEGIN
    IF NEW.nota < 5 THEN
      INSERT INTO alumnos_a_recuperar (id_alumno, id_modulo, nombre, apellido1)
      
      SELECT alumnos.id_alumno, NEW.id_modulo, alumnos.nombre, alumnos.apellido1
        FROM alumnos WHERE alumnos.id_alumno = NEW.id_alumno;
    END IF;
END //
DELIMITER ;