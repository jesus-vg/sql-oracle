-- Tabla nacionalidad
CREATE TABLE NACIONALIDAD18R(
    ID_NACIONALIDAD NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    CONTINENTE NVARCHAR2(20)
);

INSERT INTO NACIONALIDAD18R VALUES (1,'Mexicano','Am?rica');
INSERT INTO NACIONALIDAD18R VALUES (2,'India','Asia');
INSERT INTO NACIONALIDAD18R VALUES (3,'Nueva zelanda','Oceania');
INSERT INTO NACIONALIDAD18R VALUES (4,'Dinamarca','Europa');
INSERT INTO NACIONALIDAD18R VALUES (5,'USA','Am?rica');

select * from nacionalidad18r;


--TABLA DEPARRTAMENTOS
CREATE TABLE DEPARTAMENTO18R
(
 ID_DEPARTAMENTO NUMBER PRIMARY KEY,
 NOMBRE NVARCHAR2(100), 
 ESTATUS NVARCHAR2(100)
 );
 INSERT INTO DEPARTAMENTO18R VALUES(1,'Juan','Vive');
 INSERT INTO DEPARTAMENTO18R VALUES(2,'Carlos','Vacaciones');
 INSERT INTO DEPARTAMENTO18R VALUES(3,'Flor','Vive');
 INSERT INTO DEPARTAMENTO18R VALUES(4,'Savs','Vacaciones');
 INSERT INTO DEPARTAMENTO18R VALUES(5,'Antonio','Vive');
 
 SELECT*FROM DEPARTAMENTO18R;
 
-- tabla roles
CREATE TABLE ROL18R(
    ID_ROL NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    DEPARTAMENTO_ID NUMBER,
    ESTATUS NVARCHAR2(100),
    FOREIGN KEY (DEPARTAMENTO_ID) REFERENCES DEPARTAMENTO18R(ID_DEPARTAMENTO)
);
--DROP TABLE ROL18R;

INSERT INTO ROL18R VALUES(1,'Full stack developer',1,'Activo');
INSERT INTO ROL18R VALUES(2,'Lider de proyecto',2,'Activo');
INSERT INTO ROL18R VALUES(3,'QA',3,'Activo');
INSERT INTO ROL18R VALUES(4,'Frontend developer',4,'Suspendido');
INSERT INTO ROL18R VALUES(5,'Backend developer',5,'Suspendido');

SELECT * FROM rol18r;


--TABULADORES
CREATE TABLE TABULADOR18R(
    ID_TABULADOR NUMBER PRIMARY KEY,
    CLAVE NUMBER,
    SALARIO_INI NUMBER,
    SALARIO_FIN NUMBER,
    ESTATUS NUMBER
);

INSERT INTO TABULADOR18R VALUES(1,190,10000,13000,2);
INSERT INTO TABULADOR18R VALUES(2,452,8000,10000,3);
INSERT INTO TABULADOR18R VALUES(3,221,7000,40000,1);
INSERT INTO TABULADOR18R VALUES(4,633,6000,15000,4);
INSERT INTO TABULADOR18R VALUES(5,362,1000,30000,5);

SELECT * FROM TABULADOR18R;

-- SALARIOS
CREATE TABLE SALARIO18(
    ID_SALARIO18 NUMBER PRIMARY KEY,
    CLAVE NUMBER, 
    TABULADOR_ID NUMBER,
    ESTATUS NUMBER,
    FOREIGN KEY(TABULADOR_ID) REFERENCES TABULADOR18R(ID_TABULADOR)
);

INSERT INTO SALARIO18 VALUES(1, 123, 2, 2);
INSERT INTO SALARIO18 VALUES(2, 456, 1, 1);
INSERT INTO SALARIO18 VALUES(3, 789, 3, 1);
INSERT INTO SALARIO18 VALUES(4, 147, 2, 2);
INSERT INTO SALARIO18 VALUES(5, 258, 3, 1);

SELECT*FROM SALARIO18;


--
CREATE TABLE PERSONA18R(
    ID_PERSONA NUMBER PRIMARY KEY,
    NOMBRE NVARCHAR2(100),
    APP NVARCHAR2(100),
    APM NVARCHAR2(100),
    EDAD NUMBER,
    CORREO NVARCHAR2(100),
    TELEFONO NVARCHAR2(10),
    NACIONALIDAD_ID NUMBER,
    CONSTRAINT FK_PERSONA18R_NACIONALIDAD FOREIGN KEY (NACIONALIDAD_ID) REFERENCES NACIONALIDAD18R(ID_NACIONALIDAD)
);

INSERT INTO PERSONA18R VALUES(1, 'Gerardo', 'Rosas', 'Alejo', 33, 'gerardo@gmail.com', 2203154610, 1);
INSERT INTO PERSONA18R VALUES(2, 'Jose Maria', 'De los Santos', 'Flores', 24, 'josemaria@gmail.com', 2213045610, 2);
INSERT INTO PERSONA18R VALUES(3, 'Alejandro', 'Sorbo', 'Mendez', 35, 'alejandro@gmail.com', 2217856203, 3);
INSERT INTO PERSONA18R VALUES(4, 'Jesus', 'Villegas', 'Gonzalez', 24, 'jesusv@gmail.com', 2210512304, 4);
INSERT INTO PERSONA18R VALUES(5, 'Kasandra', 'Tenorio', 'Ruiz', 26, 'kass@gmail.com', 2214567983, 5);
INSERT INTO PERSONA18R VALUES(6, 'Marisol', 'Venegas', 'Hernandez', 23, 'sol.vh10@gmail.com', 2211362569, 4);
SELECT * FROM PERSONA18R;

---

