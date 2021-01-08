-- 1.- Traer e imprimir el a�o de estreno m�s alto.
/*
declare 
v_a�o number;
begin

select max(a�o) into v_a�o from pelicula;
dbms_output.put_line(v_a�o);

end;
*/


-- 2.- Traer la descripci�n de la pel�cula "Coco". Si es nula, reemplazarlo por "-Sin descripci�n-"
/*
declare
v_descripcion PELICULA.DESCRIPCION%type;
begin

select nvl(to_char(descripcion), '-Sin descripci�n-') into v_descripcion from pelicula where titulo = 'Coco';
dbms_output.put_line(v_descripcion);

end;
*/

-- 3.- Armar e imprimir una descripci�n corta de cualquier pel�cula con el siguiente formato: (a�o de estreno) - Primeros 
--40 caracteres de la descripci�n...

DECLARE 
v_datos PELICULA%rowtype;
BEGIN

select * into v_datos from pelicula where idpelicula = 1;
dbms_output.put_line('('||v_datos.a�o||') - '||SUBSTR(v_datos.descripcion, 1, 40)||'...');
--dbms_output.put_line('El a�os es: '||v_datos.A�O);

END;



















