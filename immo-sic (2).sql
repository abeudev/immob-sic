-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 08 déc. 2021 à 17:03
-- Version du serveur :  8.0.21
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `immo-sic`
--

-- --------------------------------------------------------

--
-- Structure de la table `agences`
--

DROP TABLE IF EXISTS `agences`;
CREATE TABLE IF NOT EXISTS `agences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_modification` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `date_suppression` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `structure_id_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B46015DDAA95C5C1` (`structure_id_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `agences`
--

INSERT INTO `agences` (`id`, `libelle`, `email`, `contact`, `adresse`, `date_modification`, `date_suppression`, `date_creation`, `structure_id_id`) VALUES
(5, 'Agence1', 'agence@mail.com', '020202020202', '7, rue de la garenne - 93200 Saint-Denis', '2021-11-22 10:03:43', NULL, '2021-11-22 10:03:43', 5);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_by_cat` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `img`, `count_by_cat`) VALUES
(1, 'Studio Appartements', 'studio appartements', 'categories-1.jpg', NULL),
(2, 'Luxury Houses', 'luxury houses', 'categories-2.jpg', NULL),
(3, 'Cozy Houses', 'cozy houses', 'categories-3.jpg', NULL),
(4, 'With Swimming Pool', 'with swimming pool', 'categories-4.jpg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`) VALUES
(1, 'Bla Bla car', 'bla bla car'),
(2, 'Blo Blo Cor', 'blo blo cor');

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `city`
--

INSERT INTO `city` (`id`, `title`, `name`, `slug`, `meta_title`, `meta_description`) VALUES
(1, 'Miami Luxury Real Estate', 'Miami', 'miami', 'Miami Luxury Real Estate', NULL),
(2, 'West Palm Beach, FL Apartments', 'Palm Beach', 'palm-beach', 'West Palm Beach, FL Apartments', NULL),
(3, 'Tampa Real Estate', 'Tampa', 'tampa', 'Tampa Real Estate', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
CREATE TABLE IF NOT EXISTS `contrat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bien_id` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_60349993BD95B80F` (`bien_id`),
  KEY `IDX_60349993A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`id`, `bien_id`, `date_debut`, `date_fin`, `user_id`) VALUES
(2, 3, '2021-07-23', '2022-05-19', 1);

-- --------------------------------------------------------

--
-- Structure de la table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency_title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol_left` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_right` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `currency`
--

INSERT INTO `currency` (`id`, `currency_title`, `code`, `symbol_left`, `symbol_right`) VALUES
(1, 'US Dollar', 'USD', '$', ''),
(2, 'Euro', 'EUR', '', '€'),
(3, 'Pound Sterling', 'GBP', '£', ''),
(4, 'Hong Kong Dollar', 'HKD', 'HK$', ''),
(5, 'Russian Ruble', 'RUB', '₽', ''),
(6, 'Belarusian ruble', 'BYN', '', 'Br');

-- --------------------------------------------------------

--
-- Structure de la table `deal_type`
--

DROP TABLE IF EXISTS `deal_type`;
CREATE TABLE IF NOT EXISTS `deal_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `deal_type`
--

INSERT INTO `deal_type` (`id`, `name`, `slug`) VALUES
(1, 'Rent', 'rent'),
(2, 'Sale', 'sale');

-- --------------------------------------------------------

--
-- Structure de la table `district`
--

DROP TABLE IF EXISTS `district`;
CREATE TABLE IF NOT EXISTS `district` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_31C154878BAC62AF` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `district`
--

INSERT INTO `district` (`id`, `city_id`, `name`, `slug`) VALUES
(1, 3, 'South Tampa', 'south-tampa');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20200328162849', '2021-11-12 13:18:14', 2456),
('DoctrineMigrations\\Version20200705110619', '2021-11-12 13:18:16', 102),
('DoctrineMigrations\\Version20210104185420', '2021-11-12 13:18:16', 41),
('DoctrineMigrations\\Version20210106154655', '2021-11-12 13:18:16', 26),
('DoctrineMigrations\\Version20210106191712', '2021-11-12 13:18:16', 1),
('DoctrineMigrations\\Version20210106234742', '2021-11-12 13:18:16', 6),
('DoctrineMigrations\\Version20210107000119', '2021-11-12 13:18:16', 26),
('DoctrineMigrations\\Version20210215083338', '2021-11-12 13:18:16', 0),
('DoctrineMigrations\\Version20210215173522', '2021-11-12 13:18:16', 0),
('DoctrineMigrations\\Version20210815075052', '2021-11-12 13:18:16', 115),
('DoctrineMigrations\\Version20210817062054', '2021-11-12 13:18:16', 141),
('DoctrineMigrations\\Version20211116105737', '2021-11-16 12:57:19', 157),
('DoctrineMigrations\\Version20211116140643', '2021-11-16 14:07:43', 70),
('DoctrineMigrations\\Version20211117095144', '2021-11-17 09:51:57', 133),
('DoctrineMigrations\\Version20211117101240', '2021-11-17 10:12:50', 158),
('DoctrineMigrations\\Version20211117133849', '2021-11-17 13:39:00', 150),
('DoctrineMigrations\\Version20211117143653', '2021-11-17 14:37:06', 180),
('DoctrineMigrations\\Version20211117144054', '2021-11-17 14:41:04', 215),
('DoctrineMigrations\\Version20211117161819', '2021-11-17 16:18:29', 176),
('DoctrineMigrations\\Version20211117161937', '2021-11-17 16:19:44', 162),
('DoctrineMigrations\\Version20211118103717', '2021-11-18 10:37:39', 156),
('DoctrineMigrations\\Version20211118132744', '2021-11-18 13:32:44', 38),
('DoctrineMigrations\\Version20211118143041', '2021-11-18 14:30:54', 139),
('DoctrineMigrations\\Version20211118172528', '2021-11-18 17:25:42', 203),
('DoctrineMigrations\\Version20211122094700', '2021-11-22 09:47:17', 200),
('DoctrineMigrations\\Version20211122114103', '2021-11-22 11:41:17', 532),
('DoctrineMigrations\\Version20211122165332', '2021-11-22 16:53:50', 267),
('DoctrineMigrations\\Version20211123090415', '2021-11-23 09:04:26', 156),
('DoctrineMigrations\\Version20211123090922', '2021-11-23 09:09:37', 103),
('DoctrineMigrations\\Version20211123091643', '2021-11-23 09:16:54', 104),
('DoctrineMigrations\\Version20211123092713', '2021-11-23 09:27:28', 157),
('DoctrineMigrations\\Version20211124103114', '2021-11-24 10:31:27', 230),
('DoctrineMigrations\\Version20211124120659', '2021-11-24 12:07:10', 129),
('DoctrineMigrations\\Version20211130122751', '2021-11-30 12:28:02', 407),
('DoctrineMigrations\\Version20211130153553', '2021-11-30 15:36:05', 86),
('DoctrineMigrations\\Version20211202150331', '2021-12-02 15:03:46', 334),
('DoctrineMigrations\\Version20211203113152', '2021-12-03 11:32:06', 202),
('DoctrineMigrations\\Version20211207161119', '2021-12-07 16:11:43', 464),
('DoctrineMigrations\\Version20211207162009', '2021-12-07 16:20:24', 178),
('DoctrineMigrations\\Version20211208101921', '2021-12-08 10:19:33', 218),
('DoctrineMigrations\\Version20211208102444', '2021-12-08 10:24:56', 147),
('DoctrineMigrations\\Version20211208111334', '2021-12-08 11:13:50', 109),
('DoctrineMigrations\\Version20211208122350', '2021-12-08 12:24:03', 140),
('DoctrineMigrations\\Version20211208133043', '2021-12-08 13:30:57', 197),
('DoctrineMigrations\\Version20211208133528', '2021-12-08 13:35:40', 275),
('DoctrineMigrations\\Version20211208133736', '2021-12-08 13:37:45', 330),
('DoctrineMigrations\\Version20211208135540', '2021-12-08 14:43:19', 265),
('DoctrineMigrations\\Version20211208144350', '2021-12-08 14:43:56', 189);

-- --------------------------------------------------------

--
-- Structure de la table `exterior_type`
--

DROP TABLE IF EXISTS `exterior_type`;
CREATE TABLE IF NOT EXISTS `exterior_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `feature`
--

DROP TABLE IF EXISTS `feature`;
CREATE TABLE IF NOT EXISTS `feature` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `feature`
--

INSERT INTO `feature` (`id`, `name`, `icon`) VALUES
(1, 'Air conditioning', NULL),
(2, 'Balcony', NULL),
(3, 'Elevator', NULL),
(4, 'Fire Alarm', NULL),
(5, 'First Floor Entry', NULL),
(6, 'High Impact Doors', NULL),
(7, 'Patio', NULL),
(8, 'Secure parking', '<i class=\"fas fa-parking\"></i>');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` smallint DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nofollow` tinyint(1) DEFAULT NULL,
  `new_tab` tinyint(1) DEFAULT NULL,
  `locale` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_locale_unique_key` (`url`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id`, `title`, `sort_order`, `url`, `nofollow`, `new_tab`, `locale`) VALUES
(1, 'Homepage', NULL, '/', NULL, NULL, 'en'),
(2, 'About Us', NULL, '/info/about-us', NULL, NULL, 'en'),
(3, 'Contact', NULL, '/info/contact', NULL, NULL, 'en'),
(4, 'Начало', NULL, '/', NULL, NULL, 'bg'),
(5, 'За нас', NULL, '/info/about-us', NULL, NULL, 'bg'),
(6, 'Контакти', NULL, '/info/contact', NULL, NULL, 'bg');

-- --------------------------------------------------------

--
-- Structure de la table `metro`
--

DROP TABLE IF EXISTS `metro`;
CREATE TABLE IF NOT EXISTS `metro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3884E4E18BAC62AF` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `metro`
--

INSERT INTO `metro` (`id`, `city_id`, `name`, `slug`) VALUES
(1, 1, 'Government Center', 'government-center'),
(2, 1, 'Allapattah', 'allapattah'),
(3, 1, 'Brickell', 'brickell'),
(4, 1, 'Culmer', 'culmer');

-- --------------------------------------------------------

--
-- Structure de la table `neighborhood`
--

DROP TABLE IF EXISTS `neighborhood`;
CREATE TABLE IF NOT EXISTS `neighborhood` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FEF1E9EE8BAC62AF` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `neighborhood`
--

INSERT INTO `neighborhood` (`id`, `city_id`, `name`, `slug`) VALUES
(1, 1, 'South Beach', 'south-beach'),
(2, 1, 'Downtown', 'downtown'),
(3, 3, 'Ballast Point', 'ballast-point'),
(4, 3, 'Culbreath Isles', 'culbreath-isles');

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `show_in_menu` tinyint(1) NOT NULL,
  `add_contact_form` tinyint(1) NOT NULL,
  `contact_email_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_locale_unique_key` (`slug`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `page`
--

INSERT INTO `page` (`id`, `title`, `description`, `slug`, `content`, `show_in_menu`, `add_contact_form`, `contact_email_address`, `locale`) VALUES
(1, 'About Us', 'About Us Page', 'about-us', '<h3>Why Choose Us</h3>\r\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,\r\n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\r\n                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in\r\n                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n                <h3>Our Properties</h3>\r\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,\r\n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\r\n                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in\r\n                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n                <h3>legal notice</h3>\r\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,\r\n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\r\n                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in\r\n                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>', 1, 0, NULL, 'en'),
(2, 'Contact', 'Contact Us', 'contact', NULL, 1, 1, 'example@domain.com', 'en'),
(3, 'За нас', 'Страница за нас', 'about-us', '<h3>Защо да изберете нас?</h3>\r\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,\r\n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\r\n                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in\r\n                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n                <h3>Нашите имоти</h3>\r\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,\r\n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\r\n                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in\r\n                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n                <h3>Правно съгласие</h3>\r\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,\r\n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris\r\n                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in\r\n                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>', 1, 0, NULL, 'bg'),
(4, 'Контакти', 'Страница контакти', 'contact', NULL, 1, 1, 'example@domain.com', 'bg');

-- --------------------------------------------------------

--
-- Structure de la table `parking_type`
--

DROP TABLE IF EXISTS `parking_type`;
CREATE TABLE IF NOT EXISTS `parking_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `property_id` int DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_14B78418549213EC` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`id`, `property_id`, `photo`, `sort_order`) VALUES
(1, 3, 'demo/1.jpeg', 1),
(2, 3, 'demo/2.jpeg', 2),
(3, 4, 'demo/3.jpeg', 1),
(4, 4, 'demo/4.jpeg', 2),
(5, 2, 'demo/5.jpeg', 1),
(6, 2, 'demo/6.jpeg', 2),
(7, 5, 'demo/7.jpeg', 1),
(8, 5, 'demo/2.jpeg', 2),
(9, 1, 'demo/8.jpeg', 1),
(10, 1, 'demo/9.jpeg', 2),
(11, 1, 'demo/4.jpeg', 3),
(12, 7, 'demo/10.jpeg', 1),
(13, 7, 'demo/6.jpeg', 2),
(14, 6, 'demo/11.jpeg', 1),
(15, 6, 'demo/12.jpeg', 2),
(16, 6, 'demo/13.jpeg', 3),
(18, 9, 'f4Vi1qmv9WkdZA4NfUUT.jpg', 0);

-- --------------------------------------------------------

--
-- Structure de la table `prisede_rdv`
--

DROP TABLE IF EXISTS `prisede_rdv`;
CREATE TABLE IF NOT EXISTS `prisede_rdv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_rdv` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D2D31865444F97DD` (`phone`),
  UNIQUE KEY `UNIQ_D2D31865A1CF58F3` (`date_rdv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8157AA0FA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `profile`
--

INSERT INTO `profile` (`id`, `user_id`, `full_name`, `phone`) VALUES
(1, 1, 'John Smith', '0(0)99766899'),
(2, 2, 'Rhonda Jordan', '0(0)99766899'),
(3, 3, 'Koné Seydou Emmanuel', '0748028796');

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `deal_type_id` int NOT NULL,
  `city_id` int NOT NULL,
  `neighborhood_id` int DEFAULT NULL,
  `metro_station_id` int DEFAULT NULL,
  `district_id` int DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bathrooms_number` smallint DEFAULT NULL,
  `bedrooms_number` smallint DEFAULT NULL,
  `max_guests` smallint DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_map` tinyint(1) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `price_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `available_now` tinyint(1) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `priority_number` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `elementary_school` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` int NOT NULL,
  `year_built` date NOT NULL,
  `garage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `high_school` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middlle_school` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8BF21CDEF675F31B` (`author_id`),
  KEY `IDX_8BF21CDE2156041B` (`deal_type_id`),
  KEY `IDX_8BF21CDE8BAC62AF` (`city_id`),
  KEY `IDX_8BF21CDE803BB24B` (`neighborhood_id`),
  KEY `IDX_8BF21CDEF7D58AAA` (`metro_station_id`),
  KEY `IDX_8BF21CDEB08FA272` (`district_id`),
  KEY `IDX_8BF21CDE12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `author_id`, `deal_type_id`, `city_id`, `neighborhood_id`, `metro_station_id`, `district_id`, `slug`, `bathrooms_number`, `bedrooms_number`, `max_guests`, `address`, `latitude`, `longitude`, `show_map`, `price`, `price_type`, `available_now`, `state`, `priority_number`, `created_at`, `updated_at`, `elementary_school`, `area`, `year_built`, `garage`, `school_district`, `high_school`, `middlle_school`, `category_id`, `img`) VALUES
(1, 1, 2, 3, 4, NULL, 1, 'Building: 123 on the Park', NULL, 5, NULL, '4935 New Providence Ave, Tampa, FL', '27.932255', '-82.533187', 1, 4300, 'sq. foot', NULL, 'published', 0, '2021-11-12 13:18:18', '2021-11-12 13:18:18', '', 0, '0000-00-00', '', '', '', '', 1, 'index-1.jpg'),
(2, 1, 1, 2, NULL, NULL, NULL, 'stylish-two-level-penthouse-in-palm-beach', NULL, 2, 5, '101 Worth Ave, Palm Beach, FL 33480', '26.701320', '-80.033688', 1, 2000, 'mo', NULL, 'published', 0, '2021-11-12 13:18:18', '2021-11-12 13:18:18', '', 0, '0000-00-00', '', '', '', '', 2, 'index-2.jpg'),
(3, 1, 1, 1, 1, NULL, NULL, 'bright-and-cheerful-alcove-studio', NULL, NULL, 4, '1451 Ocean Dr, Miami Beach, FL 33139', '25.785107', '-80.129460', 1, 200, 'day', NULL, 'published', 0, '2021-11-12 13:18:18', '2021-11-12 13:18:18', '', 0, '0000-00-00', '', '', '', '', 3, 'index-11.jpg'),
(4, 1, 1, 1, 1, NULL, NULL, 'modern-one-bedroom-apartment-in-miami', NULL, 1, 2, '1451 Ocean Dr, Miami Beach, FL 33139', '25.785107', '-80.129460', 1, 250, 'day', NULL, 'published', 0, '2021-11-12 13:18:18', '2021-11-12 13:18:18', '', 0, '0000-00-00', '', '', '', '', 4, 'index-4.jpg'),
(5, 1, 1, 2, NULL, NULL, NULL, 'bright-fully-furnished-1-bedroom-flat-on-the-2nd-floor', NULL, 1, 3, '300 S Ocean Blvd, Palm Beach, FL', '26.705007', '-80.033574', 1, 180, 'day', NULL, 'published', 0, '2021-11-12 13:18:18', '2021-11-12 13:18:18', '', 0, '0000-00-00', '', '', '', '', 1, 'index-5.jpg'),
(6, 2, 2, 1, 2, 1, NULL, 'interesting-two-bedroom-apartment-for-sale', NULL, 2, NULL, '111 NE 2nd Ave, Miami, FL 33132', '25.775565', '-80.190125', 1, 190000, NULL, 0, 'published', 0, '2021-11-12 13:18:18', '2021-11-19 11:18:40', '', 0, '0000-00-00', '', '', '', '', 2, 'index-6.jpg'),
(7, 2, 1, 3, 3, NULL, NULL, 'furnished-renovated-2-bedroom-2-bathroom-flat', NULL, 2, 6, '5411 Bayshore Blvd, Tampa, FL 33611', '27.885095', '-82.486153', 1, 2200, 'mo', NULL, 'published', 0, '2021-11-12 13:18:18', '2021-11-12 13:18:18', '', 0, '0000-00-00', '', '', '', '', 3, 'index-7.jpg'),
(9, 2, 2, 1, 1, 3, NULL, 'hjdgq', 4, NULL, NULL, 'gdrxgfchvj', NULL, NULL, 0, NULL, NULL, 0, 'published', 0, '2021-12-03 11:25:31', '2021-12-03 11:25:31', '', 0, '0000-00-00', '', '', '', '', 4, 'index-8.jpg'),
(10, 1, 1, 2, NULL, NULL, NULL, 'bright-fully-furnished-1-bedroom-flat-on-the-2nd-floor', NULL, 1, 3, '300 S Ocean Blvd, Palm Beach, FL', '26.705007', '-80.033574', 1, 180, 'day', NULL, 'published', 0, '2021-11-12 13:18:18', '2021-11-12 13:18:18', '', 0, '0000-00-00', '', '', '', '', 1, 'index-5.jpg'),
(11, 1, 1, 2, NULL, NULL, NULL, 'stylish-two-level-penthouse-in-palm-beach', NULL, 2, 5, '101 Worth Ave, Palm Beach, FL 33480', '26.701320', '-80.033688', 1, 2000, 'mo', NULL, 'published', 0, '2021-11-12 13:18:18', '2021-11-12 13:18:18', '', 0, '0000-00-00', '', '', '', '', 2, 'index-2.jpg'),
(12, 1, 1, 2, NULL, NULL, NULL, 'stylish-two-level-penthouse-in-palm-beach', NULL, 2, 5, '101 Worth Ave, Palm Beach, FL 33480', '26.701320', '-80.033688', 1, 2000, 'mo', NULL, 'published', 0, '2021-11-12 13:18:18', '2021-11-12 13:18:18', '', 0, '0000-00-00', '', '', '', '', 2, 'index-2.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `property_description`
--

DROP TABLE IF EXISTS `property_description`;
CREATE TABLE IF NOT EXISTS `property_description` (
  `id` int NOT NULL AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D2818010549213EC` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property_description`
--

INSERT INTO `property_description` (`id`, `property_id`, `title`, `content`, `meta_title`, `meta_description`) VALUES
(1, 1, 'Beautiful villa for sale in Tampa', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,\r\n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n                Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat.\r\n                Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur.\r\n                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui\r\n                officia deserunt mollit anim id est laborum.</p>\r\n                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem\r\n                accusantium doloremque laudantium, totam rem aperiam,\r\n                eaque ipsa quae ab illo inventore veritatis et quasi\r\n                architecto beatae vitae dicta sunt explicabo.\r\n                Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut\r\n                odit aut fugit, sed quia consequuntur magni dolores eos qui\r\n                ratione voluptatem sequi nesciunt. Neque porro quisquam est,\r\n                qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,\r\n                sed quia non numquam eius modi tempora incidunt ut labore et dolore\r\n                magnam aliquam quaerat voluptatem. Ut enim ad minima veniam,\r\n                quis nostrum exercitationem ullam corporis suscipit laboriosam,\r\n                nisi ut aliquid ex ea commodi consequatur.</p>', NULL, 'Beautiful villa for sale in Tampa'),
(2, 2, 'Stylish two-level penthouse in Palm Beach', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,\r\n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n                Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat.\r\n                Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur.\r\n                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui\r\n                officia deserunt mollit anim id est laborum.</p>\r\n                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem\r\n                accusantium doloremque laudantium, totam rem aperiam,\r\n                eaque ipsa quae ab illo inventore veritatis et quasi\r\n                architecto beatae vitae dicta sunt explicabo.\r\n                Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut\r\n                odit aut fugit, sed quia consequuntur magni dolores eos qui\r\n                ratione voluptatem sequi nesciunt. Neque porro quisquam est,\r\n                qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,\r\n                sed quia non numquam eius modi tempora incidunt ut labore et dolore\r\n                magnam aliquam quaerat voluptatem. Ut enim ad minima veniam,\r\n                quis nostrum exercitationem ullam corporis suscipit laboriosam,\r\n                nisi ut aliquid ex ea commodi consequatur.</p>', NULL, 'Stylish two-level penthouse in Palm Beach'),
(3, 3, 'Bright and Cheerful alcove studio', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,\r\n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n                Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat.\r\n                Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur.\r\n                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui\r\n                officia deserunt mollit anim id est laborum.</p>\r\n                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem\r\n                accusantium doloremque laudantium, totam rem aperiam,\r\n                eaque ipsa quae ab illo inventore veritatis et quasi\r\n                architecto beatae vitae dicta sunt explicabo.\r\n                Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut\r\n                odit aut fugit, sed quia consequuntur magni dolores eos qui\r\n                ratione voluptatem sequi nesciunt. Neque porro quisquam est,\r\n                qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,\r\n                sed quia non numquam eius modi tempora incidunt ut labore et dolore\r\n                magnam aliquam quaerat voluptatem. Ut enim ad minima veniam,\r\n                quis nostrum exercitationem ullam corporis suscipit laboriosam,\r\n                nisi ut aliquid ex ea commodi consequatur.</p>', NULL, 'Bright and Cheerful alcove studio'),
(4, 4, 'Modern one-bedroom apartment in Miami', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,\r\n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n                Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat.\r\n                Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur.\r\n                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui\r\n                officia deserunt mollit anim id est laborum.</p>\r\n                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem\r\n                accusantium doloremque laudantium, totam rem aperiam,\r\n                eaque ipsa quae ab illo inventore veritatis et quasi\r\n                architecto beatae vitae dicta sunt explicabo.\r\n                Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut\r\n                odit aut fugit, sed quia consequuntur magni dolores eos qui\r\n                ratione voluptatem sequi nesciunt. Neque porro quisquam est,\r\n                qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,\r\n                sed quia non numquam eius modi tempora incidunt ut labore et dolore\r\n                magnam aliquam quaerat voluptatem. Ut enim ad minima veniam,\r\n                quis nostrum exercitationem ullam corporis suscipit laboriosam,\r\n                nisi ut aliquid ex ea commodi consequatur.</p>', NULL, 'Modern one-bedroom apartment in Miami'),
(5, 5, 'Bright fully furnished 1-bedroom flat on the 2nd floor', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,\r\n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n                Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat.\r\n                Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur.\r\n                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui\r\n                officia deserunt mollit anim id est laborum.</p>\r\n                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem\r\n                accusantium doloremque laudantium, totam rem aperiam,\r\n                eaque ipsa quae ab illo inventore veritatis et quasi\r\n                architecto beatae vitae dicta sunt explicabo.\r\n                Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut\r\n                odit aut fugit, sed quia consequuntur magni dolores eos qui\r\n                ratione voluptatem sequi nesciunt. Neque porro quisquam est,\r\n                qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,\r\n                sed quia non numquam eius modi tempora incidunt ut labore et dolore\r\n                magnam aliquam quaerat voluptatem. Ut enim ad minima veniam,\r\n                quis nostrum exercitationem ullam corporis suscipit laboriosam,\r\n                nisi ut aliquid ex ea commodi consequatur.</p>', NULL, 'Bright fully furnished 1-bedroom flat on the 2nd floor'),
(6, 6, 'Interesting two-bedroom apartment for sale', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,\r\n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n                Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat.\r\n                Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur.\r\n                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui\r\n                officia deserunt mollit anim id est laborum.</p>\r\n                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem\r\n                accusantium doloremque laudantium, totam rem aperiam,\r\n                eaque ipsa quae ab illo inventore veritatis et quasi\r\n                architecto beatae vitae dicta sunt explicabo.\r\n                Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut\r\n                odit aut fugit, sed quia consequuntur magni dolores eos qui\r\n                ratione voluptatem sequi nesciunt. Neque porro quisquam est,\r\n                qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,\r\n                sed quia non numquam eius modi tempora incidunt ut labore et dolore\r\n                magnam aliquam quaerat voluptatem. Ut enim ad minima veniam,\r\n                quis nostrum exercitationem ullam corporis suscipit laboriosam,\r\n                nisi ut aliquid ex ea commodi consequatur.</p>', NULL, 'Interesting two-bedroom apartment for sale'),
(7, 7, 'Furnished renovated 2-bedroom 2-bathroom flat', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,\r\n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n                Ut enim ad minim veniam, quis nostrud exercitation ullamco\r\n                laboris nisi ut aliquip ex ea commodo consequat.\r\n                Duis aute irure dolor in reprehenderit in voluptate\r\n                velit esse cillum dolore eu fugiat nulla pariatur.\r\n                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui\r\n                officia deserunt mollit anim id est laborum.</p>\r\n                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem\r\n                accusantium doloremque laudantium, totam rem aperiam,\r\n                eaque ipsa quae ab illo inventore veritatis et quasi\r\n                architecto beatae vitae dicta sunt explicabo.\r\n                Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut\r\n                odit aut fugit, sed quia consequuntur magni dolores eos qui\r\n                ratione voluptatem sequi nesciunt. Neque porro quisquam est,\r\n                qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,\r\n                sed quia non numquam eius modi tempora incidunt ut labore et dolore\r\n                magnam aliquam quaerat voluptatem. Ut enim ad minima veniam,\r\n                quis nostrum exercitationem ullam corporis suscipit laboriosam,\r\n                nisi ut aliquid ex ea commodi consequatur.</p>', NULL, 'Furnished renovated 2-bedroom 2-bathroom flat'),
(9, 9, 'hjdgq', '<p>vhuyhtwhtxfjycgkvhlbjmknljhgfdswgdxhfgcjvkb</p>', 'gcghjk', 'hyfffffhgjk');

-- --------------------------------------------------------

--
-- Structure de la table `property_feature`
--

DROP TABLE IF EXISTS `property_feature`;
CREATE TABLE IF NOT EXISTS `property_feature` (
  `property_id` int NOT NULL,
  `feature_id` int NOT NULL,
  PRIMARY KEY (`property_id`,`feature_id`),
  KEY `IDX_461A3F1E549213EC` (`property_id`),
  KEY `IDX_461A3F1E60E4B879` (`feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property_feature`
--

INSERT INTO `property_feature` (`property_id`, `feature_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 6),
(1, 8),
(2, 1),
(2, 2),
(2, 4),
(2, 6),
(2, 8),
(3, 1),
(3, 2),
(3, 4),
(3, 6),
(3, 8),
(4, 1),
(4, 2),
(4, 4),
(4, 6),
(4, 8),
(5, 1),
(5, 2),
(5, 4),
(5, 6),
(5, 8),
(6, 1),
(6, 2),
(6, 4),
(6, 6),
(6, 8),
(7, 1),
(7, 2),
(7, 4),
(7, 6),
(7, 8),
(9, 4);

-- --------------------------------------------------------

--
-- Structure de la table `rdv`
--

DROP TABLE IF EXISTS `rdv`;
CREATE TABLE IF NOT EXISTS `rdv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bien_id` int NOT NULL,
  `utilisateur_id` int NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `is_effect` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_10C31F86BD95B80F` (`bien_id`),
  KEY `IDX_10C31F86FB88E14F` (`utilisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rdv`
--

INSERT INTO `rdv` (`id`, `bien_id`, `utilisateur_id`, `date`, `heure`, `is_effect`) VALUES
(4, 3, 1, '2021-11-30', '16:17:00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `roof_type`
--

DROP TABLE IF EXISTS `roof_type`;
CREATE TABLE IF NOT EXISTS `roof_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E545A0C59F9752E0` (`setting_name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `setting_name`, `setting_value`) VALUES
(4, 'name', 'Site name'),
(5, 'title', 'Popular Listing'),
(6, 'meta_title', 'Site Title'),
(7, 'meta_description', 'Site Description'),
(8, 'custom_code', ''),
(9, 'custom_footer_text', 'All Rights Reserved.'),
(10, 'items_per_page', '6'),
(11, 'ymaps_key', ''),
(12, 'map_center', '27.188534, -81.128735'),
(13, 'map_zoom', '7'),
(14, 'currency_id', '1'),
(15, 'header_image', ''),
(16, 'logo_image', ''),
(17, 'fixed_top_navbar', '0'),
(18, 'show_similar_properties', '0'),
(19, 'show_filter_by_city', '1'),
(20, 'show_filter_by_deal_type', '1'),
(21, 'show_filter_by_category', '1'),
(22, 'show_filter_by_features', '0'),
(23, 'show_filter_by_bedrooms', '0'),
(24, 'show_filter_by_guests', '0'),
(25, 'show_language_selector', '1');

-- --------------------------------------------------------

--
-- Structure de la table `slide`
--

DROP TABLE IF EXISTS `slide`;
CREATE TABLE IF NOT EXISTS `slide` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `title_principal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `slide`
--

INSERT INTO `slide` (`id`, `img`, `price`, `title_principal`, `description`) VALUES
(1, 'slide-3.jpg', 239, 'Modera Loft', 'Make Modera Loft your home and reside in historic Jersey City style.'),
(2, 'slide-1.jpg', 309, '1530-2 Liberty Ave 4', 'This is a 3 bedroom, 2.0 bathroom multi family home. It is located at 1530 Liberty Ave Hillside.'),
(3, 'slide-2.jpg', 216, '53 Rachel Ct 53', 'A renovated apartment for rent by owner. 2 bedroom, 2 full bath living and dining room');

-- --------------------------------------------------------

--
-- Structure de la table `structures`
--

DROP TABLE IF EXISTS `structures`;
CREATE TABLE IF NOT EXISTS `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `date_modification` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `date_suppression` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `numero_registe_de_commerce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5BBEC55AA4D60759` (`libelle`),
  UNIQUE KEY `UNIQ_5BBEC55A4C62E638` (`contact`),
  UNIQUE KEY `UNIQ_5BBEC55AE7927C74` (`email`),
  UNIQUE KEY `UNIQ_5BBEC55AE1540971` (`site_web`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `structures`
--

INSERT INTO `structures` (`id`, `libelle`, `adresse`, `contact`, `email`, `site_web`, `date_creation`, `date_modification`, `date_suppression`, `numero_registe_de_commerce`) VALUES
(5, 'Structure test', 'adresse 1', '123456789', 'structure@gmail.com', 'siteweb.com', '2021-11-22 10:00:03', '2021-11-22 10:00:03', NULL, '15-81478');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `confirmation_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9F85E0677` (`username`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `roles`, `confirmation_token`, `password_requested_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$13$n9FoLXv7PZqATZhMq1Xe3uNhthf8NHrBDU0qwe80IHL5OReW10IdG', '[\"ROLE_ADMIN\", \"ROLE_USER\"]', NULL, NULL),
(2, 'user', 'user@user.com', '$2y$13$4askyul99BYgUIpSSUS..uWk6p175T27ePju7T/O7kGiEXvU3HCRO', '[\"ROLE_USER\"]', NULL, NULL),
(3, 'lebeni', 'koneseydou.emmanuel@gmail.com', '$2y$13$HT9Fi0z2AUWrHqBi7fwniObX185hYzJ9WTVk76fUHxJV/1mE8go2i', '[\"ROLE_USER\"]', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bien_id` int NOT NULL,
  `prix_vente` int NOT NULL,
  `dossier` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_vente` date NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_888A2A4CBD95B80F` (`bien_id`),
  KEY `IDX_888A2A4CA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`id`, `bien_id`, `prix_vente`, `dossier`, `date_vente`, `user_id`) VALUES
(3, 1, 14000, 'CNI, ATTESTATION DE VENTE', '2021-06-20', 1);

-- --------------------------------------------------------

--
-- Structure de la table `view_type`
--

DROP TABLE IF EXISTS `view_type`;
CREATE TABLE IF NOT EXISTS `view_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `agences`
--
ALTER TABLE `agences`
  ADD CONSTRAINT `FK_B46015DDAA95C5C1` FOREIGN KEY (`structure_id_id`) REFERENCES `structures` (`id`);

--
-- Contraintes pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `FK_60349993A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_60349993BD95B80F` FOREIGN KEY (`bien_id`) REFERENCES `property` (`id`);

--
-- Contraintes pour la table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `IDX_31C154878BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Contraintes pour la table `metro`
--
ALTER TABLE `metro`
  ADD CONSTRAINT `IDX_3884E4E18BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Contraintes pour la table `neighborhood`
--
ALTER TABLE `neighborhood`
  ADD CONSTRAINT `IDX_FEF1E9EE8BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `IDX_14B78418549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`);

--
-- Contraintes pour la table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `FK_8157AA0FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `IDX_8BF21CDE2156041B` FOREIGN KEY (`deal_type_id`) REFERENCES `deal_type` (`id`),
  ADD CONSTRAINT `IDX_8BF21CDE803BB24B` FOREIGN KEY (`neighborhood_id`) REFERENCES `neighborhood` (`id`),
  ADD CONSTRAINT `IDX_8BF21CDE8BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `IDX_8BF21CDEB08FA272` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  ADD CONSTRAINT `IDX_8BF21CDEF675F31B` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `IDX_8BF21CDEF7D58AAA` FOREIGN KEY (`metro_station_id`) REFERENCES `metro` (`id`);

--
-- Contraintes pour la table `property_description`
--
ALTER TABLE `property_description`
  ADD CONSTRAINT `FK_D2818010549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`);

--
-- Contraintes pour la table `property_feature`
--
ALTER TABLE `property_feature`
  ADD CONSTRAINT `IDX_461A3F1E549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `IDX_461A3F1E60E4B879` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD CONSTRAINT `FK_10C31F86BD95B80F` FOREIGN KEY (`bien_id`) REFERENCES `property` (`id`),
  ADD CONSTRAINT `FK_10C31F86FB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `FK_888A2A4CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_888A2A4CBD95B80F` FOREIGN KEY (`bien_id`) REFERENCES `property` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
