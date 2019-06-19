-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2019 a las 16:25:32
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bepartners`
--
CREATE DATABASE IF NOT EXISTS `bepartners` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bepartners`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bo_pc_plan`
--

CREATE TABLE `bo_pc_plan` (
  `Id_Plan` int(11) NOT NULL,
  `Id_Product` int(11) NOT NULL,
  `SAP_Product_Code` varchar(45) NOT NULL,
  `Transaction_Code_RCT` varchar(45) NOT NULL,
  `Price` double NOT NULL,
  `Vigency_Days` int(11) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bo_product`
--

CREATE TABLE `bo_product` (
  `Id_Product` int(11) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Id_Product_Type` varchar(6) NOT NULL,
  `ProductCode` varchar(10) NOT NULL,
  `Description` varchar(1024) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bo_product_info`
--

CREATE TABLE `bo_product_info` (
  `Id_Product_Info` int(11) NOT NULL,
  `Id_Product` int(11) NOT NULL,
  `Id_Info_Type_Product` varchar(6) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bo_terms`
--

CREATE TABLE `bo_terms` (
  `Id_Terms` int(11) NOT NULL,
  `Url` varchar(1024) NOT NULL,
  `Version` int(11) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bo_terms`
--

INSERT INTO `bo_terms` (`Id_Terms`, `Url`, `Version`, `Enable`, `Create_Date`, `Last_modify`) VALUES
(3, 'URL Termino 1', 1, b'0', '2019-06-07', '2019-06-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_pc_transaction`
--

CREATE TABLE `mp_pc_transaction` (
  `Id_Transaction` int(11) NOT NULL,
  `Id_Transaction_Public` varchar(8) NOT NULL,
  `Id_Third_Plan` int(11) NOT NULL,
  `Id_Query_Transaction_Public` varchar(45) NOT NULL,
  `Is_Succces` bit(1) NOT NULL,
  `SP_Last_Name` varchar(48) NOT NULL,
  `SP_Id_Type` int(11) NOT NULL,
  `SP_Id_Number` varchar(48) NOT NULL,
  `Json_Result` varchar(1024) DEFAULT NULL,
  `Enable` bit(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_pc_transaction_info`
--

CREATE TABLE `mp_pc_transaction_info` (
  `Id_Transaction_Info` int(11) NOT NULL,
  `Id_Transaction` int(11) NOT NULL,
  `Id_Info_Type_Product_Tra_PC` varchar(6) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `Enbale` bit(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_rct_pc`
--

CREATE TABLE `mp_rct_pc` (
  `Id_Rct_Pc` int(11) NOT NULL,
  `Id_Transaction` int(11) NOT NULL,
  `Transaction_Name` varchar(10) NOT NULL,
  `Executor_User_Doc_Tip` varchar(1) NOT NULL,
  `Executor_User_Id_number` varchar(20) NOT NULL,
  `Entity_Nit` varchar(20) NOT NULL,
  `Transaccion_Number` varchar(45) NOT NULL,
  `Id_Register` varchar(20) NOT NULL,
  `Calif_Facsopt` varchar(10) NOT NULL,
  `Prod_Padre` varchar(10) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_third`
--

CREATE TABLE `mp_third` (
  `Id_Third` int(11) NOT NULL,
  `Id_Third_Public` varchar(60) NOT NULL,
  `Id_Type` varchar(6) NOT NULL,
  `Identification_Number` varchar(45) NOT NULL,
  `Business_Name` varchar(1024) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='		';

--
-- Volcado de datos para la tabla `mp_third`
--

INSERT INTO `mp_third` (`Id_Third`, `Id_Third_Public`, `Id_Type`, `Identification_Number`, `Business_Name`, `Enable`, `Create_Date`, `Last_Modify`) VALUES
(26, 'fd9c5c5c-8ed8-11e9-ad04-e0db559470aa', 'IDENIT', '46230531241', 'Empresa X2', b'1', '2019-06-14', '2019-06-14'),
(27, '9c438325-9110-11e9-bff0-e0db559470aa', 'IDENIT', '22230531241', 'Empresa X2', b'1', '2019-06-17', '2019-06-17'),
(28, 'c43c86eb-9132-11e9-bff0-e0db559470aa', 'IDENIT', '223410531241', 'Empresa X2', b'1', '2019-06-17', '2019-06-17'),
(29, '741e359d-9152-11e9-bff0-e0db559470aa', 'IDENIT', '2234123453241', 'ASAP X', b'1', '2019-06-17', '2019-06-17'),
(30, '5cf548fe-9153-11e9-bff0-e0db559470aa', 'IDENIT', '28667453241', 'ASAP X', b'1', '2019-06-17', '2019-06-17'),
(31, '93f242ec-9153-11e9-bff0-e0db559470aa', 'IDENIT', '286658641', 'ASAP X', b'1', '2019-06-17', '2019-06-17'),
(32, '64bcb6ab-91d6-11e9-b518-e0db559470aa', 'IDENIT', '3456655621', 'ASAP X', b'1', '2019-06-18', '2019-06-18'),
(33, '2281c27a-91d8-11e9-b518-e0db559470aa', 'IDENIT', '3434562321', 'ASAP X', b'1', '2019-06-18', '2019-06-18'),
(34, 'bf5f22a2-920b-11e9-b518-e0db559470aa', 'IDENIT', '340100121', 'ASAP X', b'1', '2019-06-18', '2019-06-18'),
(35, 'b9d115da-920c-11e9-b518-e0db559470aa', 'IDENIT', '300101121', 'ASAP X', b'1', '2019-06-18', '2019-06-18'),
(36, '68cdaf9f-920d-11e9-b518-e0db559470aa', 'IDENIT', '011101101121', 'ASAP X', b'1', '2019-06-18', '2019-06-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_third_info`
--

CREATE TABLE `mp_third_info` (
  `Id_Third_Info` int(11) NOT NULL,
  `Id_Third` int(11) NOT NULL,
  `Id_Info_Type_Third` varchar(6) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';

--
-- Volcado de datos para la tabla `mp_third_info`
--

INSERT INTO `mp_third_info` (`Id_Third_Info`, `Id_Third`, `Id_Info_Type_Third`, `Value`, `Enable`, `Create_Date`, `Last_Modify`) VALUES
(27, 26, '301006', '102002', b'1', '2019-06-14', '2019-06-14'),
(28, 26, '301007', '105001', b'1', '2019-06-14', '2019-06-14'),
(29, 27, '301006', '102002', b'1', '2019-06-17', '2019-06-17'),
(30, 27, '301007', '105001', b'1', '2019-06-17', '2019-06-17'),
(31, 28, '301006', '102002', b'1', '2019-06-17', '2019-06-17'),
(32, 28, '301007', '105001', b'1', '2019-06-17', '2019-06-17'),
(33, 29, '301006', '102002', b'1', '2019-06-17', '2019-06-17'),
(34, 29, '301007', '105001', b'1', '2019-06-17', '2019-06-17'),
(35, 30, '301006', '102002', b'1', '2019-06-17', '2019-06-17'),
(36, 30, '301007', '105001', b'1', '2019-06-17', '2019-06-17'),
(37, 31, '301006', '102002', b'1', '2019-06-17', '2019-06-17'),
(38, 31, '301007', '105001', b'1', '2019-06-17', '2019-06-17'),
(39, 32, '301006', '102002', b'1', '2019-06-18', '2019-06-18'),
(40, 32, '301007', '105001', b'1', '2019-06-18', '2019-06-18'),
(41, 33, '301006', '102002', b'1', '2019-06-18', '2019-06-18'),
(42, 33, '301007', '105001', b'1', '2019-06-18', '2019-06-18'),
(43, 34, '301006', '102002', b'1', '2019-06-18', '2019-06-18'),
(44, 34, '301007', '105001', b'1', '2019-06-18', '2019-06-18'),
(45, 35, '301006', '102002', b'1', '2019-06-18', '2019-06-18'),
(46, 35, '301007', '105001', b'1', '2019-06-18', '2019-06-18'),
(47, 36, '301006', '102002', b'1', '2019-06-18', '2019-06-18'),
(48, 36, '301007', '105001', b'1', '2019-06-18', '2019-06-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_third_pc_plan`
--

CREATE TABLE `mp_third_pc_plan` (
  `Id_Third_Plan` int(11) NOT NULL,
  `Id_Third_Plant_Public` varchar(8) NOT NULL,
  `Id_Plan` int(11) NOT NULL,
  `Id_Third` int(11) NOT NULL,
  `Id_PAYU` varchar(45) NOT NULL,
  `Coupon` varchar(10) NOT NULL,
  `Price` double NOT NULL,
  `Sale_Value` double NOT NULL,
  `Total_Price` double NOT NULL,
  `End_Date` date NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Total_Queries` int(11) NOT NULL,
  `Total_Used_Queries` int(11) NOT NULL,
  `Responsable` varchar(128) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_user`
--

CREATE TABLE `mp_user` (
  `Id_User` int(11) NOT NULL,
  `Id_User_Public` varchar(60) NOT NULL,
  `Id_Type` varchar(6) NOT NULL,
  `Identification_Number` varchar(45) NOT NULL,
  `Name` varchar(48) NOT NULL,
  `Last_Name` varchar(48) NOT NULL,
  `Email` varchar(128) NOT NULL,
  `Phone` varchar(24) NOT NULL,
  `Profile_Picture` varchar(124) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mp_user`
--

INSERT INTO `mp_user` (`Id_User`, `Id_User_Public`, `Id_Type`, `Identification_Number`, `Name`, `Last_Name`, `Email`, `Phone`, `Profile_Picture`, `Enable`, `Create_Date`, `Last_Date`) VALUES
(17, 'fdcbbb31-8ed8-11e9-ad04-e0db559470aa', 'IDENIT', '5316540241', 'Steven Camilo', 'Pacheco', 'steven.ju@gmail.com', '617345648', 'foto url', b'1', '2019-06-14', '2019-06-14'),
(27, '50d6292b-911d-11e9-bff0-e0db559470aa', 'IDENIT', '09980241', 'Steven Camilo', 'Pacheco', 'steven.ju@gmail.com', '09984648', 'foto url', b'1', '2019-06-17', '2019-06-17'),
(28, 'c46e460c-9132-11e9-bff0-e0db559470aa', 'IDENIT', '453980241', 'Steven Camilo', 'Pacheco', 'steven.ju@gmail.com', '23424648', 'foto url', b'1', '2019-06-17', '2019-06-17'),
(35, '7458125e-9152-11e9-bff0-e0db559470aa', 'IDENIT', '4534536441', 'Carlos', 'Bill', 'steven.ju@gmail.com', '23456448', 'foto url', b'1', '2019-06-17', '2019-06-17'),
(36, '5d393bf3-9153-11e9-bff0-e0db559470aa', 'IDENIT', '3457636441', 'Carlos', 'Bill', 'steven.ju@gmail.com', '23456448', 'foto url', b'1', '2019-06-17', '2019-06-17'),
(37, '942098bb-9153-11e9-bff0-e0db559470aa', 'IDENIT', '34578541', 'Carlos', 'Bill', 'steven.ju@gmail.com', '23456448', 'foto url', b'1', '2019-06-17', '2019-06-17'),
(38, '6541bd64-91d6-11e9-b518-e0db559470aa', 'IDENIT', '3987567541', 'Carlos', 'Bill', 'steven.ju@gmail.com', '23456448', 'foto url', b'1', '2019-06-18', '2019-06-18'),
(39, '22a65b7a-91d8-11e9-b518-e0db559470aa', 'IDENIT', '37456767541', 'Carlos', 'Bill', 'steven.ju@gmail.com', '23456448', 'foto url', b'1', '2019-06-18', '2019-06-18'),
(40, 'bf8e57ef-920b-11e9-b518-e0db559470aa', 'IDENIT', '370110141', 'Carlos', 'Bill', 'steven.ju@gmail.com', '23456448', 'foto url', b'1', '2019-06-18', '2019-06-18'),
(41, 'b9eccee7-920c-11e9-b518-e0db559470aa', 'IDENIT', '310010141', 'Carlos', 'Bill', 'steven.ju@gmail.com', '23456448', 'foto url', b'1', '2019-06-18', '2019-06-18'),
(42, '69195d11-920d-11e9-b518-e0db559470aa', 'IDENIT', '1001010141', 'Carlos', 'Bill', 'steven.ju@gmail.com', '23456448', 'foto url', b'1', '2019-06-18', '2019-06-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_user_info`
--

CREATE TABLE `mp_user_info` (
  `Id_Use_Info` int(11) NOT NULL,
  `Id_User` int(11) NOT NULL,
  `Id_Info_Type_User` varchar(6) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mp_user_info`
--

INSERT INTO `mp_user_info` (`Id_Use_Info`, `Id_User`, `Id_Info_Type_User`, `Value`, `Enable`, `Create_Date`, `Last_Modify`) VALUES
(23, 17, '201001', '102002', b'1', '2019-06-14', '2019-06-14'),
(24, 17, '201002', '103001', b'1', '2019-06-14', '2019-06-14'),
(25, 27, '201001', '102002', b'1', '2019-06-17', '2019-06-17'),
(26, 27, '201002', '103001', b'1', '2019-06-17', '2019-06-17'),
(27, 28, '201001', '102002', b'1', '2019-06-17', '2019-06-17'),
(28, 28, '201002', '103001', b'1', '2019-06-17', '2019-06-17'),
(29, 35, '201001', '102002', b'1', '2019-06-17', '2019-06-17'),
(30, 35, '201002', '103001', b'1', '2019-06-17', '2019-06-17'),
(31, 36, '201001', '102002', b'1', '2019-06-17', '2019-06-17'),
(32, 36, '201002', '103001', b'1', '2019-06-17', '2019-06-17'),
(33, 37, '201001', '102002', b'1', '2019-06-17', '2019-06-17'),
(34, 37, '201002', '103001', b'1', '2019-06-17', '2019-06-17'),
(35, 38, '201001', '102002', b'1', '2019-06-18', '2019-06-18'),
(36, 38, '201002', '103001', b'1', '2019-06-18', '2019-06-18'),
(37, 39, '201001', '102002', b'1', '2019-06-18', '2019-06-18'),
(38, 39, '201002', '103001', b'1', '2019-06-18', '2019-06-18'),
(39, 40, '201001', '102002', b'1', '2019-06-18', '2019-06-18'),
(40, 40, '201002', '103001', b'1', '2019-06-18', '2019-06-18'),
(41, 41, '201001', '102002', b'1', '2019-06-18', '2019-06-18'),
(42, 41, '201002', '103001', b'1', '2019-06-18', '2019-06-18'),
(43, 42, '201001', '102002', b'1', '2019-06-18', '2019-06-18'),
(44, 42, '201002', '103001', b'1', '2019-06-18', '2019-06-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_user_third`
--

CREATE TABLE `mp_user_third` (
  `Id_User_Third` int(11) NOT NULL,
  `Id_User` int(11) NOT NULL,
  `Id_Third` int(11) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mp_user_third`
--

INSERT INTO `mp_user_third` (`Id_User_Third`, `Id_User`, `Id_Third`, `Enable`, `Create_Date`, `Last_Modify`) VALUES
(6, 17, 26, b'0', '2019-06-14', '2019-06-14'),
(7, 28, 28, b'0', '2019-06-17', '2019-06-17'),
(8, 38, 32, b'0', '2019-06-18', '2019-06-18'),
(9, 39, 33, b'0', '2019-06-18', '2019-06-18'),
(10, 40, 34, b'0', '2019-06-18', '2019-06-18'),
(11, 41, 35, b'0', '2019-06-18', '2019-06-18'),
(12, 42, 36, b'0', '2019-06-18', '2019-06-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_user_third_terms`
--

CREATE TABLE `mp_user_third_terms` (
  `Id_User_Third_Terms` int(11) NOT NULL,
  `Id_User_Third` int(11) NOT NULL,
  `Id_Terms` int(11) NOT NULL,
  `Enable` bit(1) DEFAULT NULL,
  `Create_Date` date DEFAULT NULL,
  `Last_Modify` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mp_user_third_terms`
--

INSERT INTO `mp_user_third_terms` (`Id_User_Third_Terms`, `Id_User_Third`, `Id_Terms`, `Enable`, `Create_Date`, `Last_Modify`) VALUES
(5, 6, 3, b'1', '2019-06-14', '2019-06-14'),
(6, 7, 3, b'1', '2019-06-17', '2019-06-17'),
(7, 8, 3, b'1', '2019-06-18', '2019-06-18'),
(8, 9, 3, b'1', '2019-06-18', '2019-06-18'),
(9, 10, 3, b'1', '2019-06-18', '2019-06-18'),
(10, 11, 3, b'1', '2019-06-18', '2019-06-18'),
(11, 12, 3, b'1', '2019-06-18', '2019-06-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_catalog`
--

CREATE TABLE `u_catalog` (
  `Id_Catalog` int(11) NOT NULL,
  `CatalogName` varchar(45) NOT NULL,
  `Description` varchar(1024) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `u_catalog`
--

INSERT INTO `u_catalog` (`Id_Catalog`, `CatalogName`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) VALUES
(101, 'Catalog Documents Tip', 'Se registran los tipos de documento', b'1', '2019-06-12', '2019-06-12'),
(102, 'Catalog Respinse List', 'Se registran las posibles respuestas de listas restrictivas', b'1', '2019-06-12', '2019-06-12'),
(103, 'Catalog Respinse List', 'Se registran las posibles respuestas de listas restrictivas', b'1', '2019-06-12', '2019-06-12'),
(104, 'Catalog Tipos Categorias', 'Se registran los tipos de categorias para el arbol de catalogos', b'1', '2019-06-12', '2019-06-12'),
(105, 'Catalog Respinse RUES', 'Se registran las posibles respuestas de Rues', b'1', '2019-06-12', '2019-06-12'),
(201, 'Catalog Info Basic User', 'Se registra la informacion basica de usuario', b'1', '2019-06-12', '2019-06-12'),
(301, 'Catalog Info Third', 'Se registran los datos adicionales de Third', b'1', '2019-06-12', '2019-06-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_category`
--

CREATE TABLE `u_category` (
  `Id_Category` int(11) NOT NULL,
  `CategoryName` varchar(45) NOT NULL,
  `Id_Category_Type` varchar(6) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `CreateDate` date NOT NULL,
  `LastModify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';

--
-- Volcado de datos para la tabla `u_category`
--

INSERT INTO `u_category` (`Id_Category`, `CategoryName`, `Id_Category_Type`, `Enable`, `CreateDate`, `LastModify`) VALUES
(5, 'Antioquia', '102002', b'1', '2019-06-12', '2019-06-12'),
(8, 'Ataltico', '102002', b'1', '2019-06-12', '2019-06-12'),
(11, 'Bogota', '102002', b'1', '2019-06-12', '2019-06-12'),
(90, 'Colombia', '102001', b'1', '2019-06-12', '2019-06-12'),
(5001, 'Medellin', '102003', b'1', '2019-06-12', '2019-06-12'),
(5002, 'Abejoral', '102003', b'1', '2019-06-12', '2019-06-12'),
(5021, 'Alejandria', '102003', b'1', '2019-06-12', '2019-06-12'),
(8001, 'Barranquilla', '102003', b'1', '2019-06-12', '2019-06-12'),
(8078, 'Barranca', '102003', b'1', '2019-06-12', '2019-06-12'),
(11001, 'Bogota', '102003', b'1', '2019-06-12', '2019-06-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_item_catalog`
--

CREATE TABLE `u_item_catalog` (
  `Id_Item_Catalog` int(11) NOT NULL,
  `Id_Item` varchar(6) NOT NULL,
  `Id_Catalog` int(11) NOT NULL,
  `Item_Name` varchar(1024) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `u_item_catalog`
--

INSERT INTO `u_item_catalog` (`Id_Item_Catalog`, `Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) VALUES
(35, '101001', 101, 'Cedula', b'1', '2019-05-30', '2019-05-30'),
(36, '101002', 101, 'Nit', b'1', '2019-05-30', '2019-05-30'),
(37, '101003', 101, 'Cedula Extrangeria', b'1', '2019-05-30', '2019-05-30'),
(38, '102001', 102, 'Reportado', b'1', '2019-05-30', '2019-05-30'),
(39, '102002', 102, 'No Reportado', b'1', '2019-05-30', '2019-05-30'),
(40, '102003', 102, 'Error consulta Listas', b'1', '2019-05-30', '2019-05-30'),
(41, '103001', 103, 'Aprobado', b'1', '2019-05-30', '2019-05-30'),
(42, '103002', 103, 'Rechazado', b'1', '2019-05-30', '2019-05-30'),
(43, '103003', 103, 'No existe identificacion', b'1', '2019-05-30', '2019-05-30'),
(44, '103005', 103, 'No Coinciden Datos', b'1', '2019-05-30', '2019-05-30'),
(45, '103006', 103, 'Valido con documento no vigente', b'1', '2019-05-30', '2019-05-30'),
(46, '104001', 104, 'Pais', b'1', '2019-05-30', '2019-05-30'),
(47, '104002', 104, 'Departamento', b'1', '2019-05-30', '2019-05-30'),
(48, '104003', 104, 'Ciudad', b'1', '2019-05-30', '2019-05-30'),
(49, '105001', 105, 'Aprobado', b'1', '2019-05-30', '2019-05-30'),
(50, '105002', 105, 'Rechazado', b'1', '2019-05-30', '2019-05-30'),
(51, '105003', 105, 'Error consulta', b'1', '2019-05-30', '2019-05-30'),
(52, '201001', 201, 'Validate List', b'1', '2019-05-30', '2019-05-30'),
(53, '201002', 201, 'Validate Evidente', b'1', '2019-05-30', '2019-05-30'),
(54, '301001', 301, 'Razon social', b'1', '2019-05-30', '2019-05-30'),
(55, '301002', 301, 'Mail Facturacion', b'1', '2019-05-30', '2019-05-30'),
(56, '301003', 301, 'Direccion Correspondencia', b'1', '2019-05-30', '2019-05-30'),
(57, '301004', 301, 'Ciudad', b'1', '2019-05-30', '2019-05-30'),
(58, '301005', 301, 'Departamento', b'1', '2019-05-30', '2019-05-30'),
(59, '301006', 301, 'Validate_List', b'1', '2019-05-30', '2019-05-30'),
(60, '301007', 301, 'Validate_Rues', b'1', '2019-05-30', '2019-05-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_tree`
--

CREATE TABLE `u_tree` (
  `Id_Tree` int(11) NOT NULL,
  `TreeName` varchar(45) NOT NULL,
  `Description` varchar(128) DEFAULT NULL,
  `Enable` bit(1) NOT NULL,
  `CreateDate` date NOT NULL,
  `LastModify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `u_tree`
--

INSERT INTO `u_tree` (`Id_Tree`, `TreeName`, `Description`, `Enable`, `CreateDate`, `LastModify`) VALUES
(9, 'Region', 'Arbol de regiones', b'1', '2019-06-12', '2019-06-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_tree_category`
--

CREATE TABLE `u_tree_category` (
  `Id_Treee_Catetogy` int(11) NOT NULL,
  `Id_Tree` int(11) NOT NULL,
  `Id_ParentCategory` int(11) NOT NULL,
  `Id_ChildCategory` int(11) DEFAULT NULL,
  `Enable` bit(1) NOT NULL,
  `CreateDate` date NOT NULL,
  `LastaModify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `u_tree_category`
--

INSERT INTO `u_tree_category` (`Id_Treee_Catetogy`, `Id_Tree`, `Id_ParentCategory`, `Id_ChildCategory`, `Enable`, `CreateDate`, `LastaModify`) VALUES
(1233, 9, 90, 5, b'1', '2019-06-12', '2019-06-12'),
(1234, 9, 90, 8, b'1', '2019-06-12', '2019-06-12'),
(1235, 9, 90, 11, b'1', '2019-06-12', '2019-06-12'),
(1236, 9, 5, 5001, b'1', '2019-06-12', '2019-06-12'),
(1237, 9, 5, 5002, b'1', '2019-06-12', '2019-06-12'),
(1238, 9, 5, 5021, b'1', '2019-06-12', '2019-06-12'),
(1239, 9, 8, 8001, b'1', '2019-06-12', '2019-06-12'),
(1240, 9, 8, 8078, b'1', '2019-06-12', '2019-06-12'),
(1241, 9, 11, 11001, b'1', '2019-06-12', '2019-06-12');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bo_pc_plan`
--
ALTER TABLE `bo_pc_plan`
  ADD PRIMARY KEY (`Id_Plan`),
  ADD KEY `fk_BO_Planes_BO_Product1_idx` (`Id_Product`);

--
-- Indices de la tabla `bo_product`
--
ALTER TABLE `bo_product`
  ADD PRIMARY KEY (`Id_Product`);

--
-- Indices de la tabla `bo_product_info`
--
ALTER TABLE `bo_product_info`
  ADD PRIMARY KEY (`Id_Product_Info`),
  ADD KEY `fk_BO_Product_Info_BO_Product1_idx` (`Id_Product`);

--
-- Indices de la tabla `bo_terms`
--
ALTER TABLE `bo_terms`
  ADD PRIMARY KEY (`Id_Terms`);

--
-- Indices de la tabla `mp_pc_transaction`
--
ALTER TABLE `mp_pc_transaction`
  ADD PRIMARY KEY (`Id_Transaction`),
  ADD KEY `fk_MP_Query_Transaction_MP_Third_Product1_idx` (`Id_Third_Plan`);

--
-- Indices de la tabla `mp_pc_transaction_info`
--
ALTER TABLE `mp_pc_transaction_info`
  ADD PRIMARY KEY (`Id_Transaction_Info`),
  ADD KEY `fk_MP_Item_transaction_MP_Query_Transaction1_idx` (`Id_Transaction`);

--
-- Indices de la tabla `mp_rct_pc`
--
ALTER TABLE `mp_rct_pc`
  ADD PRIMARY KEY (`Id_Rct_Pc`),
  ADD KEY `FK_PC_Transaction_RCT_idx` (`Id_Transaction`);

--
-- Indices de la tabla `mp_third`
--
ALTER TABLE `mp_third`
  ADD PRIMARY KEY (`Id_Third`),
  ADD UNIQUE KEY `index2` (`Identification_Number`,`Id_Type`),
  ADD KEY `index3` (`Id_Third_Public`);

--
-- Indices de la tabla `mp_third_info`
--
ALTER TABLE `mp_third_info`
  ADD PRIMARY KEY (`Id_Third_Info`),
  ADD KEY `FK_MP_Third_MP_ThirdInf_idx` (`Id_Third`);

--
-- Indices de la tabla `mp_third_pc_plan`
--
ALTER TABLE `mp_third_pc_plan`
  ADD PRIMARY KEY (`Id_Third_Plan`),
  ADD KEY `fk_MP_Third_Product_BO_Plans1_idx` (`Id_Plan`),
  ADD KEY `fk_MP_Third_Product_MP_User_Third1_idx` (`Id_Third`);

--
-- Indices de la tabla `mp_user`
--
ALTER TABLE `mp_user`
  ADD PRIMARY KEY (`Id_User`),
  ADD UNIQUE KEY `index2` (`Id_Type`,`Identification_Number`),
  ADD KEY `index3` (`Id_User_Public`);

--
-- Indices de la tabla `mp_user_info`
--
ALTER TABLE `mp_user_info`
  ADD PRIMARY KEY (`Id_Use_Info`),
  ADD KEY `FK_MP_U_UserInfo_MP_U_User_idx` (`Id_User`);

--
-- Indices de la tabla `mp_user_third`
--
ALTER TABLE `mp_user_third`
  ADD PRIMARY KEY (`Id_User_Third`),
  ADD UNIQUE KEY `Const_User_Third` (`Id_User`,`Id_Third`),
  ADD KEY `FK_MP_Third_MP_User_idx` (`Id_User`),
  ADD KEY `FK_MP_Third_MP_User_idx1` (`Id_Third`);

--
-- Indices de la tabla `mp_user_third_terms`
--
ALTER TABLE `mp_user_third_terms`
  ADD PRIMARY KEY (`Id_User_Third_Terms`),
  ADD KEY `fk_MP_USER_THIRD_TERMS_MP_USER_THIRD1_idx` (`Id_User_Third`),
  ADD KEY `fk_MP_USER_THIRD_TERMS_BO_TERMS1_idx` (`Id_Terms`);

--
-- Indices de la tabla `u_catalog`
--
ALTER TABLE `u_catalog`
  ADD PRIMARY KEY (`Id_Catalog`);

--
-- Indices de la tabla `u_category`
--
ALTER TABLE `u_category`
  ADD PRIMARY KEY (`Id_Category`);

--
-- Indices de la tabla `u_item_catalog`
--
ALTER TABLE `u_item_catalog`
  ADD PRIMARY KEY (`Id_Item_Catalog`),
  ADD KEY `fk_Item_Catalog_U_Catalog_idx` (`Id_Catalog`);

--
-- Indices de la tabla `u_tree`
--
ALTER TABLE `u_tree`
  ADD PRIMARY KEY (`Id_Tree`);

--
-- Indices de la tabla `u_tree_category`
--
ALTER TABLE `u_tree_category`
  ADD PRIMARY KEY (`Id_Treee_Catetogy`),
  ADD KEY `U_TreeCatalog_U_Tree_idx` (`Id_Tree`),
  ADD KEY `U_Tree_ParentCategory_idx` (`Id_ParentCategory`),
  ADD KEY `U_Tree_ChildCategory_idx` (`Id_ChildCategory`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bo_pc_plan`
--
ALTER TABLE `bo_pc_plan`
  MODIFY `Id_Plan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bo_product`
--
ALTER TABLE `bo_product`
  MODIFY `Id_Product` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bo_product_info`
--
ALTER TABLE `bo_product_info`
  MODIFY `Id_Product_Info` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bo_terms`
--
ALTER TABLE `bo_terms`
  MODIFY `Id_Terms` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mp_pc_transaction`
--
ALTER TABLE `mp_pc_transaction`
  MODIFY `Id_Transaction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mp_pc_transaction_info`
--
ALTER TABLE `mp_pc_transaction_info`
  MODIFY `Id_Transaction_Info` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mp_rct_pc`
--
ALTER TABLE `mp_rct_pc`
  MODIFY `Id_Rct_Pc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mp_third`
--
ALTER TABLE `mp_third`
  MODIFY `Id_Third` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `mp_third_info`
--
ALTER TABLE `mp_third_info`
  MODIFY `Id_Third_Info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `mp_third_pc_plan`
--
ALTER TABLE `mp_third_pc_plan`
  MODIFY `Id_Third_Plan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mp_user`
--
ALTER TABLE `mp_user`
  MODIFY `Id_User` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `mp_user_info`
--
ALTER TABLE `mp_user_info`
  MODIFY `Id_Use_Info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `mp_user_third`
--
ALTER TABLE `mp_user_third`
  MODIFY `Id_User_Third` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `mp_user_third_terms`
--
ALTER TABLE `mp_user_third_terms`
  MODIFY `Id_User_Third_Terms` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `u_item_catalog`
--
ALTER TABLE `u_item_catalog`
  MODIFY `Id_Item_Catalog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `u_tree`
--
ALTER TABLE `u_tree`
  MODIFY `Id_Tree` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `u_tree_category`
--
ALTER TABLE `u_tree_category`
  MODIFY `Id_Treee_Catetogy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1242;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bo_pc_plan`
--
ALTER TABLE `bo_pc_plan`
  ADD CONSTRAINT `fk_BO_Planes_BO_Product1` FOREIGN KEY (`Id_Product`) REFERENCES `bo_product` (`Id_Product`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bo_product_info`
--
ALTER TABLE `bo_product_info`
  ADD CONSTRAINT `fk_BO_Product_Info_BO_Product1` FOREIGN KEY (`Id_Product`) REFERENCES `bo_product` (`Id_Product`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mp_pc_transaction`
--
ALTER TABLE `mp_pc_transaction`
  ADD CONSTRAINT `fk_MP_Query_Transaction_MP_Third_Product1` FOREIGN KEY (`Id_Third_Plan`) REFERENCES `mp_third_pc_plan` (`Id_Third_Plan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mp_pc_transaction_info`
--
ALTER TABLE `mp_pc_transaction_info`
  ADD CONSTRAINT `fk_MP_Item_transaction_MP_Query_Transaction1` FOREIGN KEY (`Id_Transaction`) REFERENCES `mp_pc_transaction` (`Id_Transaction`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mp_rct_pc`
--
ALTER TABLE `mp_rct_pc`
  ADD CONSTRAINT `FK_PC_Transaction_RCT` FOREIGN KEY (`Id_Transaction`) REFERENCES `mp_pc_transaction` (`Id_Transaction`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mp_third_info`
--
ALTER TABLE `mp_third_info`
  ADD CONSTRAINT `FK_MP_Third_MP_ThirdInf` FOREIGN KEY (`Id_Third`) REFERENCES `mp_third` (`Id_Third`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mp_third_pc_plan`
--
ALTER TABLE `mp_third_pc_plan`
  ADD CONSTRAINT `fk_MP_Third_Product_BO_Plans1` FOREIGN KEY (`Id_Plan`) REFERENCES `bo_pc_plan` (`Id_Plan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_MP_Third_Product_MP_User_Third1` FOREIGN KEY (`Id_Third`) REFERENCES `mp_third` (`Id_Third`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mp_user_info`
--
ALTER TABLE `mp_user_info`
  ADD CONSTRAINT `FK_MP_U_UserInfo_MP_U_User` FOREIGN KEY (`Id_User`) REFERENCES `mp_user` (`Id_User`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mp_user_third`
--
ALTER TABLE `mp_user_third`
  ADD CONSTRAINT `FK_MP_Third_MP_User` FOREIGN KEY (`Id_Third`) REFERENCES `mp_third` (`Id_Third`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_MP_User_MP_Third` FOREIGN KEY (`Id_User`) REFERENCES `mp_user` (`Id_User`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mp_user_third_terms`
--
ALTER TABLE `mp_user_third_terms`
  ADD CONSTRAINT `fk_MP_USER_THIRD_TERMS_BO_TERMS1` FOREIGN KEY (`Id_Terms`) REFERENCES `bo_terms` (`Id_Terms`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_MP_USER_THIRD_TERMS_MP_USER_THIRD1` FOREIGN KEY (`Id_User_Third`) REFERENCES `mp_user_third` (`Id_User_Third`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `u_item_catalog`
--
ALTER TABLE `u_item_catalog`
  ADD CONSTRAINT `fk_Item_Catalog_U_Catalog` FOREIGN KEY (`Id_Catalog`) REFERENCES `u_catalog` (`Id_Catalog`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `u_tree_category`
--
ALTER TABLE `u_tree_category`
  ADD CONSTRAINT `U_TreeCatalog_U_Tree` FOREIGN KEY (`Id_Tree`) REFERENCES `u_tree` (`Id_Tree`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `U_Tree_ChildCategory` FOREIGN KEY (`Id_ChildCategory`) REFERENCES `u_category` (`Id_Category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `U_Tree_ParentCategory` FOREIGN KEY (`Id_ParentCategory`) REFERENCES `u_category` (`Id_Category`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `bepartnerslog`
--
CREATE DATABASE IF NOT EXISTS `bepartnerslog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bepartnerslog`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_log_transacion_user`
--

CREATE TABLE `mp_log_transacion_user` (
  `Id_Log_Transaction_User` int(11) NOT NULL,
  `Id_Third_Public` varchar(60) DEFAULT NULL,
  `Id_User_Public` varchar(60) DEFAULT NULL,
  `Id_Reason_Type` varchar(6) NOT NULL,
  `Date_Time_Register` datetime NOT NULL,
  `Id_Status` varchar(6) NOT NULL,
  `Id_Log_Transaction_WS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mp_log_transacion_user`
--

INSERT INTO `mp_log_transacion_user` (`Id_Log_Transaction_User`, `Id_Third_Public`, `Id_User_Public`, `Id_Reason_Type`, `Date_Time_Register`, `Id_Status`, `Id_Log_Transaction_WS`) VALUES
(12, 'fd9c5c5c-8ed8-11e9-ad04-e0db559470aa', 'fdcbbb31-8ed8-11e9-ad04-e0db559470aa', '401001', '2019-06-17 00:00:00', '402002', NULL),
(13, '741e359d-9152-11e9-bff0-e0db559470aa', '7458125e-9152-11e9-bff0-e0db559470aa', '401001', '2019-06-17 00:00:00', '402001', NULL),
(14, '5cf548fe-9153-11e9-bff0-e0db559470aa', '5d393bf3-9153-11e9-bff0-e0db559470aa', '401001', '2019-06-17 00:00:00', '402001', NULL),
(15, '93f242ec-9153-11e9-bff0-e0db559470aa', '942098bb-9153-11e9-bff0-e0db559470aa', '401001', '2019-06-17 00:00:00', '402001', NULL),
(16, '64bcb6ab-91d6-11e9-b518-e0db559470aa', '6541bd64-91d6-11e9-b518-e0db559470aa', '401001', '2019-06-18 00:00:00', '402001', NULL),
(17, '2281c27a-91d8-11e9-b518-e0db559470aa', '22a65b7a-91d8-11e9-b518-e0db559470aa', '401001', '2019-06-18 00:00:00', '402001', NULL),
(18, 'bf5f22a2-920b-11e9-b518-e0db559470aa', 'bf8e57ef-920b-11e9-b518-e0db559470aa', '401001', '2019-06-18 00:00:00', '402001', NULL),
(19, 'b9d115da-920c-11e9-b518-e0db559470aa', 'b9eccee7-920c-11e9-b518-e0db559470aa', '401001', '2019-06-18 00:00:00', '402001', NULL),
(20, '68cdaf9f-920d-11e9-b518-e0db559470aa', '69195d11-920d-11e9-b518-e0db559470aa', '401001', '2019-06-18 00:00:00', '402001', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_log_transaction_user_info`
--

CREATE TABLE `mp_log_transaction_user_info` (
  `Id_Log_Transaction_User_Info` int(11) NOT NULL,
  `Id_Log_Transaction_User` int(11) NOT NULL,
  `Value` mediumtext NOT NULL,
  `Transaction_Type` varchar(6) NOT NULL,
  `Create_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mp_log_transaction_user_info`
--

INSERT INTO `mp_log_transaction_user_info` (`Id_Log_Transaction_User_Info`, `Id_Log_Transaction_User`, `Value`, `Transaction_Type`, `Create_Date`) VALUES
(5, 12, '{JSON A}', '403002', '2019-06-17'),
(6, 12, '{JSON B}', '403003', '2019-06-17'),
(7, 13, 'IDENIT', '403004', '2019-06-17'),
(8, 13, '4534536441', '403003', '2019-06-17'),
(9, 13, 'IDENIT', '403004', '2019-06-17'),
(10, 13, '2234123453241', '403003', '2019-06-17'),
(11, 14, 'IDENIT', '403004', '2019-06-17'),
(12, 14, '3457636441', '403003', '2019-06-17'),
(13, 14, 'IDENIT', '403004', '2019-06-17'),
(14, 14, '28667453241', '403003', '2019-06-17'),
(15, 15, 'IDENIT', '403004', '2019-06-17'),
(16, 15, '34578541', '403003', '2019-06-17'),
(17, 15, 'IDENIT', '403004', '2019-06-17'),
(18, 15, '286658641', '403003', '2019-06-17'),
(19, 16, '{\"user\":{\"vIdUserPublic\":\"6541bd64-91d6-11e9-b518-e0db559470aa\",\"vIdType\":\"IDENIT\",\"vIdentificationNumber\":\"3987567541\",\"vName\":\"Carlos\",\"vLastName\":\"Bill\",\"vEmail\":\"steven.ju@gmail.com\",\"vPhone\":\"23456448\",\"vProfilePicture\":\"foto url\",\"vEnable\":1},\"userInfo\":[{\"vIdUserPublic\":\"\",\"vIdInfoTypeUser\":\"201001\",\"vValue\":\"102002\",\"vEnable\":1},{\"vIdUserPublic\":\"\",\"vIdInfoTypeUser\":\"201002\",\"vValue\":\"103001\",\"vEnable\":1}],\"third\":{\"vIdThirdPublic\":\"64bcb6ab-91d6-11e9-b518-e0db559470aa\",\"vIdType\":\"IDENIT\",\"vIdentificationNumber\":\"3456655621\",\"vBusinessName\":\"ASAP X\",\"vEnable\":1,\"idThird\":null},\"thirdInfo\":[{\"v_Id_Info_Type_Third\":\"301006\",\"id_Third_InfioPrimaria\":null,\"v_Value\":\"102002\",\"v_Enable\":1,\"v_Id_Third_Public\":\"\",\"id_Third\":null},{\"v_Id_Info_Type_Third\":\"301007\",\"id_Third_InfioPrimaria\":null,\"v_Value\":\"105001\",\"v_Enable\":1,\"v_Id_Third_Public\":\"\",\"id_Third\":null}]}', '403001', '2019-06-18'),
(20, 16, 'IDENIT', '403004', '2019-06-18'),
(21, 16, '3987567541', '403003', '2019-06-18'),
(22, 16, 'IDENIT', '403004', '2019-06-18'),
(23, 16, '3456655621', '403003', '2019-06-18'),
(24, 17, '{\"user\":{\"vIdUserPublic\":\"22a65b7a-91d8-11e9-b518-e0db559470aa\",\"vIdType\":\"IDENIT\",\"vIdentificationNumber\":\"37456767541\",\"vName\":\"Carlos\",\"vLastName\":\"Bill\",\"vEmail\":\"steven.ju@gmail.com\",\"vPhone\":\"23456448\",\"vProfilePicture\":\"foto url\",\"vEnable\":1},\"userInfo\":[{\"vIdUserPublic\":\"\",\"vIdInfoTypeUser\":\"201001\",\"vValue\":\"102002\",\"vEnable\":1},{\"vIdUserPublic\":\"\",\"vIdInfoTypeUser\":\"201002\",\"vValue\":\"103001\",\"vEnable\":1}],\"third\":{\"vIdThirdPublic\":\"2281c27a-91d8-11e9-b518-e0db559470aa\",\"vIdType\":\"IDENIT\",\"vIdentificationNumber\":\"3434562321\",\"vBusinessName\":\"ASAP X\",\"vEnable\":1,\"idThird\":null},\"thirdInfo\":[{\"idThirdInfioPrimaria\":null,\"vidInfoTypeThird\":\"301006\",\"vidThirdPublic\":\"\",\"idThird\":null,\"vvalue\":\"102002\",\"venable\":1},{\"idThirdInfioPrimaria\":null,\"vidInfoTypeThird\":\"301007\",\"vidThirdPublic\":\"\",\"idThird\":null,\"vvalue\":\"105001\",\"venable\":1}]}', '403001', '2019-06-18'),
(25, 17, 'IDENIT', '403004', '2019-06-18'),
(26, 17, '37456767541', '403003', '2019-06-18'),
(27, 17, 'IDENIT', '403004', '2019-06-18'),
(28, 17, '3434562321', '403003', '2019-06-18'),
(29, 18, '{\"user\":{\"vIdUserPublic\":\"bf8e57ef-920b-11e9-b518-e0db559470aa\",\"vIdType\":\"IDENIT\",\"vIdentificationNumber\":\"370110141\",\"vName\":\"Carlos\",\"vLastName\":\"Bill\",\"vEmail\":\"steven.ju@gmail.com\",\"vPhone\":\"23456448\",\"vProfilePicture\":\"foto url\",\"vEnable\":1},\"userInfo\":[{\"vIdUserPublic\":\"\",\"vIdInfoTypeUser\":\"201001\",\"vValue\":\"102002\",\"vEnable\":1},{\"vIdUserPublic\":\"\",\"vIdInfoTypeUser\":\"201002\",\"vValue\":\"103001\",\"vEnable\":1}],\"third\":{\"vIdThirdPublic\":\"bf5f22a2-920b-11e9-b518-e0db559470aa\",\"vIdType\":\"IDENIT\",\"vIdentificationNumber\":\"340100121\",\"vBusinessName\":\"ASAP X\",\"vEnable\":1,\"idThird\":null},\"thirdInfo\":[{\"vidThirdPublic\":\"\",\"vidInfoTypeThird\":\"301006\",\"vvalue\":\"102002\",\"venable\":1,\"idThird\":null,\"idThirdInfioPrimaria\":null},{\"vidThirdPublic\":\"\",\"vidInfoTypeThird\":\"301007\",\"vvalue\":\"105001\",\"venable\":1,\"idThird\":null,\"idThirdInfioPrimaria\":null}]}', '403001', '2019-06-18'),
(30, 18, 'IDENIT', '403004', '2019-06-18'),
(31, 18, '370110141', '403003', '2019-06-18'),
(32, 18, 'IDENIT', '403004', '2019-06-18'),
(33, 18, '340100121', '403003', '2019-06-18'),
(34, 19, '{\"user\":{\"vIdUserPublic\":\"b9eccee7-920c-11e9-b518-e0db559470aa\",\"vIdType\":\"IDENIT\",\"vIdentificationNumber\":\"310010141\",\"vName\":\"Carlos\",\"vLastName\":\"Bill\",\"vEmail\":\"steven.ju@gmail.com\",\"vPhone\":\"23456448\",\"vProfilePicture\":\"foto url\",\"vEnable\":1},\"userInfo\":[{\"vIdUserPublic\":\"\",\"vIdInfoTypeUser\":\"201001\",\"vValue\":\"102002\",\"vEnable\":1},{\"vIdUserPublic\":\"\",\"vIdInfoTypeUser\":\"201002\",\"vValue\":\"103001\",\"vEnable\":1}],\"third\":{\"vIdThirdPublic\":\"b9d115da-920c-11e9-b518-e0db559470aa\",\"vIdType\":\"IDENIT\",\"vIdentificationNumber\":\"300101121\",\"vBusinessName\":\"ASAP X\",\"vEnable\":1,\"idThird\":null},\"thirdInfo\":[{\"vidThirdPublic\":\"\",\"vidInfoTypeThird\":\"301006\",\"vvalue\":\"102002\",\"venable\":1,\"idThird\":null,\"idThirdInfioPrimaria\":null},{\"vidThirdPublic\":\"\",\"vidInfoTypeThird\":\"301007\",\"vvalue\":\"105001\",\"venable\":1,\"idThird\":null,\"idThirdInfioPrimaria\":null}]}', '403001', '2019-06-18'),
(35, 19, 'IDENIT', '403004', '2019-06-18'),
(36, 19, '310010141', '403003', '2019-06-18'),
(37, 19, 'IDENIT', '403004', '2019-06-18'),
(38, 19, '300101121', '403003', '2019-06-18'),
(39, 20, '{\"user\":{\"vIdUserPublic\":\"69195d11-920d-11e9-b518-e0db559470aa\",\"vIdType\":\"IDENIT\",\"vIdentificationNumber\":\"1001010141\",\"vName\":\"Carlos\",\"vLastName\":\"Bill\",\"vEmail\":\"steven.ju@gmail.com\",\"vPhone\":\"23456448\",\"vProfilePicture\":\"foto url\",\"vEnable\":1},\"userInfo\":[{\"vIdUserPublic\":\"\",\"vIdInfoTypeUser\":\"201001\",\"vValue\":\"102002\",\"vEnable\":1},{\"vIdUserPublic\":\"\",\"vIdInfoTypeUser\":\"201002\",\"vValue\":\"103001\",\"vEnable\":1}],\"third\":{\"vIdThirdPublic\":\"68cdaf9f-920d-11e9-b518-e0db559470aa\",\"vIdType\":\"IDENIT\",\"vIdentificationNumber\":\"011101101121\",\"vBusinessName\":\"ASAP X\",\"vEnable\":1,\"idThird\":null},\"thirdInfo\":[{\"vidThirdPublic\":\"\",\"vidInfoTypeThird\":\"301006\",\"vvalue\":\"102002\",\"venable\":1,\"idThird\":null,\"idThirdInfioPrimaria\":null},{\"vidThirdPublic\":\"\",\"vidInfoTypeThird\":\"301007\",\"vvalue\":\"105001\",\"venable\":1,\"idThird\":null,\"idThirdInfioPrimaria\":null}]}', '403001', '2019-06-18'),
(40, 20, 'IDENIT', '403004', '2019-06-18'),
(41, 20, '1001010141', '403003', '2019-06-18'),
(42, 20, 'IDENIT', '403004', '2019-06-18'),
(43, 20, '011101101121', '403003', '2019-06-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_log_transaction_ws`
--

CREATE TABLE `mp_log_transaction_ws` (
  `Id_Log_Transaction_WS` int(11) NOT NULL,
  `Id_Transaction_MP` int(11) NOT NULL,
  `Id_Estatus` varchar(6) NOT NULL,
  `Response` varchar(1024) NOT NULL,
  `Request` varchar(1024) NOT NULL,
  `Info_Type_WS` varchar(6) NOT NULL,
  `Date_Time_Execution` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_log_transaction_ws_info`
--

CREATE TABLE `mp_log_transaction_ws_info` (
  `Id_Log_Transaction_Ws_Info` int(11) NOT NULL,
  `Id_Log_Transaction_WS` int(11) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Value` varchar(1028) NOT NULL,
  `Transaction_WS_Type` varchar(6) NOT NULL,
  `Create_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_user_thir_monitor`
--

CREATE TABLE `mp_user_thir_monitor` (
  `Id_User_Thir_Monitor` int(11) NOT NULL,
  `Id_User_Third` int(11) NOT NULL,
  `Id_Reason_Type` varchar(6) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Id_Doc_Type` varchar(6) NOT NULL,
  `IdentificationNumber` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Enable` varchar(45) NOT NULL,
  `Date_Time_Execution` datetime NOT NULL,
  `Id_Log_Transaction_WS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mp_user_thir_monitor_info`
--

CREATE TABLE `mp_user_thir_monitor_info` (
  `Id_User_Thir_Monitor_Info` int(11) NOT NULL,
  `Id_User_Thir_Monitor` int(11) NOT NULL,
  `Id_User_Thir_Monitor_Info_Type` varchar(6) NOT NULL,
  `Value` varchar(1028) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Create_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_login`
--

CREATE TABLE `user_login` (
  `Id_User_Login` int(11) NOT NULL,
  `Id_User` int(11) NOT NULL,
  `Date_Time_Execution` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_login_info`
--

CREATE TABLE `user_login_info` (
  `Id_User_Login_Info` int(11) NOT NULL,
  `Id_User_Login` int(11) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `Value` varchar(1028) NOT NULL,
  `User_Login_Type` varchar(6) NOT NULL,
  `CreateDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mp_log_transacion_user`
--
ALTER TABLE `mp_log_transacion_user`
  ADD PRIMARY KEY (`Id_Log_Transaction_User`),
  ADD KEY `fk_MP_LOG_TRANSACION_USER_MP_LOG_TRANSACTION_WS1_idx` (`Id_Log_Transaction_WS`);

--
-- Indices de la tabla `mp_log_transaction_user_info`
--
ALTER TABLE `mp_log_transaction_user_info`
  ADD PRIMARY KEY (`Id_Log_Transaction_User_Info`),
  ADD KEY `fk_MP_LOG_TRANSACTION_USER_INFO_MP_LOG_TRANSACION_USER_idx` (`Id_Log_Transaction_User`);

--
-- Indices de la tabla `mp_log_transaction_ws`
--
ALTER TABLE `mp_log_transaction_ws`
  ADD PRIMARY KEY (`Id_Log_Transaction_WS`);

--
-- Indices de la tabla `mp_log_transaction_ws_info`
--
ALTER TABLE `mp_log_transaction_ws_info`
  ADD PRIMARY KEY (`Id_Log_Transaction_Ws_Info`),
  ADD KEY `fk_MP_LOG_TRANSACTION_WS_INFO_MP_LOG_TRANSACTION_WS1_idx` (`Id_Log_Transaction_WS`);

--
-- Indices de la tabla `mp_user_thir_monitor`
--
ALTER TABLE `mp_user_thir_monitor`
  ADD PRIMARY KEY (`Id_User_Thir_Monitor`),
  ADD KEY `fk_MP_USER_THIR_MONITOR_MP_LOG_TRANSACTION_WS1_idx` (`Id_Log_Transaction_WS`);

--
-- Indices de la tabla `mp_user_thir_monitor_info`
--
ALTER TABLE `mp_user_thir_monitor_info`
  ADD PRIMARY KEY (`Id_User_Thir_Monitor_Info`),
  ADD KEY `fk_MP_USER_THIR_MONITOR_INFO_MP_USER_THIR_MONITOR1_idx` (`Id_User_Thir_Monitor`);

--
-- Indices de la tabla `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`Id_User_Login`);

--
-- Indices de la tabla `user_login_info`
--
ALTER TABLE `user_login_info`
  ADD PRIMARY KEY (`Id_User_Login_Info`),
  ADD KEY `fk_USER_LOGIN_INFO_USER_LOGIN1_idx` (`Id_User_Login`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mp_log_transacion_user`
--
ALTER TABLE `mp_log_transacion_user`
  MODIFY `Id_Log_Transaction_User` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `mp_log_transaction_user_info`
--
ALTER TABLE `mp_log_transaction_user_info`
  MODIFY `Id_Log_Transaction_User_Info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `mp_log_transaction_ws`
--
ALTER TABLE `mp_log_transaction_ws`
  MODIFY `Id_Log_Transaction_WS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mp_log_transaction_ws_info`
--
ALTER TABLE `mp_log_transaction_ws_info`
  MODIFY `Id_Log_Transaction_Ws_Info` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mp_user_thir_monitor`
--
ALTER TABLE `mp_user_thir_monitor`
  MODIFY `Id_User_Thir_Monitor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mp_user_thir_monitor_info`
--
ALTER TABLE `mp_user_thir_monitor_info`
  MODIFY `Id_User_Thir_Monitor_Info` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_login`
--
ALTER TABLE `user_login`
  MODIFY `Id_User_Login` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_login_info`
--
ALTER TABLE `user_login_info`
  MODIFY `Id_User_Login_Info` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mp_log_transacion_user`
--
ALTER TABLE `mp_log_transacion_user`
  ADD CONSTRAINT `fk_MP_LOG_TRANSACION_USER_MP_LOG_TRANSACTION_WS1` FOREIGN KEY (`Id_Log_Transaction_WS`) REFERENCES `mp_log_transaction_ws` (`Id_Log_Transaction_WS`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mp_log_transaction_user_info`
--
ALTER TABLE `mp_log_transaction_user_info`
  ADD CONSTRAINT `fk_MP_LOG_TRANSACTION_USER_INFO_MP_LOG_TRANSACION_USER` FOREIGN KEY (`Id_Log_Transaction_User`) REFERENCES `mp_log_transacion_user` (`Id_Log_Transaction_User`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mp_log_transaction_ws_info`
--
ALTER TABLE `mp_log_transaction_ws_info`
  ADD CONSTRAINT `fk_MP_LOG_TRANSACTION_WS_INFO_MP_LOG_TRANSACTION_WS1` FOREIGN KEY (`Id_Log_Transaction_WS`) REFERENCES `mp_log_transaction_ws` (`Id_Log_Transaction_WS`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mp_user_thir_monitor`
--
ALTER TABLE `mp_user_thir_monitor`
  ADD CONSTRAINT `fk_MP_USER_THIR_MONITOR_MP_LOG_TRANSACTION_WS1` FOREIGN KEY (`Id_Log_Transaction_WS`) REFERENCES `mp_log_transaction_ws` (`Id_Log_Transaction_WS`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mp_user_thir_monitor_info`
--
ALTER TABLE `mp_user_thir_monitor_info`
  ADD CONSTRAINT `fk_MP_USER_THIR_MONITOR_INFO_MP_USER_THIR_MONITOR1` FOREIGN KEY (`Id_User_Thir_Monitor`) REFERENCES `mp_user_thir_monitor` (`Id_User_Thir_Monitor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user_login_info`
--
ALTER TABLE `user_login_info`
  ADD CONSTRAINT `fk_USER_LOGIN_INFO_USER_LOGIN1` FOREIGN KEY (`Id_User_Login`) REFERENCES `user_login` (`Id_User_Login`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"on\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('bepartners', 1, 'diseÃ±o1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"bepartnerslog\",\"table\":\"mp_log_transaction_user_info\"},{\"db\":\"bepartners\",\"table\":\"mp_third\"},{\"db\":\"bepartnerslog\",\"table\":\"mp_log_transacion_user\"},{\"db\":\"bepartners\",\"table\":\"mp_user_third\"},{\"db\":\"bepartners\",\"table\":\"mp_user_info\"},{\"db\":\"bepartners\",\"table\":\"mp_user\"},{\"db\":\"bepartners\",\"table\":\"mp_third_info\"},{\"db\":\"bepartners\",\"table\":\"mp_user_third_terms\"},{\"db\":\"bepartners\",\"table\":\"mp_rct_pc\"},{\"db\":\"bepartners\",\"table\":\"bo_terms\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Volcado de datos para la tabla `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('bepartners', 'bo_pc_plan', 1, 800, 350),
('bepartners', 'bo_product', 1, 1060, 390),
('bepartners', 'bo_product_info', 1, 1290, 370),
('bepartners', 'bo_terms', 1, 450, 320),
('bepartners', 'mp_pc_transaction', 1, 990, 80),
('bepartners', 'mp_pc_transaction_info', 1, 1310, 140),
('bepartners', 'mp_rct_pc', 1, 1360, 240),
('bepartners', 'mp_third', 1, 360, 90),
('bepartners', 'mp_third_info', 1, 620, 10),
('bepartners', 'mp_third_pc_plan', 1, 750, 220),
('bepartners', 'mp_user', 1, 90, 90),
('bepartners', 'mp_user_info', 1, 40, 20),
('bepartners', 'mp_user_third', 1, 90, 180),
('bepartners', 'mp_user_third_terms', 1, 370, 230),
('bepartners', 'u_catalog', 1, 30, 270),
('bepartners', 'u_category', 1, 610, 490),
('bepartners', 'u_item_catalog', 1, 10, 340),
('bepartners', 'u_tree', 1, 100, 490),
('bepartners', 'u_tree_category', 1, 310, 490);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'bepartners', 'u_item_catalog', '{\"CREATE_TIME\":\"2019-06-11 15:18:26\",\"col_order\":[1,0,2,3,4,5,6],\"col_visib\":[1,1,1,1,1,1,1]}', '2019-06-12 14:02:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-06-19 14:25:03', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos`
--

CREATE TABLE `activos` (
  `id` bigint(20) NOT NULL,
  `fecha_refistro` date DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos_seq`
--

CREATE TABLE `activos_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `activos_seq`
--

INSERT INTO `activos_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `automovil`
--

CREATE TABLE `automovil` (
  `id` bigint(20) NOT NULL,
  `codigo_lectura` varchar(255) DEFAULT NULL,
  `fabricacion_modelo` varchar(255) DEFAULT NULL,
  `fecha_adquisicion` date DEFAULT NULL,
  `fecha_reemplazo` date DEFAULT NULL,
  `fecha_registro_program` date DEFAULT NULL,
  `licencia_transito` varchar(255) DEFAULT NULL,
  `numero_sello` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `placa` varchar(255) DEFAULT NULL,
  `ultima_fecha_registro` varchar(255) DEFAULT NULL,
  `ultimo_cambio` varchar(255) DEFAULT NULL,
  `valor_adquisicion` bigint(20) DEFAULT NULL,
  `valor_reemplazo` bigint(20) DEFAULT NULL,
  `departamento` bigint(20) DEFAULT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL,
  `sub_tipo` bigint(20) DEFAULT NULL,
  `tipo` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `automovil_seq`
--

CREATE TABLE `automovil_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `automovil_seq`
--

INSERT INTO `automovil_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choices`
--

CREATE TABLE `choices` (
  `id` bigint(20) NOT NULL,
  `text` varchar(40) DEFAULT NULL,
  `poll_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto`
--

CREATE TABLE `foto` (
  `id` bigint(20) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto_seq`
--

CREATE TABLE `foto_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `foto_seq`
--

INSERT INTO `foto_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionario`
--

CREATE TABLE `funcionario` (
  `id` bigint(20) NOT NULL,
  `codigo_postal` varchar(255) DEFAULT NULL,
  `direccion_residencia` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `fecha_actualizacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `piso` varchar(255) DEFAULT NULL,
  `recibe_visitas` bigint(20) DEFAULT NULL,
  `telefono_oficin` varchar(255) DEFAULT NULL,
  `telefono_residencia` varchar(255) DEFAULT NULL,
  `ubicacion_funcionario` varchar(255) DEFAULT NULL,
  `cargo` bigint(20) DEFAULT NULL,
  `ciudad_residencia` bigint(20) DEFAULT NULL,
  `departamento_admi` bigint(20) DEFAULT NULL,
  `departamento_residencia` bigint(20) DEFAULT NULL,
  `division` bigint(20) DEFAULT NULL,
  `edificio` bigint(20) DEFAULT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionario_seq`
--

CREATE TABLE `funcionario_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `funcionario_seq`
--

INSERT INTO `funcionario_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedad`
--

CREATE TABLE `novedad` (
  `id` bigint(20) NOT NULL,
  `consecutivo` bigint(20) DEFAULT NULL,
  `fecha_fi` date DEFAULT NULL,
  `fecha_in` date DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedad_seq`
--

CREATE TABLE `novedad_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `novedad_seq`
--

INSERT INTO `novedad_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operador`
--

CREATE TABLE `operador` (
  `id` bigint(20) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `identificacion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `tipo_identificacion` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operador_seq`
--

CREATE TABLE `operador_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `operador_seq`
--

INSERT INTO `operador_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id` bigint(20) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `codigo_interno` varchar(255) DEFAULT NULL,
  `firma` varchar(255) DEFAULT NULL,
  `identificacion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo_identificacion` bigint(20) DEFAULT NULL,
  `tipo_usuario` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_seq`
--

CREATE TABLE `personal_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personal_seq`
--

INSERT INTO `personal_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `polls`
--

CREATE TABLE `polls` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `expiration_date_time` datetime NOT NULL,
  `question` varchar(140) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_list`
--

CREATE TABLE `system_list` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `system_list_type` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_type`
--

CREATE TABLE `system_type` (
  `id` bigint(20) NOT NULL,
  `name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_operador`
--

CREATE TABLE `usuario_operador` (
  `id` bigint(20) NOT NULL,
  `operador` bigint(20) DEFAULT NULL,
  `user` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_operador_seq`
--

CREATE TABLE `usuario_operador_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_operador_seq`
--

INSERT INTO `usuario_operador_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id` bigint(20) NOT NULL,
  `fecha_fi` date DEFAULT NULL,
  `fecha_in` date DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_seq`
--

CREATE TABLE `vehiculo_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculo_seq`
--

INSERT INTO `vehiculo_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante`
--

CREATE TABLE `visitante` (
  `id` bigint(20) NOT NULL,
  `cargo_visitante` varchar(255) DEFAULT NULL,
  `compania_labora` varchar(255) DEFAULT NULL,
  `direccion_visitante` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `fecha_actualizacion` date DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_nacimiento` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `telefono_oficina` varchar(255) DEFAULT NULL,
  `anfitrion` bigint(20) DEFAULT NULL,
  `cidudad_visitante` bigint(20) DEFAULT NULL,
  `departamento_admin` bigint(20) DEFAULT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `estado_civil` bigint(20) DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante_seq`
--

CREATE TABLE `visitante_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `visitante_seq`
--

INSERT INTO `visitante_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita_activa`
--

CREATE TABLE `visita_activa` (
  `id` bigint(20) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora_en` date DEFAULT NULL,
  `hora_fn_programada` date DEFAULT NULL,
  `hora_in_programada` date DEFAULT NULL,
  `hora_sa` date DEFAULT NULL,
  `visitante` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita_activa_seq`
--

CREATE TABLE `visita_activa_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `visita_activa_seq`
--

INSERT INTO `visita_activa_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votes`
--

CREATE TABLE `votes` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `choice_id` bigint(20) NOT NULL,
  `poll_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activos`
--
ALTER TABLE `activos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKh6gnqcx2upsnw86lsy571g4o8` (`estado`),
  ADD KEY `FKowlks4iiwqhxt698cehwcckss` (`personal`);

--
-- Indices de la tabla `automovil`
--
ALTER TABLE `automovil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKply32d987q1hxwmd8eomlfcgm` (`departamento`),
  ADD KEY `FKojny34v33558ae9omdwe8n1qa` (`estado`),
  ADD KEY `FKf2gjuaqjepnbqbam6vwr34ows` (`personal`),
  ADD KEY `FKsdgp99l5nkhbu49g44xchggwe` (`sub_tipo`),
  ADD KEY `FKj5o9wxs4tpuyqhcemrobjy6bd` (`tipo`);

--
-- Indices de la tabla `choices`
--
ALTER TABLE `choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1i68hpih40n447wqx4lpef6ot` (`poll_id`);

--
-- Indices de la tabla `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2106sor50p2mlokhr6d1hlbge` (`personal`);

--
-- Indices de la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjaiev7hbdcf4kk5qupc1q7o30` (`cargo`),
  ADD KEY `FKix2ko1wb51qarov57o3rlp53j` (`ciudad_residencia`),
  ADD KEY `FKlff8ovfp3q5b2m9tm40nihvau` (`departamento_admi`),
  ADD KEY `FKtmgbchos5o68wruehvu98cwdj` (`departamento_residencia`),
  ADD KEY `FKhw3jcoe4fp6efnt5nry7res3` (`division`),
  ADD KEY `FKpokp2gmq91na26mkrnhwrvvyk` (`edificio`),
  ADD KEY `FKh3mx2oibvswi4bm4vud7m8pld` (`estado`),
  ADD KEY `FKmwqy4eoh3ke1oe3bd5iy521hq` (`personal`);

--
-- Indices de la tabla `novedad`
--
ALTER TABLE `novedad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKoy4hck2a68lmi5cdbwxs4vrw7` (`personal`);

--
-- Indices de la tabla `operador`
--
ALTER TABLE `operador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjjv0rulu2oyk7qmejt62e7eo6` (`estado`),
  ADD KEY `FK5mllalwc0912mda2qvn7kh6kv` (`tipo_identificacion`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKshfy92pos5nspgcglqwm21tam` (`tipo_identificacion`),
  ADD KEY `FKgnnxyu35fdpa38pikpjuig0p7` (`tipo_usuario`);

--
-- Indices de la tabla `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_nb4h0p6txrmfc0xbrd1kglp9t` (`name`);

--
-- Indices de la tabla `system_list`
--
ALTER TABLE `system_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKltgxncr9tj6xvttg569r1makv` (`system_list_type`);

--
-- Indices de la tabla `system_type`
--
ALTER TABLE `system_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`);

--
-- Indices de la tabla `usuario_operador`
--
ALTER TABLE `usuario_operador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKffw8gdhi076raiw7kctm5epwc` (`operador`),
  ADD KEY `FKgk9wbulm87tivncrxynmtrti0` (`user`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8fhrqf7y8gntu1isot0sw285h` (`estado`),
  ADD KEY `FKglraa5yaoixvs30q8pjx8w0mr` (`personal`);

--
-- Indices de la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg42bl49afw51xljqkc2hre7mu` (`anfitrion`),
  ADD KEY `FKb44g0nx6474orn6s6fgvy9rmh` (`cidudad_visitante`),
  ADD KEY `FKp1c57v65go7ynia069cktdt9u` (`departamento_admin`),
  ADD KEY `FK9ir2om4yji17rla7jas05pyeg` (`estado`),
  ADD KEY `FKgt0uxjugjso2no9s2f41vtyx9` (`estado_civil`),
  ADD KEY `FKbh3a4somxrip2gxulhm2u7lc8` (`personal`);

--
-- Indices de la tabla `visita_activa`
--
ALTER TABLE `visita_activa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKibu09bokroc24q6htgxdq230p` (`visitante`);

--
-- Indices de la tabla `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK8um9h2wxsdjrgx3rjjwvny676` (`poll_id`,`user_id`),
  ADD KEY `FKomskymhxde3qq9mcukyp1puio` (`choice_id`),
  ADD KEY `FKli4uj3ic2vypf5pialchj925e` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `choices`
--
ALTER TABLE `choices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `polls`
--
ALTER TABLE `polls`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `system_list`
--
ALTER TABLE `system_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `system_type`
--
ALTER TABLE `system_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `votes`
--
ALTER TABLE `votes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activos`
--
ALTER TABLE `activos`
  ADD CONSTRAINT `FKh6gnqcx2upsnw86lsy571g4o8` FOREIGN KEY (`estado`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKowlks4iiwqhxt698cehwcckss` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`);

--
-- Filtros para la tabla `automovil`
--
ALTER TABLE `automovil`
  ADD CONSTRAINT `FKf2gjuaqjepnbqbam6vwr34ows` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`),
  ADD CONSTRAINT `FKj5o9wxs4tpuyqhcemrobjy6bd` FOREIGN KEY (`tipo`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKojny34v33558ae9omdwe8n1qa` FOREIGN KEY (`estado`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKply32d987q1hxwmd8eomlfcgm` FOREIGN KEY (`departamento`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKsdgp99l5nkhbu49g44xchggwe` FOREIGN KEY (`sub_tipo`) REFERENCES `system_list` (`id`);

--
-- Filtros para la tabla `choices`
--
ALTER TABLE `choices`
  ADD CONSTRAINT `FK1i68hpih40n447wqx4lpef6ot` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`);

--
-- Filtros para la tabla `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `FK2106sor50p2mlokhr6d1hlbge` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`);

--
-- Filtros para la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `FKh3mx2oibvswi4bm4vud7m8pld` FOREIGN KEY (`estado`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKhw3jcoe4fp6efnt5nry7res3` FOREIGN KEY (`division`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKix2ko1wb51qarov57o3rlp53j` FOREIGN KEY (`ciudad_residencia`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKjaiev7hbdcf4kk5qupc1q7o30` FOREIGN KEY (`cargo`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKlff8ovfp3q5b2m9tm40nihvau` FOREIGN KEY (`departamento_admi`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKmwqy4eoh3ke1oe3bd5iy521hq` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`),
  ADD CONSTRAINT `FKpokp2gmq91na26mkrnhwrvvyk` FOREIGN KEY (`edificio`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKtmgbchos5o68wruehvu98cwdj` FOREIGN KEY (`departamento_residencia`) REFERENCES `system_list` (`id`);

--
-- Filtros para la tabla `novedad`
--
ALTER TABLE `novedad`
  ADD CONSTRAINT `FKoy4hck2a68lmi5cdbwxs4vrw7` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`);

--
-- Filtros para la tabla `operador`
--
ALTER TABLE `operador`
  ADD CONSTRAINT `FK5mllalwc0912mda2qvn7kh6kv` FOREIGN KEY (`tipo_identificacion`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKjjv0rulu2oyk7qmejt62e7eo6` FOREIGN KEY (`estado`) REFERENCES `system_list` (`id`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `FKgnnxyu35fdpa38pikpjuig0p7` FOREIGN KEY (`tipo_usuario`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKshfy92pos5nspgcglqwm21tam` FOREIGN KEY (`tipo_identificacion`) REFERENCES `system_list` (`id`);

--
-- Filtros para la tabla `system_list`
--
ALTER TABLE `system_list`
  ADD CONSTRAINT `FKltgxncr9tj6xvttg569r1makv` FOREIGN KEY (`system_list_type`) REFERENCES `system_type` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `usuario_operador`
--
ALTER TABLE `usuario_operador`
  ADD CONSTRAINT `FKffw8gdhi076raiw7kctm5epwc` FOREIGN KEY (`operador`) REFERENCES `operador` (`id`),
  ADD CONSTRAINT `FKgk9wbulm87tivncrxynmtrti0` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `FK8fhrqf7y8gntu1isot0sw285h` FOREIGN KEY (`estado`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKglraa5yaoixvs30q8pjx8w0mr` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`);

--
-- Filtros para la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD CONSTRAINT `FK9ir2om4yji17rla7jas05pyeg` FOREIGN KEY (`estado`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKb44g0nx6474orn6s6fgvy9rmh` FOREIGN KEY (`cidudad_visitante`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKbh3a4somxrip2gxulhm2u7lc8` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`),
  ADD CONSTRAINT `FKg42bl49afw51xljqkc2hre7mu` FOREIGN KEY (`anfitrion`) REFERENCES `personal` (`id`),
  ADD CONSTRAINT `FKgt0uxjugjso2no9s2f41vtyx9` FOREIGN KEY (`estado_civil`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKp1c57v65go7ynia069cktdt9u` FOREIGN KEY (`departamento_admin`) REFERENCES `system_list` (`id`);

--
-- Filtros para la tabla `visita_activa`
--
ALTER TABLE `visita_activa`
  ADD CONSTRAINT `FKibu09bokroc24q6htgxdq230p` FOREIGN KEY (`visitante`) REFERENCES `personal` (`id`);

--
-- Filtros para la tabla `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `FK7trt3uyihr4g13hva9d31puxg` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`),
  ADD CONSTRAINT `FKli4uj3ic2vypf5pialchj925e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKomskymhxde3qq9mcukyp1puio` FOREIGN KEY (`choice_id`) REFERENCES `choices` (`id`);
--
-- Base de datos: `test1`
--
CREATE DATABASE IF NOT EXISTS `test1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test1`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `disabled` bit(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1jsuftn50b0cj8mx3js6mubn2` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_avh1b2ec82audum2lyjx2p1ws` (`email`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `FK1jsuftn50b0cj8mx3js6mubn2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- Base de datos: `test2`
--
CREATE DATABASE IF NOT EXISTS `test2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `cust_email` varchar(255) NOT NULL,
  `cust_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `productCode` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmx4twqu610hb5kqg8fmr8uxlo` (`order_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `FKmx4twqu610hb5kqg8fmr8uxlo` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
--
-- Base de datos: `visitante_db`
--
CREATE DATABASE IF NOT EXISTS `visitante_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `visitante_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos`
--

CREATE TABLE `activos` (
  `id` bigint(20) NOT NULL,
  `fecha_refistro` date DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos_seq`
--

CREATE TABLE `activos_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `activos_seq`
--

INSERT INTO `activos_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `automovil`
--

CREATE TABLE `automovil` (
  `id` bigint(20) NOT NULL,
  `codigo_lectura` varchar(255) DEFAULT NULL,
  `fabricacion_modelo` varchar(255) DEFAULT NULL,
  `fecha_adquisicion` date DEFAULT NULL,
  `fecha_reemplazo` date DEFAULT NULL,
  `fecha_registro_program` date DEFAULT NULL,
  `licencia_transito` varchar(255) DEFAULT NULL,
  `numero_sello` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `placa` varchar(255) DEFAULT NULL,
  `ultima_fecha_registro` varchar(255) DEFAULT NULL,
  `ultimo_cambio` varchar(255) DEFAULT NULL,
  `valor_adquisicion` bigint(20) DEFAULT NULL,
  `valor_reemplazo` bigint(20) DEFAULT NULL,
  `departamento` bigint(20) DEFAULT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL,
  `sub_tipo` bigint(20) DEFAULT NULL,
  `tipo` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `automovil_seq`
--

CREATE TABLE `automovil_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `automovil_seq`
--

INSERT INTO `automovil_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choices`
--

CREATE TABLE `choices` (
  `id` bigint(20) NOT NULL,
  `text` varchar(40) NOT NULL,
  `poll_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto`
--

CREATE TABLE `foto` (
  `id` bigint(20) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto_seq`
--

CREATE TABLE `foto_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `foto_seq`
--

INSERT INTO `foto_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionario`
--

CREATE TABLE `funcionario` (
  `id` bigint(20) NOT NULL,
  `codigo_postal` varchar(255) DEFAULT NULL,
  `direccion_residencia` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `fecha_actualizacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `piso` varchar(255) DEFAULT NULL,
  `recibe_visitas` bigint(20) DEFAULT NULL,
  `telefono_oficin` varchar(255) DEFAULT NULL,
  `telefono_residencia` varchar(255) DEFAULT NULL,
  `ubicacion_funcionario` varchar(255) DEFAULT NULL,
  `cargo` bigint(20) DEFAULT NULL,
  `ciudad_residencia` bigint(20) DEFAULT NULL,
  `departamento_admi` bigint(20) DEFAULT NULL,
  `departamento_residencia` bigint(20) DEFAULT NULL,
  `division` bigint(20) DEFAULT NULL,
  `edificio` bigint(20) DEFAULT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionario_seq`
--

CREATE TABLE `funcionario_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `funcionario_seq`
--

INSERT INTO `funcionario_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedad`
--

CREATE TABLE `novedad` (
  `id` bigint(20) NOT NULL,
  `consecutivo` bigint(20) DEFAULT NULL,
  `fecha_fi` date DEFAULT NULL,
  `fecha_in` date DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedad_seq`
--

CREATE TABLE `novedad_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `novedad_seq`
--

INSERT INTO `novedad_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operador`
--

CREATE TABLE `operador` (
  `id` bigint(20) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `identificacion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `tipo_identificacion` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operador_seq`
--

CREATE TABLE `operador_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `operador_seq`
--

INSERT INTO `operador_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id` bigint(20) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `codigo_interno` varchar(255) DEFAULT NULL,
  `firma` varchar(255) DEFAULT NULL,
  `identificacion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo_identificacion` bigint(20) DEFAULT NULL,
  `tipo_usuario` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_seq`
--

CREATE TABLE `personal_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personal_seq`
--

INSERT INTO `personal_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `polls`
--

CREATE TABLE `polls` (
  `id` bigint(20) NOT NULL,
  `question` varchar(140) NOT NULL,
  `expiration_date_time` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(5, 'ROLE_ADMIN'),
(4, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_list`
--

CREATE TABLE `system_list` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `system_list_type` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_type`
--

CREATE TABLE `system_type` (
  `id` bigint(20) NOT NULL,
  `name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Boris', 'bpalaciosa', 'bpalaciosa@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(2, 'Boris', 'bpalaciosa1', 'bpalaciosa1@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(3, 'Boris', 'bpalaciosa2', 'bpalaciosa2@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(4, 'Boris', 'bpalaciosa3', 'bpalaciosa3@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(5, 'Boris', 'bpalaciosa4', 'bpalaciosa4@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(6, 'Boris', 'bpalaciosa5', 'bpalaciosa5@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(7, 'Boris', 'bpalaciosa6', 'bpalaciosa6@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(8, 'Boris', 'bpalaciosa7', 'bpalaciosa7@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(9, 'Boris', 'bpalaciosa8', 'bpalaciosa8@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(10, 'Boris', 'bpalaciosa9', 'bpalaciosa9@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(11, 'Boris', 'bpalaciosa10', 'bpalaciosa10@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(12, 'Boris', 'bpalaciosa11', 'bpalaciosa11@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(13, 'Boris', 'bpalaciosa12', 'bpalaciosa12@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(14, 'Boris', 'bpalaciosa13', 'bpalaciosa13@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(15, 'Boris', 'bpalaciosa14', 'bpalaciosa14@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(16, 'Boris', 'bpalaciosa15', 'bpalaciosa15@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(17, 'Boris', 'bpalaciosa16', 'bpalaciosa16@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(18, 'Boris', 'bpalaciosa17', 'bpalaciosa17@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(19, 'Boris', 'bpalaciosa18', 'bpalaciosa18@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(20, 'Boris', 'bpalaciosa19', 'bpalaciosa19@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(21, 'Boris', 'bpalaciosa20', 'bpalaciosa20@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(22, 'Boris', 'bpalaciosa21', 'bpalaciosa21@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(23, 'Boris', 'bpalaciosa22', 'bpalaciosa22@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(24, 'Boris', 'bpalaciosa23', 'bpalaciosa23@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(25, 'Boris', 'bpalaciosa24', 'bpalaciosa24@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(26, 'Boris', 'bpalaciosa25', 'bpalaciosa25@gmail.com', '$2a$10$YAcuJMlOslcUy43Ei3sx6uEdJ9nJbfE4o08R2dJ.RH3QrgSVeh7Mi', '2018-12-01 18:49:31', '2018-12-01 18:49:31'),
(27, 'root', 'root', 'bpalaciosaa@gmail.com', '$2a$10$79F4zNBexjo6g491hFUde.RC3l9fBv15.A7s9uyi4KAIFXyleCCU.', '2019-02-04 04:43:00', '2019-02-04 04:43:00'),
(28, 'operador', 'operador', 'operador@gmail.com', '$2a$10$FnPjYwUK0.1uVUQ7kayFpue6zeGkHcqLTD7CGrJOmL.Kysw0hLjyq', '2019-02-09 18:49:16', '2019-02-09 18:49:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 4),
(27, 4),
(28, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_operador`
--

CREATE TABLE `usuario_operador` (
  `id` bigint(20) NOT NULL,
  `operador` bigint(20) DEFAULT NULL,
  `user` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_operador_seq`
--

CREATE TABLE `usuario_operador_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_operador_seq`
--

INSERT INTO `usuario_operador_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id` bigint(20) NOT NULL,
  `fecha_fi` date DEFAULT NULL,
  `fecha_in` date DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_seq`
--

CREATE TABLE `vehiculo_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculo_seq`
--

INSERT INTO `vehiculo_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante`
--

CREATE TABLE `visitante` (
  `id` bigint(20) NOT NULL,
  `cargo_visitante` varchar(255) DEFAULT NULL,
  `compania_labora` varchar(255) DEFAULT NULL,
  `direccion_visitante` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `fecha_actualizacion` date DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_nacimiento` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `telefono_oficina` varchar(255) DEFAULT NULL,
  `anfitrion` bigint(20) DEFAULT NULL,
  `cidudad_visitante` bigint(20) DEFAULT NULL,
  `departamento_admin` bigint(20) DEFAULT NULL,
  `estado` bigint(20) DEFAULT NULL,
  `estado_civil` bigint(20) DEFAULT NULL,
  `personal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante_seq`
--

CREATE TABLE `visitante_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `visitante_seq`
--

INSERT INTO `visitante_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita_activa`
--

CREATE TABLE `visita_activa` (
  `id` bigint(20) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora_en` date DEFAULT NULL,
  `hora_fn_programada` date DEFAULT NULL,
  `hora_in_programada` date DEFAULT NULL,
  `hora_sa` date DEFAULT NULL,
  `visitante` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita_activa_seq`
--

CREATE TABLE `visita_activa_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `visita_activa_seq`
--

INSERT INTO `visita_activa_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votes`
--

CREATE TABLE `votes` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `poll_id` bigint(20) NOT NULL,
  `choice_id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activos`
--
ALTER TABLE `activos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKh6gnqcx2upsnw86lsy571g4o8` (`estado`),
  ADD KEY `FKowlks4iiwqhxt698cehwcckss` (`personal`);

--
-- Indices de la tabla `automovil`
--
ALTER TABLE `automovil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKply32d987q1hxwmd8eomlfcgm` (`departamento`),
  ADD KEY `FKojny34v33558ae9omdwe8n1qa` (`estado`),
  ADD KEY `FKf2gjuaqjepnbqbam6vwr34ows` (`personal`),
  ADD KEY `FKsdgp99l5nkhbu49g44xchggwe` (`sub_tipo`),
  ADD KEY `FKj5o9wxs4tpuyqhcemrobjy6bd` (`tipo`);

--
-- Indices de la tabla `choices`
--
ALTER TABLE `choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_choices_poll_id` (`poll_id`);

--
-- Indices de la tabla `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2106sor50p2mlokhr6d1hlbge` (`personal`);

--
-- Indices de la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjaiev7hbdcf4kk5qupc1q7o30` (`cargo`),
  ADD KEY `FKix2ko1wb51qarov57o3rlp53j` (`ciudad_residencia`),
  ADD KEY `FKlff8ovfp3q5b2m9tm40nihvau` (`departamento_admi`),
  ADD KEY `FKtmgbchos5o68wruehvu98cwdj` (`departamento_residencia`),
  ADD KEY `FKhw3jcoe4fp6efnt5nry7res3` (`division`),
  ADD KEY `FKpokp2gmq91na26mkrnhwrvvyk` (`edificio`),
  ADD KEY `FKh3mx2oibvswi4bm4vud7m8pld` (`estado`),
  ADD KEY `FKmwqy4eoh3ke1oe3bd5iy521hq` (`personal`);

--
-- Indices de la tabla `novedad`
--
ALTER TABLE `novedad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKoy4hck2a68lmi5cdbwxs4vrw7` (`personal`);

--
-- Indices de la tabla `operador`
--
ALTER TABLE `operador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjjv0rulu2oyk7qmejt62e7eo6` (`estado`),
  ADD KEY `FK5mllalwc0912mda2qvn7kh6kv` (`tipo_identificacion`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKshfy92pos5nspgcglqwm21tam` (`tipo_identificacion`),
  ADD KEY `FKgnnxyu35fdpa38pikpjuig0p7` (`tipo_usuario`);

--
-- Indices de la tabla `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_roles_name` (`name`),
  ADD UNIQUE KEY `UK_nb4h0p6txrmfc0xbrd1kglp9t` (`name`);

--
-- Indices de la tabla `system_list`
--
ALTER TABLE `system_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKltgxncr9tj6xvttg569r1makv` (`system_list_type`);

--
-- Indices de la tabla `system_type`
--
ALTER TABLE `system_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_users_username` (`username`),
  ADD UNIQUE KEY `uk_users_email` (`email`),
  ADD UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `fk_user_roles_role_id` (`role_id`);

--
-- Indices de la tabla `usuario_operador`
--
ALTER TABLE `usuario_operador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKffw8gdhi076raiw7kctm5epwc` (`operador`),
  ADD KEY `FKgk9wbulm87tivncrxynmtrti0` (`user`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8fhrqf7y8gntu1isot0sw285h` (`estado`),
  ADD KEY `FKglraa5yaoixvs30q8pjx8w0mr` (`personal`);

--
-- Indices de la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg42bl49afw51xljqkc2hre7mu` (`anfitrion`),
  ADD KEY `FKb44g0nx6474orn6s6fgvy9rmh` (`cidudad_visitante`),
  ADD KEY `FKp1c57v65go7ynia069cktdt9u` (`departamento_admin`),
  ADD KEY `FK9ir2om4yji17rla7jas05pyeg` (`estado`),
  ADD KEY `FKgt0uxjugjso2no9s2f41vtyx9` (`estado_civil`),
  ADD KEY `FKbh3a4somxrip2gxulhm2u7lc8` (`personal`);

--
-- Indices de la tabla `visita_activa`
--
ALTER TABLE `visita_activa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKibu09bokroc24q6htgxdq230p` (`visitante`);

--
-- Indices de la tabla `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK8um9h2wxsdjrgx3rjjwvny676` (`poll_id`,`user_id`),
  ADD KEY `fk_votes_user_id` (`user_id`),
  ADD KEY `fk_votes_poll_id` (`poll_id`),
  ADD KEY `fk_votes_choice_id` (`choice_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `choices`
--
ALTER TABLE `choices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `polls`
--
ALTER TABLE `polls`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `system_list`
--
ALTER TABLE `system_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `system_type`
--
ALTER TABLE `system_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `votes`
--
ALTER TABLE `votes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activos`
--
ALTER TABLE `activos`
  ADD CONSTRAINT `FKh6gnqcx2upsnw86lsy571g4o8` FOREIGN KEY (`estado`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKowlks4iiwqhxt698cehwcckss` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`);

--
-- Filtros para la tabla `automovil`
--
ALTER TABLE `automovil`
  ADD CONSTRAINT `FKf2gjuaqjepnbqbam6vwr34ows` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`),
  ADD CONSTRAINT `FKj5o9wxs4tpuyqhcemrobjy6bd` FOREIGN KEY (`tipo`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKojny34v33558ae9omdwe8n1qa` FOREIGN KEY (`estado`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKply32d987q1hxwmd8eomlfcgm` FOREIGN KEY (`departamento`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKsdgp99l5nkhbu49g44xchggwe` FOREIGN KEY (`sub_tipo`) REFERENCES `system_list` (`id`);

--
-- Filtros para la tabla `choices`
--
ALTER TABLE `choices`
  ADD CONSTRAINT `fk_choices_poll_id` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`);

--
-- Filtros para la tabla `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `FK2106sor50p2mlokhr6d1hlbge` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`);

--
-- Filtros para la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `FKh3mx2oibvswi4bm4vud7m8pld` FOREIGN KEY (`estado`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKhw3jcoe4fp6efnt5nry7res3` FOREIGN KEY (`division`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKix2ko1wb51qarov57o3rlp53j` FOREIGN KEY (`ciudad_residencia`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKjaiev7hbdcf4kk5qupc1q7o30` FOREIGN KEY (`cargo`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKlff8ovfp3q5b2m9tm40nihvau` FOREIGN KEY (`departamento_admi`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKmwqy4eoh3ke1oe3bd5iy521hq` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`),
  ADD CONSTRAINT `FKpokp2gmq91na26mkrnhwrvvyk` FOREIGN KEY (`edificio`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKtmgbchos5o68wruehvu98cwdj` FOREIGN KEY (`departamento_residencia`) REFERENCES `system_list` (`id`);

--
-- Filtros para la tabla `novedad`
--
ALTER TABLE `novedad`
  ADD CONSTRAINT `FKoy4hck2a68lmi5cdbwxs4vrw7` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`);

--
-- Filtros para la tabla `operador`
--
ALTER TABLE `operador`
  ADD CONSTRAINT `FK5mllalwc0912mda2qvn7kh6kv` FOREIGN KEY (`tipo_identificacion`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKjjv0rulu2oyk7qmejt62e7eo6` FOREIGN KEY (`estado`) REFERENCES `system_list` (`id`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `FKgnnxyu35fdpa38pikpjuig0p7` FOREIGN KEY (`tipo_usuario`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKshfy92pos5nspgcglqwm21tam` FOREIGN KEY (`tipo_identificacion`) REFERENCES `system_list` (`id`);

--
-- Filtros para la tabla `system_list`
--
ALTER TABLE `system_list`
  ADD CONSTRAINT `FKltgxncr9tj6xvttg569r1makv` FOREIGN KEY (`system_list_type`) REFERENCES `system_type` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `fk_user_roles_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `fk_user_roles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `usuario_operador`
--
ALTER TABLE `usuario_operador`
  ADD CONSTRAINT `FKffw8gdhi076raiw7kctm5epwc` FOREIGN KEY (`operador`) REFERENCES `operador` (`id`),
  ADD CONSTRAINT `FKgk9wbulm87tivncrxynmtrti0` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `FK8fhrqf7y8gntu1isot0sw285h` FOREIGN KEY (`estado`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKglraa5yaoixvs30q8pjx8w0mr` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`);

--
-- Filtros para la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD CONSTRAINT `FK9ir2om4yji17rla7jas05pyeg` FOREIGN KEY (`estado`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKb44g0nx6474orn6s6fgvy9rmh` FOREIGN KEY (`cidudad_visitante`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKbh3a4somxrip2gxulhm2u7lc8` FOREIGN KEY (`personal`) REFERENCES `personal` (`id`),
  ADD CONSTRAINT `FKg42bl49afw51xljqkc2hre7mu` FOREIGN KEY (`anfitrion`) REFERENCES `personal` (`id`),
  ADD CONSTRAINT `FKgt0uxjugjso2no9s2f41vtyx9` FOREIGN KEY (`estado_civil`) REFERENCES `system_list` (`id`),
  ADD CONSTRAINT `FKp1c57v65go7ynia069cktdt9u` FOREIGN KEY (`departamento_admin`) REFERENCES `system_list` (`id`);

--
-- Filtros para la tabla `visita_activa`
--
ALTER TABLE `visita_activa`
  ADD CONSTRAINT `FKibu09bokroc24q6htgxdq230p` FOREIGN KEY (`visitante`) REFERENCES `personal` (`id`);

--
-- Filtros para la tabla `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `fk_votes_choice_id` FOREIGN KEY (`choice_id`) REFERENCES `choices` (`id`),
  ADD CONSTRAINT `fk_votes_poll_id` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`),
  ADD CONSTRAINT `fk_votes_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
