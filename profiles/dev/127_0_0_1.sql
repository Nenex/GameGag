-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Nov 2015 um 09:19
-- Server Version: 5.6.17
-- PHP-Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `insta2015`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `apprenti`
--
-- in Benutzung(#1146 - Table 'insta2015.apprenti' doesn't exist)
-- Fehler beim Lesen der Daten: (#1146 - Table 'insta2015.apprenti' doesn't exist)

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `competence`
--
-- in Benutzung(#1146 - Table 'insta2015.competence' doesn't exist)
-- Fehler beim Lesen der Daten: (#1146 - Table 'insta2015.competence' doesn't exist)
--
-- Datenbank: `spring_social_tutorial`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3580769128426C` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `role`
--

INSERT INTO `role` (`id`, `role`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 5),
(6, 1, 6),
(7, 2, 7),
(8, 1, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `password`, `username`) VALUES
(1, 'John', 'Smith', '21232f297a57a5a743894a0e4a801fc3', 'john'),
(2, 'Jane', 'Adams', 'ee11cbb19052e40b07aac0ca060c23ee', 'jane'),
(3, 'Michael', 'Watson', 'xdhhjkd', 'mike'),
(4, 'Alice', 'Smith', 'zvksdfm', 'alice'),
(5, 'Nancy', 'Kerr', 'xmnogpd', 'nancy'),
(6, 'Jeff', 'Sprouse', 'mvbnko', 'jeff'),
(7, 'Betty', 'Star', 'mnhtiep', 'betty'),
(8, 'John', 'Tracy', 'trrtyur', 'johnny');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userconnection`
--

CREATE TABLE IF NOT EXISTS `userconnection` (
  `userId` varchar(255) NOT NULL,
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(512) DEFAULT NULL,
  `imageUrl` varchar(512) DEFAULT NULL,
  `accessToken` varchar(255) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userId`,`providerId`,`providerUserId`),
  UNIQUE KEY `UserConnectionRank` (`userId`,`providerId`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `FK3580769128426C` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
--
-- Datenbank: `test`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_accounts`
--

CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_time` datetime NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `modification_time` datetime NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `sign_in_provider` varchar(20) DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Daten für Tabelle `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `creation_time`, `email`, `first_name`, `last_name`, `modification_time`, `password`, `role`, `sign_in_provider`, `version`) VALUES
(2, '2015-11-10 17:56:04', 'test@test.test', 'test', 'test', '2015-11-10 17:56:04', '$2a$10$4YBExi9JLLr8shv3AY4qROATMJyVDz21zPuTpSMEUMnwHQPhDfpuG', 'ROLE_USER', NULL, 0),
(3, '2015-11-10 20:30:11', 'unbekannt@free.fr', 'Nenex', 'super', '2015-11-10 20:30:11', NULL, 'ROLE_USER', 'TWITTER', 0),
(4, '2015-11-10 20:38:11', 'screamy228@yahoo.fr', 'test', 'intergration account', '2015-11-10 20:38:11', NULL, 'ROLE_USER', 'FACEBOOK', 0),
(10, '2015-11-11 09:16:00', 'wq@wq.wq', 'wq', 'wq', '2015-11-11 09:16:00', '$2a$10$csvfIsO9wxMMNviCh8AiquyNmR/tcTZ/JX8cOEaJO4NJPpFPIl1j6', 'ROLE_USER', NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userconnection`
--

CREATE TABLE IF NOT EXISTS `userconnection` (
  `userId` varchar(255) NOT NULL,
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(512) DEFAULT NULL,
  `imageUrl` varchar(512) DEFAULT NULL,
  `accessToken` varchar(255) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userId`,`providerId`,`providerUserId`),
  UNIQUE KEY `UserConnectionRank` (`userId`,`providerId`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `userconnection`
--

INSERT INTO `userconnection` (`userId`, `providerId`, `providerUserId`, `rank`, `displayName`, `profileUrl`, `imageUrl`, `accessToken`, `secret`, `refreshToken`, `expireTime`) VALUES
('screamy228@yahoo.fr', 'facebook', '133942816966347', 1, NULL, 'http://facebook.com/profile.php?id=133942816966347', 'http://graph.facebook.com/133942816966347/picture', 'CAAXgJtnVGXUBAPzSsvio6URJm8f0XynJ36IJ05KfwgJ84gnsRCSBb0UAw5Rq6KVpVjjHEt6P9Vq054ZCdj9m3MyiL2rzaaeZAV51zBikNxEZBMaQRZAZBIgZBDhBdZBSFIxSw2U0qZAZBGQLvlq8Pe0nPThETp7SZCHRCr3bZARbZCcUb2gZCqGvXgWfseFxAIYd1x7sZD', NULL, NULL, 1452500178938),
('unbekannt@free.fr', 'twitter', '4112516253', 1, '@Nenexxx67', 'http://twitter.com/Nenexxx67', 'http://abs.twimg.com/sticky/default_profile_images/default_profile_6_normal.png', '4112516253-ol6yPf44pMh7xJ0h1iR6Eqa6SMdUvQ4B5q7nC4b', 'CyORxP1o9jk9HHXI80oLNKfFLpxcK9i3F9k0Gruk9O1x6', NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
