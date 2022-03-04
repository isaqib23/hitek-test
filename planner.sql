-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for planner
DROP DATABASE IF EXISTS `planner`;
CREATE DATABASE IF NOT EXISTS `planner` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `planner`;

-- Dumping structure for table planner.equipments
DROP TABLE IF EXISTS `equipments`;
CREATE TABLE IF NOT EXISTS `equipments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table planner.equipments: ~13 rows (approximately)
/*!40000 ALTER TABLE `equipments` DISABLE KEYS */;
INSERT INTO `equipments` (`id`, `name`) VALUES
	(1, 'M0871-JAD-SI01-1F-ELEC-BPP-001, BOOSTER PUMP PANEL-01, 1F-MEP Room-1st Floor'),
	(2, 'M0871-JAD-SI01-1F-ELEC-CTL-001, CIRCULATION PUMP PANEL-02, 1F-MEP Room-1st Floo'),
	(3, 'M0871-JAD-SI01-1F-ELEC-DIB-001, SPO-L01-DB-LP1-01, 1F-ELECTRICAL Room-1st Floor'),
	(4, 'M0871-JAD-SI01-1F-ELEC-DIB-002, SPO-L01-DB-PP1-01, 1F-ELECTRICAL Room-1st Floor'),
	(5, 'M0871-JAD-SI01-1F-ELEC-DIB-007, SPO-L01-DB-MP, 1F-MULTI PURPOSE Room-1st Floor'),
	(6, 'M0871-JAD-SI01-1F-ELEC-DIB-008, SPO-L01-DB-MEP, 1F-MEP Room-1st Floor'),
	(7, 'M0871-JAD-SI01-1F-ELEC-MCC-001, SPO-L01-MCC-01, 1F-MEP Room-1st Floor'),
	(8, 'M0871-JAD-SI01-1F-ELEC-MCC-002, SPO-L01-MCC-02, 1F-MEP Room-1st Floor'),
	(9, 'M0871-JAD-SI01-1F-ELEC-MCC-003, SPO-L01-EMCC-01, 1F-MEP Room-1st Floor'),
	(10, 'M0871-JAD-SI01-1F-ELEC-SMDB-002, SPO-L01-SMDB-03, 1F-ELECTRICAL Room-1st Floor'),
	(11, 'M0871-JAD-SI01-1F-HVAC-AHU-002, AHU- SPO-FF-02, 1F-MEP Room-1st Floor'),
	(12, 'M0871-JAD-SI01-1F-HVAC-AHU-003, AHU- SPO-FF-03, 1F-MEP Room-1st Floor'),
	(13, 'M0871-JAD-SI01-1F-HVAC-CWPS-001, CIRCULATION PUMP-1, 1F-MEP Room-1st Floor');
/*!40000 ALTER TABLE `equipments` ENABLE KEYS */;

-- Dumping structure for table planner.equipment_shift_mapping
DROP TABLE IF EXISTS `equipment_shift_mapping`;
CREATE TABLE IF NOT EXISTS `equipment_shift_mapping` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shift_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `equipment_id` bigint(20) NOT NULL,
  `value` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `equipment_shift_mapping_idx_equipment_id` (`equipment_id`),
  KEY `equipment_shift_mapping_idx_shift_id` (`shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table planner.equipment_shift_mapping: ~35 rows (approximately)
/*!40000 ALTER TABLE `equipment_shift_mapping` DISABLE KEYS */;
INSERT INTO `equipment_shift_mapping` (`id`, `shift_id`, `equipment_id`, `value`) VALUES
	(1, 26, 1, 'Y'),
	(2, 26, 2, 'Y'),
	(3, 12, 3, '3M'),
	(4, 25, 3, '6M'),
	(5, 12, 4, '3M'),
	(6, 25, 4, '6M'),
	(7, 12, 5, '3M'),
	(8, 25, 5, '6M'),
	(9, 12, 6, '3M'),
	(10, 25, 6, '6M'),
	(11, 14, 7, '3M'),
	(12, 26, 7, 'Y'),
	(13, 14, 8, '3M'),
	(14, 26, 8, 'Y'),
	(15, 14, 9, '3M'),
	(16, 26, 9, 'Y'),
	(17, 10, 10, '3M'),
	(18, 23, 10, '3M'),
	(19, 36, 10, '3M'),
	(20, 4, 11, 'M'),
	(21, 8, 11, 'M'),
	(22, 13, 11, '3M'),
	(23, 17, 11, 'M'),
	(24, 21, 11, 'M'),
	(25, 25, 11, 'Y'),
	(26, 30, 11, 'M'),
	(27, 34, 11, 'M'),
	(28, 4, 12, 'M'),
	(29, 8, 12, 'M'),
	(30, 13, 12, '3M'),
	(31, 17, 12, 'M'),
	(32, 21, 12, 'M'),
	(33, 25, 12, 'Y'),
	(34, 30, 12, 'M'),
	(35, 34, 12, 'M'),
	(36, 13, 13, '3M'),
	(37, 25, 13, 'Y');
/*!40000 ALTER TABLE `equipment_shift_mapping` ENABLE KEYS */;

-- Dumping structure for table planner.shifts
DROP TABLE IF EXISTS `shifts`;
CREATE TABLE IF NOT EXISTS `shifts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shift_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shift_period` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table planner.shifts: ~36 rows (approximately)
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` (`id`, `shift_number`, `shift_period`) VALUES
	(1, '39', '2021-09-25'),
	(2, '40', '2021-09-25'),
	(3, '41', '2021-09-25'),
	(4, '42', '2021-09-25'),
	(5, '43', '2021-10-23'),
	(6, '44', '2021-10-23'),
	(7, '45', '2021-10-23'),
	(8, '46', '2021-10-23'),
	(9, '47', '2021-11-20'),
	(10, '48', '2021-11-20'),
	(11, '49', '2021-11-20'),
	(12, '50', '2021-11-20'),
	(13, '51', '2021-12-18'),
	(14, '52', '2021-12-18'),
	(15, '1', '2021-12-18'),
	(16, '2', '2021-12-18'),
	(17, '3', '2022-01-15'),
	(18, '4', '2022-01-15'),
	(19, '5', '2022-01-15'),
	(20, '6', '2022-01-15'),
	(21, '7', '2022-02-12'),
	(22, '8', '2022-02-12'),
	(23, '9', '2022-02-12'),
	(24, '10', '2022-02-12'),
	(25, '11', '2022-03-12'),
	(26, '12', '2022-03-12'),
	(27, '13', '2022-03-12'),
	(28, '14', '2022-03-12'),
	(29, '15', '2022-04-09'),
	(30, '16', '2022-04-09'),
	(31, '17', '2022-04-09'),
	(32, '18', '2022-04-09'),
	(33, '19', '2022-05-07'),
	(34, '20', '2022-05-07'),
	(35, '21', '2022-05-07'),
	(36, '22', '2022-05-07');
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
