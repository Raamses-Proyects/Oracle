/*
Se deben recibir 2 parámetros: p_apodo y p_password. Se debe chequear que el nombre de usuario
existe y que la password sea válida.

En caso de ser datos válidos, se deben devolver datos en 4 variables OUT: v_mensaje(con el 
mensaje "Login correcto"), v_id_usuario, v_apodo,v_email.

En caso de ser datos inválidos, se deben devolver las 4 mismas variables OUT: v_mensaje 
(con el mensaje "Usuario no existente" o "Password incorrecta", según corresponda). 
El resto de las variables deben ser "null".
*/

create or replace procedure login(p_apodo in varchar2, p_pass in varchar2) is -- in siginifica que es parametro de salida y out de entrada

cursor cur_peliculas is -- declarando cursor
select APODO, password from usuario where email = 'familiaperez@mailejemplo.com';

BEGIN

    for registro in cur_peliculas loop
    
        if registro.APODO = p_apodo and registro.password = p_pass then
            dbms_output.put_line('Datos correctos');
        elsif registro.APODO != p_apodo or registro.password != p_pass then
            dbms_output.put_line('Datos Incorrectos');
        end if;
        
    end loop;
    
END;


begin
login('PerezRaul954', '9C98DF872D24244696C393A1D26AB749');
end;





