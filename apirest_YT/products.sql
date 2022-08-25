-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-08-2022 a las 13:57:26
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


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
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`prod_id`, `prod_name`, `prod_short_name`, `prod_img`, `prod_section`, `prod_categ`, `prod_unid`, `prod_cost`, `prod_cost_import`, `prod_price`, `prod_price_neg`, `prod_inventary`, `prod_inventary_infinite`, `prod_description`, `prod_branch`, `prod_tax_in_price`, `prod_active`, `prod_update`, `prod_update_user`) VALUES
(1, 'Pizza Muzarella', 'Muza', '', 1, 1, 0, '0.00', 0, '750.00', 0, '', 1, 'Salsa, Queso Muzzarella, Aceitunas', 0, 0, 1, '2022-07-23 01:53:59', 'ChriX'),
(2, 'Pizza Especial', 'Especial', '', 1, 1, 0, '0.00', 0, '900.00', 0, '', 1, 'Salsa, Queso Muzzarella, Jamón, Morrones, Aceitunas', 0, 0, 1, '2022-07-23 01:52:51', 'ChriX'),
(3, 'Pizza Napolitana', 'Napo', '', 1, 1, 0, '0.00', 0, '800.00', 0, '', 1, 'Salsa, Queso Muzzarella, Ajo, Tomates, Aceitunas', 0, 0, 1, '2022-07-23 01:54:12', 'ChriX'),
(4, 'Pizza Jamón con Huevo', 'JAMON', '', 1, 1, 0, '0.00', 0, '950.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:53:08', 'ChriX'),
(5, 'Pizza Calabresa', 'Calabresa', '', 1, 1, 0, '0.00', 0, '950.00', 0, '', 1, 'Salsa, Queso Muzzarella, Longaniza Calabresa, Aceitunas', 0, 0, 1, '2022-07-23 01:47:55', 'ChriX'),
(6, 'Pizza Jamón con morrones', 'JcMorron', '', 1, 1, 0, '0.00', 0, '1000.00', 0, '', 1, 'Salsa, Queso Muzzarella, Jamón, Morrones, Aceitunas', 0, 0, 1, '2022-07-23 01:53:32', 'ChriX'),
(7, 'Pizza 4 Quesos', '4queso', '', 1, 1, 0, '0.00', 0, '1000.00', 0, '', 1, 'Salsa, Queso Muzzarella, Queso Tybo, Queso Sardo, Queso Roquefort', 0, 0, 1, '2022-07-23 01:51:56', 'ChriX'),
(8, 'Hamburguesa Común', 'hacomun', '', 1, 2, 0, '0.00', 0, '300.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:46:05', 'ChriX'),
(9, 'Hamburguesa Simple con Fritas', 'HACOfrita', '', 1, 1, 0, '0.00', 0, '350.00', 0, '', 1, 'Hamburguesa Común con Fritas', 0, 0, 1, '2022-07-23 01:46:21', 'ChriX'),
(10, 'Hamburguesa Especial', 'HAESP', '', 1, 2, 0, '0.00', 0, '400.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:46:53', 'ChriX'),
(11, 'Hamburguesa Completa', 'haespfri', '', 1, 2, 0, '0.00', 0, '450.00', 0, '', 1, 'Hamburguesa Especial con Fritas', 0, 0, 1, '2022-07-23 01:46:32', 'ChriX'),
(12, 'Sandw. Pollo Común', 'SPComun', '', 1, 3, 0, '0.00', 0, '425.00', 0, '', 1, '', 0, 0, 1, '2022-08-10 02:28:41', 'ChriX'),
(13, 'Sandwich Pollo Simple', 'SPCcF', '', 1, 3, 0, '0.00', 0, '450.00', 0, '', 1, 'Sandwich de Pollo Común con Fritas', 0, 0, 1, '2022-08-10 02:28:02', 'ChriX'),
(14, 'Sandwich Pollo Especial', 'PolloEspe', '', 1, 3, 0, '0.00', 0, '475.00', 0, '', 1, '', 0, 0, 1, '2022-08-10 02:29:33', 'ChriX'),
(15, 'Sandwich Pollo Completo', 'SPCompleto', '', 1, 3, 0, '0.00', 0, '500.00', 0, '', 1, 'Sandwich de Pollo Especial con Fritas', 0, 0, 1, '2022-08-10 02:25:35', 'ChriX'),
(16, 'Sandw. Carne Común', 'carnecomun', '', 1, 4, 0, '0.00', 0, '400.00', 0, '', 1, '', 0, 0, 1, '2022-07-15 07:48:42', 'ChriX'),
(17, 'Sandw. Carne Simple', 'carnesimpl', '', 1, 4, 0, '0.00', 0, '420.00', 0, '', 1, 'Sandwich de Carne Común con Fritas', 0, 0, 1, '2022-07-15 07:49:04', 'ChriX'),
(18, 'Sandw. Carne Especial', 'CarneEspec', '', 1, 4, 0, '0.00', 0, '450.00', 0, '', 1, '', 0, 0, 1, '2022-07-15 07:49:48', 'ChriX'),
(19, 'Sandw. Carne Completo', 'CarneCompl', '', 1, 4, 0, '0.00', 0, '650.00', 0, '', 1, 'Sandwich de Carne Especial con Fritas', 0, 0, 1, '2022-08-10 02:49:43', 'ChriX'),
(20, 'Sandw. Lomo Común', 'lomoComun', '', 1, 5, 0, '0.00', 0, '450.00', 0, '', 1, '', 0, 0, 1, '2022-07-15 07:51:56', 'ChriX'),
(21, 'Sandw. Lomo Simple', 'LomoSimple', '', 1, 5, 0, '0.00', 0, '470.00', 0, '', 1, 'Sandwich de Lomo Común con Fritas', 0, 0, 1, '2022-07-15 07:52:57', 'ChriX'),
(22, 'Sandw. Lomo Especial', 'LomoEspeci', '', 1, 5, 0, '0.00', 0, '500.00', 0, '', 1, '', 0, 0, 1, '2022-07-15 07:53:17', 'ChriX'),
(23, 'Sandw. Lomo Completo', 'LomoComple', '', 1, 5, 0, '0.00', 0, '520.00', 0, '', 1, 'Sandwich de Lomo Especial con Fritas', 0, 0, 1, '2022-07-15 07:53:37', 'ChriX'),
(24, 'Triple de Lomo', 'trlomo', '', 1, 6, 0, '0.00', 0, '1000.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:54:55', 'ChriX'),
(25, 'Triple de Lomo Gratinado', 'LomoGratin', '', 1, 6, 0, '0.00', 0, '1200.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:54:44', 'ChriX'),
(26, 'Triple de Verduras', 'trverdu', '', 1, 6, 0, '0.00', 0, '550.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:54:31', 'ChriX'),
(27, 'Tostado', 'Tostado', '', 1, 7, 0, '0.00', 0, '400.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:55:11', 'ChriX'),
(28, 'Fritas (Chica)', 'FritaChica', '', 1, 8, 0, '0.00', 0, '300.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:39:45', 'ChriX'),
(29, 'Fritas (Grande)', 'FritaGrand', '', 1, 8, 0, '0.00', 0, '400.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:40:01', 'ChriX'),
(30, 'Fritas (XXL)', 'FritaExtra', '', 1, 8, 0, '0.00', 0, '580.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:40:13', 'ChriX'),
(31, 'Fritas Gratinada (Chica)', 'gratinchic', '', 1, 8, 0, '0.00', 0, '420.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:40:25', 'ChriX'),
(32, 'Fritas Gratinadas (Grande)', 'gratinGran', '', 1, 8, 0, '0.00', 0, '550.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:41:13', 'ChriX'),
(33, 'Fritas Gratinadas (XXL)', 'GratinaExt', '', 1, 8, 0, '0.00', 0, '750.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:42:08', 'ChriX'),

