-- fonctions temporelles

SET lc_time_names = 'fr_FR';
SET lc_time_names = 'en_US';

SELECT CURDATE(), CURRENT_DATE(); -- date du jour

SELECT CURTIME(), CURRENT_TIME(); -- heure actuelle

SELECT CURRENT_TIMESTAMP(), NOW(); -- horodateur

-- récupérer des parties de dates :

SELECT 
    YEAR(date_naissance) annee,
    MONTH(date_naissance) mois,
    DAY(date_naissance) jour
FROM
    Animal;

-- des parties d'heures :

SELECT HOUR(date_naissance) annee
		,MINUTE(date_naissance) mois
        ,SECOND(date_naissance) jour
FROM Animal;

-- informations précises :

SELECT 
    DAYOFYEAR(NOW()) jour_annuel
    ,DAYOFMONTH(NOW()) jour_mois
	,DAYOFWEEK(NOW()) jour_sem -- 1er jour = dimanche = 1
    ,WEEKDAY(NOW()) jour_sem2 -- 1er jour = lundi = 0
	,DAYNAME(NOW()) nom_jour
	,WEEK(NOW()) num_semaine -- attention, sur 53 semaines dont une de 1 ou 2 jours
    ,WEEKOFYEAR(NOW()) num_semaine2;

-- calculs sur les dates :

SELECT TIMESTAMPDIFF(DAY,'1789-07-14',NOW())
		,TIMESTAMPDIFF(YEAR,'1789-07-14',NOW())
        ,TIMESTAMPDIFF(HOUR,'1789-07-14',NOW())
        ,TIMESTAMPDIFF(QUARTER,'1789-07-14',NOW())
        ,TIMESTAMPDIFF(WEEK,'1789-07-14',NOW());

SELECT DATE_ADD(NOW(), INTERVAL 10 DAY)
		,DATE_SUB(NOW(), INTERVAL 5 YEAR);

SELECT NOW() + INTERVAL 2 WEEK
		,NOW() - INTERVAL 2 WEEK;

SELECT LAST_DAY(NOW());
