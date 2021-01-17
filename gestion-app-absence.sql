-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 17 jan. 2021 à 18:35
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestion-app-absence`
--

-- --------------------------------------------------------

--
-- Structure de la table `absence`
--

DROP TABLE IF EXISTS `absence`;
CREATE TABLE IF NOT EXISTS `absence` (
  `absence_id` int(11) NOT NULL AUTO_INCREMENT,
  `absence_date` varchar(100) NOT NULL,
  `absence_justification` varchar(100) DEFAULT NULL,
  `id_student` int(11) NOT NULL,
  `id_secretaire` int(11) DEFAULT NULL,
  PRIMARY KEY (`absence_id`),
  KEY `absence_FK` (`id_student`),
  KEY `absence_FK_1` (`id_secretaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `admin_name` varchar(100) NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `admin_FK` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `formateur`
--

DROP TABLE IF EXISTS `formateur`;
CREATE TABLE IF NOT EXISTS `formateur` (
  `formateur_id` int(11) NOT NULL AUTO_INCREMENT,
  `formateur_firstname` varchar(255) NOT NULL,
  `formateur_lastname` varchar(255) NOT NULL,
  `formateur_email` varchar(255) NOT NULL,
  `formateur_password` varchar(255) DEFAULT NULL,
  `formateur_specialite` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`formateur_id`),
  KEY `formateur_FK` (`formateur_specialite`),
  KEY `formateur_FK_1` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  UNIQUE KEY `role_id` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sectretaire`
--

DROP TABLE IF EXISTS `sectretaire`;
CREATE TABLE IF NOT EXISTS `sectretaire` (
  `sectretaire_id` int(11) NOT NULL AUTO_INCREMENT,
  `secretaire_firstname` varchar(255) NOT NULL,
  `secretaire_lastname` varchar(255) NOT NULL,
  `secretaire_email` varchar(255) NOT NULL,
  `secretaire_password` varchar(255) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  PRIMARY KEY (`sectretaire_id`),
  KEY `sectretaire_FK` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `specialite_id` int(11) NOT NULL AUTO_INCREMENT,
  `specialite_name` varchar(100) NOT NULL,
  PRIMARY KEY (`specialite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_firstname` varchar(255) NOT NULL,
  `student_lastname` varchar(255) NOT NULL,
  `student_email` varchar(255) NOT NULL,
  `student_password` varchar(255) NOT NULL,
  `student_annescolaire` varchar(255) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_specialite` int(11) NOT NULL,
  `student_presence` int(11) DEFAULT NULL,
  `student_absence` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `student_FK` (`id_role`),
  KEY `student_FK_1` (`id_specialite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `absence_FK` FOREIGN KEY (`id_student`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `absence_FK_1` FOREIGN KEY (`id_secretaire`) REFERENCES `sectretaire` (`sectretaire_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_FK` FOREIGN KEY (`role_id`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `formateur`
--
ALTER TABLE `formateur`
  ADD CONSTRAINT `formateur_FK` FOREIGN KEY (`formateur_specialite`) REFERENCES `specialite` (`specialite_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `formateur_FK_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `sectretaire`
--
ALTER TABLE `sectretaire`
  ADD CONSTRAINT `sectretaire_FK` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_FK` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_FK_1` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`specialite_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
