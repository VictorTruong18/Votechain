-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 17 mars 2020 à 14:46
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `electeur`;
CREATE TABLE IF NOT EXISTS `electeur` (
  `pseudo` varchar(30) NOT NULL,
  `motdepasse` varchar(64) NOT NULL,
  `avote` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pseudo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `electeur` (`pseudo`, `motdepasse`, `avote`) VALUES
('victor', 'victor', '0'),
('gabriel', 'gabriel', '0'),
('frederic', 'frederic', '0'),
('nathan', 'nathan', '0'),
('louis', 'louis', '0'),
('harry', 'harry', '0'),
('gregory', 'gregory', '0'),
('steve', 'steve', '0'),
('diane', 'diane', '0'),
('henry', 'henry', '0'),
('paul', 'paul', '0');


DROP TABLE IF EXISTS `candidat`;
CREATE TABLE IF NOT EXISTS `candidat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) NOT NULL,
  `image` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `candidat` (`id`,`nom`,`image`) VALUES 
(1,'Emmanuel Macron', 'https://cdn-media.rtl.fr/cache/U998xPBQ7Y4YS7gPtvgYGA/880v587-0/online/image/2020/0316/7800265502_emmanuel-macron-le-16-mars-2020.jpg'),
(2,'Marine Lepen','https://pbs.twimg.com/profile_images/1186216012586389504/VQQBnTI-_400x400.jpg'),
(3,'Jean-Luc Melenchon','https://medias.liberation.fr/photo/1280462-prodlibe-2019-1660-insertion-page-10-jean-luc-melenchon.jpg?modified_at=1576610580&width=960');


DROP TABLE IF EXISTS `election`;
CREATE TABLE IF NOT EXISTS `election` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) NOT NULL,
  `estfini` int(1) NOT NULL DEFAULT '0',
  `candidat1` int(11) NOT NULL,
  `candidat2` int(11) NOT NULL,
  `candidat3` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `election` (`id`,`nom`,`estfini`,`candidat1`,`candidat2`,`candidat3`) VALUES 
(1,'Election Presidentiel','0','1','2','3');


DROP TABLE IF EXISTS `votechain`;
CREATE TABLE IF NOT EXISTS `votechain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(64) NOT NULL,
  `hash` varchar(256) NOT NULL ,
  `last_hash` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `votechain` (`id`,`data`,`hash`,`last_hash`) VALUES 
(1,'Genesis Vote','Genesis Vote','Genesis Vote');

COMMIT;