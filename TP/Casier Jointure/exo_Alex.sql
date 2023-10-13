
-- question 1
select * from race WHERE nom LIKE '%berger%';

-- question 2
SELECT Animal.nom
        ,date_naissance
        ,race.nom
FROM Animal
JOIN Race
ON Animal.race_id = Race.id
WHERE Race.description NOT LIKE '%pelage%';

-- question 3
SELECT  animal.nom
        ,espece.nom_latin as espece
        ,animal.sexe
        ,race.nom as race
FROM animal
LEFT JOIN espece
    ON animal.espece_id = espece.id
LEFT JOIN race
    ON animal.race_id = race.id
WHERE espece.nom_courant = 'chat' 
OR espece.nom_courant = 'perroquet amazone'
order by espece, race;
-- question 4


-- question 5
-- question 6