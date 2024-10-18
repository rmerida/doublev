CREATE OR REPLACE PROCEDURE sp_AjustarSalario(nIdPersona NUMBER,
                                                      nSalario   OUT NUMBER) IS

 cError         VARCHAR2(1000);
 nSaldoAnterior NUMBER(10,2);
 nSalarioNuevo  NUMBER(10,2);
 nPorcentaje    NUMBER(10,2);
BEGIN
  BEGIN
    SELECT SALARIO INTO nSaldoAnterior
      FROM Personas
        WHERE IdPersona=nIdPersona;
  DBMS_OUTPUT.PUT_LINE( ' El Salario Anterior es  ' ||nSaldoAnterior);		
  EXCEPTION WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001,'Codigo de Persona No Existe! ');   
  END;
  IF nSaldoAnterior<2000 THEN
    -- Calcula porcentaje
    nPorcentaje := (nSaldoAnterior * 10)/100;
    nSalario    := nSaldoAnterior + nPorcentaje;
    UPDATE Personas
      SET Salario=nSalario
       WHERE IdPersona=nIdPersona;
  END IF;
  DBMS_OUTPUT.PUT_LINE( ' El Salario Nuevo es  ' ||nSalario);
END sp_AjustarSalario;