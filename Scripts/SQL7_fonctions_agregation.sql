-- fonctions d'agrégations :

SELECT MIN(nom), -- plus petit
		MAX(prix) -- plus grand
FROM Race;

SELECT SUM(prix), -- somme
		AVG(prix) -- moyenne
FROM Race;

SELECT STDDEV(prix), -- ecart type
		VARIANCE(prix) -- variance
FROM Race;

SELECT GROUP_CONCAT(nom_courant)
FROM espece;

SELECT COUNT(*) nb_animal
		, COUNT(race_id) ani_races
        , COUNT(DISTINCT race_id) race_diff
FROM Animal;

-- fonction de regroupement :

SELECT espece_id, COUNT(*) nb_animaux FROM Animal
GROUP BY espece_id;

-- version CASE, pas bô :
SELECT CASE espece_id WHEN 1 THEN 'chien'
					  WHEN 2 THEN 'chat'
                      ELSE 'sais pô'
	  END
			,COUNT(*) nb_animaux FROM Animal
GROUP BY espece_id;

-- avec une petite jointure :

SELECT nom_courant as espece, COUNT(*) nb_animaux 
FROM Animal
JOIN Espece ON Espece.id = Animal.espece_id
GROUP BY nom_courant;

-- sur plusieurs colonnes :

SELECT nom_courant as espece
		, sexe
		, COUNT(*) nb_animaux
        , GROUP_CONCAT(nom) liste_nom
FROM Animal
JOIN Espece ON Espece.id = Animal.espece_id
GROUP BY nom_courant, sexe;

SELECT nom_courant as espece
		, sexe
		, COUNT(*) nb_animaux
        , GROUP_CONCAT(nom) liste_nom
FROM Animal
JOIN Espece ON Espece.id = Animal.espece_id
GROUP BY sexe,nom_courant;

-- avec le ROLLUP, le début des groupings set :

SELECT nom_courant as espece, COUNT(*) nb_animaux 
FROM Animal
JOIN Espece ON Espece.id = Animal.espece_id
GROUP BY nom_courant WITH ROLLUP;

SELECT nom_courant as espece
		, sexe
		, COUNT(*) nb_animaux
FROM Animal
JOIN Espece ON Espece.id = Animal.espece_id
GROUP BY sexe,nom_courant WITH ROLLUP;

-- filtrer des fonctions d'agrégations :

SELECT nom_courant as espece, COUNT(*) nb_animaux 
FROM Animal
JOIN Espece ON Espece.id = Animal.espece_id
GROUP BY nom_courant
HAVING nb_animaux > 15;





