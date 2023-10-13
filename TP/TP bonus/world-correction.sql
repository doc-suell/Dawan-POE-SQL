-- Afficher le nom de chaque ville avec son nom de pays

SELECT v.name,p.name
  FROM city v JOIN country p ON v.CountryCode=p.Code;

-- Combien y a-t-il de pays ?

SELECT count(code)
  FROM country;

-- Combien y a-t-il de pays en 'Europe' ?

SELECT count(code)
  FROM country
 WHERE continent='Europe';

-- Combient y a-t-il de pays par continent ?

SELECT continent,count(code) nbpays
  FROM country
 GROUP BY continent
 ORDER BY nbpays;

-- Population par continent

SELECT continent,sum(population) pop
  FROM country
 GROUP BY continent
 ORDER BY pop;

-- Population urbaine de chaque pays

SELECT p.name,sum(v.population) popurb
  FROM city v JOIN country p ON code=countrycode
 GROUP BY p.name
 ORDER BY popurb;

-- Pourcentage de population urbaine de chaque pays

SELECT p.name,100*sum(v.population)/p.population popurb
  FROM city v JOIN country p ON code=countrycode
 GROUP BY p.name
 ORDER BY popurb;

-- Quelle est la capitale de chaque pays ?

SELECT p.name pays,v.name capitale
  FROM city v JOIN country p ON v.id=p.capital
 ORDER BY p.name;

-- Y a-t-il des pays sans capitale, si oui quels sont-ils ?

SELECT p.name,v.name
  FROM city v RIGHT JOIN country p ON v.id=p.capital
 WHERE v.name IS NULL;

-- Quelle est l'année d'indépendance la plus récente ?

SELECT max(indepyear)
  FROM country;

-- Quels sont les pays à avoir été le plus récemment indépendants ?

-- Solution avec sous-requête

SELECT name
  FROM country
 WHERE IndepYear=(SELECT max(indepyear)
                    FROM country);

-- Solution avec jointure

SELECT name
  FROM country JOIN (SELECT max(indepyear) maxindep FROM country) d
			   ON indepyear=maxindep;

-- Nombre de langues officielles par pays

SELECT count(language) langues,p.name pays
  FROM countrylanguage cl JOIN country p ON countrycode = Code
 WHERE isofficial = 't'
 GROUP BY p.name
 ORDER BY langues;

-- Quels sont les pays ayant plus d'une langue officielle ?

SELECT count(language) langues,p.name pays
  FROM countrylanguage cl JOIN country p ON countrycode = Code
 WHERE IsOfficial = 't'
 GROUP BY p.name
HAVING count(language) > 1
 ORDER BY langues;

-- Y a-t-il des pays sans langue officielle ?

SELECT language,p.name pays
  FROM countrylanguage cl RIGHT JOIN country p ON countrycode = Code
 WHERE isofficial = 't' and language is null
 ORDER BY language;

-- Quels sont les pays ayant le plus grand nombre de langues officielles ?

SELECT pays,nblangues
  FROM (SELECT count(language) nblangues,p.name pays
		  FROM countrylanguage cl JOIN country p ON countrycode = Code
		 WHERE isofficial = 't'
		 GROUP BY p.name) t1
 WHERE nblangues=(SELECT  max(nblangues)
				  FROM (SELECT count(language) nblangues,p.name pays
						  FROM countrylanguage cl JOIN country p ON countrycode = Code
						 WHERE isofficial = 't'
						 GROUP BY p.name) lo);

-- CTE: Common Table Expression
-- Portable hormis sous MySQL

WITH plouf AS (
    SELECT p.name pays, count(*) nblangues
		  FROM countrylanguage cl JOIN country p ON countrycode = Code
		 WHERE isofficial = 't'
		 GROUP BY p.name
)
SELECT pays,nblangues
  FROM plouf
 WHERE nblangues=(SELECT  max(nblangues)
					FROM plouf);

-- Nombre de locuteurs de chaque langue

SELECT l.language,sum(population*percentage)/100 nbloc
  FROM countrylanguage l
       JOIN country p ON countrycode=Code
 GROUP BY language
 ORDER BY nbloc DESC;