CREATE TABLE HISTORICO_PERSONA18R(
    ID_HISTORICO NUMBER PRIMARY KEY,
    PERSONA_ID NUMBER,
    ROL_ID NUMBER,
    SALARIO_ID NUMBER,
    FECHA_ING DATE,
    USUARIO NVARCHAR2(50),
    JEFE_ID NUMBER,
    TUTOR_ID NUMBER,
    FOREIGN KEY(PERSONA_ID) REFERENCES PERSONA18R(ID_PERSONA),
    FOREIGN KEY(ROL_ID) REFERENCES ROL18R(ID_ROL),
    FOREIGN KEY(SALARIO_ID) REFERENCES SALARIO18(ID_SALARIO18),
    FOREIGN KEY(JEFE_ID) REFERENCES HISTORICO_PERSONA18R(ID_HISTORICO),
    FOREIGN KEY(TUTOR_ID) REFERENCES HISTORICO_PERSONA18R(ID_HISTORICO)
);

INSERT INTO HISTORICO_PERSONA18R VALUES (1,1,1,1,'11/07/2022', 'Usu01',null, null);
INSERT INTO HISTORICO_PERSONA18R VALUES (2,2,3,4,'11/06/2010', 'Usu02',null, null);
INSERT INTO HISTORICO_PERSONA18R VALUES (3,5,3,2,'01/07/2000', 'Usu03',null, null);
INSERT INTO HISTORICO_PERSONA18R VALUES (4,4,5,3,'11/07/2019', 'Usu04',null, null);
INSERT INTO HISTORICO_PERSONA18R VALUES (5,3,2,5,'04/07/2018', 'Usu05',null, null);

INSERT INTO HISTORICO_PERSONA18R VALUES (6,4,4,1,'01/07/2002', 'Usu06',1, 2);
INSERT INTO HISTORICO_PERSONA18R VALUES (7,2,2,1,null, 'Usu07',3,4);
INSERT INTO HISTORICO_PERSONA18R VALUES (8,5,5,2,'04/07/2015', 'Usu06',5, 4);
INSERT INTO HISTORICO_PERSONA18R VALUES (9,2,3,5,'01/07/2001', 'Usu06',3, null);

SELECT * FROM HISTORICO_PERSONA18R;

--1.- OBTENER LOS DATOS DE LA PERSONA, TODOS LOS INNER -> PERSONA, NACIONALIDAD, 
--    SALARIO, TABULADOR, ROL, DEPARTAMENTO, MENO JEFE Y EL TUTOR
SELECT 
    P.ID_PERSONA,
    P.NOMBRE,
    P.APP,
    P.APM,
    P.EDAD,
    P.CORREO,
    P.TELEFONO,
    N.NOMBRE NACIONALIDAD,
    H.USUARIO,
    R.NOMBRE ROL,
    D.NOMBRE DEPTO,
    S.CLAVE SALARIO_CLAVE,
    T.CLAVE TABULADOR_CLAVE
FROM PERSONA18R P
INNER JOIN NACIONALIDAD18R N ON N.ID_NACIONALIDAD = P.NACIONALIDAD_ID
INNER JOIN HISTORICO_PERSONA18R H ON H.PERSONA_ID = P.ID_PERSONA
INNER JOIN ROL18R R ON H.ROL_ID = R.ID_ROL
INNER JOIN DEPARTAMENTO18R D ON D.ID_DEPARTAMENTO = R.DEPARTAMENTO_ID
INNER JOIN SALARIO18 S ON S.ID_SALARIO18 = H.SALARIO_ID
INNER JOIN TABULADOR18R T ON T.ID_TABULADOR = S.TABULADOR_ID;

-- 2.- OBTENER LOS DATOS DE ARRIBA MAS SI EL HISTORICO TIENE JEFE MUESTRA LOS DATOS SI NO PON NULL
SELECT 
    P.ID_PERSONA,
    P.NOMBRE,
    P.APP,
    P.APM,
    P.EDAD,
    P.CORREO,
    P.TELEFONO,
    H.*,
    P_JEFE.NOMBRE JEFE,
    P_TUTOR.NOMBRE TUTOR
FROM HISTORICO_PERSONA18R H
INNER JOIN PERSONA18R P  ON H.PERSONA_ID = P.ID_PERSONA
LEFT JOIN HISTORICO_PERSONA18R H_JEFE ON H_JEFE.ID_HISTORICO = H.JEFE_ID
LEFT JOIN PERSONA18R P_JEFE ON P_JEFE.ID_PERSONA = H_JEFE.PERSONA_ID
LEFT JOIN HISTORICO_PERSONA18R H_TUTOR ON H_TUTOR.ID_HISTORICO = H.TUTOR_ID
LEFT JOIN PERSONA18R P_TUTOR ON P_TUTOR.ID_PERSONA = H_TUTOR.PERSONA_ID
ORDER BY H.ID_HISTORICO;

SELECT * FROM HISTORICO_PERSONA18R;
SELECT * FROM PERSONA18R;
SELECT 
    P.ID_PERSONA,
    P.NOMBRE,
    P.APP,
    P.APM,
    P.EDAD,
    P.CORREO,
    P.TELEFONO,
    H.*,
    (SELECT NOMBRE FROM PERSONA18R PJ WHERE PJ.ID_PERSONA = H.JEFE_ID) JEFE_,
    (SELECT NOMBRE FROM PERSONA18R PT WHERE PT.ID_PERSONA = H.TUTOR_ID) TUTOR_
FROM HISTORICO_PERSONA18R H
INNER JOIN PERSONA18R P  ON H.PERSONA_ID = P.ID_PERSONA
ORDER BY H.ID_HISTORICO;

