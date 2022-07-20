INSERT INTO users(full_name, document_type, document_number, phone_number, birthday, picture, description)

VALUES ('Sebastián Moreno', 'C.C', '1048674274', '3246458970', '2004-05-12', 'aca va la imagen', 'Este maestro se encuentra enseñando Frontend'), 
('Sofia Sánchez', 'T.I', '147526964', '3105809658', '1999-09-11', 'acá va la imagen', 'Esta Estudiante se encuentra cursando el módulo de Backend'), 
('Valeria Estrada', 'C.C', '1827491749', '3146897514',  '2005-06-06', 'acá va la imagen', 'Esta psicóloga se encuentra cursando el módulo de Frontend'),
('Manuela vides', 'T.I', '1836292738', '3205147896', '2005-06-06', 'acá va la imagen', 'Esta administrador se encuentra cursando el módulo de Backend'),
('Juan Pablo Jiménez', 'C.C', '1927392739', '3002065874', '1998-12-12', 'acá va la imagen', 'Este maestro se encuentra enseñando Backend');

INSERT INTO roles(name)

VALUES ('Estudiante'),
 ('Maestro'),
 ('Administrador'), 
 ('Psicóloga'), 
 ('Coordinador');

INSERT INTO users_roles(user_id, role_id)

VALUES (1, 2), (5, 2), (3, 4), (2, 1), (4, 3);

INSERT INTO news(title, description, picture, date, user_id)


VALUES('Código c-13 el cambio que necesita los jóvenes',
'El día de hoy se lanzan las convocatorias para participar en la prueba piloto escuela de programación código c-13',
'acá va la imagen','2022-04-11', 1),
('¡Los jóvenes se conectan!',
'Después del lanzamiento y convocatoria la escuela de desarrollo de software c-13 muchos jóvenes se sienten emocionados de poder pertenecer y crecer como futuros programadores',
'acá va la imagen', '2022-04-16', 5),
('Inicia la prueba', 
'El día de hoy los jóvenes darán su primer paso realizando las pruebas de ingreso a la escuela',
'acá va la imagen', '2022-04-20', 3),
('Anuncian los futuros programadores de la comuna 13',
'Hoy 25 de abril se anuncian los participantes ganadores que serán parte de  este proyecto',
'acá va la imagen','2022-04-25', 2),
('Se llego el gran día',
'Hoy 1 de mayo los jóvenes empiezan esta gran aventura llamada programación',
'acá va la imagen', '2022-05-01', 4);

INSERT INTO Cities(name)

VALUES ('Itagüí'), ('Bello'), ('Medellín'), ('Poblado'), ('Sabaneta');


INSERT INTO addresses(name, city_id, user_id)

VALUES ('Cll 34 AA N° 125-166', 1, 1),
('Crr 88 A N° 23-25', 5, 5), 
('Cll 23 AA N° 134-188', 3, 3),
('Cll 34 AA N° 178-123', 2, 2), 
('Crr 24 A N° 45-56', 4, 4);


INSERT INTO journies(name)

VALUES ('Mañana'), ('Tarde'), ('Noche');

INSERT INTO careers(name, section, picture, description)

VALUES ('Frontend', '01', 'Acá va la imagen', 'Esta es la carrera que se esta cursando'), 
('Backend', '02', 'Acá va la imagen', 'Esta es la carrera que se esta cursando');

INSERT INTO group_s(code, journey_id, career_id)

VALUES ('FM2201', 1, 1),
('BT2201', 2, 2),
('FT2202', 2, 1),
('BM2202', 1, 2),
('BT2203', 2, 1);


INSERT INTO asignatures(name)

VALUES ('Nivelatorio'), 
('Base de Datos'), 
('JavasCript'), 
('NodeJs'), 
('React'), 
('Html');

INSERT INTO modalities(name)

VALUES ('Virtual'), ('Presencial');

INSERT INTO users_groups(user_id, group_id)

VALUES (1, 1), (2, 2), (3, 3), (2, 2), (4, 4);

INSERT INTO modules(asignature_id, term, description, modality_id)

VALUES (1, 3, 'El número 3 hace referencia al número de semanas estudiadas en este modulo. Este módulo es para conocer la capacidad que tiene el estudiante sobre el tema', 1),
(1, 3, 'El número 3 hace referencia al número de semanas estudiadas en este modulo. Este módulo es para conocer la capacidad que tiene el estudiante sobre el tema', 2),
(2, 4, 'El número 4 hace referencia a la cantidad de semanas en la que se estudiará el módulo. Este módulo se desempeña en la creación, actualización, eliminación, inserción y unión de la tabla de datos', 1),
(2, 3, 'El número 3 hace referencia al número de semanas estudiadas en este modulo. Este módulo se desempeña en la creación, actualización, eliminación, inserción y unión de la tabla de datos', 2),
(3, 6, 'El número 6 hace referencia al número de semanas estudiadas en este modulo. Este módulo se desempeña en aprender lenguajes JavasCript', 1),
(3, 3, 'El número 3 hace referencia al número de semanas estudiadas en este modulo. Este módulo se desempeña en aprender lenguajes JavasCript', 2),
(4, 4, 'El número 4 hace referencia al número de semanas estudiadas en este modulo. Este módulo nos permite ejecutar código de una manera veloz', 1),
(4, 2, 'El número 2 hace referencia al número de semanas estudiadas en este modulo. Este módulo nos permite ejecutar código de una manera veloz', 2),
(5, 6, 'El número 6 hace referencia al número de semanas estudiadas en este modulo. Este módulo nos permite crear interfaces de usuario con el objetivo de facilitar el desarrollo de aplicaciones en una sola página', 1),
(5, 3, 'El número 3 hace referencia al número de semanas estudiadas en este modulo. Este módulo nos permite crear interfaces de usuario con el objetivo de facilitar el desarrollo de aplicaciones en una sola página', 2),
(6, 4, 'El número 4 hace referencia al número de semanas estudiadas en este modulo. Este módulo es para el desarrollo y creación de páginas web', 1),
(6, 2, 'El número 2 hace referencia al número de semanas estudiadas en este modulo. Este módulo es para el desarrollo y creación de páginas web', 2);


INSERT INTO careers_modules(module_id, career_id)

VALUES (1,1), (1,2), (2,2), (3,1), (3,2), (4,2), (5,1), (6,1);

