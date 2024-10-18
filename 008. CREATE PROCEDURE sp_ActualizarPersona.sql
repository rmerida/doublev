CREATE OR REPLACE PROCEDURE sp_ActualizarPersona(nIdPersona   NUMBER,
                                                         cNombres              VARCHAR2,
                                                         cApellidos            VARCHAR2,
                                                         cNumeroIdentificacion VARCHAR2,
                                                         cTipoIdentificacion   VARCHAR2,
                                                         cEmail                VARCHAR2,
                                                         nSalario              NUMBER,
                                                         cEstado               VARCHAR2) IS

 cError VARCHAR2(1000);
BEGIN
  UPDATE Personas
    set Nombres=cNombres,
        Apellidos=cApellidos,
        NumeroIdentificacion=cNumeroIdentificacion,
        TipoIdentificacion=cTipoIdentificacion,
        Email=cEmail,
        Salario=nSalario,
        Estado=cEstado
    WHERE IdPersona=nIdPersona;
EXCEPTION WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001,'Codigo de Persona No Existe! ');
         WHEN OTHERS THEN
          cError := substr(sqlerrm,1,1000);
          RAISE_APPLICATION_ERROR(-20001,' Error '||cError);
END sp_ActualizarPersona;


