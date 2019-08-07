--insert admin user 
--senha super user acv@ibict.br é senha = admin123 

INSERT INTO sicv2.user (id, active, country, curriculum, dspurpose, email, firstname, jobposition, language, lastname, orcid, organization, otherlanguage, password_hash, password_hash_salt, phone, qntd_notificacoes, registrationkey, super_admin_permission, title, perfil)
SELECT * FROM (SELECT 1, b'1', 'Albania', 'www.lattes.com.br', 'Administração', 'acv@ibict.br', 'Admin', 'Ciências Florestais', 'Inglês', 'Administrador do SICV Brasil', '' as orcid, 'IBICT', '', 'ef9c9093145a125bb2cd5704766d7a0cd3f9aef831e77741d2cb69e650ae88cd9dd89dd65bda62164bba133503c6bbe95e2127f181dd917940bc698a1b8ab24e', 'yeuIKMax8kXEicHrvY10', '(61) 99322 6415', '0', '4mEYhENQ', true, 'Dr', 'perfil') AS tmp
WHERE NOT EXISTS (
    SELECT email FROM sicv2.user WHERE email = 'acv@ibict.br'
) LIMIT 1;


--insert role USER
INSERT INTO sicv2.role (id, role) 
SELECT * FROM (SELECT 1, 'USER') AS tmp
WHERE NOT EXISTS (
    SELECT role FROM sicv2.role WHERE role = 'USER'
) LIMIT 1;

--insert role MANAGER
INSERT INTO sicv2.role (id, role ) 
SELECT * FROM (SELECT 2, 'MANAGER') AS tmp
WHERE NOT EXISTS (
    SELECT role FROM sicv2.role WHERE role = 'MANAGER'
) LIMIT 1;

--insert role ADMIN
INSERT INTO sicv2.role (id, role) 
SELECT * FROM (SELECT 3, 'ADMIN') AS tmp
WHERE NOT EXISTS (
    SELECT role FROM sicv2.role WHERE role = 'ADMIN'
) LIMIT 1;

--insert role USER in ADMIN user
INSERT INTO sicv2.user_roles (user_id,role_id ) 
SELECT * FROM (SELECT 1, 1 as role_id) AS tmp
WHERE NOT EXISTS (
    SELECT role_id FROM sicv2.user_roles WHERE user_id = 1 AND role_id = 1
) LIMIT 1;

--insert role ADMIN in ADMIN user
INSERT INTO sicv2.user_roles (user_id,role_id ) 
SELECT * FROM (SELECT 1, 3) AS tmp
WHERE NOT EXISTS (
    SELECT user_id FROM sicv2.user_roles WHERE user_id = 1 AND role_id = 3
) LIMIT 1;

--FOR DEVELOPMENT TESTS

--  insert into sicv2.user (id, country, curriculum, dspurpose, email, firstname, jobposition, language, lastname, orcid, organization, otherlanguage, password_hash, password_hash_salt, phone, qntd_notificacoes, registrationkey, super_admin_permission, title, active)
--  values
--  (2, NULL, NULL, NULL, 'tiagobraga@ibict.br', 'Tiago', NULL, NULL, 'Braga', NULL, '', NULL, '66a2e4c1f11d83884a21c206ec09dd7b3d7eeaa537b428ba3aa95f38fba9f591bdd3f2d988c3147a0f97ad58140d55f2a7508465e88b293ce959cc24dc471e9f', 'uDbWYuDOm5OH7zbQ6ciK', NULL, '0', 'anHnza5B', NULL, NULL, 1)
--  ,(3, NULL, NULL, NULL, 'wellingtonsousa@ibict.br', 'Wellington', NULL, NULL, 'stanley', NULL, '', NULL, '66a2e4c1f11d83884a21c206ec09dd7b3d7eeaa537b428ba3aa95f38fba9f591bdd3f2d988c3147a0f97ad58140d55f2a7508465e88b293ce959cc24dc471e9f', 'uDbWYuDOm5OH7zbQ6ciK', NULL, '1', '5!8NA4Lg', NULL, NULL, 1)
--  ,(4, NULL, NULL, NULL, 'deivdysilva@ibict.br', 'deivdy', NULL, NULL, 'willliam', NULL, '', NULL, '66a2e4c1f11d83884a21c206ec09dd7b3d7eeaa537b428ba3aa95f38fba9f591bdd3f2d988c3147a0f97ad58140d55f2a7508465e88b293ce959cc24dc471e9f', 'uDbWYuDOm5OH7zbQ6ciK', NULL, '0', 'xrFA3qsJ', NULL, NULL, 1);
--
--  INSERT INTO `sicv2`.`user_roles` (`user_id`, `role_id`) VALUES ('2', '1') , ('2','2'), ('3', '1'), ('4', '1');
