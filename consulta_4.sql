/*Se desea saber quienes son nacidos despues del 2000 los estudiantes de 
frontend que sean de una determinada ciudad. :D */

SELECT users.full_name AS Nombre, users.birthday AS Nacimiento
FROM addresses
	JOIN cities ON cities.id_city = addresses.city_id
	JOIN users ON users.id_user = addresses.user_id
	JOIN users_roles ON users_roles.user_id = users.id_user
	JOIN roles ON roles.id_role = users_roles.role_id
	JOIN users_groups ON users_groups.user_id = addresses.user_id
	JOIN group_s ON group_s.id_group = users_groups.group_id
	JOIN careers ON group_s.career_id = careers.id_career
WHERE users.birthday > '2000-01-01' AND (roles.name = 'Estudiante' 
OR roles.name = 'Administrador'
OR roles.name = 'Psicóloga')
AND cities.name LIKE '%po%'
ORDER BY users.birthday
