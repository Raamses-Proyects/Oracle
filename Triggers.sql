-- 1.- Crear un trigger que se dispare ante un INSERT en la tabla de usuarios. Se debe validar que el apodo no esté siendo
--utilizado por un usuario existente. En caso afirmativo, interrumpir la ejecución de ese INSERT.

/*
create or replace trigger apodo_no_repetido -- creando trigger
before insert on USUARIO -- Se va a ejecutar (before (antes de)), en este caso de un (Update), y nombre de la tabla, en este caso la tabla ARTICULOS_C
for each row

DECLARE

v_apodo_nuevo_usuario varchar2(20);
v_existe number;

BEGIN

    v_apodo_nuevo_usuario := :new.apodo;
    select count(*) into v_existe from usuario where apodo = v_apodo_nuevo_usuario;
    
    if v_existe > 0 then
    
        raise_application_error(-20000,'El apodo se encuentra ocupado');
    
    end if;
    
END;
--insert into USUARIO(IDUSUARIO, APODO, EMAIL, PASSWORD) VALUES(121, 'PerezRaul954', 'familiaperez@malejemplo.cod', '2sx23');
*/



-- 2.- Crear un trigger que vaya guardando un histórico de las opiniones editadas y borradas.
--Para ello, deberá crear un registro nuevo en la tabla de "opinion_historico".

create or replace trigger registro_opiniones
after update or delete on OPINION
for each row

DECLARE 

    v_id_opinion_historico number;
    v_accion varchar2(20);

BEGIN

    if updating('OPINION') then
    
        v_accion := 'Actualizado :)';
        select nvl(max(IDOPINIONHISTORICO)+ 1, 1) into v_id_opinion_historico from opinion_historico;
        insert into opinion_historico(IDOPINIONHISTORICO, OPINION, ACCION, USUARIOMODIFICACION, FECHAMODIFICACION)
        values(v_id_opinion_historico, :old.OPINION, v_accion, user, sysdate);
        
    elsif deleting then
        
        v_accion := 'Eliminado :(';
        select nvl(max(IDOPINIONHISTORICO)+ 1, 1) into v_id_opinion_historico from opinion_historico;
        insert into opinion_historico(IDOPINIONHISTORICO, OPINION, ACCION, USUARIOMODIFICACION, FECHAMODIFICACION)
        values(v_id_opinion_historico, :old.OPINION, v_accion, user, sysdate);
        
    end if;
END;

update opinion set opinion = 'Hola masomenos' where idopinion = 26; 
delete opinion where idopinion = 24;















