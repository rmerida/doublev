CREATE OR REPLACE PROCEDURE sp_ConsultarPersona(nIdPersona   NUMBER) IS

 cError VARCHAR2(1000);
 cNombre_Completo VARCHAR2(100);
BEGIN
  SELECT PR_PERSONAS.NOMBRE_COMPLETO(1) INTO cNombre_Completo
    FROM PERSONAS
    WHERE IdPersona=nIdPersona;
EXCEPTION WHEN NO_DATA_FOUND THEN
  RAISE_APPLICATION_ERROR(-20001,'Codigo de Persona No Existe! ');
END sp_ConsultarPersona;


