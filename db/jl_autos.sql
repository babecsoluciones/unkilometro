-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-01-2020 a las 05:12:50
-- Versión del servidor: 5.7.23
-- Versión de PHP: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jl_autos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BitPublicaciones`
--

CREATE TABLE `BitPublicaciones` (
  `eCodPublicacion` int(11) NOT NULL,
  `eCodUsuario` int(11) NOT NULL,
  `eCodEntidad` int(11) NOT NULL,
  `eCodEstado` int(11) NOT NULL,
  `eCodMunicipio` int(11) NOT NULL,
  `eCodEstatus` int(11) NOT NULL,
  `fhFecha` int(11) NOT NULL,
  `tTitulo` varchar(200) NOT NULL,
  `tDescripcion` text NOT NULL,
  `eCodTipo` int(11) NOT NULL,
  `eCodMarca` int(11) NOT NULL,
  `eModelo` int(11) NOT NULL,
  `eCodTransmision` int(11) NOT NULL,
  `tColor` varchar(50) NOT NULL,
  `dPrecio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatCaracteristicas`
--

CREATE TABLE `CatCaracteristicas` (
  `eCodCaracteristica` int(11) NOT NULL,
  `eCodEstatus` int(11) NOT NULL,
  `tNombre` varchar(35) NOT NULL,
  `tIcono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatEntidades`
--

CREATE TABLE `CatEntidades` (
  `eCodEntidad` int(11) NOT NULL,
  `eCodEstatus` int(11) NOT NULL,
  `tNombre` varchar(150) NOT NULL,
  `tDireccion` text NOT NULL,
  `tLogo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatEstados`
--

CREATE TABLE `CatEstados` (
  `eCodEstado` int(11) NOT NULL,
  `tCodEstado` varchar(3) DEFAULT NULL,
  `tNombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatEstatus`
--

CREATE TABLE `CatEstatus` (
  `eCodEstatus` int(11) NOT NULL,
  `tCodEstatus` varchar(2) DEFAULT NULL,
  `tNombre` varchar(15) DEFAULT NULL,
  `tIcono` varchar(25) DEFAULT NULL,
  `tColor` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CatEstatus`
--

