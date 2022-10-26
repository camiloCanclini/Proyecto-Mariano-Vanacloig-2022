SELECT * FROM fechas;

SELECT * FROM equipos;

ALTER TABLE fechas CHANGE `fk_idEquipo 1` `fk_idEquipo1` INT(11); 

SELECT id,canchas.direccion, fecha, t2.nombreEquipo, t3.nombreEquipo, desde_hs, hasta_hs FROM fechas 
LEFT OUTER JOIN canchas ON fechas.fk_idCancha = canchas.idCancha
LEFT OUTER JOIN equipos t2 ON fechas.fk_idEquipo1 = t2.idEquipo
LEFT OUTER JOIN equipos t3 ON fechas.fk_idEquipo2 = t3.idEquipo;

SELECT * FROM fechas 
LEFT OUTER JOIN canchas ON fechas.fk_idCancha = canchas.idCancha
LEFT OUTER JOIN equipos t2 ON fechas.fk_idEquipo1 = t2.idEquipo
LEFT OUTER JOIN equipos t3 ON fechas.fk_idEquipo2 = t3.idEquipo;

DELETE FROM `fechas` WHERE `id` = '$id';

UPDATE fechas SET fk_idEquipo1 = 2, fk_idEquipo2 = 2, fk_idCancha = 1, fecha = '2020-10-10', desde_hs = '00:00', hasta_hs = '00:00' WHERE id = 7;

UPDATE `fechas` SET `fk_idEquipo1` = '2', `fk_idEquipo2` = '2', `fk_idCancha` = 'cancha', `fecha` = '2022-12-10', `desde_hs` = '12:00', `hasta_hs` = '12:00' WHERE `id` = '1';

UPDATE `fechas` SET `fk_idEquipo1` = '1', `fk_idEquipo2` = '1', `fk_idCancha` = 'cancha', `fecha` = '2022-11-14', `desde_hs` = '20:00:00', `hasta_hs` = '23:00:00' WHERE `id` = '1';