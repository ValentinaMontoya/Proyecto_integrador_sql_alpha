/*Se desea saber la lista de usuarios a que grupo pertenece y que carrera está cursando*/
SELECT id_user AS Id, full_name AS Nombre, asignatures.name,
CODE AS Grupo,
careers.NAME AS Carrera
FROM users_groups
	JOIN users ON users.id_user = users_groups.user_id
	JOIN group_s ON group_s.id_group = users_groups.group_id
	JOIN careers ON careers.id_career = group_s.career_id
	JOIN careers_modules ON careers_modules.career_id = careers.id_career
	JOIN modules ON modules.id_module = careers_modules.module_id
	JOIN asignatures ON asignatures.id_asignature = modules.asignature_id
	GROUP BY users.full_name
	ORDER BY users.full_name