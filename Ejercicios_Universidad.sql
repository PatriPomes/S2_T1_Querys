/*Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.*/
SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo='alumno' ORDER BY apellido1, apellido2 ASC, nombre ASC;
/*Esbrina el nom i els dos cognoms dels/les alumnes que no han donat d'alta el seu número de telèfon en la base de dades.*/
SELECT apellido1, apellido2, nombre, telefono FROM universidad.persona WHERE (telefono IS NULL) AND (tipo='alumno');
/*Retorna el llistat dels/les alumnes que van néixer en 1999.*/
SELECT *  FROM universidad.persona WHERE (tipo='alumno') AND (fecha_nacimiento LIKE '%1999%');
/*Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.*/
SELECT *  FROM universidad.persona WHERE (tipo='profesor') AND (nif LIKE '%K');
/*Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.*/
SELECT id,nombre, curso, cuatrimestre, id_grado FROM universidad.asignatura WHERE (curso='3') AND (cuatrimestre='1') AND (id_grado='7');
/*Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats/des. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.*/
SELECT apellido1, apellido2, persona.nombre AS nombre_profesor,departamento.nombre AS nombre_departamento FROM universidad.persona INNER JOIN universidad.profesor ON universidad.profesor.id_profesor=universidad.persona.id INNER JOIN universidad.departamento ON universidad.departamento.id=universidad.profesor.id_departamento ORDER BY apellido1 ASC, apellido2 ASC, persona.nombre ASC;
/*Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.*/
SELECT nif, asignatura.nombre, anyo_inicio, anyo_fin FROM universidad.persona INNER JOIN universidad.alumno_se_matricula_asignatura ON universidad.alumno_se_matricula_asignatura.id_alumno=universidad.persona.id INNER JOIN universidad.asignatura ON universidad.asignatura.id=universidad.alumno_se_matricula_asignatura.id_asignatura INNER JOIN universidad.curso_escolar ON universidad.curso_escolar.id=universidad.alumno_se_matricula_asignatura.id_curso_escolar WHERE nif='26902806M';
/*Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).*/
SELECT DISTINCT departamento.nombre FROM universidad.grado INNER JOIN universidad.asignatura ON universidad.asignatura.id_grado=universidad.grado.id INNER JOIN universidad.profesor ON universidad.profesor.id_profesor=universidad.asignatura.id_profesor INNER JOIN universidad.departamento ON universidad.departamento.id=universidad.profesor.id_departamento WHERE grado.nombre='Grado en Ingeniería Informática (Plan 2015)';
/*Retorna un llistat amb tots els/les alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.*/
SELECT DISTINCT apellido1, apellido2, nombre FROM universidad.persona INNER JOIN universidad.alumno_se_matricula_asignatura ON universidad.alumno_se_matricula_asignatura.id_alumno=universidad.persona.id INNER JOIN universidad.curso_escolar ON universidad.curso_escolar.id=universidad.alumno_se_matricula_asignatura.id_curso_escolar WHERE anyo_inicio=2018 AND anyo_fin=2019;
/* Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats/des. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.*/
SELECT  apellido1, apellido2, persona.nombre AS nombre, departamento.nombre AS departamento FROM universidad.persona RIGHT JOIN universidad.profesor ON universidad.persona.id=universidad.profesor.id_profesor RIGHT JOIN universidad.departamento ON universidad.profesor.id_departamento=universidad.departamento.id ORDER BY departamento.nombre ASC, apellido1 ASC, apellido2 ASC, persona.nombre ASC;
/*Retorna un llistat amb els professors/es que no estan associats a un departament.*/
SELECT  apellido1, apellido2, persona.nombre AS nombre, departamento.nombre AS departamento FROM universidad.persona LEFT JOIN universidad.profesor ON universidad.persona.id=universidad.profesor.id_profesor LEFT JOIN universidad.departamento ON universidad.profesor.id_departamento=universidad.departamento.id WHERE (tipo='profesor') AND (id_departamento IS NULL) ORDER BY departamento.nombre ASC, apellido1 ASC, apellido2 ASC, persona.nombre ASC;
/*Retorna un llistat amb els departaments que no tenen professors/es associats.*/
SELECT  apellido1, apellido2, persona.nombre AS nombre, departamento.nombre AS departamento FROM universidad.persona RIGHT JOIN universidad.profesor ON universidad.persona.id=universidad.profesor.id_profesor RIGHT JOIN universidad.departamento ON universidad.profesor.id_departamento=universidad.departamento.id WHERE id_profesor IS NULL ORDER BY departamento.nombre ASC, apellido1 ASC, apellido2 ASC, persona.nombre ASC;
/*Retorna un llistat amb els professors/es que no imparteixen cap assignatura.*/
SELECT  apellido1, apellido2, persona.nombre AS nombre, asignatura.nombre AS asignatura FROM universidad.persona LEFT JOIN universidad.profesor ON universidad.persona.id=universidad.profesor.id_profesor LEFT JOIN universidad.asignatura ON universidad.profesor.id_profesor=universidad.asignatura.id_profesor WHERE (persona.tipo='profesor') AND asignatura.nombre IS NULL;
/*Retorna un llistat amb les assignatures que no tenen un professor/a assignat.*/
SELECT  apellido1, apellido2, persona.nombre AS nombre, asignatura.nombre AS asignatura FROM universidad.persona RIGHT JOIN universidad.profesor ON universidad.persona.id=universidad.profesor.id_profesor RIGHT JOIN universidad.asignatura ON universidad.profesor.id_profesor=universidad.asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
/*Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.*/
SELECT departamento.nombre AS departamento, asignatura.nombre AS asignatura, anyo_inicio, anyo_fin FROM universidad.departamento LEFT JOIN universidad.profesor ON universidad.profesor.id_departamento=universidad.departamento.id LEFT JOIN  universidad.asignatura  ON universidad.profesor.id_profesor=universidad.asignatura.id_profesor LEFT JOIN universidad.alumno_se_matricula_asignatura ON universidad.alumno_se_matricula_asignatura.id_asignatura=universidad.asignatura.id LEFT JOIN universidad.curso_escolar ON universidad.curso_escolar.id=universidad.alumno_se_matricula_asignatura.id_curso_escolar WHERE (anyo_inicio IS NULL) AND (anyo_fin IS NULL);
/*Retorna el nombre total d'alumnes que hi ha.*/
SELECT COUNT(*) FROM universidad.persona WHERE tipo='alumno';
/*Calcula quants/es alumnes van néixer en 1999.*/
SELECT COUNT(*)  FROM universidad.persona WHERE (tipo='alumno') AND (fecha_nacimiento LIKE '%1999%');
/*Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.*/
SELECT  nombre, COUNT(id_profesor) AS total_profesors FROM universidad.departamento RIGHT JOIN universidad.profesor ON universidad.profesor.id_departamento=universidad.departamento.id GROUP BY (nombre) ORDER BY total_profesors DESC;
/*Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Té en compte que poden existir departaments que no tenen professors/es associats/des. Aquests departaments també han d'aparèixer en el llistat.*/
SELECT  nombre, COUNT(id_profesor) AS total_profesors FROM universidad.departamento LEFT JOIN universidad.profesor ON universidad.profesor.id_departamento=universidad.departamento.id GROUP BY (nombre) ORDER BY total_profesors DESC;
/*Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Té en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.*/
SELECT grado.nombre AS grado, COUNT(asignatura.nombre) AS asignatura FROM universidad.grado LEFT JOIN universidad.asignatura ON universidad.asignatura.id_grado=universidad.grado.id GROUP BY(grado) ORDER BY (asignatura)DESC;
/*Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.*/
SELECT grado.nombre AS grado, COUNT(asignatura.nombre) AS asignatura FROM universidad.grado LEFT JOIN universidad.asignatura ON universidad.asignatura.id_grado=universidad.grado.id  GROUP BY(grado) HAVING asignatura>40  ORDER BY (asignatura)DESC;
/*Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.*/
SELECT  grado.nombre AS grado, SUM(creditos), tipo  FROM universidad.grado RIGHT JOIN universidad.asignatura ON universidad.asignatura.id_grado=universidad.grado.id GROUP BY (grado);
/*Retorna un llistat que mostri quants/es alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats/des.*/
SELECT anyo_inicio, COUNT(DISTINCT id_alumno) FROM universidad.alumno_se_matricula_asignatura RIGHT JOIN universidad.curso_escolar ON universidad.curso_escolar.id=universidad.alumno_se_matricula_asignatura.id_curso_escolar GROUP BY anyo_inicio;
/*Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.*/
SELECT persona.id, persona.nombre AS profesor, apellido1, apellido2, COUNT(DISTINCT asignatura.nombre) AS asignaturas FROM universidad.asignatura RIGHT JOIN universidad.persona ON universidad.persona.id=universidad.asignatura.id_profesor GROUP BY persona.nombre ORDER BY asignaturas DESC;
/*Retorna totes les dades de l'alumne més jove.*/
SELECT * FROM universidad.persona WHERE (tipo='alumno') HAVING MIN(fecha_nacimiento);
/*Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.*/
SELECT persona.nombre AS Profesor, id_departamento, asignatura.nombre AS asignatura FROM universidad.persona LEFT JOIN universidad.profesor ON universidad.profesor.id_profesor=universidad.persona.id LEFT JOIN universidad.asignatura ON universidad.asignatura.id_profesor=universidad.profesor.id_profesor WHERE persona.tipo='profesor' HAVING asignatura.nombre IS NULL;
