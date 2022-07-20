/* Se desea obtener el nombre del usuario, el título de la noticia que publicó y que sea administrador en código 13 ordenando por Id */

SELECT id_user AS Id, full_name AS Nombre,
roles.name AS Rol,
title AS Título


FROM users_roles
	JOIN roles ON users_roles.role_id = roles.id_role
	JOIN users ON users.id_user = users_roles.user_id
	JOIN news ON news.user_id = users.id_user
WHERE roles.name LIKE '%AdM%'
ORDER BY Id