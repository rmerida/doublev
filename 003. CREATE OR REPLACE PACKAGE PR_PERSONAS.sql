CREATE OR REPLACE PACKAGE PR_PERSONAS AS
 /************************************************************
 * NOMBRE DEL PROGRAMA : PR_PERSONAS                        *
 * CREADO POR          : RONY MERIDA                        *
 * FECHA               : 16/10/2024                         *
 ***********************************************************/
 FUNCTION  VALIDA_EMAIL(email VARCHAR2) RETURN NUMBER;
 FUNCTION NOMBRE_COMPLETO (nIdPersona NUMBER) RETURN VARCHAR2;
 FUNCTION IDENTIFICACIONCOMPLETA (nIdPersona NUMBER) RETURN VARCHAR2;
END PR_PERSONAS;
/
CREATE OR REPLACE PACKAGE BODY PR_PERSONAS AS
FUNCTION VALIDA_EMAIL (email VARCHAR2) RETURN NUMBER IS

  t_valid NUMBER(1);
  t_totallen NUMBER(2);
  t_counter NUMBER(2):=0;
  t_atpos NUMBER(2):= 1;
  i NUMBER(2) := 1;
  t_pointpos NUMBER(2):= 1;
  mail_ch VARCHAR2(1);
BEGIN
  t_totallen := LENGTH(email);
  t_counter := t_totallen;
  i := 1;
  t_valid := 1;
  -- Validamos la longitud del correo, no puede ser vacío 
  IF LENGTH(ltrim(rtrim(email))) = 0 THEN
    t_valid := 0;
  ELSE
    --Valida que no contenga caracteres inválidos en un correo
    t_counter := t_totallen;
    WHILE t_counter > 0 LOOP
       mail_ch := substr(email,i,1);
       i := i+1;
       t_counter := t_counter -1;
       IF mail_ch IN (' ','!','#','$','%','^','&','*','(',')','-','','"','+','|','{','}','[',']',':','>','<','?','/','','=') THEN
         t_valid := 0;
         EXIT;
       END IF;

    END LOOP;
    --Valida que no tenga mas de un @
    t_atpos := instr(email,'@',1,2) ;
    IF t_atpos > 1 then
      t_valid := 0;
    END IF;
    --Valida que contenga solo un @
    t_atpos := instr(email,'@',1);
    IF t_atpos IN (0,1) THEN
      t_valid := 0;
    END IF;
    --Validamos que tenga por lo menos un punto (.)
    t_pointpos := instr(email,'.',1) ;
    IF t_pointpos IN (0,1) THEN
      t_valid := 0;
    END IF;
  END IF;
  RETURN t_valid;
END VALIDA_EMAIL;
FUNCTION NOMBRE_COMPLETO (nIdPersona NUMBER) RETURN VARCHAR2 IS

  cNOMBRE_COMPLETO VARCHAR2(100);
BEGIN
  BEGIN
    SELECT Nombres||' '||Apellidos INTO cNOMBRE_COMPLETO
      FROM PERSONAS
        WHERE IdPersona = nIdPersona; 
  EXCEPTION WHEN NO_DATA_FOUND THEN
    cNOMBRE_COMPLETO := 'Codigo de Persona No Existe!';
  END;
  RETURN(cNOMBRE_COMPLETO);
END NOMBRE_COMPLETO;
FUNCTION IDENTIFICACIONCOMPLETA (nIdPersona NUMBER) RETURN VARCHAR2 IS

  cIDENTIFICACIONCOMPLETA VARCHAR2(100);
BEGIN
  BEGIN
    SELECT TipoIdentificacion||'-'||NumeroIdentificacion INTO cIDENTIFICACIONCOMPLETA
      FROM PERSONAS
        WHERE IdPersona = nIdPersona; 
  EXCEPTION WHEN NO_DATA_FOUND THEN
    cIDENTIFICACIONCOMPLETA := 'Codigo de Persona No Existe!';
  END;
  RETURN(cIDENTIFICACIONCOMPLETA);
END IDENTIFICACIONCOMPLETA;
END PR_PERSONAS;
/