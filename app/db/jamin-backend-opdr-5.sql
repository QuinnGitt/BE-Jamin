-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 22 mrt 2024 om 14:03
-- Serverversie: 8.0.31
-- PHP-versie: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jamin-backend-opdr-5`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `allergeen`
--

DROP TABLE IF EXISTS `allergeen`;
CREATE TABLE IF NOT EXISTS `allergeen` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) NOT NULL,
  `Omschrijving` varchar(100) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `allergeen`
--

INSERT INTO `allergeen` (`Id`, `Naam`, `Omschrijving`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Gluten', 'Dit product bevat Gluten', b'1', NULL, '2024-01-15 16:36:11.879034', '2024-01-15 16:36:11.879037'),
(2, 'Gelatine', 'Dit product bevat Gelatine', b'1', NULL, '2024-01-15 16:36:11.879139', '2024-01-15 16:36:11.879140'),
(3, 'AZO-kleurstoffen', 'Dit product bevat AZO-kleurstoffen', b'1', NULL, '2024-01-15 16:36:11.879152', '2024-01-15 16:36:11.879152'),
(4, 'Lactose', 'Dit product bevat Lactose', b'1', NULL, '2024-01-15 16:36:11.879157', '2024-01-15 16:36:11.879157'),
(5, 'Soja', 'Dit product bevat Soja', b'1', NULL, '2024-01-15 16:36:11.879162', '2024-01-15 16:36:11.879162');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leverancier`
--

DROP TABLE IF EXISTS `leverancier`;
CREATE TABLE IF NOT EXISTS `leverancier` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) NOT NULL,
  `ContactPersoon` varchar(30) NOT NULL,
  `LeverancierNummer` varchar(30) NOT NULL,
  `Mobiel` varchar(15) NOT NULL,
  `Omschrijving` varchar(100) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `leverancier`
--

