/*
Se debe retornar nombre de la película, la calificación promedio numérica y calificación en texto (Entre 1 y 2: Mala - 
entre 3 y 4: Buena - Mayor a 4: Excelente) y el número de calificaciones, todo en un mismo texto.

Ejemplo: "Power Rangers - Calificación: Buena (3,2) - Basada en 7 puntuaciónes".
*/

create or replace function promedio_calificacion_peliculas(p_id_pelicula number) 
return varchar is

    v_nombre_pelicula varchar(55);
    v_calificacion_txt varchar(55);
    
    --Variables para el promedio
    v_puntuacion number;
    v_contador number;
    v_promedio number;
    
    v_resultado varchar(255);


BEGIN

    select TITULO into v_nombre_pelicula from PELICULA where IDPELICULA = p_id_pelicula;
    
    select sum(PUNTUACION) into v_puntuacion from opinion where idpelicula = p_id_pelicula;
    select count(PUNTUACION) into v_contador from OPINION where IDPELICULA = p_id_pelicula;
    --select count(IDPELICULA) into v_contador from opinion where idpelicula = 5;
    v_promedio := v_puntuacion / v_contador;
    
    
    if v_puntuacion between 1 and 2 then
        v_calificacion_txt := 'Mala';
    elsif v_puntuacion between 3 and 4 then
        v_calificacion_txt := 'Buena';
    elsif v_puntuacion = 5 then
       v_calificacion_txt := 'Excelente';
    end if;


    v_resultado := v_nombre_pelicula ||' Calificación: '||v_calificacion_txt||'('||v_promedio||')'||' Basado en '||v_contador||' puntaciones';


    return v_resultado;

END;

--select promedio_calificacion_peliculas(5) from dual

--Para probar el funcionamiento con todas las películas de la tabla:    
--select promedio_calificacion_peliculas(p.idpelicula), p.titulo
--from pelicula p



