/*Se quiere obtener la ciudad y cuatnos participantes de frontend viven en ella*/
SELECT cities.name AS Ciudad, COUNT(cities.name) AS 'Cantidad',
careers.name AS Carrera

FROM addresses
	JOIN cities ON cities.id_city = addresses.city_id
	JOIN users_groups ON users_groups.user_id = addresses.user_id
	JOIN group_s ON group_s.id_group = users_groups.group_id
	JOIN careers ON group_s.career_id = careers.id_career

WHERE cities.name LIKE '%ItAg%'

ORDER BY cities.name