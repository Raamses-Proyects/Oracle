-- 1.- Utilizando el email, buscar e imprimir ID y apodo de un usuario. Lanzar una 
-- exception e imprimir un mensaje si no se encuentra ningún usuario con ese email. 

-- 2.- Continuando con el punto anterior, lanzar una exception e imprimir un mensaje si hay más de un usuario con el mismo email.

-- 3.- Continuando con el punto anterior, crear una exception personalizada e imprimir un mensaje en caso de que el mail ingresado 
-- no tenga un "@" en alguna parte del texto.

DECLARE 

v_email varchar(55) := 'bbbb';
v_apodo varchar(55);
v_id_user number;
contador number := 0;

ex_mas_de_un_user_mismo_email EXCEPTION;
ex_sin_arroba EXCEPTION;
v_codigo_exception number;
v_mensaje_exception varchar(255);


BEGIN

if v_email not like '%@%' then
    raise ex_sin_arroba; 
end if;

select count(*) into contador from usuario where email = v_email;
if contador > 0 then
    raise ex_mas_de_un_user_mismo_email;
end if;

select APODO, idusuario into v_apodo, v_id_user from usuario where email = v_email;
dbms_output.put_line('El ID del usuario es: '||v_id_user||' El apodo del usuario es: '||v_apodo);

EXCEPTION
when ex_mas_de_un_user_mismo_email then
dbms_output.put_line('Hay '||contador||' usuarios con ese email');

when ex_sin_arroba then
dbms_output.put_line('El correo: ('||v_email||') No tiene arroba');


when OTHERS then
v_codigo_exception := SQLCODE;
v_mensaje_exception := SQLERRM;
dbms_output.put_line(v_codigo_exception);
dbms_output.put_line(v_mensaje_exception);

END;











