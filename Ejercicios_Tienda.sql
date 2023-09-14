/*Llista totes les columnes de la taula "producto".*/
SELECT * FROM tienda.producto;
/*Llista el nom de tots els productes que hi ha en la taula "producto".*/
SELECT nombre FROM tienda.producto;
/*Llista els noms i els preus de tots els productes de la taula "producto".*/
SELECT nombre, precio FROM tienda.producto;
/*Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans (USD).*/
SELECT nombre, precio, ROUND(precio*0.93,2) AS 'Precio USD' FROM tienda.producto;
/*Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de "producto", euros, dòlars nord-americans.*/
SELECT nombre AS 'Producto', precio AS 'Euros', ROUND(precio*0.93,2) AS 'Dòlars nord-americans' FROM tienda.producto;
/*Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a majúscula.*/
SELECT UPPER(nombre), precio FROM tienda.producto;
/*Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a minúscula.*/
SELECT LCASE(nombre), precio FROM tienda.producto;
/*Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.*/
SELECT nombre, ucase(substr(nombre,1,2)) FROM tienda.fabricante;
/*Llista els noms i els preus de tots els productes de la taula "producto", arrodonint el valor del preu.*/
SELECT nombre, ROUND(precio) FROM tienda.producto;
/*Llista els noms i els preus de tots els productes de la taula "producto", truncant el valor del preu per a mostrar-lo sense cap xifra decimal.*/
SELECT nombre, FLOOR(precio) FROM tienda.producto;
/*Llista el codi dels fabricants que tenen productes en la taula "producto".*/
SELECT codigo_fabricante FROM tienda.producto;
/*Llista el codi dels fabricants que tenen productes en la taula "producto", eliminant els codis que apareixen repetits.*/
SELECT codigo_fabricante FROM tienda.producto GROUP BY codigo_fabricante;
/*Llista els noms dels fabricants ordenats de manera ascendent.*/
SELECT nombre FROM tienda.fabricante;
/*Llista els noms dels fabricants ordenats de manera descendent.*/
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;
/*Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.*/
SELECT nombre, precio FROM tienda.producto ORDER BY precio DESC;
/*Retorna una llista amb les 5 primeres files de la taula "fabricante".*/
SELECT * FROM tienda.fabricante LIMIT 5;
/*Retorna una llista amb 2 files a partir de la quarta fila de la taula "fabricante". La quarta fila també s'ha d'incloure en la resposta.*/
SELECT * FROM tienda.fabricante LIMIT 2 OFFSET 3;
/*Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MIN(preu), necessitaries GROUP BY*/
SELECT nombre, precio FROM tienda.producto ORDER BY precio LIMIT 1;
/*Llista el nom i el preu del producte més car. (Fes servir solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MAX(preu), necessitaries GROUP BY.*/
SELECT nombre, precio FROM tienda.producto ORDER BY precio DESC LIMIT 1;
/*Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.*/
SELECT * FROM tienda.producto WHERE codigo_fabricante=2;

