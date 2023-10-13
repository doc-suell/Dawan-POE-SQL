-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.27-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema assoc
--

CREATE DATABASE IF NOT EXISTS assoc;
USE assoc;

--
-- Definition of table `activite`
--

DROP TABLE IF EXISTS `activite`;
CREATE TABLE `activite` (
  `NO_ATEL` tinyint NOT NULL DEFAULT '0',
  `JOUR` char(2) NOT NULL,
  `DUREE` decimal(2,0) default NULL,
  PRIMARY KEY  (`NO_ATEL`,`JOUR`),
  CONSTRAINT `FK_ACT_ATE` FOREIGN KEY (`NO_ATEL`) REFERENCES `atelier` (`NO_ATEL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activite`
--

/*!40000 ALTER TABLE `activite` DISABLE KEYS */;
INSERT INTO `activite` (`NO_ATEL`,`JOUR`,`DUREE`) VALUES 
 ('1','MA','2'),
 ('1','SA','2'),
 ('1','VE','2'),
 ('2','LU','1'),
 ('2','ME','2'),
 ('2','SA','2'),
 ('3','LU','2'),
 ('3','ME','1'),
 ('3','VE','2'),
 ('4','LU','2'),
 ('4','ME','1'),
 ('4','VE','2'),
 ('5','LU','2'),
 ('5','ME','1'),
 ('5','VE','2'),
 ('6','JE','2'),
 ('6','MA','2'),
 ('7','JE','2'),
 ('7','MA','2'),
 ('8','JE','2'),
 ('8','MA','2'),
 ('8','SA','1'),
 ('9','JE','2'),
 ('9','MA','2'),
 ('9','SA','1'),
 ('10','MA','2'),
 ('10','ME','2'),
 ('10','VE','2'),
 ('11','MA','2'),
 ('11','SA','1'),
 ('12','MA','2'),
 ('12','SA','1'),
 ('13','MA','2'),
 ('13','SA','1'),
 ('14','DI','2'),
 ('14','LU','1'),
 ('14','SA','2'),
 ('15','DI','2'),
 ('15','LU','1'),
 ('15','SA','2'),
 ('15','VE','3'),
 ('16','DI','2'),
 ('16','LU','1'),
 ('16','SA','2'),
 ('16','VE','3');
/*!40000 ALTER TABLE `activite` ENABLE KEYS */;


--
-- Definition of table `adherent`
--

DROP TABLE IF EXISTS `adherent`;
CREATE TABLE `adherent` (
  `NO_ADHER` decimal(4,0) NOT NULL default '0',
  `NOM` varchar(25) default NULL,
  `PRENOM` varchar(25) default NULL,
  `RUE` varchar(35) default NULL,
  `CP` char(5) default NULL,
  `VILLE` varchar(25) default NULL,
  `DATE_NAISSANCE` datetime default NULL,
  `SEXE` char(1) default NULL,
  PRIMARY KEY  (`NO_ADHER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adherent`
--

/*!40000 ALTER TABLE `adherent` DISABLE KEYS */;
INSERT INTO `adherent` (`NO_ADHER`,`NOM`,`PRENOM`,`RUE`,`CP`,`VILLE`,`DATE_NAISSANCE`,`SEXE`) VALUES 
 ('1','MARTIN','HENRI','10 rue du velodrome','35000','RENNES','1959-10-12 00:00:00','M'),
 ('2','MICHELET','ISABELLE','52 rue des ormes','35000','RENNES','1970-02-05 00:00:00','F'),
 ('3','ALENVERS','MICHEL','23 rue des peupliers','44000','NANTES','1962-03-25 00:00:00','M'),
 ('4','ROUGER','REMY','52 rue longue','44000','NANTES','1959-08-08 00:00:00','M'),
 ('5','GERMAIN','BRUNO','45 rue des fleurs','35000','RENNES','1965-06-25 00:00:00','M'),
 ('6','MICHELIN','ANDRE','2 place des bancs','44000','NANTES','1965-12-25 00:00:00','M'),
 ('7','LAJOINIE','MARTINE','5 rue des arbres en fleurs','44000','NANTES','1970-09-10 00:00:00','F'),
 ('8','LEMERCIER','VALENTINE','5 rue des feuilles mortes','35000','RENNES','1975-11-10 00:00:00','F'),
 ('9','PRIN','RENEE','6 rue des mangues','44000','NANTES','1962-05-05 00:00:00','F'),
 ('10','VIALLE','GISELE','65 rue des tilleuls','44000','NANTES','1969-08-07 00:00:00','F'),
 ('11','BONNIN','ANDRE','10 rue du muguet','44000','NANTES','1965-03-24 00:00:00','M');
INSERT INTO `adherent` (`NO_ADHER`,`NOM`,`PRENOM`,`RUE`,`CP`,`VILLE`,`DATE_NAISSANCE`,`SEXE`) VALUES 
 ('12','BIROT','MARCELLE','10 rue du regiment','35000','RENNES','1976-01-12 00:00:00','F'),
 ('20','DE PIE','Denis','46,RUE DES HRONS CENDRS','44800','SAINT HERBLAIN','1956-03-24 00:00:00','M'),
 ('21','ALLICARTE','Michle','25 RUE DES MARRONNIERS','44000','NANTES','1965-02-01 00:00:00','F'),
 ('22','ALMARANTE','Irne','22 RUE DES FRNES','35000','RENNES','1965-10-12 00:00:00','F'),
 ('23','ALBIN','Marcel','10 RUE DU VLODROME','44100','NANTES','1958-01-10 00:00:00','M'),
 ('24','AMITT','Grald','25 RUE DE LA POSTE','44000','NANTES','1975-05-10 00:00:00','M'),
 ('25','APPERT','Nicolas','25 RUE DE L\'LECTRICIT','35000','RENNES','1981-12-25 00:00:00','M'),
 ('26','APPLIQUE','Isabelle','65 AVENUE DE LA CONCORDANCE','35000','RENNES','1984-12-10 00:00:00','F'),
 ('27','AROBASQUE','Marcel','10 RUE DE L\'ESPERLUETTE','44000','NANTES','1965-11-10 00:00:00','M'),
 ('28','ATOS','Murielle','1 AVENUE ST ANDR','44100','NANTES','1969-10-12 00:00:00','F'),
 ('29','PARKER','Emilie','10 RUE DU CRIME','44000','NANTES','1965-02-10 00:00:00','F');
INSERT INTO `adherent` (`NO_ADHER`,`NOM`,`PRENOM`,`RUE`,`CP`,`VILLE`,`DATE_NAISSANCE`,`SEXE`) VALUES 
 ('30','CHALENDON','Albin','10 RUE DU MARGINAL','35000','RENNES','1946-05-10 00:00:00','M'),
 ('31','MICHEL','Andre','10 RUE FABLE','44000','NANTES','1965-02-10 00:00:00','M'),
 ('32','LAVILLE','Adrienne','25 AVENUE LONGE','44000','NANTES','1985-02-10 00:00:00','F'),
 ('33','PEREZ','Amapola','10 RUE DE LA POSTE','44100','NANTES','1948-05-02 00:00:00','F'),
 ('34','BONNEAU','Jean','31, RUE DES COLOMBES','79000','NIORT','1969-04-11 00:00:00','M'),
 ('35','BOSAPIN','Edmond','21, AVENUE DES PEUPLIERS','49000','ANGERS','1945-02-14 00:00:00','M'),
 ('36','COMILFO','Juste','39, RUE DES BOULANGERS','44000','NANTES','1968-01-17 00:00:00','M'),
 ('37','DABITUDE','Cme','1,	RUE CLAUDE FRANOIS','44700','ORVAULT','1967-09-14 00:00:00','M'),
 ('38','DASSAULT','Richard','12, RUE DE LA GRANDE ARME','49000','ANGERS','1963-07-13 00:00:00','M'),
 ('39','DE CAJOU','Benot','96, RUE DES OLIVIERS','44400','REZE','1966-05-12 00:00:00','M'),
 ('40','DE RADIS','Stphane','72, RUE DES MARACHERS','44980','SAINTE LUCE SUR LOIRE','1947-07-29 00:00:00','M');
INSERT INTO `adherent` (`NO_ADHER`,`NOM`,`PRENOM`,`RUE`,`CP`,`VILLE`,`DATE_NAISSANCE`,`SEXE`) VALUES 
 ('41','DE VOUVOIR','Honor','5,	RUE DE LAMITI','44300','NANTES','1962-05-01 00:00:00','M'),
 ('42','DINARAVELO','Ferdinand','25,	RUE POULIDOR','44700','ORVAULT','1968-05-14 00:00:00','M'),
 ('43','GONZOLA','Igor','5,	PLACE DES FROMAGERS','49000','ANGERS','1957-06-13 00:00:00','M'),
 ('47','HOCHET','Eric','11,	RUE DU LAC','49240','AVRILLE','1965-09-04 00:00:00','M'),
 ('50','MONFILS','Thibault','15,	AVENUE DALGRIE','49240','AVRILLE','1967-10-14 00:00:00','M'),
 ('52','OPOSTE','Fidle','12,	AVENUE DE LA CASERNE','49000','ANGERS','1969-04-03 00:00:00','M'),
 ('58','SWITAUME','Guillaume','8,	AVENUE DANGLETERRE','44000','NANTES','1968-12-04 00:00:00','M'),
 ('59','TACHAMBRE','Branger','10,	AVENUE DU CHTEAU','49000','ANGERS','1967-07-03 00:00:00','M'),
 ('61','TERRIEUR','Alex','27,	IMPASSE DU PONT','49000','ANGERS','1968-04-21 00:00:00','M'),
 ('62','TINIQUE','Aymar','45,	RUE DES ANTILLES','44980','SAINTE LUCE SUR LOIRE','1962-07-29 00:00:00','M'),
 ('63','TINE','Clment','33,	RUE DES JARDINS','49240','AVRILLE','1964-09-24 00:00:00','M');
INSERT INTO `adherent` (`NO_ADHER`,`NOM`,`PRENOM`,`RUE`,`CP`,`VILLE`,`DATE_NAISSANCE`,`SEXE`) VALUES 
 ('64','TINE','Constant','25,	AVENUE LOUIS XVI','49300','CHOLET','1967-10-30 00:00:00','M'),
 ('65','TOURNE','Sylvan','12,	RUE DES ALIZES','44300','NANTES','1963-05-08 00:00:00','M'),
 ('66','TOULETEMPS','Isidore','72,	ROUTE DE LA PLAGE','44340','BOUGUENAIS','1961-06-29 00:00:00','M'),
 ('67','ABONDIEU','Elisabeth','5,	PLACE DE LA CATHDRALE','44000','NANTES','1956-01-01 00:00:00','F'),
 ('68','AIMONE','Anne','3,	PLACE DE LA RPUBLIQUE','49000','ANGERS','1932-02-12 00:00:00','F'),
 ('69','MALALANICHE','Mlanie','14,	RUE DU CHENIL','44700','ORVAULT','1964-06-15 00:00:00','F'),
 ('70','DE JEU','Odette','45,	RUE DU CASINO','44000','NANTES','1963-04-25 00:00:00','F'),
 ('71','ENERBE','Eugnie','15,	AVENUE DES FACULTS','44000','NANTES','1949-09-10 00:00:00','F');
/*!40000 ALTER TABLE `adherent` ENABLE KEYS */;


--
-- Definition of table `animateur`
--

DROP TABLE IF EXISTS `animateur`;
CREATE TABLE `animateur` (
  `NO_ANIM` decimal(4,0) NOT NULL default '0',
  `NOM` varchar(25) default NULL,
  `PRENOM` varchar(25) default NULL,
  `TEL` char(14) default NULL,
  `NO_RESP` decimal(4,0) default NULL,
  `FONCTION` varchar(9) default NULL,
  `COUT_HEURE` decimal(4,0) default NULL,
  PRIMARY KEY  (`NO_ANIM`),
  KEY `FK_ANI_ANI` (`NO_RESP`),
  CONSTRAINT `FK_ANI_ANI` FOREIGN KEY (`NO_RESP`) REFERENCES `animateur` (`NO_ANIM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `animateur`
--

/*!40000 ALTER TABLE `animateur` DISABLE KEYS */;
INSERT INTO `animateur` (`NO_ANIM`,`NOM`,`PRENOM`,`TEL`,`NO_RESP`,`FONCTION`,`COUT_HEURE`) VALUES 
 ('1','BEGUIN','ARMEL','02.40.25.25.25','4','Cadre','180'),
 ('2','POIRIER','JEAN','02.99.65.65.65','5','Agent','150'),
 ('3','FOLIOT','YOLANDE','02.99.45.45.45','4','Cadre','180'),
 ('4','ADAMI','SYLVIE','02.40.85.85.85',NULL,'Directeur','220'),
 ('5','PARDON','EMILE','02.99.85.36.63','4','Cadre','180'),
 ('6','LEBORGNE','ALAIN','02.99.52.25.52','7','Agent','150'),
 ('7','LAVILLE','MARIE','02.40.25.25.36','4','Cadre','180'),
 ('8','LEDLUZ','MICHEL','02.40.69.96.36','5','Agent','150'),
 ('9','MERCIER','ALAIN','02.99.65.65.45','1','Agent','150'),
 ('10','PLUCHON','LIONEL','02.40.25.85.15','7','Agent','150'),
 ('11','BILLARD','MARTIN','02.40.58.58.25','3','Agent','150'),
 ('12','COCHIN','SYLVAIN','02.99.63.63.52','1','Agent','150'),
 ('13','MAGNIN','MARTINE','02.40.25.36.36','5','Agent','150'),
 ('14','BILLON','ADRIEN','02.40.52.15.45','7','Agent','150'),
 ('15','SAULNIER','LUC','02.40.74.47.14','5','Agent','150'),
 ('16','BUCHER','MLANIE','02.51.58.56.65','7','Agent','150');
INSERT INTO `animateur` (`NO_ANIM`,`NOM`,`PRENOM`,`TEL`,`NO_RESP`,`FONCTION`,`COUT_HEURE`) VALUES 
 ('17','VIVIER','LUCIEN','02.99.65.65.65','7','Agent','150'),
 ('18','MICHELET','JACQUES','02.51.25.36.36','5','Agent','150');
/*!40000 ALTER TABLE `animateur` ENABLE KEYS */;


--
-- Definition of table `atelier`
--

DROP TABLE IF EXISTS `atelier`;
CREATE TABLE `atelier` (
  `NO_ATEL` tinyint NOT NULL default '0',
  `INTITULE` varchar(35) default NULL,
  `GENRE` varchar(9) default NULL,
  `ILLUSTRATION` blob,
  `VENTE_HEURE` decimal(4,0) default NULL,
  `NO_ANIM` decimal(4,0) default NULL,
  PRIMARY KEY  (`NO_ATEL`),
  KEY `FK_ATE_ANI` (`NO_ANIM`),
  CONSTRAINT `FK_ATE_ANI` FOREIGN KEY (`NO_ANIM`) REFERENCES `animateur` (`NO_ANIM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `atelier`
--

/*!40000 ALTER TABLE `atelier` DISABLE KEYS */;
INSERT INTO `atelier` (`NO_ATEL`,`INTITULE`,`GENRE`,`ILLUSTRATION`,`VENTE_HEURE`,`NO_ANIM`) VALUES 
 ('1','ASTRONOMIE','SCIENCES',NULL,'350','12'),
 ('2','BADMINTON','SPORT',NULL,'350','8'),
 ('3','BUREAUTIQUE','TNIC',NULL,'350','11'),
 ('4','DANSEJAZZ','CULTURE',NULL,'350','14'),
 ('5','DENTELLE','CULTURE',NULL,'350','16'),
 ('6','DESSIN','CULTURE',NULL,'350','7'),
 ('7','ECHECS','SPORT',NULL,'350','13'),
 ('8','ECOLOGIE','SCIENCES',NULL,'350','1'),
 ('9','ESCRIME MEDIEVAL','SPORT',NULL,'350','18'),
 ('10','GYMNASTIQUE','SPORT',NULL,'350','5'),
 ('11','INTERNET','TNIC',NULL,'350','3'),
 ('12','JUDO','SPORT',NULL,'350','2'),
 ('13','PEINTURE','CULTURE',NULL,'350','10'),
 ('14','PLANEUR','SCIENCES',NULL,'350','9'),
 ('15','POTERIE','CULTURE',NULL,'350','17'),
 ('16','PROGRAMMATION','TNIC',NULL,'350','11');
/*!40000 ALTER TABLE `atelier` ENABLE KEYS */;


--
-- Definition of table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE `inscription` (
  `NO_INSC` decimal(4,0) NOT NULL default '0',
  `NO_ADHER` decimal(4,0) NOT NULL,
  `NO_ATEL` tinyint NOT NULL,
  `JOUR` char(2) NOT NULL,
  `DATE_INSCRIPTION` datetime default NULL,
  `NOTE` decimal(2,0) default NULL,
  `DATE_SORTIE` datetime default NULL,
  PRIMARY KEY  (`NO_INSC`),
  KEY `FK_INS_ACT` (`NO_ATEL`,`JOUR`),
  KEY `FK_INS_ADH` (`NO_ADHER`),
  CONSTRAINT `FK_INS_ACT` FOREIGN KEY (`NO_ATEL`, `JOUR`) REFERENCES `activite` (`NO_ATEL`, `JOUR`),
  CONSTRAINT `FK_INS_ADH` FOREIGN KEY (`NO_ADHER`) REFERENCES `adherent` (`NO_ADHER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inscription`
--

/*!40000 ALTER TABLE `inscription` DISABLE KEYS */;
INSERT INTO `inscription` (`NO_INSC`,`NO_ADHER`,`NO_ATEL`,`JOUR`,`DATE_INSCRIPTION`,`NOTE`,`DATE_SORTIE`) VALUES 
 ('1','22','16','VE','2000-02-01 00:00:00','9',NULL),
 ('2','66','16','SA','2000-02-01 00:00:00','10',NULL),
 ('3','62','16','VE','2000-02-01 00:00:00','6',NULL),
 ('4','68','16','VE','2000-02-01 00:00:00','13',NULL),
 ('5','65','16','VE','2000-02-01 00:00:00','18',NULL),
 ('6','67','15','SA','2000-02-01 00:00:00','16',NULL),
 ('7','71','15','LU','2000-02-01 00:00:00','17',NULL),
 ('8','23','16','SA','2000-02-01 00:00:00','12',NULL),
 ('9','43','16','DI','2000-02-01 00:00:00','14',NULL),
 ('10','61','15','VE','2000-02-01 00:00:00','15',NULL),
 ('11','62','2','LU','2000-02-01 00:00:00','10',NULL),
 ('12','64','2','ME','2000-02-01 00:00:00','11',NULL),
 ('13','68','2','SA','2000-02-01 00:00:00','12',NULL),
 ('14','21','1','SA','2000-02-01 00:00:00','10',NULL),
 ('15','24','1','VE','2000-02-01 00:00:00','11',NULL),
 ('16','42','2','LU','2000-02-01 00:00:00','12',NULL),
 ('17','63','2','ME','2000-02-01 00:00:00','13',NULL),
 ('18','66','2','SA','2000-02-01 00:00:00','14',NULL);
INSERT INTO `inscription` (`NO_INSC`,`NO_ADHER`,`NO_ATEL`,`JOUR`,`DATE_INSCRIPTION`,`NOTE`,`DATE_SORTIE`) VALUES 
 ('19','69','3','LU','2000-02-01 00:00:00','15',NULL),
 ('20','25','1','MA','2000-02-01 00:00:00','7',NULL),
 ('21','65','1','VE','2000-02-01 00:00:00','9',NULL),
 ('22','70','2','LU','2000-02-01 00:00:00','10',NULL),
 ('23','22','1','SA','2000-02-01 00:00:00','8',NULL),
 ('24','41','16','LU','2000-02-01 00:00:00','13',NULL),
 ('25','26','4','ME','2000-01-12 00:00:00','12',NULL),
 ('26','26','10','ME','2000-01-12 00:00:00','13',NULL),
 ('27','28','10','ME','2000-01-12 00:00:00','13',NULL),
 ('28','28','14','DI','2000-01-12 00:00:00','13',NULL),
 ('29','31','7','MA','2000-01-15 00:00:00','8',NULL),
 ('30','31','9','JE','2000-01-15 00:00:00','10',NULL),
 ('31','34','6','MA','2000-02-10 00:00:00','10',NULL),
 ('32','40','9','JE','2000-02-09 00:00:00','8',NULL),
 ('33','34','15','DI','2000-03-12 00:00:00','12',NULL),
 ('34','47','5','ME','1999-12-10 00:00:00','12',NULL),
 ('35','47','13','MA','2000-02-01 00:00:00','7',NULL),
 ('36','50','11','SA','1999-12-12 00:00:00','18',NULL);
INSERT INTO `inscription` (`NO_INSC`,`NO_ADHER`,`NO_ATEL`,`JOUR`,`DATE_INSCRIPTION`,`NOTE`,`DATE_SORTIE`) VALUES 
 ('37','50','12','SA','2000-02-12 00:00:00','15',NULL),
 ('38','50','13','SA','2000-03-12 00:00:00','16',NULL),
 ('39','52','3','VE','2000-02-01 00:00:00','12',NULL),
 ('40','52','4','VE','1999-11-12 00:00:00','12',NULL),
 ('41','52','9','SA','2000-02-03 00:00:00','15',NULL),
 ('42','59','12','MA','1999-10-10 00:00:00','13',NULL),
 ('43','58','10','MA','2000-03-12 00:00:00','16',NULL),
 ('44','1','3','ME','1999-12-10 00:00:00','12',NULL),
 ('45','1','5','VE','1999-10-15 00:00:00','15',NULL),
 ('46','1','11','SA','1999-01-15 00:00:00','8',NULL),
 ('47','2','6','JE','1999-10-10 00:00:00','11',NULL),
 ('48','2','13','SA','1999-10-25 00:00:00','12',NULL),
 ('49','3','4','LU','1999-10-15 00:00:00','18',NULL),
 ('50','4','8','JE','1999-10-10 00:00:00','5',NULL),
 ('51','4','13','SA','1999-10-15 00:00:00','12',NULL),
 ('52','6','5','ME','2000-02-01 00:00:00','15',NULL),
 ('53','6','8','SA','2000-02-01 00:00:00','14',NULL),
 ('54','6','14','DI','2000-02-01 00:00:00','12',NULL);
INSERT INTO `inscription` (`NO_INSC`,`NO_ADHER`,`NO_ATEL`,`JOUR`,`DATE_INSCRIPTION`,`NOTE`,`DATE_SORTIE`) VALUES 
 ('55','7','8','MA','1999-09-15 00:00:00','16',NULL),
 ('56','7','14','SA','1999-10-06 00:00:00','10',NULL),
 ('57','8','6','MA','1999-10-10 00:00:00','13',NULL),
 ('58','8','10','ME','1999-10-10 00:00:00','12',NULL),
 ('59','8','13','SA','1999-10-10 00:00:00','9',NULL),
 ('60','9','3','VE','1999-12-15 00:00:00','17',NULL),
 ('61','10','3','ME','1999-10-04 00:00:00','12',NULL),
 ('62','10','5','VE','1999-11-06 00:00:00','15',NULL);
/*!40000 ALTER TABLE `inscription` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
