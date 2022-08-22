SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "-03:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apicocina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `prod_id` int(2) NOT NULL,
  `prod_name` varchar(100) NOT NULL,
  `prod_short_name` varchar(15) NOT NULL,
  `prod_img` varchar(255) DEFAULT NULL,
  `prod_categ` int(2) NOT NULL,
  `prod_unid` int(2) DEFAULT NULL,
  `prod_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `prod_cost_import` tinyint(1) NOT NULL DEFAULT 0,
  `prod_price` decimal(10,2) NOT NULL,
  `prod_price_neg` tinyint(1) NOT NULL DEFAULT 0,
  `prod_inventary` text DEFAULT NULL,
  `prod_inventary_infinite` tinyint(1) DEFAULT 0,
  `prod_description` varchar(255) NOT NULL,
  `prod_branch` int(4) NOT NULL DEFAULT 1,
  `prod_tax_in_price` tinyint(1) NOT NULL DEFAULT 0,
  `prod_active` tinyint(1) NOT NULL DEFAULT 1,
  `prod_update` timestamp NOT NULL DEFAULT current_timestamp(),
  `prod_update_user` varchar(14) NOT NULL COMMENT 'aid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--

CREATE TABLE `users` (
 `user_id` int(3) NOT NULL AUTO_INCREMENT,
 `user_alias` varchar(20) NOT NULL,
 `user_name` varchar(30) NOT NULL,
 `user_last_name` varchar(30) NOT NULL,
 `user_email` varchar(30) NOT NULL,
 `user_password` varchar(32) NOT NULL,
 `user_level` int(2) NOT NULL,
 `user_createAt` datetime NOT NULL,
 PRIMARY KEY (`userId`),
 UNIQUE KEY `user_alias` (`user_alias`),
 UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4

CREATE TABLE `users_tokens` (
 `token_id` int(12) NOT NULL AUTO_INCREMENT,
 `token_user_id` int(3) NOT NULL,
 `token` varchar(45) NOT NULL,
 `token_status` int(1) NOT NULL DEFAULT 1,
 `token_createAt` datetime NOT NULL,
 PRIMARY KEY (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4




INSERT INTO `users` 
   (`user_id`, `user-alias`, `user_name`, `user_last_name`, `user_email`, `user_password`, `user_level`, `user_createAt`) 
 VALUES
   (NULL, 'usuario1', 'usuario1', 'UNO', 'usuario1@gmail.com', MD5('123456'), '1', '');
   (NULL, 'usuario2', 'usuario2', 'DOS', 'usuario2@gmail.com', MD5('123456'), '1', ''),
   (NULL, 'usuario3', 'usuario3', 'TRES', 'usuario3@gmail.com', MD5('123456'), '1', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `prod_id` int(2) NOT NULL,
  `prod_name` varchar(100) NOT NULL,
  `prod_short_name` varchar(15) NOT NULL,
  `prod_img` varchar(255) DEFAULT NULL,
  `prod_categ` int(2) NOT NULL,
  `prod_unid` int(2) DEFAULT NULL,
  `prod_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `prod_cost_import` tinyint(1) NOT NULL DEFAULT 0,
  `prod_price` decimal(10,2) NOT NULL,
  `prod_price_neg` tinyint(1) NOT NULL DEFAULT 0,
  `prod_inventary` text DEFAULT NULL,
  `prod_inventary_infinite` tinyint(1) DEFAULT 0,
  `prod_description` varchar(255) NOT NULL,
  `prod_branch` int(4) NOT NULL DEFAULT 1,
  `prod_tax_in_price` tinyint(1) NOT NULL DEFAULT 0,
  `prod_active` tinyint(1) NOT NULL DEFAULT 1,
  `prod_update` timestamp NOT NULL DEFAULT current_timestamp(),
  `prod_update_user` varchar(14) NOT NULL COMMENT 'aid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
