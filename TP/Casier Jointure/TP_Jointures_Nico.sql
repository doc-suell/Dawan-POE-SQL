-- TP JOINTURES :
-- 1) Vous devez obtenir la liste des races de chiens
-- qui sont des chiens de berger.

SELECT * FROM race WHERE nom LIKE 'Berger%';


-- 2) Vous devez obtenir la liste des animaux
-- (leur nom, date de naissance et race) 
-- pour lesquels nous n'avons aucune information sur leur pelage.

SELECT Animal.nom
        ,date_naissance
        ,race.nom
FROM Animal
JOIN Race
ON Animal.race_id = Race.id
WHERE Race.description NOT LIKE '%pelage%';


-- 3) Vous devez obtenir la liste des chats et des perroquets amazones,
-- avec leur sexe, leur espèce (nom latin) et leur race s'ils en ont une.
-- Regroupez les chats ensemble, les perroquets ensemble et,
-- au sein de l'espèce, regroupez les races.

SELECT  animal.nom
	,animal.sexe
        ,espece.nom_latin as espece
        ,race.nom as race
FROM animal
LEFT JOIN espece
    ON animal.espece_id = espece.id
LEFT JOIN race
    ON animal.race_id = race.id
WHERE espece.nom_courant = 'chat' 
OR espece.nom_courant = 'perroquet amazone'
order by espece, race;


-- 4) Vous devez obtenir la liste des chiennes dont on connaît la race,
-- et qui sont en âge de procréer (c'est-à-dire nées avant juillet 2010).
-- Affichez leurs nom, date de naissance et race.

SELECT  animal.nom
        ,animal.date_naissance
        ,race.nom as race
FROM animal
JOIN race
    ON animal.race_id = race.id
WHERE animal.espece_id = 1
AND sexe = 'F' 
AND date_naissance < '2010-07-01';


-- Pour les énervés de la jointure :
-- 1) Vous devez obtenir la liste des chats dont on connaît les parents,
-- ainsi que le nom de ces parents.

-- 2) Vous devez maintenant obtenir la liste des enfants de Bouli
-- (nom, sexe et date de naissance).

-- Pour la suivante, bon courage :)
-- 3) Vous devez obtenir la liste des animaux
-- dont on connaît le père, la mère, la race,
-- la race du père, la race de la mère.
-- Affichez le nom et la race de l'animal et de ses parents,
-- ainsi que l'espèce de l'animal (pas des parents).