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
  `prod_img` varchar(255) DEFAULT NULL,
  `prod_name` varchar(100) NOT NULL,
  `prod_short_name` varchar(15) NOT NULL,
  `prod_description` varchar(255) NOT NULL,
  `prod_section` int(2) NOT NULL DEFAULT 0,
  `prod_categ` int(2) NOT NULL,
  `prod_unid` int(2) DEFAULT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `prod_fraction` int(1) NOT NULL DEFAULT 0 COMMENT 'Si el producto se vende en fracciones valor es 1',
  `prod_fractionDetails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Matriz Asociativa ("clave": "valor"), donde debe indicarse en CLAVE la fracción del producto, y en valor el precio de esa fracción. Por ejemplo un producto Empanadas, que se venden por docena, debe asignar la unidad de producto en la misma unidad de medida que la que utilizara en las fracciones, ej. 12u; las fracciones irían de la siguiente forma:\r\n( \r\n"6":"600.00",\r\n"1":"100.00"\r\n)' CHECK (json_valid(`prod_fractionDetails`)),
  `prod_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `prod_cost_import` tinyint(1) NOT NULL DEFAULT 0,
  `prod_price_neg` tinyint(1) NOT NULL DEFAULT 0,
  `prod_inventary` text DEFAULT NULL,
  `prod_inventary_infinite` tinyint(1) DEFAULT 0,
  `prod_tax_in_price` tinyint(1) NOT NULL DEFAULT 0,
  `prod_branch` int(4) NOT NULL DEFAULT 1,
  `prod_active` tinyint(1) NOT NULL DEFAULT 1,
  `prod_update` timestamp NOT NULL DEFAULT current_timestamp(),
  `prod_update_user` varchar(14) NOT NULL COMMENT 'aid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`prod_id`, `prod_img`, `prod_name`, `prod_short_name`, `prod_description`, `prod_section`, `prod_categ`, `prod_unid`, `prod_price`, `prod_fraction`, `prod_fractionDetails`, `prod_cost`, `prod_cost_import`, `prod_price_neg`, `prod_inventary`, `prod_inventary_infinite`, `prod_tax_in_price`, `prod_branch`, `prod_active`, `prod_update`, `prod_update_user`) VALUES
