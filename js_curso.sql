-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2018 a las 17:56:44
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `js_curso`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `idActividades` int(11) NOT NULL,
  `actividad_1` varchar(100) NOT NULL,
  `actividad_2` varchar(100) NOT NULL,
  `editar` varchar(100) NOT NULL,
  `subir` varchar(100) NOT NULL,
  `eliminar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `idAlumnos` int(11) NOT NULL,
  `nombre__1` varchar(100) NOT NULL,
  `correo__electronico` varchar(100) NOT NULL,
  `curso_js` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bibliografia`
--

CREATE TABLE `bibliografia` (
  `idBibliografia` int(11) NOT NULL,
  `pdf` varchar(90) NOT NULL,
  `libros` varchar(90) NOT NULL,
  `articulos` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_js_`
--

CREATE TABLE `curso_js_` (
  `idcursojs_` int(11) NOT NULL,
  `idalumnos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega_actividades`
--

CREATE TABLE `entrega_actividades` (
  `idAlumnos` int(11) NOT NULL,
  `idactividades` int(11) NOT NULL,
  `hora_fecha` date NOT NULL,
  `revisar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE `examen` (
  `idPreguntas` int(11) NOT NULL,
  `Respuesta` varchar(100) NOT NULL,
  `Puntuacion` varchar(100) NOT NULL,
  `solucion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realizar__examenes`
--

CREATE TABLE `realizar__examenes` (
  `idAlumnos` int(11) NOT NULL,
  `idExamen` int(11) NOT NULL,
  `fecha_y_hora` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`idActividades`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`idAlumnos`);

--
-- Indices de la tabla `bibliografia`
--
ALTER TABLE `bibliografia`
  ADD PRIMARY KEY (`idBibliografia`);

--
-- Indices de la tabla `curso_js_`
--
ALTER TABLE `curso_js_`
  ADD KEY `idcursojs_` (`idcursojs_`),
  ADD KEY `idalumnos` (`idalumnos`);

--
-- Indices de la tabla `entrega_actividades`
--
ALTER TABLE `entrega_actividades`
  ADD KEY `idAlumnos` (`idAlumnos`),
  ADD KEY `idactividades` (`idactividades`);

--
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`idPreguntas`);

--
-- Indices de la tabla `realizar__examenes`
--
ALTER TABLE `realizar__examenes`
  ADD KEY `idAlumnos` (`idAlumnos`),
  ADD KEY `idExamen` (`idExamen`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `idActividades` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `idAlumnos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `bibliografia`
--
ALTER TABLE `bibliografia`
  MODIFY `idBibliografia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `idPreguntas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `actividades_ibfk_1` FOREIGN KEY (`idActividades`) REFERENCES `alumnos` (`idAlumnos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`idAlumnos`) REFERENCES `curso_js_` (`idalumnos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bibliografia`
--
ALTER TABLE `bibliografia`
  ADD CONSTRAINT `bibliografia_ibfk_1` FOREIGN KEY (`idBibliografia`) REFERENCES `alumnos` (`idAlumnos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entrega_actividades`
--
ALTER TABLE `entrega_actividades`
  ADD CONSTRAINT `entrega_actividades_ibfk_1` FOREIGN KEY (`idAlumnos`) REFERENCES `alumnos` (`idAlumnos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entrega_actividades_ibfk_2` FOREIGN KEY (`idactividades`) REFERENCES `actividades` (`idActividades`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `examen`
--
ALTER TABLE `examen`
  ADD CONSTRAINT `examen_ibfk_1` FOREIGN KEY (`idPreguntas`) REFERENCES `alumnos` (`idAlumnos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `realizar__examenes`
--
ALTER TABLE `realizar__examenes`
  ADD CONSTRAINT `realizar__examenes_ibfk_1` FOREIGN KEY (`idAlumnos`) REFERENCES `alumnos` (`idAlumnos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `realizar__examenes_ibfk_2` FOREIGN KEY (`idExamen`) REFERENCES `examen` (`idPreguntas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
