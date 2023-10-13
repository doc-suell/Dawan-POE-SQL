-- les index et les jointures :

CREATE INDEX ix_nom ON Animal(nom);

DROP INDEX ix_nom ON Animal;

CREATE UNIQUE INDEX ix_nom_espece ON Animal(nom,espece);

SELECT * FROM Animal
WHERE nom = 'roucky';

/* PRIMARY KEY est :
	- un INDEX (CLUSTER)
    - UNIQUE
	- NOT NULL
*/

-- clé étrangère :

ALTER TABLE Animal 
ADD CONSTRAINT fk_espece_id FOREIGN KEY(espece_id) REFERENCES Espece(id);

SELECT * FROM Animal;
SELECT * FROM Espece;

DELETE FROM Espece;

-- la jointure interne :

SELECT * FROM Animal
WHERE nom = 'bobo';

SELECT * FROM Espece
WHERE id = 1;

SELECT * 
FROM Animal JOIN Espece 
	ON Animal.espece_id = Espece.id
WHERE nom = 'bobo';

-- avec toute la table Animal :

SELECT  Animal.nom
		,Espece.nom_courant as espece
		,Animal.sexe
        ,Animal.date_naissance
FROM Animal 
JOIN Espece 						-- INNER JOIN = JOIN
	ON Animal.espece_id = Espece.id;

-- problème de la jointure interne, les nulls sont exclus :

SELECT * FROM Animal;

SELECT  *
FROM Animal 
JOIN Race
	ON Animal.race_id = Race.id;

-- les jointures externes :

SELECT  Animal.nom
		,Race.nom as race
FROM Animal LEFT JOIN Race
	ON Animal.race_id = Race.id
WHERE Animal.espece_id = 2;

SELECT  Animal.nom
		,Race.nom as race
FROM Animal RIGHT JOIN Race
	ON Animal.race_id = Race.id
WHERE Race.espece_id = 2;

SELECT  Animal.nom
		,Race.nom as race
FROM Race LEFT JOIN Animal
	ON Animal.race_id = Race.id
WHERE Race.espece_id = 2;

-- joindre plusieurs tables :

SELECT Animal.nom
		,Espece.nom_courant as espece
        ,Race.nom as race
FROM Animal 
JOIN Espece 
	ON Animal.espece_id = Espece.id
LEFT JOIN Race
	ON Animal.race_id = Race.id;

-- auto-jointure :

SELECT * 
FROM Animal
JOIN Animal as Mere
	ON Animal.mere_id = Mere.id;

-- jointure obsolète, le produit carthésien :

SELECT * FROM Animal,Espece
WHERE Animal.espece_id = Espece.id;



