-- 1.- Dada una determinada opinión, si esta fue de 1 o 2 puntos llenar una variable con el valor "Mala". Si fue de 3 o 4 puntos 
-- "Buena" y si fue de 5 puntos "Excelente". Luego imprimir el resultado junto al título de la película.
/*
DECLARE 

v_puntuacion opinion.puntuacion%type;
v_titulo pelicula.titulo%type;
v_opinion varchar(10);

BEGIN


select opinion.puntuacion, pelicula.titulo
into v_puntuacion, v_titulo 
from opinion 
inner join pelicula on OPINION.IDPELICULA = pelicula.idpelicula
where opinion.IDOPINION = 26;


if v_puntuacion BETWEEN 1 and 2 THEN
    v_opinion := 'Mala';
    dbms_output.put_line(v_opinion);
    
elsif  v_puntuacion BETWEEN 3 and 4 THEN
    v_opinion := 'Buena';
    dbms_output.put_line(v_opinion);
        
elsif  v_puntuacion = 5 THEN
    v_opinion := 'Exelente';
    dbms_output.put_line(v_opinion);
        
end if;

END;
*/

-- 2.- Calcular la potencia de un número cualquiera e imprimir el resultado. Ejemplo: 2^4 = 16.

DECLARE 

v_numero number := 5;
v_elevado_a number := 8;
v_resultado number := 1;

BEGIN

for i in 1..v_elevado_a loop

    v_resultado := v_resultado * v_numero;
    dbms_output.put_line(v_resultado);

end loop;

END;



