-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.1.33-community - MySQL Community Server (GPL)
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных gen derevo
CREATE DATABASE IF NOT EXISTS `gen derevo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gen derevo`;

-- Дамп структуры для таблица gen derevo.fggyy
CREATE TABLE IF NOT EXISTS `fggyy` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Data` int(11) NOT NULL,
  `Pasport` int(11) NOT NULL,
  `Rodstvo` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_fggyy_rodstvo` (`Rodstvo`),
  CONSTRAINT `FK_fggyy_rodstvo` FOREIGN KEY (`Rodstvo`) REFERENCES `rodstvo` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- Дамп данных таблицы gen derevo.fggyy: ~17 rows (приблизительно)
/*!40000 ALTER TABLE `fggyy` DISABLE KEYS */;
INSERT INTO `fggyy` (`ID`, `Name`, `Data`, `Pasport`, `Rodstvo`) VALUES
	(20, 'Rurik', 862, 1023654123, 1),
	(21, 'Igor\'', 912, 1236987412, 2),
	(22, 'Olga', 945, 1233456789, 2),
	(23, 'Svyatoslav', 964, 1254789630, 3),
	(24, 'Yaropolk', 972, 1236985470, NULL),
	(25, 'Oleg', 977, 1459876320, NULL),
	(26, 'Vladimir', 980, 1246951370, 4),
	(27, 'Svyatopolk', 1015, 1230650879, NULL),
	(28, 'Yaroslav', 1019, 1678945215, 5),
	(29, 'Boris', 1010, 1236547898, NULL),
	(30, 'Gleb', 1012, 1000322445, NULL),
	(31, 'Vladimir', 1032, 1000000000, 6),
	(32, 'Svyatoslav', 1073, 1000000001, 7),
	(33, 'Izyaslav', 1054, 1002203548, 8),
	(34, 'Vsevolod', 1078, 1234567000, 9),
	(35, 'Rostislav', 1102, 1542367890, 10),
	(36, 'Oleg', 1115, 1203456879, 11);
/*!40000 ALTER TABLE `fggyy` ENABLE KEYS */;

-- Дамп структуры для таблица gen derevo.rodstvo
CREATE TABLE IF NOT EXISTS `rodstvo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(255) NOT NULL DEFAULT '0',
  `Type` char(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Дамп данных таблицы gen derevo.rodstvo: ~11 rows (приблизительно)
/*!40000 ALTER TABLE `rodstvo` DISABLE KEYS */;
INSERT INTO `rodstvo` (`ID`, `name`, `Type`) VALUES
	(1, 'Igor\'', 'Sin'),
	(2, 'Svyatoslav', 'Sin'),
	(3, 'Yaropolk, Oleg, Vladimir', 'Sin'),
	(4, 'Svyatopolk 1, Yaroslav, Boris, Gleb', 'Sin'),
	(5, 'Vladimir, Svyatoslav, Izyaslav, Vsevolod', 'Sin'),
	(6, 'Rostislav', 'Sin'),
	(7, 'Oleg, David', 'Sin'),
	(8, 'Svyatopolk 2', 'Sin'),
	(9, 'Vladimir Monomah', 'Sin'),
	(10, 'Volodar\'', 'Sin'),
	(11, 'Vsevolod 2', 'Sin');
/*!40000 ALTER TABLE `rodstvo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
