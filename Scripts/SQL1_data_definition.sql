-- les commandes du DDL (Data Definition Language) :

CREATE DATABASE test; -- création de la base test

SHOW DATABASES; -- affichage de toutes les bases

USE test; -- changer de base de travail

SHOW TABLES; -- affichage des tables de la base


-- les différents types de données :

CREATE TABLE test_entier(
	minus TINYINT -- 1 octet, valeurs de -128 à +127
    ,petit SMALLINT -- 2 octets, de environ -32 000 à 32 000
    -- ,moyen MEDIUMINT -- 3 octets 
    ,entier INT -- 4 octets, de -2e9 à 2e9
    ,gros BIGINT -- 8 octets, de -9e18 à 9e18
);

INSERT INTO test_entier
VALUES (127,32000,'123456',17892798.891);

SELECT * FROM test_entier;

-- types de décimaux :
-- numeric et decimal sont les meme types

CREATE TABLE test_deci(
	num NUMERIC(12,2) -- (n,m) n : nombre de chiffres en tout, m : nombre de chiffre après la virgule
    ,deci DECIMAL(13) -- m = 0, donc pas de décimales
    ,reel REAL -- 4 octets 
    ,flottant FLOAT	-- 4 ou 8 octets selon la taille du nombre
    ,double_p DOUBLE PRECISION -- 8 octets
);

INSERT INTO test_deci
VALUES (7462.4186,4567426.945,7082938746.4576,498643.4912846,418624653.462387172683451);

SELECT * FROM test_deci;

-- types de caractères :

CREATE TABLE test_char(
	chaine CHAR(20) -- entre 1 et 255 caractères, plus rapide mais coute plus cher en stockage
    ,chaine_dyn VARCHAR(10000) -- entre 1 et 65535 (théoriquement...), plus lent mais adapte la taille de la case à la longueur de la chaine
    ,texte TEXT -- 65535 caractères, s'adapte
    ,mini_texte TINYTEXT -- 255 caractères, s'adapte
    ,moyen_texte MEDIUMTEXT -- 2 milliards, s'adapte
    ,long_texte LONGTEXT -- 4 milliards, s'adapte
);

-- types temporels :

CREATE TABLE test_temp(
	dates DATE
    ,heures TIME
    ,horodateurs DATETIME
    -- ,tampon TIMESTAMP (lié à epoch time)
);

SELECT current_timestamp();

INSERT INTO test_temp
VALUES (current_timestamp(),current_timestamp(),current_timestamp());

SELECT * FROM test_temp;

-- exemple de cas concret :

CREATE DATABASE IF NOT EXISTS elevage;
USE elevage;

-- BOOLEAN : 0 ou 1, type déconseillé pour des champs comme sexe
DROP TABLE IF EXISTS Animal;

CREATE TABLE Animal(
	id SMALLINT UNSIGNED AUTO_INCREMENT
    ,espece VARCHAR(30) NOT NULL
    ,sexe CHAR(1) 
    ,date_naissance DATETIME NOT NULL
    ,nom VARCHAR(30) DEFAULT NULL
    ,commentaires TEXT
    ,CONSTRAINT pk_animal PRIMARY KEY(id)
    ,CONSTRAINT ck_sexe CHECK (sexe IN ('M','F'))
);

-- les modifications de tables :
USE test;

CREATE TABLE test_alter(
	id DATE
    ,prénon INT
);

ALTER TABLE test_alter
MODIFY id SMALLINT PRIMARY KEY;

DESCRIBE test_alter;

ALTER TABLE test_alter
CHANGE prénon prenom VARCHAR(30);

ALTER TABLE test_alter
ADD nom VARCHAR(30) AFTER id; -- FIRST

DESCRIBE test_alter;

ALTER TABLE test_alter
ADD code_postal CHAR(5) FIRST; 

ALTER TABLE test_alter
DROP code_postal;

DROP DATABASE test;
