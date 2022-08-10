-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-08-2022 a las 20:48:15
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `divergiro2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adicional`
--

CREATE TABLE `adicional` (
  `id_adicional` int(11) NOT NULL,
  `nombre_adicional` varchar(30) DEFAULT NULL,
  `precio_adicional` int(11) DEFAULT NULL,
  `imagen` varchar(70) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `adicional`
--

INSERT INTO `adicional` (`id_adicional`, `nombre_adicional`, `precio_adicional`, `imagen`, `descripcion`) VALUES
(1, 'Video profesional', 200, 'https://i.imgur.com/NZCxJvE.png', '¡Llevate una filmación profecional de todos los detalles de tu evento!'),
(2, 'Dibujo Gigante', 60, 'https://i.imgur.com/AjbMffD.png', '¡Dibujo en tamaño real de tu personajes favorito!'),
(3, 'Video invitación', 30, 'https://i.imgur.com/sayH4LS.png', '¡Enviale a tus invitados una increible invitación para este divertidísimo evento!'),
(4, 'Foto profesional', 100, 'https://i.imgur.com/pIykfPn.png', '¡Llenate de recuerdos con fotografias profesionales de tu evento!');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adicional_boleta`
--

CREATE TABLE `adicional_boleta` (
  `id_adicional_boleta` int(11) NOT NULL,
  `id_adicional` int(11) NOT NULL,
  `id_boleta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `adicional_boleta`
--

INSERT INTO `adicional_boleta` (`id_adicional_boleta`, `id_adicional`, `id_boleta`) VALUES
(25, 1, 22),
(26, 3, 22),
(27, 2, 23),
(28, 4, 23),
(29, 1, 24),
(30, 2, 24),
(31, 3, 24),
(32, 1, 25),
(33, 2, 25),
(34, 2, 26),
(35, 3, 26),
(36, 2, 27),
(37, 3, 27),
(38, 1, 28),
(39, 2, 28),
(40, 1, 29),
(41, 2, 29),
(42, 4, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `id_boleta` int(11) NOT NULL,
  `neto` varchar(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `observaciones` varchar(300) DEFAULT NULL,
  `direccion_evento` varchar(40) NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `fecha_evento` date NOT NULL,
  `fecha_creacion` date NOT NULL,
  `tiempo_total` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `boleta`
--

INSERT INTO `boleta` (`id_boleta`, `neto`, `dni`, `observaciones`, `direccion_evento`, `metodo_pago`, `fecha_evento`, `fecha_creacion`, `tiempo_total`) VALUES
(22, '400', 12345678, 'Es casa pequeña.', 'Calle las Palomas 467', 'Efectivo', '2022-03-24', '2022-02-02', '45'),
(23, '400', 72971718, 'NO LLEGUEN TARDE', 'Urb. Procion Mz. A Lt. 8, Casa', 'POS', '2022-02-23', '2022-02-02', '45'),
(24, '800', 98765432, 'Es una casa pequeña.', 'Calle Los Proceres 265', 'Efectivo', '2022-02-10', '2022-02-03', '90'),
(25, '660', 72971718, '', 'Urb. Procion Mz. A Lt. 8, Casa', 'POS', '2022-02-15', '2022-02-03', '45'),
(26, '990', 72971718, '', 'Urb. Procion Mz. A Lt. 8, Casa', 'Efectivo', '2022-02-18', '2022-02-03', '120'),
(27, '1540', 12345678, '', 'Urb. Procion Mz. A Lt. 8, Casa', 'Efectivo', '2022-02-24', '2022-02-03', '210'),
(28, '1160', 98765432, 'ejemplo', 'ejemplo', 'debito', '2022-08-08', '2022-08-08', '120'),
(29, '660', 98765432, 'sas', 'asa', 'assa', '2022-08-08', '2022-08-08', '45'),
(30, '1300', 12345678, 'ninguna.', 'Calle las Palomas 467', 'Efectivo', '2022-08-17', '2022-08-08', '165');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `contrasena` varchar(30) NOT NULL,
  `dni` int(11) NOT NULL,
  `rol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`contrasena`, `dni`, `rol`) VALUES
('1234', 12345678, 'CLIENTE'),
('jean', 42042042, 'CLIENTE'),
('1234', 65267501, 'CLIENTE'),
('admin', 72971718, 'ADMIN'),
('1234', 98765432, 'CLIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  `tiempo` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `Banner_img` varchar(200) NOT NULL,
  `Portada_img` varchar(80) NOT NULL,
  `categoria` varchar(40) NOT NULL,
  `incluye` varchar(250) NOT NULL,
  `logo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `nombre`, `precio`, `tiempo`, `descripcion`, `Banner_img`, `Portada_img`, `categoria`, `incluye`, `logo`) VALUES
(1, 'Diver-Magiaa', 400, 45, 'Vive una aventura junto a DiverGiro, en donde verás hechizos que ningún otro mago ha realizado antes.', 'https://i.imgur.com/P1Zwkfo.jpg', 'https://i.imgur.com/PjN32Ix.jpg', 'servicio', '<ul><li> MAGIA CÓMICA</li><li>MAGIA MUSICALIZADA</li><li>DIVER DISFRAZ PARA EL CUMPLEAÑER@ </li></ul>', 'https://i.imgur.com/HjHRRYI.png'),
(2, 'Diver-Ciencia', 400, 45, 'Descubre la Diver-Ciencia y diviértete aprendiendo cosas que no verás en nungún otro lugar. Además de realizar un Diver-Experimento en tus propias manos.', 'https://i.imgur.com/CbvQjQG.jpg', 'https://i.imgur.com/p5FoV4K.jpg', 'servicio', '<ul><li>REACCIONES QUIMICAS</li><li>¡LEVITACIÓN CIENTÍFICA!</li><li>VORTICES DE HUMO</li></ul>', 'https://i.imgur.com/qpmdC1I.png'),
(3, 'Diver-Titeres', 400, 45, 'No hay mejores amigos que los Diver-Tíeres. Junto a ellos vivirás aventuras jamás vistas y aprenderás lo importante que es el valor de la amistad y la honestidad.', 'https://i.imgur.com/rbffUNZ.jpg', 'https://i.imgur.com/0f3PrEF.jpg', 'servicio', '', 'https://i.imgur.com/kkJIGii.png'),
(4, 'Diver-Burbujas', 400, 45, 'Vive una nueva forma de jugar junto a DiverGiro, en donde explotaremos las mejores Diver-Burbujas junto a ti y todos tus amigos.', 'https://i.imgur.com/2ZwSEQW.jpg', 'https://i.imgur.com/4juoL1u.jpg', 'servicio', '<ul><li>BURBUJAS DE HUMO</li><li>BANDEROLAS GIGANTES</li><li>¡CAPSULA DE BURBUJA PARA EL CUMPLEAÑERO!</li></ul>', 'https://i.imgur.com/Ptuuxqm.png'),
(5, 'Diver-Promocion-1', 800, 120, '¡ Sumale una Diver-Animadora a tu Diver evento !', 'https://i.imgur.com/ojLWEfQ.png', 'https://i.imgur.com/ojLWEfQ.png', 'promocion', '<ul><li>2 Diver-Show a elección</li><li>Diver-Animadora</li></ul>', 'https://i.imgur.com/idKVe8O.png'),
(6, 'Diver-Promocion-2', 550, 90, '¡ Súmale una Diver-Animadora a tus Diver eventos !', 'https://i.imgur.com/ojLWEfQ.png', 'https://i.imgur.com/ojLWEfQ.png', 'promocion', '<ul><li>1 Diver-Show a elección</li><li>1 Diver-Animadora</li></ul>', 'https://i.imgur.com/idKVe8O.png'),
(7, 'Diver-Fiesta-Princesas', 900, 120, 'Los poderes de Divergiro son cada vez más fuertes, los portales cada vez más estables y más personajes se nos unen.', 'https://i.imgur.com/egQzrSu.png', 'https://i.imgur.com/egQzrSu.png', 'promocion', '<ul><li>1 Diver-Show (Magia o Ciencia)</li><li>Princesa favorita y 2 personajes a elección </li><li>Micro obra musicalizada</li></ul>', 'https://i.imgur.com/idKVe8O.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_boleta`
--

CREATE TABLE `servicio_boleta` (
  `id_servicio_boleta` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_boleta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicio_boleta`
--

INSERT INTO `servicio_boleta` (`id_servicio_boleta`, `id_servicio`, `id_boleta`) VALUES
(16, 1, 22),
(17, 2, 23),
(18, 2, 24),
(19, 4, 24),
(20, 2, 25),
(21, 7, 26),
(22, 7, 27),
(23, 6, 27),
(24, 7, 28),
(25, 1, 29),
(26, 5, 30),
(27, 2, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `dni` int(11) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `celular` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`dni`, `nombres`, `apellidos`, `email`, `celular`) VALUES
(12345678, 'Jose', 'Sanchez', 'msanchez@gmail.com', 987654321),
(42042042, 'jean', 'santi', 'hola@gmail.com', 912345678),
(65267501, 'Marcos', 'Sanchez Ramirez', 'msanchez@gmail.com', 902650075),
(72971718, 'Jean Paul', 'Santivañez Moreno', 'santivanezjeanpaull@gmail.com', 977648575),
(98765432, 'David', 'Zamora Ayamamani', 'dzamora@gmail.com', 987654328);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adicional`
--
ALTER TABLE `adicional`
  ADD PRIMARY KEY (`id_adicional`);

--
-- Indices de la tabla `adicional_boleta`
--
ALTER TABLE `adicional_boleta`
  ADD PRIMARY KEY (`id_adicional_boleta`),
  ADD KEY `id_adicional` (`id_adicional`),
  ADD KEY `id_boleta` (`id_boleta`);

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`id_boleta`),
  ADD KEY `dni` (`dni`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `servicio_boleta`
--
ALTER TABLE `servicio_boleta`
  ADD PRIMARY KEY (`id_servicio_boleta`),
  ADD KEY `id_boleta` (`id_boleta`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adicional`
--
ALTER TABLE `adicional`
  MODIFY `id_adicional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `adicional_boleta`
--
ALTER TABLE `adicional_boleta`
  MODIFY `id_adicional_boleta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `boleta`
--
ALTER TABLE `boleta`
  MODIFY `id_boleta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `servicio_boleta`
--
ALTER TABLE `servicio_boleta`
  MODIFY `id_servicio_boleta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adicional_boleta`
--
ALTER TABLE `adicional_boleta`
  ADD CONSTRAINT `adicional_boleta_ibfk_1` FOREIGN KEY (`id_adicional`) REFERENCES `adicional` (`id_adicional`),
  ADD CONSTRAINT `adicional_boleta_ibfk_2` FOREIGN KEY (`id_boleta`) REFERENCES `boleta` (`id_boleta`);

--
-- Filtros para la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD CONSTRAINT `boleta_ibfk_2` FOREIGN KEY (`dni`) REFERENCES `usuario` (`dni`);

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `usuario` (`dni`);

--
-- Filtros para la tabla `servicio_boleta`
--
ALTER TABLE `servicio_boleta`
  ADD CONSTRAINT `servicio_boleta_ibfk_1` FOREIGN KEY (`id_boleta`) REFERENCES `boleta` (`id_boleta`),
  ADD CONSTRAINT `servicio_boleta_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
