CREATE TABLE JUGUETE18(
    ID_JUGUETE NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    PRECIO NUMBER,
    TIPO NVARCHAR2(100), -- Bebe, niño, Adolecente, Joven, Adulto
    CONSTRAINT CHECK_JUGUETE18 CHECK(TIPO IN('Bebe', 'Niño', 'Adolecente', 'Joven', 'Adulto'))
);

INSERT INTO JUGUETE18 VALUES(1,'Sonaja', 50, 'Bebe');
 
--TRANSACCIONES -> confirma o deshace las operaciones
-- commit -> para confirmar las operaciones
-- rollback -> para revertir las operaciones