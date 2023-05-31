USE henry;
SELECT * FROM alumno;
SELECT * FROM carrera;
SELECT * FROM cohorte;
SELECT * FROM instructor;
-- 1. ¿Cual es el año con mayor cantidad de ingresos de alumnos?
SELECT year(fechaIngreso), count(*) FROM alumno
GROUP BY year(fechaIngreso)
ORDER BY 2 DESC
LIMIT 1;
-- R/: 2021

-- 2. ¿Cual es la cohorte con mayor cantidad estudiantes ingresados en el año 2022?
SELECT idCohorte, count(*) FROM alumno
WHERE year(fechaIngreso)=2022
GROUP BY idCohorte
ORDER BY 2 DESC;
-- R/: 1242 O 1243

-- 3. ¿Cual es el id del estudiante con más antiguedad en henry?
SELECT * FROM alumno
order by fechaIngreso
LIMIT 1;
-- R/: 2

-- 4. ¿Cual es la cohorte con mayor tiempo promedio en dias entre la fecha de nacimiento y la fecha de ingreso a henry de los estudiantes?
SELECT idCohorte, AVG(timestampdiff(day, fechaNacimiento, fechaIngreso)) FROM alumno
GROUP BY idCohorte
ORDER BY 2 DESC
LIMIT 1;

-- R/: 1241

-- 5. ¿Cual es la cantidad de estudiantes ingresados en el 2022 cuayo apellido empieza por la letra R?
SELECT count(*) FROM alumno
WHERE year(fechaIngreso)=2022 AND apellido like 'R%';
-- R/: 4

-- 6. ¿Cuantos alumnos tienen las letras "LL" en alguna parte de su apellido que hayan entrado despues de 2019?
SELECT count(*) FROM alumno 
WHERE year(fechaIngreso)>2019 AND apellido like '%LL%';
-- R/: 17

-- 7. ¿Cual es el ID del instructor Franco Caseros?
SELECT idInstructor FROM instructor
WHERE nombre='Franco' AND apellido='Caseros';
-- R/: 5

-- 8. ¿Cual fue el mes con menores ingresos para la cohorte 1241 en el año 2022?
SELECT month(fechaIngreso), count(*) FROM alumno
WHERE idCohorte=1241 AND year(fechaIngreso)=2022
GROUP BY month(fechaIngreso)
ORDER BY 2
LIMIT 1;
-- R/: 2 (Febrero)


