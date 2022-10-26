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