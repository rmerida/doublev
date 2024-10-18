begin
  sp_InsertarPersona('Rony Anibal','Merida Illescas','2295691100501','TI','merida.rony@gmail.com',1,'ACTIVO');
  sp_InsertarPersona('Alvaro Cesar','Castellanos','2295691100502','CC','castellanos.alvaro@gmail.com',2,'ACTIVO');
  sp_InsertarPersona('Carlos Augusto','Figueroa','2295691100503','NIT','figueroa.carlos@gmail.com',3,'ACTIVO');
  sp_InsertarPersona('Diego Rodrigo','Perez Florez','2295691100504','PAS','perez.diego@gmail.com',4,'ACTIVO');
  sp_InsertarPersona('Oscar Isaac','Mansilla De Leon','2295691100505','CC','mansilla.oscar@gmail.com',5,'ACTIVO');
  commit;
end;

select * from personas

begin
  sp_ActualizarPersona(1,'Rony Anibal-Modificado','Merida Illescas','2295691100509','CC','modmerida.rony@gmail.com',1,'ACTIVO');
  commit;
  sp_ActualizarPersona(2,'Alvaro Cesar-Modificado','Castellanos','2295691100508','PAS','modcastellanos.alvaro@gmail.com',2,'ACTIVO');
  commit;
end;

select * from personas