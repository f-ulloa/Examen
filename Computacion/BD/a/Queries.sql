/* a.	Nombre de la persona que más sanciones (de cualquier tipo) ha recibido. */

select persona.nombre
from persona
         JOIN (select sancion.id_sancionado, count(sancion.id_sancionado)
               from sancion
               group by sancion.id_sancionado
               order by count DESC
               limit 1) x ON x.id_sancionado = persona.id;


/* b.	Fechas de juegos que no hayan tenido ningún espectador. */
SELECT p.fecha_hora_inicio
FROM partida p
         left join participa par on par.id_partida = p.id
         left join persona per on per.id = par.id_persona
         left join persona_rol pr on pr.id_persona = per.id
         left join rol r on pr.id_rol = r.id
GROUP BY p.fecha_hora_inicio
HAVING count(CASE WHEN r.nombre_rol IN ('Espectador', 'OT', 'PS') THEN per.id END) = 0;


/* c.	Nombre y nacionalidad de los equipos que tienen jugadores de reserva. */
