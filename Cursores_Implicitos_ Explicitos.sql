-- 1.- Obtener e imprimir todas las opiniones para la película con ID 5.
/*
DECLARE 

cursor cur_peliculas is 
select opinion from OPINION where IDPELICULA = 5;

BEGIN  

    for opi in cur_peliculas loop
         dbms_output.put_line(opi.OPINION);
    end loop;

END;
*/

-- 2.- Obtener e imprimir todas las opiniones de un usuario (enviar id de usuario por parámetro al cursor), imprimiendo 
-- primero el nombre de la película en mayúsculas y luego la opinión.
/*
DECLARE 

cursor cur_peliculas(p_id_user NUMBER) is
select PELICULA.TITULO, OPINION.OPINION 
from PELICULA 
inner join opinion on PELICULA.IDPELICULA = OPINION.IDPELICULA 
where IDUSUARIO = p_id_user;


v_id_user number := 2;

BEGIN

    for pelic in cur_peliculas(v_id_user) loop
        
        dbms_output.put_line(upper(pelic.TITULO)||' Opinion del usuario: ('||v_id_user||') es: '||pelic.OPINION);
       
    end loop;

END;
*/


-- 3.- Cambiar todos los textos de opiniones para la película con ID 4. Modificar concatenando el nombre del usuario delante 
-- del texto. Ej: "Juan: Aquí iría la opinión del usuario". Imprimir cuantas filas fueron afectadas utilizando cursor implícito.


DECLARE 

cursor cur_peliculas is
select opinion.opinion, USUARIO.APODO 
from opinion 
inner join usuario on opinion.IDUSUARIO = usuario.idusuario 
where idpelicula = 4
for update;

v_cantidad number := 0;
v_opinion varchar(255);
v_usuario_apodo varchar(55);
v_nueva_opinion varchar(255);

BEGIN
    
    for pel in cur_peliculas loop 
    
         v_opinion := pel.OPINION;
         v_usuario_apodo := pel.APODO;
         v_nueva_opinion := v_usuario_apodo ||': '||v_opinion;
         
         update OPINION set OPINION = v_nueva_opinion where current of cur_peliculas;  
         
         v_cantidad := v_cantidad + sql%rowcount; -- cantidad de registros afectados
         dbms_output.put_line('Cantidad de filas afectadas: '||v_cantidad);
        
    end loop;

END;
--select * from opinion where idpelicula = 4;







	
    
    
    
    
    
    