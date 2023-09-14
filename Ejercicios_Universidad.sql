/*Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. 
El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.*/
SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo='alumno' ORDER BY apellido1;
/*Esbrina el nom i els dos cognoms dels/les alumnes que no han donat d'alta el seu número de telèfon en la base de dades.*/
SELECT apellido1, apellido2, nombre, telefono FROM universidad.persona WHERE (telefono IS NULL) AND (tipo='alumno');
/*Retorna el llistat dels/les alumnes que van néixer en 1999.*/
SELECT *  FROM universidad.persona WHERE (tipo='alumno') AND (fecha_nacimiento LIKE '%1999%');
/*Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.*/
SELECT *  FROM universidad.persona WHERE (tipo='profesor') AND (nif LIKE '%K');
/*Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.*/