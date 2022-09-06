-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-09-2022 a las 00:42:00
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.26

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
-- Estructura de tabla para la tabla `categories`
--
-- Creación: 06-09-2022 a las 22:37:15
-- Última actualización: 06-09-2022 a las 22:37:15
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `categorie_id` int(4) NOT NULL,
  `categorie_name` varchar(35) NOT NULL,
  `categorie_active` tinyint(1) NOT NULL DEFAULT 1,
  `categorie_nro_prod` int(11) NOT NULL,
  `categorie_viewMenu` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `categories`:
--

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`categorie_id`, `categorie_name`, `categorie_active`, `categorie_nro_prod`, `categorie_viewMenu`) VALUES
(1, 'Pizza Casera', 1, 7, 1),
(2, 'Hamburguesa', 1, 4, 2),
(3, 'Sandwich de Milanesa de Pollo', 1, 4, 3),
(4, 'Sandwich de Milanesa de Carne', 1, 4, 4),
(5, 'Sandwich de Lomo', 1, 4, 5),
(6, 'Triples', 1, 3, 6),
(7, 'Tostados', 1, 1, 7),
(8, 'Papas Fritas', 1, 3, 8),
(9, 'Empanadas', 1, 2, 9);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorie_id`),
  ADD UNIQUE KEY `nombre` (`categorie_name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `categorie_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
