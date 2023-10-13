SELECT *
FROM Race WHERE nom LIKE '%berger%';

SELECT Animal.nom
		,date_naissance
        ,race.nom
FROM Animal
JOIN Race
ON Animal.race_id = Race.id
WHERE Race.description NOT LIKE '%pelage%';

SELECT Animal.sexe
		,Espece.nom_latin as espece
        ,Race.nom as race
FROM Animal
LEFT JOIN Race
ON Animal.race_id = Race.id
LEFT JOIN Espece
ON Animal.Espece_id = Espece.id
WHERE Espece.nom_courant = 'chat'
OR espece.nom_courant = 'Perroquet amazone'
ORDER BY espece, race;

SELECT Animal.nom
		,Animal.date_naissance
		,Race.nom
FROM Animal
JOIN Race
ON Animal.race_id = Race.id
WHERE Animal.sexe = 'F'
AND Animal.date_naissance < '2010-07-01'
AND Animal.race_id IS NOT NULL
AND animal.espece_id = 1;

SELECT *
FROM Animal
JOIN espece
ON Animal.Espece_id = Espece.id
WHERE Espece.nom_courant = 'chat'
AND Animal.mere_id IS NOT NULL
AND Animal.pere_id IS NOT NULL;

SELECT Animal.nom
		,Animal.sexe
		,Animal.date_naissance
FROM Animal
JOIN Animal as e

SELECT * FROM Animal WHERE nom = 'bouli';