INSERT INTO `leverancier` (`Id`, `Naam`, `ContactPersoon`, `LeverancierNummer`, `Mobiel`, `Omschrijving`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Venco', 'Bert van Linge', 'L1029384719', '06-28493827', '', b'1', NULL, '2024-01-15 16:36:12.077613', '2024-01-15 16:36:12.077616'),
(2, 'Astra Sweets', 'Jasper del Monte', 'L1029284315', '06-39398734', '', b'1', NULL, '2024-01-15 16:36:12.077655', '2024-01-15 16:36:12.077655'),
(3, 'Haribo', 'Sven Stalman', 'L1029324748', '06-24383291', '', b'1', NULL, '2024-01-15 16:36:12.077673', '2024-01-15 16:36:12.077673'),
(4, 'Basset', 'Joyce Stelterberg', 'L1023845773', '06-48293823', '', b'1', NULL, '2024-01-15 16:36:12.077678', '2024-01-15 16:36:12.077679'),
(5, 'De Bron', 'Remco Veenstra', 'L1023857736', '06-34291234', '', b'1', NULL, '2024-01-15 16:36:12.077683', '2024-01-15 16:36:12.077683');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `magazijn`
--

DROP TABLE IF EXISTS `magazijn`;
CREATE TABLE IF NOT EXISTS `magazijn` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProductId` int UNSIGNED NOT NULL,
  `VerpakkingsEenheid` decimal(3,2) NOT NULL,
  `AantalAanwezig` int DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Magazijn_ProductId_Product_Id` (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `magazijn`
--

INSERT INTO `magazijn` (`Id`, `ProductId`, `VerpakkingsEenheid`, `AantalAanwezig`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, '5.00', 453, b'1', NULL, '2024-01-15 16:36:11.797439', '2024-01-15 16:36:11.797443'),
(2, 2, '2.50', 400, b'1', NULL, '2024-01-15 16:36:11.797515', '2024-01-15 16:36:11.797516'),
(3, 3, '5.00', 1, b'1', NULL, '2024-01-15 16:36:11.797550', '2024-01-15 16:36:11.797550'),
(4, 4, '1.00', 800, b'1', NULL, '2024-01-15 16:36:11.797571', '2024-01-15 16:36:11.797571'),
(5, 5, '3.00', 234, b'1', NULL, '2024-01-15 16:36:11.797588', '2024-01-15 16:36:11.797588'),
(6, 6, '2.00', 345, b'1', NULL, '2024-01-15 16:36:11.797604', '2024-01-15 16:36:11.797605'),
(7, 7, '1.00', 795, b'1', NULL, '2024-01-15 16:36:11.797620', '2024-01-15 16:36:11.797621'),
(8, 8, '9.99', 233, b'1', NULL, '2024-01-15 16:36:11.797643', '2024-01-15 16:36:11.797644'),
(9, 9, '2.50', 123, b'1', NULL, '2024-01-15 16:36:11.797660', '2024-01-15 16:36:11.797661'),
(10, 10, '3.00', NULL, b'1', NULL, '2024-01-15 16:36:11.797677', '2024-01-15 16:36:11.797677'),
(11, 11, '2.00', 367, b'1', NULL, '2024-01-15 16:36:11.797693', '2024-01-15 16:36:11.797693'),
(12, 12, '1.00', 467, b'1', NULL, '2024-01-15 16:36:11.797709', '2024-01-15 16:36:11.797709'),
(13, 13, '5.00', 20, b'1', NULL, '2024-01-15 16:36:11.797724', '2024-01-15 16:36:11.797725');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) NOT NULL,
  `Barcode` bigint NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `product`
--

INSERT INTO `product` (`Id`, `Naam`, `Barcode`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Mintnopjes', 8719587231278, b'1', NULL, '2024-01-15 16:36:11.691353', '2024-01-15 16:36:11.691357'),
(2, 'Schoolkrijt', 8719587326713, b'1', NULL, '2024-01-15 16:36:11.691459', '2024-01-15 16:36:11.691460'),
(3, 'Honingdrop', 8719587327836, b'1', NULL, '2024-01-15 16:36:11.691472', '2024-01-15 16:36:11.691473'),
(4, 'Zure Beren', 8719587321441, b'1', NULL, '2024-01-15 16:36:11.691477', '2024-01-15 16:36:11.691477'),
(5, 'Cola Flesjes', 8719587321237, b'1', NULL, '2024-01-15 16:36:11.691481', '2024-01-15 16:36:11.691482'),
(6, 'Turtles', 8719587322245, b'1', NULL, '2024-01-15 16:36:11.691486', '2024-01-15 16:36:11.691486'),
(7, 'Witte Muizen', 8719587328256, b'1', NULL, '2024-01-15 16:36:11.691491', '2024-01-15 16:36:11.691491'),
(8, 'Reuzen Slangen', 8719587325641, b'1', NULL, '2024-01-15 16:36:11.691495', '2024-01-15 16:36:11.691495'),
(9, 'Zoute Rijen', 8719587322739, b'1', NULL, '2024-01-15 16:36:11.691499', '2024-01-15 16:36:11.691500'),
(10, 'Winegums', 8719587327527, b'1', NULL, '2024-01-15 16:36:11.691504', '2024-01-15 16:36:11.691504'),
(11, 'Drop Munten', 8719587322345, b'1', NULL, '2024-01-15 16:36:11.691514', '2024-01-15 16:36:11.691514'),
(12, 'Kruis Drop', 8719587322265, b'1', NULL, '2024-01-15 16:36:11.691522', '2024-01-15 16:36:11.691522'),
(13, 'Zoute Ruitjes', 8719587323256, b'1', NULL, '2024-01-15 16:36:11.691526', '2024-01-15 16:36:11.691526');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `productperallergeen`
--

DROP TABLE IF EXISTS `productperallergeen`;
CREATE TABLE IF NOT EXISTS `productperallergeen` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProductId` int UNSIGNED NOT NULL,
  `AllergeenId` int UNSIGNED NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ProductPerAllergeen_ProductId_Product_Id` (`ProductId`),
  KEY `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` (`AllergeenId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `productperallergeen`
--

INSERT INTO `productperallergeen` (`Id`, `ProductId`, `AllergeenId`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 2, b'1', NULL, '2024-01-15 16:36:11.989802', '2024-01-15 16:36:11.989806'),
(2, 1, 1, b'1', NULL, '2024-01-15 16:36:11.989918', '2024-01-15 16:36:11.989919'),
(3, 1, 3, b'1', NULL, '2024-01-15 16:36:11.989938', '2024-01-15 16:36:11.989938'),
(4, 3, 4, b'1', NULL, '2024-01-15 16:36:11.989949', '2024-01-15 16:36:11.989949'),
(5, 6, 5, b'1', NULL, '2024-01-15 16:36:11.989962', '2024-01-15 16:36:11.989962'),
(6, 9, 2, b'1', NULL, '2024-01-15 16:36:11.989973', '2024-01-15 16:36:11.989973'),
(7, 9, 5, b'1', NULL, '2024-01-15 16:36:11.989983', '2024-01-15 16:36:11.989983'),
(8, 10, 2, b'1', NULL, '2024-01-15 16:36:11.989994', '2024-01-15 16:36:11.989994'),
(9, 12, 4, b'1', NULL, '2024-01-15 16:36:11.990004', '2024-01-15 16:36:11.990005'),
(10, 13, 1, b'1', NULL, '2024-01-15 16:36:11.990015', '2024-01-15 16:36:11.990015'),
(11, 13, 4, b'1', NULL, '2024-01-15 16:36:11.990025', '2024-01-15 16:36:11.990025'),
(12, 13, 5, b'1', NULL, '2024-01-15 16:36:11.990035', '2024-01-15 16:36:11.990035');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `productperleverancier`
--

DROP TABLE IF EXISTS `productperleverancier`;
CREATE TABLE IF NOT EXISTS `productperleverancier` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `LeverancierId` int UNSIGNED NOT NULL,
  `ProductId` int UNSIGNED NOT NULL,
  `DatumLevering` datetime NOT NULL,
  `Aantal` int NOT NULL,
  `DatumEerstVolgendeLevering` datetime NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerkingen` varchar(250) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` (`LeverancierId`),
  KEY `FK_ProductPerLeverancier_ProductId_Product_Id` (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `productperleverancier`
--

INSERT INTO `productperleverancier` (`Id`, `LeverancierId`, `ProductId`, `DatumLevering`, `Aantal`, `DatumEerstVolgendeLevering`, `IsActief`, `Opmerkingen`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 1, '2023-04-09 00:00:00', 23, '2023-04-09 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204052', '2024-01-15 16:36:12.204054'),
(2, 1, 1, '2023-04-18 00:00:00', 21, '2023-04-25 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204226', '2024-01-15 16:36:12.204227'),
(3, 1, 2, '2023-04-09 00:00:00', 12, '2023-04-16 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204255', '2024-01-15 16:36:12.204255'),
(4, 1, 3, '2023-04-10 00:00:00', 11, '2023-04-17 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204276', '2024-01-15 16:36:12.204276'),
(5, 2, 4, '2023-04-14 00:00:00', 16, '2023-04-21 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204293', '2024-01-15 16:36:12.204294'),
(6, 2, 4, '2023-04-21 00:00:00', 23, '2023-04-28 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204316', '2024-01-15 16:36:12.204317'),
(7, 2, 5, '2023-04-14 00:00:00', 45, '2023-04-21 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204337', '2024-01-15 16:36:12.204337'),
(8, 2, 6, '2023-04-14 00:00:00', 30, '2023-04-21 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204353', '2024-01-15 16:36:12.204353'),
(9, 3, 7, '2023-04-12 00:00:00', 12, '2023-04-19 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204370', '2024-01-15 16:36:12.204371'),
(10, 3, 7, '2023-04-19 00:00:00', 23, '2023-04-26 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204386', '2024-01-15 16:36:12.204386'),
(11, 3, 8, '2023-04-10 00:00:00', 12, '2023-04-17 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204401', '2024-01-15 16:36:12.204401'),
(12, 3, 9, '2023-04-11 00:00:00', 1, '2023-04-18 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204415', '2024-01-15 16:36:12.204416'),
(13, 4, 10, '2023-04-16 00:00:00', 24, '2023-04-30 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204438', '2024-01-15 16:36:12.204438'),
(14, 5, 11, '2023-04-10 00:00:00', 47, '2023-04-17 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204461', '2024-01-15 16:36:12.204461'),
(15, 5, 11, '2023-04-10 00:00:00', 60, '2023-04-26 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204477', '2024-01-15 16:36:12.204477'),
(16, 5, 12, '2023-04-11 00:00:00', 45, '0000-00-00 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204509', '2024-01-15 16:36:12.204510'),
(17, 5, 13, '2023-04-12 00:00:00', 23, '0000-00-00 00:00:00', b'1', NULL, '2024-01-15 16:36:12.204534', '2024-01-15 16:36:12.204535');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `magazijn`
--
ALTER TABLE `magazijn`
  ADD CONSTRAINT `FK_Magazijn_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`);

--
-- Beperkingen voor tabel `productperallergeen`
--
ALTER TABLE `productperallergeen`
  ADD CONSTRAINT `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` FOREIGN KEY (`AllergeenId`) REFERENCES `allergeen` (`Id`),
  ADD CONSTRAINT `FK_ProductPerAllergeen_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`);

--
-- Beperkingen voor tabel `productperleverancier`
--
ALTER TABLE `productperleverancier`
  ADD CONSTRAINT `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` FOREIGN KEY (`LeverancierId`) REFERENCES `leverancier` (`Id`),
  ADD CONSTRAINT `FK_ProductPerLeverancier_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
