-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 13-06-2022 a las 03:55:06
-- Versión del servidor: 10.5.12-MariaDB
-- Versión de PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id19095482_carservice`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auto`
--

CREATE TABLE `auto` (
  `id_auto` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `placa` char(8) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_tipo_auto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auto`
--

INSERT INTO `auto` (`id_auto`, `anio`, `placa`, `id_marca`, `id_tipo_auto`) VALUES
(3, 2022, 'p-123a', 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_empleado`
--

CREATE TABLE `cargo_empleado` (
  `id_cargo` int(11) NOT NULL COMMENT 'Llave primaria de la tabla. Identificador del cargo de empleado',
  `nombre_cargo` varchar(50) NOT NULL COMMENT 'Nombre del cargo del empleado. Identificador de puesto/cargo a desempeñar el empleado en la empresa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo_empleado`
--

INSERT INTO `cargo_empleado` (`id_cargo`, `nombre_cargo`) VALUES
(1, 'Administrador'),
(3, 'Gerente'),
(2, 'Mecanico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_falla`
--

CREATE TABLE `categoria_falla` (
  `id_categoria_falla` int(11) NOT NULL,
  `nombre_categoria_falla` varchar(50) NOT NULL,
  `descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria_falla`
--

INSERT INTO `categoria_falla` (`id_categoria_falla`, `nombre_categoria_falla`, `descripcion`) VALUES
(3, 'Transmision', 'Falla en cambios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `dui` char(9) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `usuario` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellidos`, `direccion`, `telefono`, `dui`, `fecha_registro`, `usuario`) VALUES
(4, 'Jose', 'Duran', 'San Salvador, San Salvador', '7325-6598', '123659-7', '2023-11-22 00:00:00', 'mecanico1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_mto`
--

CREATE TABLE `detalle_mto` (
  `id_mto` int(11) NOT NULL,
  `id_falla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico_falla`
--

CREATE TABLE `diagnostico_falla` (
  `id_diagnostico` int(11) NOT NULL,
  `id_falla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico_mto`
--

CREATE TABLE `diagnostico_mto` (
  `id_diagnostico_mto` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `diagnostico_mto`
--

INSERT INTO `diagnostico_mto` (`id_diagnostico_mto`, `descripcion`) VALUES
(6, 'Falla en caja de cambios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL COMMENT 'Llave primaria de la tabla. Identificador del empleado de la empresa',
  `nombres` varchar(50) NOT NULL COMMENT 'Nombre/s del empleado del sistema',
  `apellidos` varchar(50) NOT NULL COMMENT 'Apellido/s del empleado del sistema',
  `fecha_ingreso` datetime DEFAULT NULL COMMENT 'Fecha de ingreso a la compañía del empleado',
  `id_cargo_empleado` int(11) NOT NULL COMMENT 'Llave foránea de la tabla y conexion para la tabla cargo empleado. Identificador para el empleado del cargo a desempeñar ',
  `usuario` char(50) NOT NULL COMMENT 'Llave foránea de la tabla y conexion para la tabla usuario. Identificador del usuario y contraseña para el ingreso al sistema'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombres`, `apellidos`, `fecha_ingreso`, `id_cargo_empleado`, `usuario`) VALUES
(1, 'Carlos', 'Orellana', '2015-04-22 00:00:00', 20, 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

CREATE TABLE `facturacion` (
  `id_factura` int(11) NOT NULL,
  `id_mto` int(11) NOT NULL,
  `monto` decimal(10,0) NOT NULL,
  `fecha_facturacion` date NOT NULL,
  `efectivo` decimal(10,0) NOT NULL,
  `cambio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturacion`
--

INSERT INTO `facturacion` (`id_factura`, `id_mto`, `monto`, `fecha_facturacion`, `efectivo`, `cambio`) VALUES
(9, 4, 215, '2017-04-22', 220, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `falla`
--

CREATE TABLE `falla` (
  `id_falla` int(11) NOT NULL,
  `descripción` varchar(150) NOT NULL,
  `id_categoria_falla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `falla`
--

INSERT INTO `falla` (`id_falla`, `descripción`, `id_categoria_falla`) VALUES
(3, 'Falla en transmision y direccion', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `id_mto` int(11) NOT NULL,
  `id_auto` int(11) NOT NULL,
  `id_diagnostico` int(11) DEFAULT NULL,
  `id_tipo_mto` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_mto` datetime NOT NULL,
  `proximo_mto` datetime DEFAULT NULL,
  `estado_mto` char(1) NOT NULL,
  `descripcion_mto` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mantenimiento`
--

INSERT INTO `mantenimiento` (`id_mto`, `id_auto`, `id_diagnostico`, `id_tipo_mto`, `id_sucursal`, `id_empleado`, `fecha_mto`, `proximo_mto`, `estado_mto`, `descripcion_mto`) VALUES
(4, 3, 6, 12, 11, 1, '2023-11-22 00:00:00', '2023-12-22 00:00:00', '1', 'cambio de aceite');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_auto`
--

CREATE TABLE `marca_auto` (
  `id_marca_auto` int(11) NOT NULL,
  `nombre_marca` varchar(100) NOT NULL,
  `id_modelo_auto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca_auto`
--

INSERT INTO `marca_auto` (`id_marca_auto`, `nombre_marca`, `id_modelo_auto`) VALUES
(2, 'Mazda', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_auto`
--

CREATE TABLE `modelo_auto` (
  `id_modelo_auto` int(11) NOT NULL,
  `nombre_modelo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modelo_auto`
--

INSERT INTO `modelo_auto` (`id_modelo_auto`, `nombre_modelo`) VALUES
(10, 'Microbus');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `nombre_sucursal` varchar(50) NOT NULL,
  `direccion_sucursal` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `nombre_sucursal`, `direccion_sucursal`) VALUES
(11, 'CAR SERVICES SS', 'Colonia Escalon, San Salvador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_auto`
--

CREATE TABLE `tipo_auto` (
  `id_tipo_auto` int(11) NOT NULL,
  `nombre_tipo_auto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_auto`
--

INSERT INTO `tipo_auto` (`id_tipo_auto`, `nombre_tipo_auto`) VALUES
(5, 'Sedan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_mto`
--

CREATE TABLE `tipo_mto` (
  `id_tipo` int(11) NOT NULL,
  `nombre_mto` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_mto`
--

INSERT INTO `tipo_mto` (`id_tipo`, `nombre_mto`) VALUES
(12, 'Preventivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario` char(50) NOT NULL COMMENT 'Usuario para ingresar al sistema y llave primaria de la tabla.',
  `contrasenia` char(50) NOT NULL COMMENT 'Contaseña para ingresar al sistema'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `contrasenia`) VALUES
('admin', 'admin'),
('mecanico 2', 'mecanico 2'),
('mecanico1', 'mecanico1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`id_auto`),
  ADD UNIQUE KEY `u_placa` (`placa`),
  ADD KEY `fk_auto_marca` (`id_marca`),
  ADD KEY `fk_tipo_auto_auto` (`id_tipo_auto`);

--
-- Indices de la tabla `cargo_empleado`
--
ALTER TABLE `cargo_empleado`
  ADD PRIMARY KEY (`id_cargo`),
  ADD UNIQUE KEY `nombre_cargo` (`nombre_cargo`);

--
-- Indices de la tabla `categoria_falla`
--
ALTER TABLE `categoria_falla`
  ADD PRIMARY KEY (`id_categoria_falla`),
  ADD UNIQUE KEY `nombre_categoria_falla` (`nombre_categoria_falla`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `u_dui` (`dui`),
  ADD KEY `fk_cliente_usuario` (`usuario`);

--
-- Indices de la tabla `detalle_mto`
--
ALTER TABLE `detalle_mto`
  ADD KEY `fk_mto_detalle` (`id_mto`),
  ADD KEY `fk_detalle_mto_falla` (`id_falla`);

--
-- Indices de la tabla `diagnostico_falla`
--
ALTER TABLE `diagnostico_falla`
  ADD KEY `fk_diagnostico_falla` (`id_diagnostico`),
  ADD KEY `fk_falla_diagnostico` (`id_falla`);

--
-- Indices de la tabla `diagnostico_mto`
--
ALTER TABLE `diagnostico_mto`
  ADD PRIMARY KEY (`id_diagnostico_mto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `fk_empleado_cargo` (`id_cargo_empleado`),
  ADD KEY `fk_empleado_usuario` (`usuario`);

--
-- Indices de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `fk_mto_factura` (`id_mto`);

--
-- Indices de la tabla `falla`
--
ALTER TABLE `falla`
  ADD PRIMARY KEY (`id_falla`),
  ADD KEY `fk_categoria_falla_falla` (`id_categoria_falla`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`id_mto`),
  ADD UNIQUE KEY `fk_diagnostico_mto` (`id_diagnostico`),
  ADD KEY `fk_mto_tipo_mto` (`id_tipo_mto`),
  ADD KEY `fk_mto_sucursal` (`id_sucursal`),
  ADD KEY `fk_mto_empleado` (`id_empleado`),
  ADD KEY `fk_auto_mto` (`id_auto`);

--
-- Indices de la tabla `marca_auto`
--
ALTER TABLE `marca_auto`
  ADD PRIMARY KEY (`id_marca_auto`),
  ADD UNIQUE KEY `u_marca` (`nombre_marca`),
  ADD KEY `fk_marca_modelo` (`id_modelo_auto`);

--
-- Indices de la tabla `modelo_auto`
--
ALTER TABLE `modelo_auto`
  ADD PRIMARY KEY (`id_modelo_auto`),
  ADD UNIQUE KEY `u_modelo` (`nombre_modelo`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`),
  ADD UNIQUE KEY `u_sucursal` (`nombre_sucursal`);

--
-- Indices de la tabla `tipo_auto`
--
ALTER TABLE `tipo_auto`
  ADD PRIMARY KEY (`id_tipo_auto`),
  ADD UNIQUE KEY `u_nombre_tu` (`nombre_tipo_auto`);

--
-- Indices de la tabla `tipo_mto`
--
ALTER TABLE `tipo_mto`
  ADD PRIMARY KEY (`id_tipo`),
  ADD UNIQUE KEY `u_tipo_mto` (`nombre_mto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auto`
--
ALTER TABLE `auto`
  MODIFY `id_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cargo_empleado`
--
ALTER TABLE `cargo_empleado`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria de la tabla. Identificador del cargo de empleado', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `diagnostico_mto`
--
ALTER TABLE `diagnostico_mto`
  MODIFY `id_diagnostico_mto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `falla`
--
ALTER TABLE `falla`
  MODIFY `id_falla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  MODIFY `id_mto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `marca_auto`
--
ALTER TABLE `marca_auto`
  MODIFY `id_marca_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `modelo_auto`
--
ALTER TABLE `modelo_auto`
  MODIFY `id_modelo_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipo_auto`
--
ALTER TABLE `tipo_auto`
  MODIFY `id_tipo_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipo_mto`
--
ALTER TABLE `tipo_mto`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auto`
--
ALTER TABLE `auto`
  ADD CONSTRAINT `auto_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca_auto` (`id_marca_auto`),
  ADD CONSTRAINT `auto_ibfk_2` FOREIGN KEY (`id_tipo_auto`) REFERENCES `tipo_auto` (`id_tipo_auto`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `detalle_mto`
--
ALTER TABLE `detalle_mto`
  ADD CONSTRAINT `detalle_mto_ibfk_1` FOREIGN KEY (`id_falla`) REFERENCES `falla` (`id_falla`),
  ADD CONSTRAINT `detalle_mto_ibfk_2` FOREIGN KEY (`id_mto`) REFERENCES `mantenimiento` (`id_mto`);

--
-- Filtros para la tabla `diagnostico_falla`
--
ALTER TABLE `diagnostico_falla`
  ADD CONSTRAINT `diagnostico_falla_ibfk_1` FOREIGN KEY (`id_diagnostico`) REFERENCES `diagnostico_mto` (`id_diagnostico_mto`),
  ADD CONSTRAINT `diagnostico_falla_ibfk_2` FOREIGN KEY (`id_falla`) REFERENCES `falla` (`id_falla`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `cargo_empleado` (`id_cargo`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`id_mto`) REFERENCES `mantenimiento` (`id_mto`);

--
-- Filtros para la tabla `falla`
--
ALTER TABLE `falla`
  ADD CONSTRAINT `falla_ibfk_1` FOREIGN KEY (`id_categoria_falla`) REFERENCES `categoria_falla` (`id_categoria_falla`);

--
-- Filtros para la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD CONSTRAINT `mantenimiento_ibfk_1` FOREIGN KEY (`id_diagnostico`) REFERENCES `diagnostico_mto` (`id_diagnostico_mto`),
  ADD CONSTRAINT `mantenimiento_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `mantenimiento_ibfk_3` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`),
  ADD CONSTRAINT `mantenimiento_ibfk_4` FOREIGN KEY (`id_tipo_mto`) REFERENCES `tipo_mto` (`id_tipo`),
  ADD CONSTRAINT `mantenimiento_ibfk_5` FOREIGN KEY (`id_auto`) REFERENCES `auto` (`id_auto`);

--
-- Filtros para la tabla `marca_auto`
--
ALTER TABLE `marca_auto`
  ADD CONSTRAINT `marca_auto_ibfk_1` FOREIGN KEY (`id_modelo_auto`) REFERENCES `modelo_auto` (`id_modelo_auto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
