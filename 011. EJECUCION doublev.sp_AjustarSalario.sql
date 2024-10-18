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