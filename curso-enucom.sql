--create base de datos
CREATE DATABASE NOMBRE;
--CREATET TABLE
CREATE TABLE PERRO18(
ID_PERRO NUMBER,
NOMBRE NVARCHAR2(100),
PRECIO NUMBER,
RAZA NVARCHAR2(100)
);

--eliminar
DROP TABLE PERRO18;

--crear tabla con una pk 1ra forma
CREATE TABLE AUTO18(
ID_AUTO NUMBER PRIMARY KEY,
MODELO NVARCHAR2(100),
PRECIO NUMBER,
COLOR NVARCHAR2(100),
MARCA NVARCHAR2(100),
PESO NUMBER
);

-- segunda forma
CREATE TABLE AUTO182(
ID_AUTO NUMBER,
MODELO NVARCHAR2(100),
PRECIO NUMBER,
COLOR NVARCHAR2(100),
MARCA NVARCHAR2(100),
PESO NUMBER,
CONSTRAINT PK_AUTO18 PRIMARY KEY(ID_AUTO)
);

--crear tabla con una pk 3 forma
CREATE TABLE AUTO183(
ID_AUTO NUMBER,
MODELO NVARCHAR2(100),
PRECIO NUMBER,
COLOR NVARCHAR2(100),
MARCA NVARCHAR2(100),
PESO NUMBER,
PRIMARY KEY(ID_AUTO)
);


--insert
insert into auto18 values(1, 'XC40', 754000,'blanco', 'Volvo', 9000);
insert into auto18 values(2, 'FORD F150', 114000,'Negra', 'FORD', 15000);
insert into auto18 values(3, 'GT', 754000,'Negro', 'MG', 80000);
insert into auto18 values(4, 'Sierra', 754000,'blanca', 'GMC', 450);
insert into auto18 values(5, 'Civic', 754000,'Azul electrico', 'Honda', 450);
insert into auto18 values(6, 'Volkswagen', 150000,'verde', 'Vw', 750000);
insert into auto18 values(7, 'Vento', 320000,null, 'Vw', 750000);
insert into auto18 values(8, 'i10', 310000,'Naranja', 'Ford', 500000);

--see3lct
select ID_AUTO, MODELO, PRECIO, COLOR, MARCA, PESO FROM AUTO18;
select * from auto18;
select a.ID_AUTO FROM AUTO18 a;
select a.ID_AUTO AS 'clave' FROM AUTO18 a;

--update
update auto18 set precio = 20000 WHERE ID_AUTO = 1;
update auto18 set COLOR = 'GRIS', PESO=850000 WHERE ID_AUTO = 1;

--delete
delete from AUTO18 WHERE ID_AUTO= 6;
delete from AUTO18 ;


--search
select ID_AUTO, MODELO, PRECIO, COLOR, MARCA, PESO 
FROM AUTO18
WHERE ID_AUTO = 4 OR ID_AUTO = 6;

--search ej2
select ID_AUTO, MODELO, PRECIO, COLOR, MARCA, PESO 
FROM AUTO18
WHERE MARCA like 'MG' AND PRECIO = 754000;

--search autos precio <= 500000
select ID_AUTO, MODELO, PRECIO, COLOR, MARCA, PESO 
FROM AUTO18
WHERE PRECIO <= 500000;


--search ej2
select ID_AUTO, MODELO, PRECIO, COLOR, MARCA, PESO 
FROM AUTO18
WHERE ID_AUTO BETWEEN 3 AND 5;

--Mustren los autos con id 2,1,5
select ID_AUTO, MODELO, PRECIO, COLOR, MARCA, PESO 
FROM AUTO18
WHERE ID_AUTO IN (2,1,5);

--buscar autos donde el modelo sea 'Civic','Sierra', 'XC40'
select ID_AUTO, MODELO, PRECIO, COLOR, MARCA, PESO 
FROM AUTO18
WHERE MODELO IN ('Civic','Sierra', 'XC40');


