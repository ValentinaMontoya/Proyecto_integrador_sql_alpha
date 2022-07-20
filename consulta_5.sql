/*Contar cuantos estudiantes son de itagui*/
SELECT COUNT(cities.name) AS 'Cantidad de estudiantes de una ciudad'
FROM addresses
	JOIN cities ON cities.id_city = addresses.city_id
	JOIN users ON users.id_user = addresses.user_id
WHERE cities.name LIKE '%Ita%'