-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-08-2022 a las 23:56:33
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
CREATE DATABASE IF NOT EXISTS `apicocina` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `apicocina`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apikeys`
--

DROP TABLE IF EXISTS `apikeys`;
CREATE TABLE `apikeys` (
  `apikey_id` int(11) NOT NULL,
  `apikey` int(12) NOT NULL,
  `apikey_site` varchar(50) NOT NULL,
  `apikey_userEmail` varchar(45) DEFAULT NULL,
  `apikey_user` varchar(20) DEFAULT NULL,
  `apikey_password` varchar(30) NOT NULL,
  `apikey_status` int(1) NOT NULL DEFAULT 0,
  `apikey_createAT` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `apikeys`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `categorie_id` int(4) NOT NULL,
  `categorie_name` varchar(35) NOT NULL,
  `categorie_active` tinyint(1) NOT NULL DEFAULT 1,
  `categorie_nro_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `categories`:
--

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`categorie_id`, `categorie_name`, `categorie_active`, `categorie_nro_prod`) VALUES
(1, 'Pizza Casera', 1, 7),
(2, 'Hamburguesa', 1, 4),
(3, 'Sandwich de Milanesa de Pollo', 1, 4),
(4, 'Sandwich de Milanesa de Carne', 1, 4),
(5, 'Sandwich de Lomo', 1, 4),
(6, 'Triples', 1, 3),
(7, 'Tostados', 1, 1),
(8, 'Papas Fritas', 1, 3),
(9, 'Empanadas', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `prod_id` int(2) NOT NULL,
  `prod_name` varchar(100) NOT NULL,
  `prod_short_name` varchar(15) NOT NULL,
  `prod_img` varchar(255) DEFAULT NULL,
  `prod_section` int(2) NOT NULL DEFAULT 0,
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
-- RELACIONES PARA LA TABLA `products`:
--

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`prod_id`, `prod_name`, `prod_short_name`, `prod_img`, `prod_section`, `prod_categ`, `prod_unid`, `prod_cost`, `prod_cost_import`, `prod_price`, `prod_price_neg`, `prod_inventary`, `prod_inventary_infinite`, `prod_description`, `prod_branch`, `prod_tax_in_price`, `prod_active`, `prod_update`, `prod_update_user`) VALUES
(1, 'Pizza Muzarella', 'Muza', '', 1, 1, 0, '0.00', 0, '750.00', 0, '', 1, 'Salsa, Queso Muzzarella, Aceitunas', 0, 0, 1, '2022-07-23 01:53:59', 'ChriX'),
(2, 'Pizza Especial', 'Especial', '', 1, 1, 0, '0.00', 0, '900.00', 0, '', 1, 'Salsa, Queso Muzzarella, Jamón, Morrones, Aceitunas', 0, 0, 1, '2022-07-23 01:52:51', 'ChriX'),
(3, 'Pizza Napolitana', 'Napo', '', 1, 1, 0, '0.00', 0, '800.00', 0, '', 1, 'Salsa, Queso Muzzarella, Ajo, Tomates, Aceitunas', 0, 0, 1, '2022-07-23 01:54:12', 'ChriX'),
(4, 'Pizza Calabresa', 'Calabresa', '', 1, 1, 0, '0.00', 0, '950.00', 0, '', 1, 'Salsa, Queso Muzzarella, Longaniza Calabresa, Aceitunas', 0, 0, 1, '2022-07-23 01:47:55', 'ChriX'),
(5, 'G. Cabalgata Naranja', 'CaNaran', 'gaseosa_cabalgata_naranja_150x150.png', 2, 2, 0, '90.00', 0, '120.00', 0, '7', 0, 'Gaseosa Sabor NARANJA', 0, 0, 1, '2021-08-20 00:02:45', 'ChriX'),
(6, 'G. Cabalgata Limonada', 'CaLimo', 'gaseosa_cabalgata_LLimon_150x150.png', 2, 2, 0, '90.00', 0, '120.00', 0, '0', 0, '', 0, 0, 1, '2021-08-20 00:02:57', 'ChriX'),
(7, 'Pizza Jamón con Huevo', 'JAMON', '', 1, 1, 0, '0.00', 0, '950.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:53:08', 'ChriX'),
(8, 'Hamburguesa Común', 'hacomun', '', 1, 1, 0, '0.00', 0, '300.00', 0, '', 1, 'Hamburguesa Común', 0, 0, 1, '2022-07-23 01:46:05', 'ChriX'),
(9, 'Hamburguesa Común con Fritas', 'HACOfrita', '', 1, 1, 0, '0.00', 0, '350.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:46:21', 'ChriX'),
(10, 'Hamburguesa Especial', 'HAESP', '', 1, 1, 0, '0.00', 0, '400.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:46:53', 'ChriX'),
(11, 'Hamburguesa Especial con Fritas', 'haespfri', '', 1, 1, 0, '0.00', 0, '450.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:46:32', 'ChriX'),
(12, 'Triple de Lomo', 'trlomo', '', 1, 1, 0, '0.00', 0, '1000.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:54:55', 'ChriX'),
(13, 'Triple de Verduras', 'trverdu', '', 1, 1, 0, '0.00', 0, '550.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:54:31', 'ChriX'),
(14, 'Hamburguesa Especial Doble Carne', 'Doblenecar', '', 1, 1, 0, '0.00', 0, '850.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:47:06', 'ChriX'),
(15, 'Pizza 4 Quesos', '4queso', '', 1, 1, 0, '0.00', 0, '1000.00', 0, '', 1, 'Salsa, Queso Muzzarella, Queso Tybo, Queso Sardo, Queso Roquefort', 0, 0, 1, '2022-07-23 01:51:56', 'ChriX'),
(16, 'Pizza Jamón con morrones', 'JcMorron', '', 1, 1, 0, '0.00', 0, '1000.00', 0, '', 1, 'Salsa, Queso Muzzarella, Jamón, Morrones, Aceitunas', 0, 0, 1, '2022-07-23 01:53:32', 'ChriX'),
(17, 'Triple de Lomo Gratinado', 'LomoGratin', '', 1, 1, 0, '0.00', 0, '1200.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:54:44', 'ChriX'),
(18, 'Sandw. Pollo Común', 'SPComun', '', 1, 1, 0, '0.00', 0, '425.00', 0, '', 1, '', 0, 0, 1, '2022-08-10 02:28:41', 'ChriX'),
(19, 'Sandw. Pollo Común con Fritas', 'SPCcF', '', 1, 1, 0, '0.00', 0, '450.00', 0, '', 1, '', 0, 0, 1, '2022-08-10 02:28:02', 'ChriX'),
(20, 'Sandw. Pollo Especial', 'PolloEspe', '', 1, 1, 0, '0.00', 0, '475.00', 0, '', 1, '', 0, 0, 1, '2022-08-10 02:29:33', 'ChriX'),
(21, 'Sandw. Pollo Especial con Fritas', 'SPCompleto', '', 1, 1, 0, '0.00', 0, '500.00', 0, '', 1, '', 0, 0, 1, '2022-08-10 02:25:35', 'ChriX'),
(22, 'Sandw. Carne Común', 'carnecomun', '', 1, 1, 0, '0.00', 0, '400.00', 0, '', 1, '', 0, 0, 1, '2022-07-15 07:48:42', 'ChriX'),
(23, 'Sandw. Carne Común con Fritas', 'carnesimpl', '', 1, 1, 0, '0.00', 0, '420.00', 0, '', 1, '', 0, 0, 1, '2022-07-15 07:49:04', 'ChriX'),
(24, 'Sandw. Carne Especial', 'CarneEspec', '', 1, 1, 0, '0.00', 0, '450.00', 0, '', 1, '', 0, 0, 1, '2022-07-15 07:49:48', 'ChriX'),
(25, 'Sandw. Carne Especial con Fritas', 'CarneCompl', '', 1, 1, 0, '0.00', 0, '650.00', 0, '', 1, '', 0, 0, 1, '2022-08-10 02:49:43', 'ChriX'),
(26, 'Tostado', 'Tostado', '', 1, 1, 0, '0.00', 0, '400.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:55:11', 'ChriX'),
(27, 'Sandw. Lomo Común', 'lomoComun', '', 1, 1, 0, '0.00', 0, '450.00', 0, '', 1, '', 0, 0, 1, '2022-07-15 07:51:56', 'ChriX'),
(28, 'Sandw. Lomo Común con Fritas', 'LomoSimple', '', 1, 1, 0, '0.00', 0, '470.00', 0, '', 1, '', 0, 0, 1, '2022-07-15 07:52:57', 'ChriX'),
(29, 'Sandw. Lomo Especial', 'LomoEspeci', '', 1, 1, 0, '0.00', 0, '500.00', 0, '', 1, '', 0, 0, 1, '2022-07-15 07:53:17', 'ChriX'),
(30, 'Sandw. Lomo Especial con Fritas', 'LomoComple', '', 1, 1, 0, '0.00', 0, '520.00', 0, '', 1, '', 0, 0, 1, '2022-07-15 07:53:37', 'ChriX'),
(31, 'Vino Balbo', 'Balbo', 'vino_balbo_tinto_150x150.png', 2, 2, 0, '165.00', 0, '220.00', 0, '10', 0, '', 0, 0, 1, '2021-08-20 00:01:02', 'ChriX'),
(32, 'G. Coca-Cola 1.,5Lts (Retornable)', 'coca', 'gaseosa_cocacola_1.5l_150x150.png', 2, 2, 0, '106.00', 0, '140.00', 0, '3', 0, '', 0, 0, 1, '2021-08-20 00:02:22', 'ChriX'),
(33, 'G. Sprite 2 Lts (Retornable)', 'sprite', 'gaseosa_sprite_2l_150x150.png', 2, 2, 0, '100.00', 0, '140.00', 0, '3', 0, '', 0, 0, 1, '2021-08-20 00:01:29', 'ChriX'),
(34, 'G. Fanta 2 Lts (Retornable)', 'Fanta', 'gaseosa_fanta_2l_150x150.png', 2, 2, 0, '100.00', 0, '140.00', 0, '4', 0, '', 0, 0, 1, '2021-08-20 00:01:57', 'ChriX'),
(35, 'Fritas (Chica)', 'FritaChica', '', 1, 1, 0, '0.00', 0, '300.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:39:45', 'ChriX'),
(36, 'Fritas (Grande)', 'FritaGrand', '', 1, 1, 0, '0.00', 0, '400.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:40:01', 'ChriX'),
(37, 'Fritas (XXL)', 'FritaExtra', '', 1, 1, 0, '0.00', 0, '580.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:40:13', 'ChriX'),
(38, 'Fritas Gratinada (Chica)', 'gratinchic', '', 1, 1, 0, '0.00', 0, '420.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:40:25', 'ChriX'),
(39, 'Fritas Gratinadas (Grande)', 'gratinGran', '', 1, 1, 0, '0.00', 0, '550.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:41:13', 'ChriX'),
(40, 'Fritas Gratinadas (XXL)', 'GratinaExt', '', 1, 1, 0, '0.00', 0, '750.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:42:08', 'ChriX'),
(41, 'Emp. Jamon y queso Frita (x1)', '1Jyq', '', 1, 1, 0, '0.00', 0, '80.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:25:07', 'ChriX'),
(42, 'Emp. Carne Frita (x1)', '1carne', '', 1, 1, 0, '0.00', 0, '100.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:07:06', 'ChriX'),
(43, 'Emp. Carne al Horno (x6)', 'Hcarne', '', 1, 1, 0, '0.00', 0, '730.00', 0, '', 1, 'precio de media doc', 0, 0, 1, '2022-07-23 01:39:29', 'ChriX'),
(44, 'Emp. Jamon y queso al Horno(x6)', 'hjyq', '', 1, 1, 0, '0.00', 0, '630.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:39:18', 'ChriX'),
(45, 'Emp. Carne al Horno (x12)', '12empcarne', '', 1, 1, 0, '0.00', 0, '1200.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:16:09', 'ChriX'),
(46, 'Emp. Jamon y queso Frita (x12)', '12empjyqf', '', 1, 1, 0, '0.00', 0, '800.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:25:23', 'ChriX'),
(47, 'Emp. Jamon y queso Frita (x6)', '6empjyqf', '', 1, 1, 0, '0.00', 0, '430.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:20:56', 'ChriX'),
(48, 'Emp. Carne Frita (x6)', '6empcarnef', '', 1, 1, 0, '0.00', 0, '530.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:22:06', 'ChriX'),
(49, 'Emp. Carne Frita (x12)', '12empcarnf', '', 1, 1, 0, '0.00', 0, '1000.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:24:19', 'ChriX'),
(50, 'Emp. Jamon y queso al horno (x12)', '12empjyqh', '', 1, 1, 0, '0.00', 0, '1000.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:27:31', 'ChriX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `section_id` int(2) NOT NULL,
  `section_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `section_active` tinyint(1) NOT NULL DEFAULT 1,
  `section_nro_prod` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELACIONES PARA LA TABLA `sections`:
--

--
-- Volcado de datos para la tabla `sections`
--

INSERT INTO `sections` (`section_id`, `section_name`, `section_active`, `section_nro_prod`) VALUES
(1, 'Roticeria', 1, 44),
(2, 'Bebidas', 1, 6),
(3, 'Precocidos', 1, 0),
(5, 'Especias', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `user_alias` varchar(20) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_last_name` varchar(30) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_level` int(2) NOT NULL,
  `user_status` int(1) NOT NULL DEFAULT 0,
  `user_createAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `users`:
--

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `user_alias`, `user_name`, `user_last_name`, `user_email`, `user_password`, `user_level`, `user_status`, `user_createAt`) VALUES
(4, 'usuario1', 'usuario1', 'UNO', 'usuario1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '0000-00-00 00:00:00'),
(5, 'usuario2', 'usuario2', 'DOS', 'usuario2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 0, '0000-00-00 00:00:00'),
(6, 'usuario3', 'usuario3', 'TRES', 'usuario3@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_tokens`
--

DROP TABLE IF EXISTS `users_tokens`;
CREATE TABLE `users_tokens` (
  `token_id` int(12) NOT NULL,
  `token_userId` int(3) NOT NULL,
  `token` varchar(45) NOT NULL,
  `token_status` int(1) NOT NULL DEFAULT 1,
  `token_createAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `users_tokens`:
--

--
-- Volcado de datos para la tabla `users_tokens`
--

INSERT INTO `users_tokens` (`token_id`, `token_userId`, `token`, `token_status`, `token_createAt`) VALUES
(1, 4, 'fa1f28ec97ae8ce68cc2ce9891a86272', 1, '2022-08-24 08:04:19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apikeys`
--
ALTER TABLE `apikeys`
  ADD PRIMARY KEY (`apikey_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorie_id`),
  ADD UNIQUE KEY `nombre` (`categorie_name`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`),
  ADD UNIQUE KEY `prod_short_name` (`prod_short_name`),
  ADD UNIQUE KEY `prod_name` (`prod_name`);

--
-- Indices de la tabla `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`),
  ADD UNIQUE KEY `nombre` (`section_name`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_alias` (`user_alias`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- Indices de la tabla `users_tokens`
--
ALTER TABLE `users_tokens`
  ADD PRIMARY KEY (`token_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apikeys`
--
ALTER TABLE `apikeys`
  MODIFY `apikey_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `categorie_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users_tokens`
--
ALTER TABLE `users_tokens`
  MODIFY `token_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