select ID_AUTO, MODELO, PRECIO, COLOR, MARCA, PESO 
FROM AUTO18
WHERE PRECIO BETWEEN 500000 AND 1000000;

--buscar los autos donde la marca empiece con v
select ID_AUTO, MODELO, PRECIO, COLOR, MARCA, PESO 
FROM AUTO18
WHERE MODELO like 'V%';

--mostrar autos que su color termine con una o
select *
FROM AUTO18
WHERE COLOR like '%o';

--mostrar los autos en donde el color tenga la letra i
select *
FROM AUTO18
WHERE COLOR like '%i%';


--mostrar los autos en donde el color sea null
select *
FROM AUTO18
WHERE COLOR IS NULL;

--mostrar los autos en donde el color NO sea null
select *
FROM AUTO18
WHERE COLOR IS NOT NULL;

--mostrar autos ordenados por precio del mas caro al mas baratin
select *
FROM AUTO18
ORDER BY PRECIO DESC;

--mostrar autos ordenados por precio del mas barati (default)
select *
FROM AUTO18
ORDER BY PRECIO

-- mostrar autos agrupados por marca
select marca
FROM AUTO18
GROUP BY MARCA


-------------------------- OTHER TABLE

CREATE TABLE TORTAS(
ID_TORTA NUMBER PRIMARY KEY,
NOMBRE NVARCHAR2(100),
PRECIO NUMBER,
REGION NVARCHAR2(100),
PESO NUMBER,
CALORIAS NUMBER
);

INSERT INTO TORTAS VALUES (1,'Cubana',45,'México', 200, 1500);
INSERT INTO TORTAS VALUES (2,'Jamon',20,'México', 80, 900);
INSERT INTO TORTAS VALUES (3,'Cemita',55,'Puebla', 150, 1000);
INSERT INTO TORTAS VALUES (4,'Texana',80,'México', 250, 1600);
INSERT INTO TORTAS VALUES (5,'Ahogada',50,'Guadalajara', 100, 950);
INSERT INTO TORTAS VALUES (6,'Huevo',15,'Puebla', 70, 500);
INSERT INTO TORTAS VALUES (7,'Española',75,'México', 160, 1200);

select * FROM TORTAS;

--consultas
--1.- Muestren las tortas que su precio sea 20,15 0 55
SELECT * 
FROM TORTAS 
WHERE PRECIO IN (20,15) OR PRECIO = 55;

--2.- Buscar tortas que su nombre termine con la letra a
SELECT * 
FROM TORTAS 
WHERE NOMBRE LIKE '%a';

--3.- Ordenar las tortas en base a sus calorias
SELECT * 
FROM TORTAS 
ORDER BY CALORIAS

--4.- Agrupar las tortas por region
SELECT REGION
FROM TORTAS 
GROUP BY REGION;


--5.- Buscar tortas donde el precio esté entre 60 y 90
SELECT * 
FROM TORTAS 
WHERE PRECIO BETWEEN 60 AND 90;


-------------------------- OTHER TABLE

CREATE TABLE VIDEOJUEGOS(
ID_VIDEOJ NUMBER PRIMARY KEY,
NOMBRE NVARCHAR2(100),
PRECIO NUMBER,
GENERO NVARCHAR2(100),
EDAD NUMBER,
FECHA_REG DATE
)


INSERT INTO VIDEOJUEGOS VALUES (1,'MVC3', 1000, 'Arcade', 5, '01-01-2010');
INSERT INTO VIDEOJUEGOS VALUES (2,'Leage of leagen', 800, 'Mova', 12, '01-01-2008');
INSERT INTO VIDEOJUEGOS VALUES (3,'King of figther', 1200, 'Arcade', 6, '20-12-1994');
INSERT INTO VIDEOJUEGOS VALUES (4,'Black Opps', 1250, 'Belico', 18, '01-01-2010');
INSERT INTO VIDEOJUEGOS VALUES (5,'Gear of War 3', 1300, 'Belico', 18, '01-01-2015');
INSERT INTO VIDEOJUEGOS VALUES (6,'Mario Bross', 500, 'Arcade', 5, '01-01-2000');

