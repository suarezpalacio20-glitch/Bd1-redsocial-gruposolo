-- Pruebas de humo del modelo físico (se ejecuta después del DDL)
SET search_path TO red_social;
BEGIN;
INSERT INTO programa_academico(nombre,facultad) VALUES ('Ingeniería de Software','Ingeniería');
INSERT INTO usuario(id_programa_academico,nombre,correo,contrasena,semestre)
 VALUES (1,'Ana Ruiz','ana@u.edu.co','h',3),(1,'Luis Mora','luis@u.edu.co','h',8);
INSERT INTO seguimiento(id_seguidor,id_seguido,es_mentoria) VALUES (1,2,true);
INSERT INTO grupo(id_creador,nombre_grupo,tipo) VALUES (1,'Bases de Datos','estudio');
INSERT INTO miembro_grupo(id_grupo,id_usuario,rol) VALUES (1,1,'admin'),(1,2,'miembro');
INSERT INTO publicacion(id_usuario,id_grupo,tipo,contenido) VALUES (2,1,'pregunta','¿Cómo normalizo a 3FN?');
INSERT INTO comentario(id_publicacion,id_usuario,contenido) VALUES (1,1,'Mira Elmasri cap. 14');
INSERT INTO reaccion(id_publicacion,id_usuario,tipo) VALUES (1,1,'util');
INSERT INTO evento(id_organizador,id_grupo,titulo_evento,tipo,lugar,fecha_hora,fecha_fin)
 VALUES (1,1,'Repaso parcial','estudio','Biblioteca',now(),now()+interval '2 hours');
INSERT INTO asistencia_evento(id_evento,id_usuario) VALUES (1,2);
SAVEPOINT s;
-- Debe fallar: autoseguimiento
DO $$ BEGIN INSERT INTO seguimiento(id_seguidor,id_seguido) VALUES (1,1); EXCEPTION WHEN check_violation THEN RAISE NOTICE 'OK autoseguimiento bloqueado'; END $$;
DO $$ BEGIN INSERT INTO evento(id_organizador,titulo_evento,tipo,lugar,fecha_hora,fecha_fin) VALUES (1,'x','social','y',now(),now()-interval '1h'); EXCEPTION WHEN check_violation THEN RAISE NOTICE 'OK fechas invalidas bloqueadas'; END $$;
DO $$ BEGIN INSERT INTO usuario(id_programa_academico,nombre,correo,contrasena,semestre) VALUES (1,'Otra Ana','ana@u.edu.co','h',1); EXCEPTION WHEN unique_violation THEN RAISE NOTICE 'OK correo duplicado bloqueado'; END $$;
DO $$ BEGIN DELETE FROM programa_academico WHERE id_programa_academico=1; EXCEPTION WHEN foreign_key_violation THEN RAISE NOTICE 'OK RESTRICT en programa'; END $$;
DO $$ BEGIN DELETE FROM usuario WHERE id_usuario=1; EXCEPTION WHEN foreign_key_violation THEN RAISE NOTICE 'OK RESTRICT: no se borra creador de grupo'; END $$;
-- SET NULL: borrar grupo conserva el evento
DELETE FROM grupo WHERE id_grupo=1;
SELECT 'evento conservado, id_grupo=' || coalesce(id_grupo::text,'NULL') AS set_null FROM evento;
SELECT 'publicaciones tras borrar grupo: ' || count(*) FROM publicacion;
ROLLBACK;