(50, 'Emp. Jamon y queso al horno (x12)', '12empjyqh', '', 1, 9, 0, '0.00', 0, '1000.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:27:31', 'ChriX');
(46, 'Emp. Jamon y queso Frita (x12)', '12empjyqf', '', 1, 9, 0, '0.00', 0, '800.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:25:23', 'ChriX'),

(41, 'Emp. Jamon y queso Frita (x1)', '1Jyq', '', 1, 1, 0, '0.00', 0, '80.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:25:07', 'ChriX'),
(42, 'Emp. Carne Frita (x1)', '1carne', '', 1, 1, 0, '0.00', 0, '100.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:07:06', 'ChriX'),
(43, 'Emp. Carne al Horno (x6)', 'Hcarne', '', 1, 1, 0, '0.00', 0, '730.00', 0, '', 1, 'precio de media doc', 0, 0, 1, '2022-07-23 01:39:29', 'ChriX'),
(44, 'Emp. Jamon y queso al Horno(x6)', 'hjyq', '', 1, 1, 0, '0.00', 0, '630.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:39:18', 'ChriX'),
(45, 'Emp. Carne al Horno (x12)', '12empcarne', '', 1, 1, 0, '0.00', 0, '1200.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:16:09', 'ChriX'),
(47, 'Emp. Jamon y queso Frita (x6)', '6empjyqf', '', 1, 1, 0, '0.00', 0, '430.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:20:56', 'ChriX'),
(48, 'Emp. Carne Frita (x6)', '6empcarnef', '', 1, 1, 0, '0.00', 0, '530.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:22:06', 'ChriX'),
(49, 'Emp. Carne Frita (x12)', '12empcarnf', '', 1, 1, 0, '0.00', 0, '1000.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 03:24:19', 'ChriX'),
(14, 'Hamburguesa Especial Doble Carne', 'Doblenecar', '', 1, 1, 0, '0.00', 0, '850.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:47:06', 'ChriX'),