SELECT * FROM VIDEOJUEGOS;

select count(GENERO) AS TOTAL from VIDEOJUEGOS where GENERO = 'Belico';

--obtener la suma 

SELECT sum(PRECIO) AS TOTAL
FROM VIDEOJUEGOS 
WHERE NOMBRE like '%o%' 
OR NOMBRE like '%O%'


--mostrar el promedio del precio de los videojuegos que son arcade
SELECT * FROM VIDEOJUEGOS;
SELECT avg(PRECIO) FROM VIDEOJUEGOS WHERE GENERO = 'Arcade';

--obtener la edad maás alta para jugar videojuegos
SELECT MAX(EDAD) FROM VIDEOJUEGOS;


--obtener la edad maás mini para jugar videojuegos
SELECT MIN(EDAD) FROM VIDEOJUEGOS;

--mostrar el nombre el minisculas y ordenar por genero
SELECT 
ID_VIDEOJ,
LOWER(NOMBRE ) NOMBRE,
PRECIO,
GENERO,
EDAD, 
FECHA_REG 
FROM VIDEOJUEGOS 
ORDER BY GENERO;


--mostrar el nombre en Mayusculas y ordenar por genero
SELECT 
ID_VIDEOJ,
UPPER(NOMBRE ) NOMBRE,
PRECIO,
GENERO,
EDAD, 
FECHA_REG 
FROM VIDEOJUEGOS 
ORDER BY GENERO;


-- mostrar los generos sin repetir
SELECT 
GENERO
FROM VIDEOJUEGOS 
GROUP BY GENERO;


--agregar al campo edad la palabra años
SELECT 
NOMBRE,
CONCAT(EDAD, ' AÑOS') EDAD
FROM VIDEOJUEGOS;

----- OTHER TABLE
CREATE TABLE PELICULA (
ID_PELICULA NUMBER PRIMARY KEY,
NOMBRE NVARCHAR2(100),
GENERO NVARCHAR2(100),
FECHA_ESTRENO DATE,
COSTO NUMBER,
CALIFICACION NUMBER
);

INSERT INTO PELICULA VALUES (1,'Matrix','Ciencia ficción', '01/01/2000',500000,9);
INSERT INTO PELICULA VALUES (2,'Forest Gum','Drama', '01/01/2005',600000,10);
INSERT INTO PELICULA VALUES (3,'Gladiador','Acción', '01/01/2001',800000,9.5);
INSERT INTO PELICULA VALUES (4,'Orgullo y prejuicio','Romance', '01/01/2015',350000,8);
INSERT INTO PELICULA VALUES (5,'Valeria y la ciudad de los mil planetas','Ciencia ficción', '01/01/2010',100000,7);
INSERT INTO PELICULA VALUES (6,'Camila','Drama', '01/01/1984',300000,10);

SELECT * FROM PELICULA;


-- 1.- Contas las peliculas del genenero "romance"
SELECT COUNT(GENERO) GENERO FROM PELICULA WHERE GENERO = 'Romance';
-- 2.- Sumar el costo de las peliculas cuyo nombre tenga la letra m
SELECT SUM(COSTO) COSTO FROM PELICULA WHERE NOMBRE LIKE '%m%';
-- 3.- Ordenar las peliculas por su fecha de estreno y mostrar el nombre en mayusculas y el cosoto agregarle $
SELECT 
ID_PELICULA,
UPPER(NOMBRE) NOMBRE ,
GENERO ,
FECHA_ESTRENO ,
CONCAT('$ ',COSTO) COSTO ,
CALIFICACION 
FROM PELICULA 
ORDER BY FECHA_ESTRENO;
-- 4.- Contar las peliculas por genero
SELECT COUNT(GENERO) TOTAL, GENERO FROM PELICULA GROUP BY GENERO;








