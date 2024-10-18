CREATE OR REPLACE PROCEDURE sp_InsertarPersona(
                                                          cNombres              VARCHAR2,
                                                         cApellidos            VARCHAR2,
                                                       cNumeroIdentificacion VARCHAR2,
                                                       cTipoIdentificacion   VARCHAR2,
                                                       cEmail                VARCHAR2,
                                                       nSalario              NUMBER,
                                                       cEstado               VARCHAR2) IS

 cError VARCHAR2(1000);
BEGIN
  INSERT INTO PERSONAS(Nombres,Apellidos,NumeroIdentificacion,TipoIdentificacion,Email,Salario,Estado)
  VALUES(cNombres,cApellidos,cNumeroIdentificacion,cTipoIdentificacion,cEmail,nSalario,cEstado);
EXCEPTION WHEN OTHERS THEN
  cError := substr(sqlerrm,1,1000);
  RAISE_APPLICATION_ERROR(-20001,' Error '||cError);
END sp_InsertarPersona;


