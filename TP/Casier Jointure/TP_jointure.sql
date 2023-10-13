-- TP JOINTURES :
-- 1) Vous devez obtenir la liste des races de chiens
-- qui sont des chiens de berger.

select * from race WHERE nom LIKE '%berger%';

-- SELECT   animal.nom
			-- ,race.nom as race
-- FROM animal
-- JOIN race
	-- ON animal.race_id = race.id
-- WHERE race.nom LIKE '%berger%';    


-- 2) Vous devez obtenir la liste des animaux
-- (leur nom, date de naissance et race) 
-- pour lesquels nous n'avons aucune information sur leur pelage. 

SELECT * FROM race
WHERE race.description NOT LIKE '%pelage%';

SELECT  animal.nom
		,animal.date_naissance
        ,race.nom as race
FROM animal
LEFT JOIN race
	ON animal.race_id = race.id
WHERE race.description NOT LIKE '%pelage%';


-- 3) Vous devez obtenir la liste des chats et des perroquets amazones,
-- avec leur sexe, leur espèce (nom latin) et leur race s'ils en ont une.
-- Regroupez les chats ensemble, les perroquets ensemble et,
-- au sein de l'espèce, regroupez les races.

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
AND date_naissance < '2010-01-01';

SELECT * FROM animal
WHERE sexe = 'F' 
AND espece_id = 1 
AND date_naissance < '2010-01-01';

-- Pour les énervés de la jointure :
-- 1) Vous devez obtenir la liste des chats dont on connaît les parents,
-- ainsi que le nom de ces parents.

SELECT  animal.nom
		,mere.nom
        ,pere.nom
FROM animal
JOIN animal as mere
	ON animal.mere_id = animal.mere_id
JOIN animal as pere
	ON animal.pere_id = animal.pere_id;

-- 2) Vous devez maintenant obtenir la liste des enfants de Bouli
-- (nom, sexe et date de naissance).

-- Pour la suivante, bon courage :)
-- 3) Vous devez obtenir la liste des animaux
-- dont on connaît le père, la mère, la race,
-- la race du père, la race de la mère.
-- Affichez le nom et la race de l'animal et de ses parents,
-- ainsi que l'espèce de l'animal (pas des parents).