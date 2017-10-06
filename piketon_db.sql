-- --------------------------------------------------------
-- Host:                         46.101.166.180
-- Server version:               5.7.19-0ubuntu0.16.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for information_schema

-- Dumping database structure for piketondb
CREATE DATABASE IF NOT EXISTS `piketondb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `piketondb`;

-- Dumping structure for table piketondb.Batch
CREATE TABLE IF NOT EXISTS `Batch` (
  `BatchId` int(11) NOT NULL,
  `Supplier` varchar(255) NOT NULL,
  `LotNumber` int(11) DEFAULT NULL,
  `Grade` varchar(255) DEFAULT NULL,
  `PdfLink` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BatchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This is the material batch';

-- Data exporting was unselected.
-- Dumping structure for table piketondb.Build
CREATE TABLE IF NOT EXISTS `Build` (
  `BuildId` varchar(20) NOT NULL,
  `MagicsFileName` varchar(20) DEFAULT NULL,
  `SlmId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BuildId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table piketondb.HallFlowTest
CREATE TABLE IF NOT EXISTS `HallFlowTest` (
  `TestId` int(11) NOT NULL,
  `TestDate` date DEFAULT NULL,
  `BatchId` int(11) NOT NULL,
  `Operator` varchar(225) DEFAULT NULL,
  `RelativeHumidity` double(8,3) DEFAULT NULL,
  `Temp1` double(8,3) DEFAULT NULL,
  `Temp2` double(8,3) DEFAULT NULL,
  PRIMARY KEY (`TestId`),
  KEY `BatchId` (`BatchId`),
  CONSTRAINT `HallFlowTest_ibfk_1` FOREIGN KEY (`BatchId`) REFERENCES `Batch` (`BatchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table piketondb.Material
CREATE TABLE IF NOT EXISTS `Material` (
  `MaterialNo` varchar(50) NOT NULL,
  `BatchId` int(11) DEFAULT NULL,
  `MaterialName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MaterialNo`),
  KEY `BatchId` (`BatchId`),
  CONSTRAINT `Material_ibfk_1` FOREIGN KEY (`BatchId`) REFERENCES `Batch` (`BatchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table piketondb.Part
CREATE TABLE IF NOT EXISTS `Part` (
  `PartId` varchar(20) NOT NULL,
  `StlFileName` varchar(20) DEFAULT NULL,
  `CadFileName` varchar(20) DEFAULT NULL,
  `ProjectId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PartId`),
  KEY `ProjectId` (`ProjectId`),
  CONSTRAINT `Part_ibfk_1` FOREIGN KEY (`ProjectId`) REFERENCES `Project` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table piketondb.PartOfBuild
CREATE TABLE IF NOT EXISTS `PartOfBuild` (
  `BuildId` varchar(20) NOT NULL,
  `PartId` varchar(20) NOT NULL,
  `PartRank` int(11) NOT NULL,
  PRIMARY KEY (`BuildId`,`PartId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table piketondb.PostPrint
CREATE TABLE IF NOT EXISTS `PostPrint` (
  `PostPrintId` int(11) NOT NULL AUTO_INCREMENT,
  `PostPrintDate` date DEFAULT NULL,
  `Picture` varchar(255) DEFAULT NULL,
  `PrintConfigId` int(11) DEFAULT NULL,
  `SupportRemoval` varchar(50) DEFAULT NULL,
  `WEDM` varchar(255) DEFAULT NULL,
  `Blasting` varchar(255) DEFAULT NULL,
  `HeatTreatmentId` int(11) DEFAULT NULL,
  `PrinterName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PostPrintId`),
  KEY `PrintConfigId` (`PrintConfigId`),
  CONSTRAINT `PostPrint_ibfk_1` FOREIGN KEY (`PrintConfigId`) REFERENCES `PrintConfiguration` (`PrintConfigId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table piketondb.PrintConfiguration
CREATE TABLE IF NOT EXISTS `PrintConfiguration` (
  `PrintConfigId` int(11) NOT NULL AUTO_INCREMENT,
  `BuildId` varchar(20) NOT NULL,
  `MaterialNo` varchar(50) NOT NULL,
  `MagicsSnapshot` varchar(50) DEFAULT NULL,
  `MaterialReuseCount` int(11) DEFAULT NULL,
  `PowderWeight` double(8,3) DEFAULT NULL,
  `Operator` varchar(20) DEFAULT NULL,
  `StartTime` date DEFAULT NULL,
  `EndTime` date DEFAULT NULL,
  PRIMARY KEY (`PrintConfigId`),
  KEY `BuildId` (`BuildId`),
  KEY `MaterialNo` (`MaterialNo`),
  CONSTRAINT `PrintConfiguration_ibfk_1` FOREIGN KEY (`BuildId`) REFERENCES `Build` (`BuildId`),
  CONSTRAINT `PrintConfiguration_ibfk_2` FOREIGN KEY (`MaterialNo`) REFERENCES `Material` (`MaterialNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table piketondb.Project
CREATE TABLE IF NOT EXISTS `Project` (
  `ProjectId` varchar(20) NOT NULL,
  `CustomerId` varchar(20) DEFAULT NULL,
  `ProjectDate` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
