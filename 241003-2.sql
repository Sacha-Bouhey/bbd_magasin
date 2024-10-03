-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           9.0.1 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour magasin
CREATE DATABASE IF NOT EXISTS `magasin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `magasin`;

-- Listage de la structure de table magasin. disposer
CREATE TABLE IF NOT EXISTS `disposer` (
  `id_produit` int NOT NULL,
  `id_rayon` int NOT NULL,
  `quantite` int DEFAULT NULL,
  PRIMARY KEY (`id_produit`,`id_rayon`),
  KEY `id_rayon` (`id_rayon`),
  CONSTRAINT `disposer_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`),
  CONSTRAINT `disposer_ibfk_2` FOREIGN KEY (`id_rayon`) REFERENCES `rayon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table magasin.disposer : ~5 rows (environ)
DELETE FROM `disposer`;
INSERT INTO `disposer` (`id_produit`, `id_rayon`, `quantite`) VALUES
	(1, 1, 2),
	(2, 1, 2),
	(3, 1, 3),
	(4, 2, 50),
	(5, 2, 30);

-- Listage de la structure de table magasin. entrepot
CREATE TABLE IF NOT EXISTS `entrepot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_rangee` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table magasin.entrepot : ~1 rows (environ)
DELETE FROM `entrepot`;
INSERT INTO `entrepot` (`id`, `numero_rangee`) VALUES
	(1, 1);

-- Listage de la structure de table magasin. fournir
CREATE TABLE IF NOT EXISTS `fournir` (
  `id_produit` int NOT NULL,
  `id_fournisseur` int NOT NULL,
  `prix_fournisseur` double DEFAULT NULL,
  PRIMARY KEY (`id_produit`,`id_fournisseur`),
  KEY `id_fournisseur` (`id_fournisseur`),
  CONSTRAINT `fournir_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`),
  CONSTRAINT `fournir_ibfk_2` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table magasin.fournir : ~7 rows (environ)
DELETE FROM `fournir`;
INSERT INTO `fournir` (`id_produit`, `id_fournisseur`, `prix_fournisseur`) VALUES
	(1, 1, 1100),
	(2, 2, 900),
	(3, 2, 1500),
	(4, 1, 20),
	(5, 1, 12),
	(5, 2, 16),
	(6, 1, 15);

-- Listage de la structure de table magasin. fournisseur
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table magasin.fournisseur : ~2 rows (environ)
DELETE FROM `fournisseur`;
INSERT INTO `fournisseur` (`id`, `nom`) VALUES
	(1, 'browning LTD'),
	(2, 'Remington LTD');

-- Listage de la structure de table magasin. magasin
CREATE TABLE IF NOT EXISTS `magasin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table magasin.magasin : ~1 rows (environ)
DELETE FROM `magasin`;
INSERT INTO `magasin` (`id`, `nom`) VALUES
	(1, 'chasse');

-- Listage de la structure de table magasin. presenter
CREATE TABLE IF NOT EXISTS `presenter` (
  `id_produit` int NOT NULL,
  `id_magasin` int NOT NULL,
  `quantite` int DEFAULT NULL,
  PRIMARY KEY (`id_produit`,`id_magasin`),
  KEY `id_magasin` (`id_magasin`),
  CONSTRAINT `presenter_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`),
  CONSTRAINT `presenter_ibfk_2` FOREIGN KEY (`id_magasin`) REFERENCES `magasin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table magasin.presenter : ~3 rows (environ)
DELETE FROM `presenter`;
INSERT INTO `presenter` (`id_produit`, `id_magasin`, `quantite`) VALUES
	(1, 1, 3),
	(2, 1, 5),
	(3, 1, 1);

-- Listage de la structure de table magasin. produit
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) DEFAULT NULL,
  `marque` varchar(35) DEFAULT NULL,
  `prix_vente` double DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table magasin.produit : ~6 rows (environ)
DELETE FROM `produit`;
INSERT INTO `produit` (`id`, `nom`, `marque`, `prix_vente`, `reference`) VALUES
	(1, 'Fusil', 'Browning', 1500, 'FB12'),
	(2, 'V3 FIELD SPORT BOIS', 'Remington', 1299, 'RV3'),
	(3, 'Remington 700', 'Remington', 2000, 'R7'),
	(4, 'Cartouches magnum 12/76 calibre 12', 'Meyson', 50, 'CMM1276'),
	(5, 'Cartouches de chasse pour calibre 12', 'Mayson', 30, 'CC1270'),
	(6, 'Bipied carabine de chasse', 'Armurerie_chasseur', 30, 'BCCAC');

-- Listage de la structure de table magasin. rayon
CREATE TABLE IF NOT EXISTS `rayon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(35) DEFAULT NULL,
  `reference_rayon` varchar(20) DEFAULT NULL,
  `id_magasin` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_magasin` (`id_magasin`),
  CONSTRAINT `rayon_ibfk_1` FOREIGN KEY (`id_magasin`) REFERENCES `magasin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table magasin.rayon : ~2 rows (environ)
DELETE FROM `rayon`;
INSERT INTO `rayon` (`id`, `nom`, `reference_rayon`, `id_magasin`) VALUES
	(1, 'armes', 'A1', 1),
	(2, 'munition', 'M1', 1);

-- Listage de la structure de table magasin. stocker
CREATE TABLE IF NOT EXISTS `stocker` (
  `id_produit` int NOT NULL,
  `id_entrepot` int NOT NULL,
  `quantite` int DEFAULT NULL,
  PRIMARY KEY (`id_produit`,`id_entrepot`),
  KEY `id_entrepot` (`id_entrepot`),
  CONSTRAINT `stocker_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`),
  CONSTRAINT `stocker_ibfk_2` FOREIGN KEY (`id_entrepot`) REFERENCES `entrepot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table magasin.stocker : ~6 rows (environ)
DELETE FROM `stocker`;
INSERT INTO `stocker` (`id_produit`, `id_entrepot`, `quantite`) VALUES
	(1, 1, 10),
	(2, 1, 10),
	(3, 1, 10),
	(4, 1, 1000),
	(5, 1, 500),
	(6, 1, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
