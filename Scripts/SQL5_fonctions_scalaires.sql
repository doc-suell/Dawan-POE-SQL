ALTER TABLE Race 
ADD prix DECIMAL(7,2);

ALTER TABLE Espece 
ADD prix DECIMAL(7,2);

-- Remplissage des colonnes "prix"
UPDATE Espece SET prix = 200 WHERE id = 1;
UPDATE Espece SET prix = 150 WHERE id = 2;
UPDATE Espece SET prix = 140 WHERE id = 3;
UPDATE Espece SET prix = 700 WHERE id = 4;
UPDATE Espece SET prix = 10 WHERE id = 5;
UPDATE Espece SET prix = 75 WHERE id = 6;

UPDATE Race SET prix = 450 WHERE id = 1;
UPDATE Race SET prix = 900 WHERE id = 2;
UPDATE Race SET prix = 950 WHERE id = 3;
UPDATE Race SET prix = 800 WHERE id = 4;
UPDATE Race SET prix = 700 WHERE id = 5;
UPDATE Race SET prix = 1200 WHERE id = 7;
UPDATE Race SET prix = 950 WHERE id = 8;
UPDATE Race SET prix = 600 WHERE id = 9;

SELECT * FROM Espece;
SELECT * FROM Race;

SELECT 3*2, 2-1, 1+1, 8/2, 3%2;

SELECT prix, prix+50 augmentation, prix-20 ristourne, prix*3 triplé, prix/2 soldes
FROM espece;

SELECT MAX(prix) FROM Race; -- fonction d'agrégation

SELECT nom, LENGTH(nom) FROM Race; -- fonction scalaire

-- quelques fonctions avec différents nombre de paramètres :

SELECT CURRENT_TIMESTAMP(), USER(), VERSION(); -- pas de paramètres

SELECT LENGTH(nom) FROM Race; -- un paramètre

SELECT LOCATE('la','blablabla'), LOCATE('la','blablabla',3);

-- fonctions exotiques :
-- récupérer le dernier id inséré :
SELECT LAST_INSERT_ID();

INSERT INTO Animal(nom,date_naissance,sexe,race_id,espece_id)
SELECT 'Felix', '2012-03-16', 'M', LAST_INSERT_ID(), id 
FROM espece WHERE nom_courant = 'chat';

SELECT * FROM Animal WHERE nom = 'Felix';

SET @id = LAST_INSERT_ID();

-- conversion de type :
SELECT CAST('20100619' AS DATE);

SELECT CAST(prix/2 AS DECIMAL(10,2)) FROM Espece ;

-- formatage :

SELECT FORMAT(prix/2,2) FROM Race;

SELECT FORMAT(178496156.52864,2,'fr_FR'); -- standard pour tous les SGBD (sauf quelques outils sur MySQL)
SELECT FORMAT(178496156.52864,2,'en_US');
SELECT FORMAT(178496156.52864,2,'de_DE');

SELECT DATE_FORMAT('2010-12-25','the %W %d %M %Y'); -- spécifique à MySQL

-- numériques :

SELECT FLOOR(129.99), FLOOR(129.49); -- arrondi à l'inferieur 

SELECT CEIL(129.99), CEILING(129.49); -- arrondi superieur

SELECT ROUND(129.99), ROUND(129.49),
ROUND(129.99,1), ROUND(129.49,-2); -- arrondi

SELECT SIGN(-42),SIGN(0),SIGN(42); -- récuperer le signe
SELECT ABS(-42),ABS(0),ABS(42); -- valeur absolue

SELECT RAND(); -- valeur aléatoire
SELECT RAND(5);

SELECT * FROM Animal
ORDER BY RAND() -- tri aléatoire
LIMIT 5;

-- fonctions de chaines :

SELECT LENGTH('soon™'), -- poids de la chaine de caractère
CHAR_LENGTH('soon™'); -- nombre de caractères

SELECT LENGTH('toît'), -- poids de la chaine de caractère
CHAR_LENGTH('toît'); -- nombre de caractères


SELECT LEFT('123456','3') , RIGHT('123456','3'); -- bout de chaine à gauche ou droite

SELECT LOCATE('la','blablabla',3); -- récupère la position d'une chaine

SELECT SUBSTRING('blablabla',2,3); -- a partir de la 2eme position 3 caracctères

SELECT REPLACE('Enzo','E','€'); -- remplace des caractères par un autre (case sensitive)

SELECT INSERT('toto',2,2,'rét'); -- remplace une chaine par un autre

SELECT TRIM('         bla bla bla  !        '); -- retire les espaces en trop (gauche et droite)

SELECT CONCAT('une ','belle','phrase','sur','plusieurs','colonnes'),
CONCAT_WS(' ','une ','belle','phrase','sur','plusieurs','colonnes');

-- j'aimerais avoir une phrase avec le prix des animaux proprement :
-- une espece coute tant euros ...

-- 'nom prenom' -> e.rosario@dawan.fr