(5, 'G. Cabalgata Naranja', 'CaNaran', 'gaseosa_cabalgata_naranja_150x150.png', 2, 2, 0, '90.00', 0, '120.00', 0, '7', 0, 'Gaseosa Sabor NARANJA', 0, 0, 1, '2021-08-20 00:02:45', 'ChriX'),
(6, 'G. Cabalgata Limonada', 'CaLimo', 'gaseosa_cabalgata_LLimon_150x150.png', 2, 2, 0, '90.00', 0, '120.00', 0, '0', 0, '', 0, 0, 1, '2021-08-20 00:02:57', 'ChriX'),
(32, 'G. Coca-Cola 1.,5Lts (Retornable)', 'coca', 'gaseosa_cocacola_1.5l_150x150.png', 2, 2, 0, '106.00', 0, '140.00', 0, '3', 0, '', 0, 0, 1, '2021-08-20 00:02:22', 'ChriX'),
(33, 'G. Sprite 2 Lts (Retornable)', 'sprite', 'gaseosa_sprite_2l_150x150.png', 2, 2, 0, '100.00', 0, '140.00', 0, '3', 0, '', 0, 0, 1, '2021-08-20 00:01:29', 'ChriX'),
(34, 'G. Fanta 2 Lts (Retornable)', 'Fanta', 'gaseosa_fanta_2l_150x150.png', 2, 2, 0, '100.00', 0, '140.00', 0, '4', 0, '', 0, 0, 1, '2021-08-20 00:01:57', 'ChriX'),
(31, 'Vino Balbo', 'Balbo', 'vino_balbo_tinto_150x150.png', 2, 2, 0, '165.00', 0, '220.00', 0, '10', 0, '', 0, 0, 1, '2021-08-20 00:01:02', 'ChriX'),

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`),
  ADD UNIQUE KEY `prod_short_name` (`prod_short_name`),
  ADD UNIQUE KEY `prod_name` (`prod_name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