(1, '', 'Pizza Muzarella', 'Muza', 'Salsa, Queso Muzzarella, Aceitunas', 1, 1, 0, '750.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:53:59', 'ChriX'),
(2, '', 'Pizza Especial', 'Especial', 'Salsa, Queso Muzzarella, Jamón, Morrones, Aceitunas', 1, 1, 0, '900.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:52:51', 'ChriX'),
(3, '', 'Pizza Napolitana', 'Napo', 'Salsa, Queso Muzzarella, Ajo, Tomates, Aceitunas', 1, 1, 0, '800.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:54:12', 'ChriX'),
(4, '', 'Pizza Jamón con Huevo', 'JAMON', '', 1, 1, 0, '950.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:53:08', 'ChriX'),
(5, '', 'Pizza Calabresa', 'Calabresa', 'Salsa, Queso Muzzarella, Longaniza Calabresa, Aceitunas', 1, 1, 0, '950.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:47:55', 'ChriX'),
(6, '', 'Pizza Jamón con morrones', 'JcMorron', 'Salsa, Queso Muzzarella, Jamón, Morrones, Aceitunas', 1, 1, 0, '1000.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:53:32', 'ChriX'),
(7, '', 'Pizza 4 Quesos', '4queso', 'Salsa, Queso Muzzarella, Queso Tybo, Queso Sardo, Queso Roquefort', 1, 1, 0, '1000.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:51:56', 'ChriX'),
(8, '', 'Hamburguesa Común', 'hacomun', '', 1, 2, 0, '300.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:46:05', 'ChriX'),
(9, '', 'Hamburguesa Simple con Fritas', 'HACOfrita', 'Hamburguesa Común con Fritas', 1, 1, 0, '350.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:46:21', 'ChriX'),
(10, '', 'Hamburguesa Especial', 'HAESP', '', 1, 2, 0, '400.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:46:53', 'ChriX'),
(11, '', 'Hamburguesa Completa', 'haespfri', 'Hamburguesa Especial con Fritas', 1, 2, 0, '450.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:46:32', 'ChriX'),
(12, '', 'Hamburguesa Especial Doble Carne', 'Doblenecar', '', 1, 1, 0, '850.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:47:06', 'ChriX'),
(13, '', 'Sandw. Pollo Común', 'SPComun', '', 1, 3, 0, '425.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-08-10 05:28:41', 'ChriX'),
(14, '', 'Sandwich Pollo Simple', 'SPCcF', 'Sandwich de Pollo Común con Fritas', 1, 3, 0, '450.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-08-10 05:28:02', 'ChriX'),
(15, '', 'Sandwich Pollo Especial', 'PolloEspe', '', 1, 3, 0, '475.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-08-10 05:29:33', 'ChriX'),
(16, '', 'Sandwich Pollo Completo', 'SPCompleto', 'Sandwich de Pollo Especial con Fritas', 1, 3, 0, '500.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-08-10 05:25:35', 'ChriX'),
(17, '', 'Sandw. Carne Común', 'carnecomun', '', 1, 4, 0, '400.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-15 10:48:42', 'ChriX'),
(18, '', 'Sandw. Carne Simple', 'carnesimpl', 'Sandwich de Carne Común con Fritas', 1, 4, 0, '420.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-15 10:49:04', 'ChriX'),
(19, '', 'Sandw. Carne Especial', 'CarneEspec', '', 1, 4, 0, '450.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-15 10:49:48', 'ChriX'),
(20, '', 'Sandw. Carne Completo', 'CarneCompl', 'Sandwich de Carne Especial con Fritas', 1, 4, 0, '650.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-08-10 05:49:43', 'ChriX'),
(21, '', 'Sandw. Lomo Común', 'lomoComun', '', 1, 5, 0, '450.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-15 10:51:56', 'ChriX'),
(22, '', 'Sandw. Lomo Simple', 'LomoSimple', 'Sandwich de Lomo Común con Fritas', 1, 5, 0, '470.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-15 10:52:57', 'ChriX'),
(23, '', 'Sandw. Lomo Especial', 'LomoEspeci', '', 1, 5, 0, '500.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-15 10:53:17', 'ChriX'),
(24, '', 'Sandw. Lomo Completo', 'LomoComple', 'Sandwich de Lomo Especial con Fritas', 1, 5, 0, '520.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-15 10:53:37', 'ChriX'),
(25, '', 'Triple de Lomo', 'trlomo', '', 1, 6, 0, '1000.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:54:55', 'ChriX'),
(26, '', 'Triple de Lomo Gratinado', 'LomoGratin', '', 1, 6, 0, '1200.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:54:44', 'ChriX'),
(27, '', 'Triple de Verduras', 'trverdu', '', 1, 6, 0, '550.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:54:31', 'ChriX'),
(28, '', 'Tostado', 'Tostado', '', 1, 7, 0, '400.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:55:11', 'ChriX'),
(29, '', 'Fritas (Chica)', 'FritaChica', '', 1, 8, 0, '300.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:39:45', 'ChriX'),
(30, '', 'Fritas (Grande)', 'FritaGrand', '', 1, 8, 0, '400.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:40:01', 'ChriX'),
(31, '', 'Fritas (XXL)', 'FritaExtra', '', 1, 8, 0, '580.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 04:40:13', 'ChriX'),
(32, '', 'Emp. Jamon y queso al Horno (x12)', '12empjyqh', '', 1, 9, 0, '1000.00', 1, '{\"6\":\"500.00\",\r\n\"1\":\"200.00\"\r\n}', '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 06:27:31', 'ChriX'),
(33, '', 'Emp. Carne al Horno (x12)', '12empcarne', '', 1, 9, 0, '1200.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 06:16:09', 'ChriX'),
(34, '', 'Emp. Jamon y queso Frita (x12)', '12empjyqf', '', 1, 9, 0, '800.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 06:25:23', 'ChriX'),
(35, '', 'Emp. Carne Frita (x12)', '12empcarnf', '', 1, 9, 0, '1000.00', 0, NULL, '0.00', 0, 0, '', 1, 0, 0, 1, '2022-07-23 06:24:19', 'ChriX');

  (36, 'Fritas Gratinada (Chica)', 'gratinchic', '', 1, 8, 0, '0.00', 0, '420.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:40:25', 'ChriX'),
  (37, 'Fritas Gratinadas (Grande)', 'gratinGran', '', 1, 8, 0, '0.00', 0, '550.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:41:13', 'ChriX'),
  (38, 'Fritas Gratinadas (XXL)', 'GratinaExt', '', 1, 8, 0, '0.00', 0, '750.00', 0, '', 1, '', 0, 0, 1, '2022-07-23 01:42:08', 'ChriX'),

(39, 'G. Cabalgata Naranja', 'CaNaran', 'gaseosa_cabalgata_naranja_150x150.png', 2, 2, 0, '90.00', 0, '120.00', 0, '7', 0, 'Gaseosa Sabor NARANJA', 0, 0, 1, '2021-08-20 00:02:45', 'ChriX'),
(40, 'G. Cabalgata Limonada', 'CaLimo', 'gaseosa_cabalgata_LLimon_150x150.png', 2, 2, 0, '90.00', 0, '120.00', 0, '0', 0, '', 0, 0, 1, '2021-08-20 00:02:57', 'ChriX'),
(41, 'G. Coca-Cola 1.,5Lts (Retornable)', 'coca', 'gaseosa_cocacola_1.5l_150x150.png', 2, 2, 0, '106.00', 0, '140.00', 0, '3', 0, '', 0, 0, 1, '2021-08-20 00:02:22', 'ChriX'),
(42, 'G. Sprite 2 Lts (Retornable)', 'sprite', 'gaseosa_sprite_2l_150x150.png', 2, 2, 0, '100.00', 0, '140.00', 0, '3', 0, '', 0, 0, 1, '2021-08-20 00:01:29', 'ChriX'),
(43, 'G. Fanta 2 Lts (Retornable)', 'Fanta', 'gaseosa_fanta_2l_150x150.png', 2, 2, 0, '100.00', 0, '140.00', 0, '4', 0, '', 0, 0, 1, '2021-08-20 00:01:57', 'ChriX'),
(44, 'Vino Balbo', 'Balbo', 'vino_balbo_tinto_150x150.png', 2, 2, 0, '165.00', 0, '220.00', 0, '10', 0, '', 0, 0, 1, '2021-08-20 00:01:02', 'ChriX'),

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
  MODIFY `prod_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