INSERT INTO `CatEstatus` (`eCodEstatus`, `tCodEstatus`, `tNombre`, `tIcono`, `tColor`) VALUES
(1, 'NU', 'Nuevo', 'far fa-question-circle', NULL),
(2, 'PR', 'En proceso...', 'fas fa-cogs', '#84eefa'),
(3, 'AC', 'Activo', 'fa fa-check', NULL),
(4, 'CA', 'Cancelado', 'fas fa-ban', NULL),
(5, 'RE', 'Rechazado', 'fas fa-minus-circle', NULL),
(6, 'BL', 'Bloqueado', 'fas fa-lock', NULL),
(7, 'EL', 'Eliminado', 'far fa-trash-alt', NULL),
(8, 'FI', 'Finalizado', 'fas fa-check-double', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatMarcasVehiculos`
--

CREATE TABLE `CatMarcasVehiculos` (
  `eCodMarca` int(11) NOT NULL,
  `eCodEstatus` int(11) NOT NULL,
  `tNombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatMunicipios`
--

CREATE TABLE `CatMunicipios` (
  `eCodMunicipio` int(11) NOT NULL,
  `eCodEstado` int(11) NOT NULL,
  `tNombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatTiposSecciones`
--

CREATE TABLE `CatTiposSecciones` (
  `eCodTipoSeccion` int(11) NOT NULL,
  `tCodTipoSeccion` char(3) NOT NULL,
  `tNombre` varchar(50) NOT NULL,
  `tIcono` varchar(50) DEFAULT NULL,
  `ePosicion` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `CatTiposSecciones`
--

INSERT INTO `CatTiposSecciones` (`eCodTipoSeccion`, `tCodTipoSeccion`, `tNombre`, `tIcono`, `ePosicion`) VALUES
(1, 'cat', 'Catalogo', 'fas fa-folder-open', 2),
(2, 'ser', 'Servicio', 'fas fa-list-alt', 3),
(3, 'sis', 'Sistema', 'fas fa-cogs', 5),
(4, 'con', 'Consultas', 'fas fa-search', 4),
(5, 'ini', 'Inicio', 'fas fa-tachometer-alt', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CatTiposVehiculos`
--

CREATE TABLE `CatTiposVehiculos` (
  `eCodTipo` int(11) NOT NULL,
  `eCodEstatus` int(11) NOT NULL,
  `tNombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RelPublicacionesCaracteristicas`
--

CREATE TABLE `RelPublicacionesCaracteristicas` (
  `eCodPublicacion` int(11) NOT NULL,
  `eCodCaracteristica` int(11) NOT NULL,
  `tValor` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisBotones`
--

CREATE TABLE `SisBotones` (
  `tCodBoton` varchar(2) NOT NULL,
  `tTitulo` varchar(20) DEFAULT NULL,
  `tFuncion` varchar(25) DEFAULT NULL,
  `tAccion` varchar(25) NOT NULL,
  `tIcono` varchar(45) DEFAULT NULL,
  `tId` varchar(15) NOT NULL,
  `tClase` varchar(50) NOT NULL,
  `tHTML` varchar(255) DEFAULT NULL,
  `bDeshabilitado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisBotones`
--

INSERT INTO `SisBotones` (`tCodBoton`, `tTitulo`, `tFuncion`, `tAccion`, `tIcono`, `tId`, `tClase`, `tHTML`, `bDeshabilitado`) VALUES
('CO', 'Listado', 'window.location=\'url\';', '', '<i class=\"fas fa-table\"></i>', '', 'btn btn-primary', NULL, NULL),
('EL', 'Eliminar', 'eliminar();', '', '<i class=\"far fa-trash-alt\"></i>', '', 'btn btn-danger', NULL, NULL),
('GU', 'Guardar', 'validar();', '', '<i class=\"fa fa-floppy-o\"></i>', 'btnGuardar', 'btn btn-primary', NULL, NULL),
('IM', 'Imprimir', 'imprimir();', '', '<i class=\"fas fa-print\"></i>', '', 'btn btn-success', NULL, NULL),
('NU', 'Nuevo', 'window.location=\'url\';', '', '<i class=\"fa fa-plus\"></i>', 'btnNuevo', 'btn btn-primary', NULL, NULL),
('PD', 'Descargar PDF', 'window.location=\'url\';', 'generar/pdf', '<i class=\"fas fa-file-pdf\"></i>', '', 'btn btn-danger', NULL, NULL),
('RE', 'Rechazar', 'rechazar();', '', '<i class=\"far fa-trash-alt\"></i>', '', 'btn btn-danger', NULL, NULL),
('SR', 'Consultar', 'consultarFecha();', '', '<i class=\"fas fa-search\"></i>', '', 'btn btn-info', '<form id=\"Datos\" method=\"post\" action=\"<?=$_SERVER[\'REQUEST_URI\']?>\"><input type=\"text\" id=\"datepicker\"><input type=\"hidden\" name=\"fhFechaConsulta\" id=\"datepicker1\"></form>', NULL),
('VA', NULL, 'activarValidacion();', '', '<i class=\"fa fa-key\" ></i>', 'btnValidar', 'btn btn-primary', '<input type=\"password\" class=\"form-control col-md-3\" onkeyup=\"validarUsuario()\"  id=\"tPasswordOperaciones\"  style=\"display:none;\" size=\"8\">', NULL),
('XL', 'Descargar XLS', 'generarArchivo(\'xls\');', 'exportar/xls', '<i class=\"fas fa-file-excel\"></i>', '', 'btn btn-success', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisLogs`
--

CREATE TABLE `SisLogs` (
  `eCodEvento` int(11) NOT NULL,
  `eCodUsuario` int(11) NOT NULL,
  `fhFecha` datetime NOT NULL,
  `tDescripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisPerfiles`
--

CREATE TABLE `SisPerfiles` (
  `eCodPerfil` int(11) NOT NULL,
  `tNombre` varchar(15) DEFAULT NULL,
  `tCodEstatus` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisPerfiles`
--

INSERT INTO `SisPerfiles` (`eCodPerfil`, `tNombre`, `tCodEstatus`) VALUES
(1, 'Administrador', 'AC'),
(2, 'Coordinador', 'AC'),
(3, 'Ventas', 'AC'),
(4, 'Pagos', 'AC'),
(5, 'Bodega', NULL),
(6, 'Entregas', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSecciones`
--

CREATE TABLE `SisSecciones` (
  `tCodSeccion` varchar(20) NOT NULL,
  `tCodPadre` varchar(20) DEFAULT NULL,
  `tCodTipoSeccion` char(3) NOT NULL,
  `tDirectorio` char(3) NOT NULL,
  `tTitulo` varchar(60) DEFAULT NULL,
  `eCodEstatus` int(11) DEFAULT NULL,
  `ePosicion` int(11) DEFAULT NULL,
  `bFiltro` int(11) NOT NULL,
  `bPublico` int(11) DEFAULT NULL,
  `tIcono` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisSecciones`
--

INSERT INTO `SisSecciones` (`tCodSeccion`, `tCodPadre`, `tCodTipoSeccion`, `tDirectorio`, `tTitulo`, `eCodEstatus`, `ePosicion`, `bFiltro`, `bPublico`, `tIcono`) VALUES
('cata-cam-con', 'sis-dash-con', 'cat', 'veh', 'Camionetas', 3, 3, 1, NULL, 'fa fa-file-text-o'),
('cata-cam-reg', 'cata-cam-con', '', 'veh', '+ Camionetas', 3, 1, 0, NULL, 'fa fa-file-text-o'),
('cata-car-con', 'sis-dash-con', '', 'das', 'Eventos de Carga', 3, 3, 1, NULL, 'fa fa-file-text-o'),
('cata-cli-con', 'sis-dash-con', 'cat', 'cli', 'Clientes', 3, 3, 1, NULL, 'fa fa-file-text-o'),
('cata-cli-det', 'cata-cli-con', '', 'cli', 'Detalles de Clientes', 3, 2, 0, 1, 'fa fa-file-text-o'),
('cata-cli-reg', 'cata-cli-con', '', 'cli', '+ Clientes', 3, 1, 0, NULL, 'fa fa-file-text-o'),
('cata-eve-con', 'sis-dash-con', 'con', 'ser', 'Eventos', 3, 2, 1, NULL, 'fa fa-file-text-o'),
('cata-eve-det', 'cata-eve-con', '', 'ser', 'Detalles de Eventos', 3, 1, 0, 1, 'fa fa-file-text-o'),
('cata-ini-usr', 'sis-dash-con', 'sis', 'sis', 'Logs de Inicio de Sesion', 3, 15, 0, NULL, 'fa fa-file-text-o'),
('cata-inv-con', 'sis-dash-con', 'cat', 'inv', 'Inventario', 3, 3, 1, NULL, 'fa fa-file-text-o'),
('cata-inv-det', 'cata-inv-con', '', 'inv', 'Detalles de Inventario', 3, 2, 0, 1, 'fa fa-file-text-o'),
('cata-inv-reg', 'cata-inv-con', '', 'inv', '+ Inventario', 3, 1, 0, NULL, 'fa fa-file-text-o'),
('cata-per-reg', 'cata-per-sis', '', 'sis', '+ Perfiles', 3, 5, 0, NULL, 'fa fa-file-text-o'),
('cata-per-sis', 'sis-dash-con', 'sis', 'sis', 'Perfiles', 3, 6, 0, NULL, 'fa fa-file-text-o'),
('cata-ren-con', 'sis-dash-con', 'con', 'ser', 'Rentas', 3, 2, 1, NULL, 'fa fa-file-text-o'),
('cata-ren-det', 'cata-ren-con', '', 'ser', 'Detalles de Rentas', 3, 1, 0, 1, 'fa fa-file-text-o'),
('cata-sbc-con', 'sis-dash-con', 'cat', 'inv', 'Subclasificaciones de Inventario', 3, 4, 1, NULL, 'fa fa-file-text-o'),
('cata-sbc-reg', 'cata-sbc-con', '', 'inv', '+ Subclasificacion de Inventario', 3, 1, 0, NULL, 'fa fa-file-text-o'),
('cata-sec-usr', 'sis-dash-con', 'sis', 'sis', 'Logs de Acceso en Sistema', 3, 15, 0, NULL, 'fa fa-file-text-o'),
('cata-ser-con', 'sis-dash-con', 'cat', 'inv', 'Paquetes', 3, 3, 1, NULL, 'fa fa-file-text-o'),
('cata-ser-det', 'cata-ser-con', '', 'inv', 'Detalles de Paquetes', 3, 2, 0, 1, 'fa fa-file-text-o'),
('cata-ser-reg', 'cata-ser-con', '', 'inv', '+ Paquetes', 3, 1, 0, NULL, 'fa fa-file-text-o'),
('cata-tiv-con', 'sis-dash-con', 'cat', 'inv', 'Tipos de Inventario', 3, 4, 1, NULL, 'fa fa-file-text-o'),
('cata-tiv-reg', 'cata-tiv-con', '', 'inv', '+ Tipo de Inventario', 3, 1, 0, NULL, 'fa fa-file-text-o'),
('cata-tra-con', 'sis-dash-con', 'con', 'das', 'Transacciones', 3, 4, 1, NULL, 'fa fa-file-text-o'),
('cata-usr-reg', 'cata-usr-sis', '', 'sis', '+ Usuarios', 3, 5, 0, NULL, 'fa fa-file-text-o'),
('cata-usr-sis', 'sis-dash-con', 'sis', 'sis', 'Usuarios', 3, 5, 0, NULL, 'fa fa-file-text-o'),
('oper-eve-cot', 'cata-eve-con', 'ser', 'ser', '+ Eventos', 3, 1, 0, NULL, 'fa fa-file-text-o'),
('oper-ren-cot', 'cata-ren-con', 'ser', 'ser', '+ Rentas', 3, 1, 0, NULL, 'fa fa-file-text-o'),
('sis-bod-con', 'sis-dash-con', 'ini', 'das', 'Bodega', 3, 2, 1, NULL, 'fa-tachometer-alt'),
('sis-dash-con', NULL, 'ini', 'das', 'Dashboard', 3, 1, 1, NULL, 'fa-tachometer-alt'),
('sis-log-con', 'sis-dash-con', 'sis', 'sis', 'Logs', 3, 15, 0, NULL, 'fa fa-file-text-o');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesBotones`
--

CREATE TABLE `SisSeccionesBotones` (
  `eCodRegistro` int(11) NOT NULL,
  `tCodPadre` varchar(15) DEFAULT NULL,
  `tCodSeccion` varchar(15) DEFAULT NULL,
  `tCodBoton` varchar(2) DEFAULT NULL,
  `tFuncion` varchar(25) DEFAULT NULL,
  `tEtiqueta` varchar(30) DEFAULT NULL,
  `ePosicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisSeccionesBotones`
--

INSERT INTO `SisSeccionesBotones` (`eCodRegistro`, `tCodPadre`, `tCodSeccion`, `tCodBoton`, `tFuncion`, `tEtiqueta`, `ePosicion`) VALUES
(2, 'cata-cli-reg', 'cata-cli-reg', 'GU', NULL, NULL, 2),
(3, 'cata-cli-reg', 'cata-cli-con', 'CO', NULL, NULL, 3),
(5, 'cata-inv-reg', 'cata-inv-reg', 'GU', NULL, NULL, 2),
(6, 'cata-inv-reg', 'cata-inv-con', 'CO', NULL, NULL, 3),
(8, 'cata-per-reg', 'cata-per-reg', 'GU', 'guardar();', NULL, 2),
(9, 'cata-per-reg', 'sis-per-con', 'CO', NULL, NULL, 3),
(11, 'cata-ser-reg', 'cata-ser-reg', 'GU', NULL, NULL, 2),
(12, 'cata-ser-reg', 'cata-ser-con', 'CO', NULL, NULL, 3),
(14, 'cata-usr-reg', 'cata-usr-reg', 'GU', NULL, NULL, 2),
(15, 'cata-usr-reg', 'sis-usr-con', 'CO', NULL, NULL, 3),
(17, 'oper-eve-cot', 'oper-eve-cot', 'GU', NULL, NULL, 2),
(18, 'oper-eve-cot', 'cata-eve-con', 'CO', NULL, NULL, 3),
(20, 'oper-ren-cot', 'oper-ren-cot', 'GU', NULL, NULL, 2),
(21, 'oper-ren-cot', 'cata-ren-con', 'CO', NULL, NULL, 3),
(22, 'cata-cli-con', 'cata-cli-reg', 'NU', NULL, NULL, 1),
(24, 'cata-eve-con', 'oper-eve-cot', 'NU', NULL, NULL, 1),
(25, 'cata-inv-con', 'cata-inv-reg', 'NU', NULL, NULL, 1),
(26, 'cata-ren-con', 'oper-ren-cot', 'NU', NULL, NULL, 1),
(27, 'cata-ser-con', 'cata-ser-reg', 'NU', NULL, NULL, 1),
(28, 'cata-per-sis', 'cata-per-reg', 'NU', NULL, NULL, 1),
(29, 'cata-usr-sis', 'cata-usr-reg', 'NU', NULL, NULL, 1),
(30, 'cata-cli-det', 'cata-cli-con', 'CO', NULL, NULL, 3),
(31, 'cata-eve-det', 'cata-eve-det', 'PD', 'crearPDF(\'cotizacion\');', NULL, 1),
(32, 'cata-ren-det', 'cata-ren-det', 'PD', 'crearPDF(\'cotizacion\');', NULL, 1),
(33, 'cata-cli-con', 'cata-cli-con', 'XL', 'extraerClientes();', NULL, 2),
(34, 'cata-eve-det', 'cata-eve-con', 'CO', NULL, NULL, 3),
(35, 'cata-ren-det', 'cata-ren-con', 'CO', NULL, NULL, 3),
(37, 'sis-dash-con', 'oper-eve-cot', 'NU', NULL, 'Nuevo Evento', 1),
(38, 'sis-dash-con', 'oper-ren-cot', 'NU', NULL, 'Nueva Renta', 2),
(39, 'cata-ser-det', 'cata-ser-con', 'CO', NULL, NULL, 1),
(41, 'cata-inv-det', 'cata-inv-con', 'CO', NULL, NULL, 3),
(44, 'cata-cam-reg', 'cata-cam-reg', 'GU', NULL, NULL, 2),
(45, 'cata-cam-reg', 'cata-cam-con', 'CO', NULL, NULL, 3),
(46, 'cata-cam-con', 'cata-cam-reg', 'NU', NULL, NULL, 1),
(48, 'cata-tiv-con', 'cata-tiv-reg', 'NU', NULL, NULL, 1),
(49, 'cata-tiv-reg', 'cata-tiv-reg', 'GU', 'guardar();', NULL, 2),
(50, 'cata-tiv-reg', 'cata-tiv-con', 'CO', NULL, NULL, 3),
(51, 'cata-sbc-con', 'cata-sbc-reg', 'NU', NULL, NULL, 1),
(52, 'cata-sbc-reg', 'cata-sbc-reg', 'GU', 'guardar();', NULL, 2),
(53, 'cata-sbc-reg', 'cata-sbc-con', 'CO', NULL, NULL, 3),
(54, 'cata-ser-con', 'cata-ser-con', 'XL', NULL, NULL, 5),
(55, 'cata-inv-con', 'cata-inv-con', 'XL', NULL, NULL, 5),
(56, 'sis-dash-con', 'sis-dash-con', 'CO', 'verFecha(\'inv\');', 'Disponibilidad de Inventario', 1),
(57, 'sis-dash-con', 'sis-dash-con', NULL, 'verFecha(\'paq\');', 'Disponibilidad de Paquetes', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesMenusEmergentes`
--

CREATE TABLE `SisSeccionesMenusEmergentes` (
  `eCodMenuEmergente` int(11) NOT NULL,
  `tCodPadre` varchar(20) DEFAULT NULL,
  `tCodSeccion` varchar(20) DEFAULT NULL,
  `tCodPermiso` char(1) NOT NULL,
  `tTitulo` varchar(30) NOT NULL,
  `tAccion` varchar(25) DEFAULT NULL,
  `tFuncion` varchar(50) DEFAULT NULL,
  `tValor` varchar(20) DEFAULT NULL,
  `ePosicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisSeccionesMenusEmergentes`
--

INSERT INTO `SisSeccionesMenusEmergentes` (`eCodMenuEmergente`, `tCodPadre`, `tCodSeccion`, `tCodPermiso`, `tTitulo`, `tAccion`, `tFuncion`, `tValor`, `ePosicion`) VALUES
(1, 'cata-cli-con', 'cata-cli-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 2),
(2, 'cata-ser-con', 'cata-ser-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 2),
(3, 'cata-eve-con', 'cata-eve-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 2),
(4, 'cata-ren-con', 'cata-ren-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 1),
(5, 'cata-inv-con', 'cata-inv-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 1),
(6, 'cata-eve-con', 'oper-eve-cot', 'A', 'Editar', 'editar-cotizacion', 'window.location=\'url\';', 'editar-cotizacion', 1),
(7, 'cata-cli-con', 'cata-cli-reg', 'A', 'Editar', 'editar', 'window.location=\'url\';', 'editar', 1),
(8, 'cata-usr-sis', 'cata-usr-reg', 'A', 'Editar', 'editar', 'window.location=\'url\';', 'editar', 1),
(9, 'cata-ser-con', 'cata-ser-reg', 'A', 'Editar', 'editar', 'window.location=\'url\';', 'editar', 1),
(10, 'cata-cli-con', 'cata-cli-con', 'D', 'Eliminar', 'eliminar', 'acciones(codigo,\'D\');', 'eliminar', 3),
(11, 'cata-ser-con', 'cata-ser-con', 'D', 'Eliminar', 'eliminar', 'acciones(codigo,\'D\');', 'eliminar', 3),
(12, 'cata-eve-con', 'cata-eve-con', 'D', 'Eliminar', 'eliminar', 'acciones(codigo,\'D\');', 'eliminar', 3),
(13, 'cata-ren-con', 'cata-ren-con', 'D', 'Eliminar', 'eliminar', 'acciones(codigo,\'D\');', 'eliminar', 3),
(14, 'cata-inv-con', 'cata-inv-con', 'D', 'Eliminar', 'eliminar', 'acciones(codigo,\'D\');', 'eliminar', 2),
(16, 'cata-usr-sis', 'cata-usr-sis', 'D', 'Eliminar', 'eliminar', 'acciones(codigo,\'D\');', 'eliminar', 2),
(17, 'cata-eve-con', 'cata-eve-con', 'D', 'Finalizar', 'finalizar', 'acciones(codigo,\'F\');', 'finalizar', 4),
(18, 'cata-ren-con', 'cata-ren-con', 'D', 'Finalizar', 'finalizar', 'acciones(codigo,\'F\');', 'finalizar', 4),
(19, 'cata-ren-con', 'oper-ren-cot', 'A', 'Editar', 'editar-cotizacion', 'window.location=\'url\';', 'editar-cotizacion', 1),
(20, 'cata-eve-con', 'cata-eve-con', 'A', 'Agregar Transaccion', 'agregarTransaccion', 'nuevaTransaccion(codigo);', 'agregarTransaccion', 5),
(21, 'cata-ren-con', 'cata-ren-con', 'A', 'Agregar transaccion', 'agregarTransaccion', 'nuevaTransaccion(codigo);', 'agregarTransaccion', 5),
(22, 'cata-ren-con', 'oper-ren-cot', 'A', 'Editar', 'editar-cotizacion', 'window.location=\'url\';', 'editar-cotizacion', 1),
(23, 'cata-eve-con', 'cata-eve-con', 'A', 'Agregar Transaccion', 'agregarTransaccion', 'nuevaTransaccion(codigo);', 'agregarTransaccion', 5),
(24, 'cata-ren-con', 'cata-ren-con', 'A', 'Agregar transaccion', 'agregarTransaccion', 'nuevaTransaccion(codigo);', 'agregarTransaccion', 5),
(25, 'cata-per-sis', 'cata-per-reg', 'A', 'Editar', 'editar', 'window.location=\'url\';', 'editar', 1),
(26, 'cata-tra-con', 'cata-eve-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 1),
(27, 'cata-inv-con', 'cata-inv-reg', 'A', 'Editar', 'editar', 'window.location=\'url\';', 'editar', 1),
(28, 'cata-cam-con', 'cata-cam-reg', 'A', 'Editar', 'editar', 'window.location=\'url\';', 'editar', 1),
(29, 'cata-car-con', 'cata-eve-det', 'A', 'Detalles', 'detalles', 'window.location=\'url\';', 'detalles', 2),
(30, 'cata-tiv-con', 'cata-tiv-reg', 'A', 'Editar', 'editar', 'window.location=\'url\';', 'editar', 1),
(31, 'cata-sbc-con', 'cata-sbc-reg', 'A', 'Editar', 'editar', 'window.location=\'url\';', 'editar', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesPerfiles`
--

CREATE TABLE `SisSeccionesPerfiles` (
  `eCodPerfil` int(11) DEFAULT NULL,
  `tCodSeccion` varchar(15) DEFAULT NULL,
  `bAll` int(11) DEFAULT NULL,
  `bDelete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisSeccionesPerfiles`
--

INSERT INTO `SisSeccionesPerfiles` (`eCodPerfil`, `tCodSeccion`, `bAll`, `bDelete`) VALUES
(6, 'sis-bod-con', 1, 0),
(6, 'cata-ren-con', 1, 0),
(6, 'cata-ren-det', 1, 0),
(6, 'cata-eve-con', 1, 0),
(6, 'cata-eve-det', 1, 0),
(6, 'cata-ser-con', 1, 0),
(6, 'cata-ser-det', 1, 0),
(6, 'cata-cam-reg', 1, 1),
(6, 'cata-cli-det', 0, 0),
(6, 'cata-car-con', 1, 0),
(6, 'cata-tra-con', 1, 0),
(3, 'sis-dash-con', 1, 0),
(3, 'cata-ren-con', 1, 0),
(3, 'cata-ren-det', 1, 0),
(3, 'oper-ren-cot', 1, 0),
(3, 'cata-eve-con', 1, 0),
(3, 'cata-eve-det', 1, 0),
(3, 'oper-eve-cot', 1, 0),
(3, 'cata-ser-con', 0, 0),
(3, 'cata-ser-det', 1, 0),
(3, 'cata-inv-con', 1, 0),
(3, 'cata-inv-det', 1, 0),
(3, 'cata-cli-con', 1, 0),
(3, 'cata-cli-reg', 1, 0),
(3, 'cata-cli-det', 1, 0),
(3, 'cata-tra-con', 1, 0),
(1, 'sis-dash-con', 1, 1),
(1, 'cata-eve-con', 1, 1),
(1, 'cata-eve-det', 0, 0),
(1, 'oper-eve-cot', 0, 0),
(1, 'sis-bod-con', 1, 1),
(1, 'cata-ren-con', 1, 1),
(1, 'cata-ren-det', 0, 0),
(1, 'oper-ren-cot', 0, 0),
(1, 'cata-cli-con', 1, 1),
(1, 'cata-cli-reg', 0, 0),
(1, 'cata-cli-det', 0, 0),
(1, 'cata-inv-con', 0, 1),
(1, 'cata-inv-reg', 0, 0),
(1, 'cata-inv-det', 0, 0),
(1, 'cata-ser-con', 0, 1),
(1, 'cata-ser-reg', 0, 0),
(1, 'cata-ser-det', 0, 0),
(1, 'cata-tra-con', 1, 1),
(1, 'cata-usr-sis', 0, 1),
(1, 'cata-usr-reg', 0, 0),
(1, 'cata-per-sis', 0, 1),
(1, 'cata-per-reg', 0, 0),
(1, 'sis-log-con', 0, 1),
(5, 'sis-bod-con', 1, 0),
(5, 'cata-car-con', 1, 1),
(2, 'sis-dash-con', 1, 1),
(2, 'cata-eve-con', 1, 1),
(2, 'cata-eve-det', 1, 1),
(2, 'oper-eve-cot', 1, 1),
(2, 'cata-ren-con', 1, 1),
(2, 'oper-ren-cot', 1, 1),
(2, 'cata-car-con', 1, 1),
(2, 'cata-cli-con', 1, 1),
(2, 'cata-cli-reg', 1, 1),
(2, 'cata-cli-det', 1, 1),
(2, 'cata-inv-con', 1, 1),
(2, 'cata-inv-reg', 1, 1),
(2, 'cata-inv-det', 1, 1),
(2, 'cata-ser-con', 1, 1),
(2, 'cata-ser-reg', 1, 1),
(2, 'cata-ser-det', 1, 1),
(2, 'cata-tra-con', 1, 1),
(2, 'cata-tiv-con', 1, 1),
(2, 'cata-tiv-reg', 1, 1),
(2, 'cata-sbc-con', 1, 1),
(2, 'cata-sbc-reg', 1, 1),
(2, 'cata-ren-det', 1, 1),
(3, 'cata-ren-det', 1, 1),
(4, 'cata-ren-det', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesPerfilesInicio`
--

CREATE TABLE `SisSeccionesPerfilesInicio` (
  `eCodPerfil` int(11) NOT NULL,
  `tCodSeccion` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `SisSeccionesPerfilesInicio`
--

INSERT INTO `SisSeccionesPerfilesInicio` (`eCodPerfil`, `tCodSeccion`) VALUES
(1, 'sis-dash-con'),
(2, 'sis-dash-con'),
(6, 'sis-bod-con'),
(3, 'sis-dash-con'),
(5, 'sis-bod-con');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesReemplazos`
--

CREATE TABLE `SisSeccionesReemplazos` (
  `eCodReemplazo` int(11) NOT NULL,
  `tBase` varchar(4) NOT NULL,
  `tNombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisSeccionesReemplazos`
--

INSERT INTO `SisSeccionesReemplazos` (`eCodReemplazo`, `tBase`, `tNombre`) VALUES
(1, 'cata', 'catalogo'),
(2, 'oper', 'operaciones'),
(3, 'reg', 'registrar'),
(4, 'inv', 'inventario'),
(5, 'usr', 'usuario'),
(6, 'sis', 'sistema'),
(7, 'bod', 'bodega'),
(8, 'ser', 'paquetes'),
(9, 'per', 'perfiles'),
(10, 'con', 'consultar'),
(11, 'dash', 'dashboard'),
(12, 'eve', 'eventos'),
(13, 'noti', 'notificaciones'),
(14, 'det', 'detalles'),
(15, 'del', 'eliminar'),
(16, 'log', 'logs'),
(17, 'tra', 'transacciones'),
(18, 'cit', 'citas'),
(19, 'gen', 'generar'),
(20, 'xls', 'excel'),
(21, 'pdf', 'pdf'),
(22, 'ren', 'rentas'),
(23, 'cli', 'clientes'),
(24, 'reg', 'editar'),
(25, 'xls', 'xls'),
(26, 'cot', 'crear'),
(27, 'cot', 'editar-cotizacion'),
(28, 'cam', 'camionetas'),
(29, 'car', 'carga'),
(30, 'cam', 'camionetas'),
(31, 'tiv', 'tipo-inventario'),
(32, 'sbc', 'subclasificacion'),
(33, 'ini', 'inicio-sesion'),
(34, 'sec', 'secciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisSeccionesWeb`
--

CREATE TABLE `SisSeccionesWeb` (
  `tCodSeccion` varchar(15) NOT NULL,
  `tCodPadre` varchar(15) DEFAULT NULL,
  `eCodEstatus` int(11) NOT NULL,
  `ePosicion` int(11) NOT NULL,
  `tNombre` varchar(50) NOT NULL,
  `tBreadcrumb` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisUsuarios`
--

CREATE TABLE `SisUsuarios` (
  `eCodUsuario` int(11) NOT NULL,
  `eCodEntidad` int(11) DEFAULT NULL,
  `tNombre` varchar(50) DEFAULT NULL,
  `tApellidos` varchar(50) DEFAULT NULL,
  `tCorreo` varchar(100) DEFAULT NULL,
  `tPasswordAcceso` varchar(60) DEFAULT NULL,
  `tPasswordOperaciones` varchar(60) DEFAULT NULL,
  `fhFechaCreacion` datetime DEFAULT NULL,
  `eCodEstatus` int(11) DEFAULT NULL,
  `eCodPerfil` int(11) DEFAULT NULL,
  `bAll` int(11) DEFAULT NULL,
  `bPriv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisUsuarios`
--

INSERT INTO `SisUsuarios` (`eCodUsuario`, `eCodEntidad`, `tNombre`, `tApellidos`, `tCorreo`, `tPasswordAcceso`, `tPasswordOperaciones`, `fhFechaCreacion`, `eCodEstatus`, `eCodPerfil`, `bAll`, `bPriv`) VALUES
(1, NULL, 'Mario Ernesto', 'Basurto Medrano', 'babec.soluciones@gmail.com', 'QmFzQDI4OTE=', 'QmFzQDI4OTE=', '2018-07-29 00:00:00', 3, 1, 1, 1),
(2, NULL, 'Administrador', 'Sistema', 'admin@antroentucasa.com', 'YWRtaW4=', 'YWRtaW4=', '2018-07-30 02:00:00', 3, 1, 1, NULL),
(4, NULL, 'Jaime', 'Morales PÃƒÂ©rez', 'jaime@antroentucasa.com.mx', 'YW50cm8xMjM=', 'YW50cm8xMjM=', '2018-11-12 19:28:41', 3, 1, 1, NULL),
(5, NULL, 'Jose Manuel', 'Morales ', 'manolosa86@hotmail.com', 'YW50cm8xMjM=', 'YW50cm8xMjM=', '2018-11-16 22:44:57', 3, 4, 0, NULL),
(6, NULL, 'Mariana ', 'Morales V', '\"mananamorales@gmail.com\" <mananamorales@gmail.com>', 'bWFuYW5hMjAwMg==', 'bWFuYW5hMjAwMg==', '2018-12-13 16:20:42', 7, 3, 0, NULL),
(7, NULL, 'Veronica ', 'Jasso', 'veronica_jp@antroentucasa.com.mx', 'VmludGFnZTMz', 'VmludGFnZTMz', '2018-12-17 14:27:15', 7, 1, 1, NULL),
(8, NULL, 'Stephany', 'V', 'stephany_vc@antroentucasa.com.mx', 'enp6MTEx', 'enp6MTEx', '2019-01-02 14:47:33', 7, 5, 0, NULL),
(9, NULL, 'Lessley', 'Mariz', 'less@antroentucasa.com.mx', 'RGphbnRybzIwMTc=', 'RGphbnRybzIwMTc=', '2019-01-02 14:48:46', 3, 2, 0, NULL),
(10, NULL, 'Danny Boy', 'Alvarez', 'danny@antroentucasa.com.mx', 'UXNjMDAz', 'UXNjMDAz', '2019-01-02 14:50:45', 7, 5, 0, NULL),
(11, NULL, 'Memo', 'Medina', 'memo@antroentucasa.com', 'bWVtbzEyMw==', 'TWVtbzEyMw==', '2019-02-11 13:39:43', 7, 6, 0, NULL),
(12, NULL, 'Karen', 'Vargas', 'karen@antroentucasa.com.mx', 'Q290eTIwMDI=', 'Q290eTIwMDI=', '2019-03-25 12:40:26', 3, 3, 0, NULL),
(13, NULL, 'Virginia', 'BaÃƒÂ±os PÃƒÂ©rez', 'Vico@antroentucasa.com.mx', 'SmF6ejE5NzA=', 'SmF6ejE5NzA=', '2019-03-25 16:34:10', 3, 2, 0, NULL),
(14, NULL, 'Ernesto', 'Hernandez', 'ernesto_antroentucasa@hotmail.com', 'TWFja2llMTk3MA==', 'TWFja2llMTk3MA==', '2019-04-29 12:26:45', 7, 2, 0, NULL),
(15, NULL, 'Ernesto', 'Hernandez', 'ernesto@antroentucasa.com.mx', 'U3VubGl0ZTIwMTc=', 'U3VubGl0ZTIwMTc=', '2019-05-21 11:02:50', 3, 2, 0, NULL),
(16, NULL, 'Ernesto', 'Hernandez', 'ernesto@antroentucasa.com.mx', 'U3UyMDE3', 'U3UyMDE3', '2019-05-21 11:26:05', 7, 2, 1, NULL),
(17, NULL, 'David', 'Mendoza', 'dmendoza@ausa.com.mx', 'QXp1bDM=', 'QXp1bDM=', '2019-06-01 17:50:03', 3, 6, 0, NULL),
(18, NULL, 'monaco', '213', 'monaco@hotmail.com', 'RGFueWJveTE=', 'RGFueWJveTE=', '2019-06-17 11:56:32', 7, 5, 0, NULL),
(19, NULL, 'Melissa', 'AETC', 'melissa@antroentucasa.com.mx', 'VmludGFnZTE5ODA=', 'VmludGFnZTE5ODA=', '2019-06-17 14:37:33', 3, 2, 0, NULL),
(20, NULL, 'Dany', 'Boy', 'dany@antroentucasa.com.mx', 'ZG14NTEy', 'ZG14NTEy', '2019-07-05 00:52:45', 3, 5, 0, NULL),
(21, NULL, 'Maribel', 'Hernandez', 'maribel@antroentucasa.com.mx', 'UXNjMTk4MA==', 'UXNjMTk4MA==', '2019-08-27 10:34:45', 3, 2, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisUsuariosAccesos`
--

CREATE TABLE `SisUsuariosAccesos` (
  `eCodRegistro` int(11) NOT NULL,
  `eCodUsuario` int(11) NOT NULL,
  `fhFecha` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisUsuariosSeccionesAccesos`
--

CREATE TABLE `SisUsuariosSeccionesAccesos` (
  `eCodRegistro` int(11) NOT NULL,
  `eCodUsuario` int(11) NOT NULL,
  `tCodSeccion` varchar(15) NOT NULL,
  `fhFecha` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SisVariables`
--

CREATE TABLE `SisVariables` (
  `eCodVariable` int(11) NOT NULL,
  `tNombre` varchar(50) NOT NULL,
  `tEtiqueta` varchar(50) NOT NULL,
  `tValor` varchar(255) NOT NULL,
  `bMultilinea` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SisVariables`
--

INSERT INTO `SisVariables` (`eCodVariable`, `tNombre`, `tEtiqueta`, `tValor`, `bMultilinea`) VALUES
(1, 'tURL', 'URL del sistema', 'http://192.168.8.103/', NULL),
(2, 'tSistema', 'Nombre del Sistema', 'FussionMD', NULL),
(3, 'tCorreoRemitente', 'E-mail remitente', 'soporte@fussionmd.com', NULL),
(4, 'tServidorCorreo', 'Servidor de e-mail', 'mail.fussionmd.com', NULL),
(5, 'tPasswordCorreo', 'Password correo', 'Bas@2891', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `BitPublicaciones`
--
ALTER TABLE `BitPublicaciones`
  ADD PRIMARY KEY (`eCodPublicacion`);

--
-- Indices de la tabla `CatCaracteristicas`
--
ALTER TABLE `CatCaracteristicas`
  ADD PRIMARY KEY (`eCodCaracteristica`);

--
-- Indices de la tabla `CatEntidades`
--
ALTER TABLE `CatEntidades`
  ADD PRIMARY KEY (`eCodEntidad`);

--
-- Indices de la tabla `CatEstados`
--
ALTER TABLE `CatEstados`
  ADD PRIMARY KEY (`eCodEstado`);

--
-- Indices de la tabla `CatEstatus`
--
ALTER TABLE `CatEstatus`
  ADD PRIMARY KEY (`eCodEstatus`),
  ADD UNIQUE KEY `tCodEstatus_UNIQUE` (`tCodEstatus`);

--
-- Indices de la tabla `CatMarcasVehiculos`
--
ALTER TABLE `CatMarcasVehiculos`
  ADD PRIMARY KEY (`eCodMarca`);

--
-- Indices de la tabla `CatMunicipios`
--
ALTER TABLE `CatMunicipios`
  ADD PRIMARY KEY (`eCodMunicipio`);

--
-- Indices de la tabla `CatTiposSecciones`
--
ALTER TABLE `CatTiposSecciones`
  ADD PRIMARY KEY (`eCodTipoSeccion`);

--
-- Indices de la tabla `CatTiposVehiculos`
--
ALTER TABLE `CatTiposVehiculos`
  ADD PRIMARY KEY (`eCodTipo`);

--
-- Indices de la tabla `SisBotones`
--
ALTER TABLE `SisBotones`
  ADD PRIMARY KEY (`tCodBoton`);

--
-- Indices de la tabla `SisLogs`
--
ALTER TABLE `SisLogs`
  ADD PRIMARY KEY (`eCodEvento`);

--
-- Indices de la tabla `SisPerfiles`
--
ALTER TABLE `SisPerfiles`
  ADD PRIMARY KEY (`eCodPerfil`);

--
-- Indices de la tabla `SisSecciones`
--
ALTER TABLE `SisSecciones`
  ADD PRIMARY KEY (`tCodSeccion`);

--
-- Indices de la tabla `SisSeccionesBotones`
--
ALTER TABLE `SisSeccionesBotones`
  ADD PRIMARY KEY (`eCodRegistro`),
  ADD KEY `tCodPadre_rel_fk_botones_idx` (`tCodPadre`),
  ADD KEY `tCodBoton_rel_fk_botones_idx` (`tCodBoton`);

--
-- Indices de la tabla `SisSeccionesMenusEmergentes`
--
ALTER TABLE `SisSeccionesMenusEmergentes`
  ADD PRIMARY KEY (`eCodMenuEmergente`);

--
-- Indices de la tabla `SisSeccionesPerfiles`
--
ALTER TABLE `SisSeccionesPerfiles`
  ADD KEY `perfil_rel_seccion_fk_idx` (`eCodPerfil`),
  ADD KEY `seccion_rel_perfil_idx` (`tCodSeccion`);

--
-- Indices de la tabla `SisSeccionesReemplazos`
--
ALTER TABLE `SisSeccionesReemplazos`
  ADD PRIMARY KEY (`eCodReemplazo`);

--
-- Indices de la tabla `SisSeccionesWeb`
--
ALTER TABLE `SisSeccionesWeb`
  ADD PRIMARY KEY (`tCodSeccion`);

--
-- Indices de la tabla `SisUsuarios`
--
ALTER TABLE `SisUsuarios`
  ADD PRIMARY KEY (`eCodUsuario`),
  ADD KEY `SisUsuarios_rel_perfiles_fk_idx` (`eCodPerfil`),
  ADD KEY `CatEstatus_rel_usuarios_fk_idx` (`eCodEstatus`);

--
-- Indices de la tabla `SisUsuariosAccesos`
--
ALTER TABLE `SisUsuariosAccesos`
  ADD PRIMARY KEY (`eCodRegistro`);

--
-- Indices de la tabla `SisUsuariosSeccionesAccesos`
--
ALTER TABLE `SisUsuariosSeccionesAccesos`
  ADD PRIMARY KEY (`eCodRegistro`);

--
-- Indices de la tabla `SisVariables`
--
ALTER TABLE `SisVariables`
  ADD PRIMARY KEY (`eCodVariable`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `BitPublicaciones`
--
ALTER TABLE `BitPublicaciones`
  MODIFY `eCodPublicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CatCaracteristicas`
--
ALTER TABLE `CatCaracteristicas`
  MODIFY `eCodCaracteristica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CatEntidades`
--
ALTER TABLE `CatEntidades`
  MODIFY `eCodEntidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CatEstados`
--
ALTER TABLE `CatEstados`
  MODIFY `eCodEstado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CatEstatus`
--
ALTER TABLE `CatEstatus`
  MODIFY `eCodEstatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `CatMarcasVehiculos`
--
ALTER TABLE `CatMarcasVehiculos`
  MODIFY `eCodMarca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CatMunicipios`
--
ALTER TABLE `CatMunicipios`
  MODIFY `eCodMunicipio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CatTiposSecciones`
--
ALTER TABLE `CatTiposSecciones`
  MODIFY `eCodTipoSeccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `CatTiposVehiculos`
--
ALTER TABLE `CatTiposVehiculos`
  MODIFY `eCodTipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SisLogs`
--
ALTER TABLE `SisLogs`
  MODIFY `eCodEvento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SisPerfiles`
--
ALTER TABLE `SisPerfiles`
  MODIFY `eCodPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `SisSeccionesBotones`
--
ALTER TABLE `SisSeccionesBotones`
  MODIFY `eCodRegistro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `SisSeccionesMenusEmergentes`
--
ALTER TABLE `SisSeccionesMenusEmergentes`
  MODIFY `eCodMenuEmergente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `SisSeccionesReemplazos`
--
ALTER TABLE `SisSeccionesReemplazos`
  MODIFY `eCodReemplazo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `SisUsuarios`
--
ALTER TABLE `SisUsuarios`
  MODIFY `eCodUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `SisUsuariosAccesos`
--
ALTER TABLE `SisUsuariosAccesos`
  MODIFY `eCodRegistro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SisUsuariosSeccionesAccesos`
--
ALTER TABLE `SisUsuariosSeccionesAccesos`
  MODIFY `eCodRegistro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SisVariables`
--
ALTER TABLE `SisVariables`
  MODIFY `eCodVariable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `SisSeccionesBotones`
--
ALTER TABLE `SisSeccionesBotones`
  ADD CONSTRAINT `tCodBoton_rel_fk_botones` FOREIGN KEY (`tCodBoton`) REFERENCES `SisBotones` (`tCodBoton`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tCodPadre_rel_fk_botones` FOREIGN KEY (`tCodPadre`) REFERENCES `SisSecciones` (`tCodSeccion`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `SisSeccionesPerfiles`
--
ALTER TABLE `SisSeccionesPerfiles`
  ADD CONSTRAINT `perfil_rel_seccion_fk` FOREIGN KEY (`eCodPerfil`) REFERENCES `SisPerfiles` (`eCodPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `seccion_rel_perfil` FOREIGN KEY (`tCodSeccion`) REFERENCES `SisSecciones` (`tCodSeccion`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
