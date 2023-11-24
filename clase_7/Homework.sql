-- 1.

USE henry_homework;

SELECT COUNT(*) AS carreras
FROM carrera;

-- 2.

SELECT COUNT(*) AS alumnos
FROM alumno;

-- 3.

SELECT 
IdCohorte AS Cohorte,
COUNT(*) AS alumnosXCohorte
FROM alumno
GROUP BY IdCohorte;

-- 4.

SELECT 
CONCAT(Nombre," " ,Apellido) AS nombreCompleto,
FechaDeIngreso AS fechaDeIngreso
FROM alumno
ORDER BY FechaDeIngreso ASC;

-- 5.

SELECT 
CONCAT(Nombre," " ,Apellido) AS nombreCompleto,
FechaDeIngreso AS fechaDeIngreso
FROM alumno
ORDER BY FechaDeIngreso ASC
LIMIT 1;

-- 6.

SELECT 
CONCAT(Nombre," " ,Apellido) AS nombreCompleto,
FechaDeIngreso AS fechaDeIngreso
FROM alumno
ORDER BY FechaDeIngreso ASC
LIMIT 1;

-- 7.

SELECT 
CONCAT(Nombre," " ,Apellido) AS nombreCompleto,
FechaDeIngreso AS fechaDeIngreso
FROM alumno
ORDER BY FechaDeIngreso DESC
LIMIT 1;

-- 8.

SELECT 
YEAR(FechaDeIngreso) AS año,
COUNT(*) AS alumnosXAño
FROM alumno
GROUP BY YEAR(FechaDeIngreso)
ORDER BY YEAR(FechaDeIngreso) ASC;

-- 9.

SELECT
YEAR(FechaDeIngreso) AS año,
WEEKOFYEAR(FechaDeIngreso) AS semana,
COUNT(*) AS alumnosXSemana
FROM alumno
GROUP BY YEAR(FechaDeIngreso), WEEKOFYEAR(FechaDeIngreso)
ORDER BY YEAR(FechaDeIngreso), WEEKOFYEAR(FechaDeIngreso) ASC;

-- 10.

SELECT 
YEAR(FechaDeIngreso) AS año,
COUNT(*) > 20 AS añosConMasDe20Alumnos
FROM alumno
GROUP BY YEAR(FechaDeIngreso)
ORDER BY YEAR(FechaDeIngreso) ASC;

-- 11.

SELECT 
CONCAT(Nombre," " ,Apellido) AS nombreCompleto,
TIMESTAMPDIFF(YEAR, FechaDeNacimiento, CURDATE()) AS edad,
DATE_ADD(FechaDeNacimiento, INTERVAL TIMESTAMPDIFF(YEAR, FechaDeNacimiento, CURDATE()) YEAR) AS ultimoCumpleaños
FROM instructor;

-- 12.

SELECT
CONCAT(Nombre," " ,Apellido) AS nombreCompleto,
TIMESTAMPDIFF(YEAR, FechaDeNacimiento, CURDATE()) AS edad
FROM alumno
ORDER BY TIMESTAMPDIFF(YEAR, FechaDeNacimiento, CURDATE()) ASC;

-- arreglando un registro
UPDATE alumno
SET FechaDeNacimiento = "2002-01-02"
WHERE IdAlumno IN (127);

SELECT
AVG(TIMESTAMPDIFF(YEAR, FechaDeNacimiento, CURDATE())) AS edadPromedio
FROM alumno;

SELECT
IdCohorte AS NºDeCohorte,
AVG(TIMESTAMPDIFF(YEAR, FechaDeNacimiento, CURDATE())) AS edadPromedioCohorte
FROM alumno
GROUP BY IdCohorte;

-- 13.

SELECT
CONCAT(Nombre," " ,Apellido) AS nombreCompleto,
TIMESTAMPDIFF(YEAR, FechaDeNacimiento, CURDATE()) AS edad
FROM alumno
WHERE TIMESTAMPDIFF(YEAR, FechaDeNacimiento, CURDATE()) > (SELECT AVG(TIMESTAMPDIFF(YEAR, FechaDeNacimiento, curdate())) AS edad_promedio
	FROM alumno)
ORDER BY TIMESTAMPDIFF(YEAR, FechaDeNacimiento, CURDATE()) ASC;