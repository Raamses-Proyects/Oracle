-- 1.- Traer e imprimir el año de estreno más alto.
/*
declare 
v_año number;
begin

select max(año) into v_año from pelicula;
dbms_output.put_line(v_año);

end;
*/


-- 2.- Traer la descripción de la película "Coco". Si es nula, reemplazarlo por "-Sin descripción-"
/*
declare
v_descripcion PELICULA.DESCRIPCION%type;
begin

select nvl(to_char(descripcion), '-Sin descripción-') into v_descripcion from pelicula where titulo = 'Coco';
dbms_output.put_line(v_descripcion);

end;
*/

-- 3.- Armar e imprimir una descripción corta de cualquier película con el siguiente formato: (año de estreno) - Primeros 
--40 caracteres de la descripción...

DECLARE 
v_datos PELICULA%rowtype;
BEGIN

select * into v_datos from pelicula where idpelicula = 1;
dbms_output.put_line('('||v_datos.año||') - '||SUBSTR(v_datos.descripcion, 1, 40)||'...');
--dbms_output.put_line('El años es: '||v_datos.AÑO);

END;



















