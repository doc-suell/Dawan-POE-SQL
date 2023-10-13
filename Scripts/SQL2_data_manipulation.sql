-- data manipulation language :
USE elevage;

SHOW TABLES;
DESCRIBE animal;

SELECT * FROM Animal;

-- insertion de données manuelles :

INSERT INTO animal
VALUES (1,'chien','M','2010-09-21 12:00:00','Roucky', 'Aime les léchouilles');

SELECT * FROM Animal;

INSERT INTO animal
VALUES (NULL,'chat',NULL,'2006-06-15 12:00:00','Rox', 'Ressemble bizarrement à un renard');

SELECT * FROM animal;

INSERT INTO animal(sexe,nom,espece,date_naissance)
VALUES ('M','Bagherra','chat','2008-07-10 18:15:00'),
	   (NULL,'Donatello','tortue','2006-05-02 03:45:00'),
       ('F','Caroline','chien','2007-11-02 09:45:00');

SELECT * FROM animal;

-- insertion de masses : 
-- csv -> interface : clic droit sur la base -> Table Data Import Wizard
-- par requete (nécessite une action Admin préalable sur my.ini) :

LOAD DATA INFILE 'adresse fichier'
INTO TABLE animal
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n';

SELECT * FROM Animal;

/* .sql -> interface : onglet File -> Open sql script
par requete (uniquement en connection SHELL) :
\connect user@ip_host:port
SOURCE 'nom_dossier'+*+'.sql'
*/ 

SOURCE 'adresse_fichier';

SELECT * FROM Animal;

-- affichage de données en long en large et en travers :

SELECT 'Hello world !' as message, (3+2)/9*0.2 as opération;

SELECT * FROM Animal;

SELECT elevage.animal.espece
		,animal.sexe
		,nom
        ,'Table Animal' origine
FROM elevage.animal;

-- filtrer des données : WHERE

SELECT * FROM Animal
WHERE espece = 'chien';

SELECT * FROM Animal
WHERE nom <= 'd';

SELECT * FROM Animal
WHERE date_naissance > '2009-06-10';

SELECT * FROM Animal
WHERE espece != 'chat'; -- != different de

SELECT * FROM Animal
WHERE espece <> 'chat'; -- <> aussi different de

-- les opérateurs logiques :

SELECT * FROM Animal
WHERE espece = 'chien' AND sexe != 'F';

SELECT * FROM Animal
WHERE espece = 'chien' OR espece = 'chat';

SELECT * FROM Animal
WHERE NOT(espece = 'chien' OR espece = 'chat');

SELECT * FROM Animal
WHERE espece = 'chien' XOR sexe = 'F'; -- OR exclusif

-- le cas du NULL :

SELECT * FROM Animal
WHERE sexe IS NULL;

SELECT * FROM Animal
WHERE commentaires IS NOT NULL;

-- il me faut (tous les animaux nés après 2009)
-- (et tous les chats males)
-- (et les chats femelles nés avant aout 2007)

SELECT * FROM Animal
WHERE date_naissance >= '2010-01-01' -- format date 'yyyy-mm-dd'
OR espece = 'chat' AND sexe = 'M'
OR espece = 'chat' AND sexe = 'F' AND date_naissance < '2007-08-01';

-- les options supplémentaires du SELECT :
-- obtenir uniquement les valeurs différentes d'une ou pusieurs colonnes

SELECT espece FROM Animal;
SELECT DISTINCT espece FROM Animal; 
SELECT DISTINCT espece,sexe FROM Animal;

-- trier les valeurs d'une colonne dans l'ordre croissant ou décroissant :

SELECT * FROM Animal
ORDER BY espece; -- par défaut, croissant

SELECT * FROM Animal
ORDER BY espece ASC, sexe DESC; -- DESC pour décroissant

-- pour travailler des échantillons de données :

SELECT * FROM Animal
LIMIT 10; -- limiter le résultat aux 10 premières lignes

SELECT * FROM Animal
LIMIT 5 OFFSET 15;  -- offset permet de sauter les 15 premières lignes
					-- et de récupere les 5 suivantes

-- petit test intermédiaire :
-- comment récupérer les informations de l'animal le plus vieux ?

SELECT * FROM animal
ORDER BY date_naissance
LIMIT 1;

-- avoir une liste de variables à tester

SELECT * FROM Animal
WHERE id = 1 
OR id = 3
OR id = 12
OR id = 42
OR id = 23
OR id = 51;

SELECT * FROM Animal
WHERE id IN (1,3,12,23,42,51);

-- fourchette de valeurs, entre deux bornes :

SELECT * FROM Animal
WHERE date_naissance >= '2006-09-01' AND date_naissance <= '2008-03-01';

SELECT * FROM Animal
WHERE date_naissance BETWEEN '2006-09-01' AND '2008-03-01';

-- les recherches approximatives :

SELECT * FROM Animal
WHERE nom LIKE 'f%'; -- % remplace n'importe quelle chaine de caractère

SELECT * FROM Animal
WHERE nom LIKE '%f%';

SELECT * FROM Animal
WHERE nom LIKE '_a%'; -- _ remplace un seul caractère

-- mettre à jour des données :

SELECT * FROM Animal
WHERE id = 33;

UPDATE Animal
SET nom = 'Rouquin', sexe = 'M'
WHERE id = 33;

-- supprimer des données :

TRUNCATE TABLE Animal; -- supprime toutes les lignes, sans distinctions, remet tous les indexs à zéros

DELETE 
-- SELECT *
FROM Animal
WHERE nom = 'Donatello';

DELETE FROM animal;

