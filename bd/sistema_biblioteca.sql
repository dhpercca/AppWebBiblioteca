-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-01-2021 a las 18:40:18
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `idautor` int(11) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`idautor`, `descripcion`) VALUES
(1, 'Ricardo Palma'),
(2, 'Jose Maria Arguedas'),
(3, 'cesar vallejo'),
(4, 'Pablo Neruda'),
(5, 'Mario Vargas Llosa'),
(17, 'leonardo da vinci'),
(18, 'Maria Rosas Pilar'),
(19, 'Gabriel García Márquez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `descripcion`) VALUES
(1, 'drama'),
(2, 'romance'),
(3, 'terror'),
(4, 'novela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_usuario`
--

CREATE TABLE `detalle_usuario` (
  `iddetalle_usuario` int(11) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `curso` varchar(25) DEFAULT NULL,
  `persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `ideditorial` int(11) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`ideditorial`, `descripcion`) VALUES
(1, 'Words'),
(2, 'Acerba'),
(3, 'Leendo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplar_libro`
--

CREATE TABLE `ejemplar_libro` (
  `idejemplar_libro` int(11) NOT NULL,
  `autor` int(11) NOT NULL,
  `editorial` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `titulo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ejemplar_libro`
--

INSERT INTO `ejemplar_libro` (`idejemplar_libro`, `autor`, `editorial`, `categoria`, `descripcion`, `titulo`) VALUES
(1, 1, 1, 1, 'libro nuevo', 'Tradiciones peruanas'),
(2, 2, 2, 2, 'new book', 'Mi amor a ti'),
(3, 3, 1, 1, 'poemas', 'los heraldos negros '),
(4, 5, 2, 2, 'poema', 'De vuelta a ti'),
(5, 19, 1, 4, 'Novela latinoamericana', 'Cien años de soledad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `area` varchar(25) DEFAULT NULL,
  `cargo` varchar(25) DEFAULT NULL,
  `persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_libro`
--

CREATE TABLE `estado_libro` (
  `idestado_libro` int(11) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_libro`
--

INSERT INTO `estado_libro` (`idestado_libro`, `descripcion`) VALUES
(1, 'disponible'),
(2, 'reservado'),
(3, 'solicitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `grado` varchar(10) DEFAULT NULL,
  `seccion` char(1) DEFAULT NULL,
  `nivel` varchar(30) DEFAULT NULL,
  `persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`grado`, `seccion`, `nivel`, `persona`) VALUES
('5', 'B', 'PRIMARIA', 2),
('1', 'A', 'PRIMARIA', 3),
('5', 'C', 'PRIMARIA', 4),
('4', 'B', 'PRIMARIA', 6),
('3', 'A', 'PRIMARIA', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `codlibro` int(11) NOT NULL,
  `codigo` int(11) DEFAULT NULL,
  `estado_libro` int(11) NOT NULL,
  `ejemplar_libro` int(11) NOT NULL,
  `fecha_compra` varchar(25) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`codlibro`, `codigo`, `estado_libro`, `ejemplar_libro`, `fecha_compra`, `precio`) VALUES
(1, 112111, 1, 1, '2020-08-18', '12.00'),
(2, 22222, 1, 1, '2020-08-14', '13.00'),
(3, 12412312, 1, 1, '2020-08-30', '16.50'),
(6, 90999, 1, 3, '2020-08-29', '15.20'),
(7, 10023, 1, 2, '2020-08-22', '13.50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_carnet`
--

CREATE TABLE `pago_carnet` (
  `idpago_carnet` int(11) NOT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `DNI` char(8) DEFAULT NULL,
  `nombres` varchar(25) DEFAULT NULL,
  `apellidos` varchar(25) DEFAULT NULL,
  `direccion` varchar(25) DEFAULT NULL,
  `celular` char(9) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `DNI`, `nombres`, `apellidos`, `direccion`, `celular`, `email`) VALUES
(1, '76452633', 'Roger', 'Tarqui', 'las glorietas g-18', '910099260', 'rogertarqui12@gmail.com'),
(2, '76452634', 'Lewis', 'Tarqui Salazar', 'las brisas r-12', '953956920', 'lewis12@gmail.com'),
(3, '76452633', 'Leigthon', 'Tarqui', 'las glorietas g-18', '910099260', 'rogertarqui12@gmail.com'),
(4, '12345678', 'gabriela', 'velasquez', 'nuevo ilo', '987654321', 'adjsaosdi'),
(5, '98765432', 'diego', 'percca', 'alto ilo', '123123123', 'salfjlasf'),
(6, '32452312', 'bety', 'yabar', 'santa rosa', '987654322', 'zkhfaukf'),
(7, '98765430', 'cesar', 'mendez', 'miramar', '123451234', 'sdkjfhsk');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premio`
--

CREATE TABLE `premio` (
  `idpremio` int(11) NOT NULL,
  `descripcion` varchar(25) DEFAULT NULL,
  `precio` decimal(15,2) DEFAULT NULL,
  `persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `idprestamo` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `libro` int(11) NOT NULL,
  `estado_prestamo` varchar(35) DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`idprestamo`, `usuario`, `libro`, `estado_prestamo`, `fecha_prestamo`, `fecha_entrega`) VALUES
(2, 4, 2, 'PRESTADO', '2019-01-02', '2019-01-05'),
(3, 3, 3, 'DEVUELTO', '2019-01-30', '2019-02-02'),
(4, 5, 6, 'DEVUELTO', '2019-02-20', '2019-02-23'),
(5, 5, 7, 'SOLICITADO', '2019-03-05', '2019-03-08'),
(6, 3, 7, 'DEVUELTO', '2019-03-04', '2019-03-06'),
(7, 5, 1, 'DEVUELTO', '2020-04-08', '2020-04-10'),
(8, 3, 1, 'DEVUELTO', '2019-05-02', '2019-05-05'),
(10, 3, 1, 'SOLICITADO', '2019-05-30', '2019-06-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `idtipo_usuario` int(11) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`idtipo_usuario`, `descripcion`) VALUES
(1, 'administrador'),
(2, 'bibliotecario'),
(3, 'estudiante'),
(5, 'docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `clave` varchar(15) DEFAULT NULL,
  `tipo_usuario` int(11) NOT NULL,
  `persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `usuario`, `clave`, `tipo_usuario`, `persona`) VALUES
(1, 'roger', '1234', 1, 1),
(2, 'lewis', '1234', 3, 2),
(3, 'leyton', 'leyton', 3, 3),
(4, 'gaby', 'gaby', 3, 4),
(5, 'diego', 'diego', 5, 5),
(6, 'bety', 'bety', 3, 6),
(7, 'cesar', 'cesar', 3, 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`idautor`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `detalle_usuario`
--
ALTER TABLE `detalle_usuario`
  ADD PRIMARY KEY (`iddetalle_usuario`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD KEY `persona` (`persona`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`ideditorial`);

--
-- Indices de la tabla `ejemplar_libro`
--
ALTER TABLE `ejemplar_libro`
  ADD PRIMARY KEY (`idejemplar_libro`),
  ADD KEY `autor` (`autor`),
  ADD KEY `editorial` (`editorial`),
  ADD KEY `categoria` (`categoria`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD KEY `persona` (`persona`);

--
-- Indices de la tabla `estado_libro`
--
ALTER TABLE `estado_libro`
  ADD PRIMARY KEY (`idestado_libro`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD KEY `persona` (`persona`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`codlibro`),
  ADD KEY `ejemplar_libro` (`ejemplar_libro`),
  ADD KEY `estado_libro` (`estado_libro`);

--
-- Indices de la tabla `pago_carnet`
--
ALTER TABLE `pago_carnet`
  ADD PRIMARY KEY (`idpago_carnet`),
  ADD KEY `persona` (`persona`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `premio`
--
ALTER TABLE `premio`
  ADD PRIMARY KEY (`idpremio`),
  ADD KEY `persona` (`persona`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`idprestamo`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `libro` (`libro`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`idtipo_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `tipo_usuario` (`tipo_usuario`),
  ADD KEY `persona` (`persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `idautor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_usuario`
--
ALTER TABLE `detalle_usuario`
  MODIFY `iddetalle_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `ideditorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ejemplar_libro`
--
ALTER TABLE `ejemplar_libro`
  MODIFY `idejemplar_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estado_libro`
--
ALTER TABLE `estado_libro`
  MODIFY `idestado_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `codlibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pago_carnet`
--
ALTER TABLE `pago_carnet`
  MODIFY `idpago_carnet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `premio`
--
ALTER TABLE `premio`
  MODIFY `idpremio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `idprestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `idtipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`persona`) REFERENCES `persona` (`idpersona`);

--
-- Filtros para la tabla `ejemplar_libro`
--
ALTER TABLE `ejemplar_libro`
  ADD CONSTRAINT `ejemplar_libro_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `autor` (`idautor`),
  ADD CONSTRAINT `ejemplar_libro_ibfk_2` FOREIGN KEY (`editorial`) REFERENCES `editorial` (`ideditorial`),
  ADD CONSTRAINT `ejemplar_libro_ibfk_3` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`idcategoria`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`persona`) REFERENCES `persona` (`idpersona`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`persona`) REFERENCES `persona` (`idpersona`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`ejemplar_libro`) REFERENCES `ejemplar_libro` (`idejemplar_libro`),
  ADD CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`estado_libro`) REFERENCES `estado_libro` (`idestado_libro`);

--
-- Filtros para la tabla `pago_carnet`
--
ALTER TABLE `pago_carnet`
  ADD CONSTRAINT `pago_carnet_ibfk_1` FOREIGN KEY (`persona`) REFERENCES `persona` (`idpersona`);

--
-- Filtros para la tabla `premio`
--
ALTER TABLE `premio`
  ADD CONSTRAINT `premio_ibfk_1` FOREIGN KEY (`persona`) REFERENCES `persona` (`idpersona`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`libro`) REFERENCES `libro` (`codlibro`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipo_usuario` (`idtipo_usuario`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`persona`) REFERENCES `persona` (`idpersona`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
