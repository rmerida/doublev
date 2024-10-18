+++++++++++++++++++++++++++++++++++++++++++++++++
+ Examen Para Desarrollador Oracle
+ Realizado Por Rony Merida.
+ Ciudad de Guatemala
+ 18/10/2024
+++++++++++++++++++++++++++++++++++++++++++++++++

1. Creacion de la tabla Personas
   
   se agregaron constraints a los campos 
   
   TipoIdentificacion   VARCHAR2(5)    not null CONSTRAINT CK_TipoIdent CHECK (TipoIdentificacion IN ('CC', 'TI','NIT', 'PAS'))
   Estado               VARCHAR2(10)   not null CONSTRAINT chk_estado CHECK (Estado IN('ACTIVO', 'INACTIVO'))

2. creacion del paquete PR_PERSONAS

   que incluye las funciones 

   FUNCTION  VALIDA_EMAIL(email VARCHAR2) para la validacion del mail.
   FUNCTION NOMBRE_COMPLETO   utilizado para la contatenacion de los nombres y apellidos
   FUNCTION IDENTIFICACIONCOMPLETA utilizado para la concatenacion de tipo de identificacion y numero de identificacion.
   
3. Creacion del trigger trg_Personas  
   
   este incluye la validacion de que el salario no sea menor a cero,
   adicional cuando se crea o modifica un registro los nombres y apellidos son guardados en mayusculas
   asi mismo realiza la validacion de que al insertar un registro o modificarlo verifique que el mail sea correcto.

4. se crearon los siguientes procedimiento para los fines que se indican en cada uno.
   sp_InsertarPersona   inserta personas nuevas.
    a este procedimiento se le deben mandar los siguientes parametros cNombres              VARCHAR2,
                                                                      cApellidos            VARCHAR2,
                                                                      cNumeroIdentificacion VARCHAR2,
                                                                      cTipoIdentificacion   VARCHAR2,
                                                                      cEmail                VARCHAR2,
                                                                      nSalario              NUMBER,
                                                                      cEstado               VARCHAR2
	para su ejecucion deben utilizarlo de la siguiente manera
	
	begin
      sp_InsertarPersona('Rony Anibal','Merida Illescas','2295691100501','TI','merida.rony@gmail.com',1,'ACTIVO');
      commit;
    end;																  
													   
   sp_ActualizarPersona actualiza personas  
   a este procedimiento se le deben mandar los siguientes parametros nIdPersona   NUMBER,
                                                                     cNombres              VARCHAR2,
                                                                     cApellidos            VARCHAR2,
                                                                     cNumeroIdentificacion VARCHAR2,
                                                                     cTipoIdentificacion   VARCHAR2,
                                                                     cEmail                VARCHAR2,
                                                                     nSalario              NUMBER,
                                                                     cEstado               VARCHAR2

	para su ejecucion deben utilizarlo de la siguiente manera
	
	begin
      sp_ActualizarPersona(1,'Rony Anibal-Modificado','Merida Illescas','2295691100509','CC','modmerida.rony@gmail.com',1,'ACTIVO');
      commit;
    end;
   
    sp_AjustarSalario    actualiza salario 
    a este procedimiento se le deben mandar los siguientes parametros nIdPersona NUMBER,
                                                                     nSalario   OUT NUMBER
	para su ejecucion deben utilizarlo de la siguiente manera																 
    DECLARE
      v_nuevo_salario NUMBER; -- Variable para almacenar el salario ajustado
    BEGIN
      -- Llamar al procedimiento
      sp_AjustarSalario(nIdPersona => 1, nSalario => v_nuevo_salario);
      -- Imprimir el nuevo salario
      DBMS_OUTPUT.PUT_LINE('El nuevo salario es: ' || v_nuevo_salario);
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
    /	
 
 
Se realizo la Exposición de Procedimientos como Servicios REST con ORDS

GET: Utilizando consultas SQL directas, para obtener solo el registro activo.
POST: Utilizar sp_InsertarPersona para insertar una nueva persona.
PUT: Utilizar sp_ActualizarPersona para actualizar el registro.
DELETE: Utilizando Código PLSQL para eliminar de forma lógica el registro.

Los cuales se detallan a continuacion.

 
GET

https://apex.oracle.com/pls/apex/doublev/api/personas/5

POST

https://apex.oracle.com/pls/apex/doublev/api/personas/CrearPersona


{
  "cApellidos": "JEREZ HIDALGO",
  "cEmail": "carlos.paiz@gmail.com",
  "cEstado": "ACTIVO",
  "cNombres": "CARLOS PEREZ",
  "cNumeroIdentificacion": "123",
  "cTipoIdentificacion": "CC",
  "nSalario": "2000"
}

PUT

https://apex.oracle.com/pls/apex/doublev/api/personas/ActualizaPersona

{
  "cApellidos": "MERIDA ILLESCAS 2",
  "cEmail": "illescas.rony@gmail.com",
  "cEstado": "ACTIVO",
  "cNombres": "anibal illescas",
  "cNumeroIdentificacion": "5432",
  "cTipoIdentificacion": "CC",
  "nIdPersona": "1",
  "nSalario": "25"
}

DELETE

https://apex.oracle.com/pls/apex/doublev/api/personas/6


Documentacion

https://editor.swagger.io/?url=https://apex.oracle.com/pls/apex/doublev/open-api-catalog/api/personas/


Seguridad

usuario    :   merida.rony@gmail.com
Contraseña :   Fernand@2000






