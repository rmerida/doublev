DROP TABLE Personas CASCADE CONSTRAINTS;
/
CREATE TABLE Personas(
  IdPersona            NUMBER         not null,
  Nombres              VARCHAR2(50)   not null,
  Apellidos            VARCHAR2(50)   not null,
  NumeroIdentificacion VARCHAR2(20)   not null,
  TipoIdentificacion   VARCHAR2(5)    not null CONSTRAINT CK_TipoIdent CHECK (TipoIdentificacion IN ('CC', 'TI','NIT', 'PAS')),
  Email                VARCHAR2(100)  not null,
  Salario              NUMBER(10,2)   not null,
  Estado               VARCHAR2(10)   not null CONSTRAINT chk_estado CHECK (Estado IN('ACTIVO', 'INACTIVO'))
);
/
--CREATE OR REPLACE PUBLIC SYNONYM Personas FOR Personas; 
--/
COMMENT ON COLUMN Personas.IdPersona            IS 'Identificador de la Persona';
/
COMMENT ON COLUMN Personas.Nombres              IS 'Nombres de la Persona'; 
/
COMMENT ON COLUMN Personas.Apellidos            IS 'Apellidos de la Persona'; 
/
COMMENT ON COLUMN Personas.NumeroIdentificacion IS 'Numero de Identificacion de la persona'; 
/
COMMENT ON COLUMN Personas.TipoIdentificacion   IS 'Tipo de Identificacion de la persona IN (CC,TI,NIT,PAS)';
/
COMMENT ON COLUMN Personas.Email                IS 'e-mail de la persona';
/
COMMENT ON COLUMN Personas.Salario              IS 'Salario de la persona';
/
COMMENT ON COLUMN Personas.Estado               IS 'Estado de la persona (ACTIVO,INACTIVO)';
/
-- Constraints
ALTER TABLE Personas ADD CONSTRAINT pk_personas PRIMARY KEY (IdPersona);
/
ALTER TABLE Personas ADD CONSTRAINT uq_personas_NumIdent unique (NumeroIdentificacion);
/
ALTER TABLE Personas ADD CONSTRAINT uq_personas_Email unique (Email);
/