-- les sous requetes :
USE elevage;

SELECT * FROM Animal
WHERE nom = 'Bobo';

SELECT espece_id FROM Animal
WHERE nom = 'Bobo';

SELECT * FROM Espece
WHERE id = (SELECT espece_id FROM Animal
			WHERE nom = 'Bobo');

-- en considérant que Bouli est un male,
-- comment je peux récuperer les enfants de bouli par sous requete?

-- EXPLAIN
SELECT * FROM Animal
WHERE pere_id = (SELECT id FROM Animal WHERE nom = 'Bouli');

-- dans ce cas précis, petite volumétrie et utilisation d'index,
-- la sous requete est plus efficace que la jointure

-- autre intérêt de la sous requete :
-- comment récupérer les infos de l'animal le plus jeune ?

SELECT * FROM Animal
ORDER BY date_naissance DESC
LIMIT 1;

SELECT * FROM Animal
WHERE date_naissance = (SELECT MAX(date_naissance) FROM Animal);

-- retourne plusieurs valeurs :

SELECT * FROM Animal
WHERE race_id IN (SELECT id FROM race WHERE espece_id = 1);

-- plusieurs colonnes dans la sous requete :

SELECT * FROM Animal
WHERE (race_id,espece_id) 
	IN (SELECT id,espece_id FROM race WHERE espece_id = 1);

-- la sous requete avec EXISTS et NOT EXISTS :

SELECT nom FROM race
WHERE EXISTS (SELECT * FROM Animal WHERE Animal.race_id = Race.id);

SELECT nom FROM race
WHERE NOT EXISTS 
	(SELECT * FROM Animal WHERE Animal.race_id = Race.id);

-- la sous requete dans un select :

SELECT nom, (SELECT nom FROM Race WHERE Animal.race_id = Race.id) as race
FROM Animal;

-- sous requetes dans un FROM, les tables dérivées :

SELECT *
FROM 
	(SELECT Animal.nom
			,Animal.sexe
			,Espece.nom_courant as espece
			,Race.nom as race
	FROM Animal 
	JOIN Espece 
		ON Animal.espece_id = Espece.id
	LEFT JOIN Race
		ON Animal.race_id = Race.id) as elevage
WHERE race LIKE '%berger%';

-- les COMMON TABLE EXPRESSION :

WITH cte_elevage AS
	C

SELECT * FROM cte_elevage
WHERE espece = 'chien';

SELECT * FROM cte_elevage; -- ici la cte "n'existe plus"

-- la requete sauvegardé, les vues :

CREATE OR REPLACE VIEW v_elevage AS
(SELECT Animal.nom
			,Animal.sexe
            ,Animal.date_naissance
			,Espece.nom_courant as espece
			,Race.nom as race
	FROM Animal 
	JOIN Espece 
		ON Animal.espece_id = Espece.id
	LEFT JOIN Race
		ON Animal.race_id = Race.id);

SELECT * FROM v_elevage
WHERE espece = 'chien';

-- la table temporaire, n'existe que le temps de la sessions en cours :

CREATE TEMPORARY TABLE tmp_elevage AS
SELECT * FROM v_elevage;

SELECT * FROM tmp_elevage;

-- modification de tables :

/* Nouvelle adoption :
nom : Ulysse
date de naissance : 2010-02-16
sexe : M
espece : chat
race : sphynx
*/

SELECT id, espece_id FROM race WHERE nom = 'Sphynx';

SELECT 'Ulysse', '2010-02-16', 'M';

INSERT INTO Animal(nom,date_naissance,sexe,race_id,espece_id)
SELECT 'Ulysse', '2010-02-16', 'M', id as race_id, espece_id 
FROM race WHERE nom = 'Sphynx';

SELECT * FROM Animal WHERE nom = 'Ulysse';

-- UPDATE avec sous requete :

INSERT INTO Race (nom, espece_id, description)
VALUES ('Nebelung', 2, 'Chat bleu russe, mais avec des poils longs...');

UPDATE Animal
SET race_id = (SELECT id FROM Race WHERE nom = 'Nebelung')
WHERE nom = 'Filou';

-- l'opérateur d'ensemble, UNION :

SELECT nom FROM Race
UNION  -- peut etre remplacé par INTERSECT ou EXCEPT hors MySQL
SELECT nom_courant FROM Espece;
