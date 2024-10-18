CREATE OR REPLACE TRIGGER trg_Personas
  BEFORE INSERT OR UPDATE ON Personas FOR EACH ROW
DECLARE 
  eMail Personas.Email%TYPE;
BEGIN
  IF INSERTING THEN
    -- Genera correlativo de Personas
	SELECT NVL(MAX(IdPersona),0) + 1 INTO :NEW.IdPersona
      FROM Personas;
    --Valida que el Salario no sea menor a Cero!  
    IF NVL(:NEW.Salario,0)<=0 THEN
      RAISE_APPLICATION_ERROR(-20001,' El Salario no puede ser menor a Cero ');
    END IF;
    -- Coloco en Mayusculas Nombres y Apellidos
    :NEW.Nombres   := UPPER(:NEW.Nombres);
    :NEW.Apellidos := UPPER(:NEW.Apellidos); 
    -- Valido el Email
    eMail := PR_PERSONAS.valida_email(:NEW.Email);
    IF eMail <> 1 THEN
      RAISE_APPLICATION_ERROR(-20001,' El correo no es válido.');
    END IF;
  ELSIF UPDATING THEN
    -- Coloco en Mayusculas Nombres y Apellidos
    :NEW.Nombres   := UPPER(:NEW.Nombres);
    :NEW.Apellidos := UPPER(:NEW.Apellidos); 
	-- Valido el Email
    eMail := PR_PERSONAS.valida_email(:NEW.Email);
    IF eMail <> 1 THEN
      RAISE_APPLICATION_ERROR(-20001,' El correo no es válido.');
    END IF;
  END IF;
END;