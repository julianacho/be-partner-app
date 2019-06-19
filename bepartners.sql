-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2019 a las 17:45:04
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpSert_Third` (IN `v_Id_Third_Public` VARCHAR(80), IN `V_Id_Type` VARCHAR(80), IN `V_Identification_Number` VARCHAR(80), IN `V_Business_Name` VARCHAR(80), IN `V_Enable` CHAR(1))  BEGIN
IF V_Id_Third_Public = '' THEN
		INSERT INTO `bepartners`.`mp_third` 
		(`Id_Third_Public`
		, `Id_Type`
		, `Identification_Number`
		, `Business_Name`
		, `Enable`
		, `Create_Date`
		, `Last_Modify`) 
		VALUES (UUID(), V_Id_Type, V_Identification_Number, V_Business_Name, V_Enable, CURDATE(), CURDATE());
ELSE
		UPDATE `bepartners`.`mp_third` 
		SET `Business_Name`=V_Business_Name, `Enable`=V_Enable, `Last_Modify`=CURDATE()  WHERE  `Id_Third_Public`=v_Id_Third_Public;
END IF;
		COMMIT;
		SELECT * FROM `bepartners`.`mp_third` WHERE  Identification_Number=V_Identification_Number AND Id_Type=V_Id_Type;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpSert_Third_Basic_Info` (IN `V_Id_Third_Public` VARCHAR(80), IN `V_Id_Info_Type_Third` VARCHAR(80), IN `V_Value` VARCHAR(80), IN `V_Enable` CHAR(1))  BEGIN

DECLARE V_Id_Third_Infio INT;


SELECT inf.Id_Third_Info INTO V_Id_Third_Infio
FROM mp_third_info inf
JOIN mp_third thr ON thr.Id_Third=inf.Id_Third
WHERE thr.Id_Third_Public=V_Id_Third_Public
AND inf.Id_Info_Type_Third=V_Id_Info_Type_Third;

IF V_Id_Third_Infio > 0 THEN
	UPDATE `bepartners`.`mp_third_info` 
	SET `Value`=V_Value, `Enable`=V_Enable, `Last_Modify`=CURDATE()
	WHERE  `Id_Third_Info`=V_Id_Third_Infio AND `Id_Info_Type_Third`=V_Id_Info_Type_Third;		
ELSE	
	INSERT INTO `bepartners`.`mp_third_info` (`Id_Third`, `Id_Info_Type_Third`, `Value`, `Enable`, `Create_Date`, `Last_Modify`) 
	VALUES ((SELECT th.Id_Third FROM mp_third th WHERE th.Id_Third_Public=V_Id_Third_Public), V_Id_Info_Type_Third, V_Value, V_Enable, CURDATE(), CURDATE());		
END IF;

SELECT inf.*
FROM mp_third_info inf 
JOIN mp_third thr ON thr.Id_Third=inf.Id_Third
WHERE thr.Id_Third_Public=V_Id_Third_Public AND inf.Id_Info_Type_Third=V_Id_Info_Type_Third;
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpSert_User` (IN `V_Id_User_Public` VARCHAR(80), IN `V_Id_Type` VARCHAR(80), IN `V_Identification_Number` VARCHAR(80), IN `V_Name` VARCHAR(80), IN `V_Last_Name` VARCHAR(80), IN `V_Email` VARCHAR(80), IN `V_Phone` VARCHAR(80), IN `V_Profile_Picture` VARCHAR(80), IN `V_Enable` CHAR(1))  BEGIN

IF V_Id_User_Public = '' THEN
		INSERT INTO `bepartners`.`mp_user` (`Id_User_Public`, `Id_Type`, `Identification_Number`, `Name`, `Last_Name`, `Email`, `Phone`, `Profile_Picture`, `Enable`, `Create_Date`, `Last_Date`) 
		VALUES (UUID()
		, V_Id_Type, 
		V_Identification_Number, 
		V_Name, 
		V_Last_Name, 
		V_Email, 
		V_Phone, 
		V_Profile_Picture, 
		V_Enable, 
		CURDATE(), 
		CURDATE());
ELSE
		UPDATE `bepartners`.`mp_user` 
		SET `Last_Name`=V_Last_Name,
		`Email`=V_Email,
		`Phone`=V_Phone,
		`Profile_Picture`=V_Profile_Picture,
		 `Enable`=V_Enable, 
		 `Last_Date`=CURDATE()  
		 WHERE  `Id_User_Public`=V_Id_User_Public;
END IF;
COMMIT;
SELECT * FROM bepartners.mp_user WHERE Id_Type=V_Id_Type AND Identification_Number=V_Identification_Number;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpSert_User_Info` (IN `V_Id_User_Public` VARCHAR(80), IN `V_Id_Info_Type_User` VARCHAR(80), IN `V_Value` VARCHAR(80), IN `V_Enable` CHAR(1))  BEGIN

DECLARE V_Id_Use_Infio INT;

SELECT inf.Id_Use_Info INTO V_Id_Use_Infio
FROM mp_user_info inf 
JOIN mp_user us ON us.Id_User=inf.Id_User
WHERE us.Id_User_Public=V_Id_User_Public
AND inf.Id_Info_Type_User=V_Id_Info_Type_User;

IF V_Id_Use_Infio > 0 THEN
	UPDATE `bepartners`.`mp_user_info` 
	SET `Value`=V_Value, `Enable`=V_Enable, `Last_Modify`=CURDATE()
	WHERE  `Id_Use_Info`=V_Id_Use_Infio AND `Id_Info_Type_User`=V_Id_Info_Type_User;	
ELSE
	INSERT INTO `bepartners`.`mp_user_info` (`Id_User`, `Id_Info_Type_User`, `Value`, `Enable`, `Create_Date`, `Last_Modify`) 
	VALUES ((SELECT us.id_User FROM mp_user us  WHERE us.Id_User_Public=V_Id_User_Public), V_Id_Info_Type_User, V_Value, V_Enable, CURDATE(), CURDATE());
END IF;

COMMIT;

SELECT inf.*
FROM mp_user_info inf 
JOIN mp_user us ON us.Id_User=inf.Id_User
WHERE us.Id_User_Public=V_Id_User_Public
AND inf.Id_Info_Type_User=V_Id_Info_Type_User;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpSert_User_third` (IN `V_Id_User_Public` VARCHAR(80), IN `V_Id_Third_Public` VARCHAR(80), IN `V_Enable` CHAR(1))  BEGIN

DECLARE V_Id_User_Third INT;
		SELECT ust.Id_User_Third INTO V_Id_User_Third
		FROM mp_user_third  ust
		JOIN mp_user us ON ust.Id_User=us.Id_User
		JOIN mp_third th ON ust.Id_Third=th.Id_Third
		WHERE us.Id_User_Public=V_Id_User_Public
		AND th.Id_Third_Public=V_Id_Third_Public;
		
IF V_Id_User_Third > 0 THEN
   UPDATE `bepartners`.`mp_user_third` 
	SET  `Enable`=V_Enable, `Last_Modify`=CURDATE()
	WHERE  `Id_User_Third`=V_Id_User_Third;

ELSE

	INSERT INTO `bepartners`.`mp_user_third` (`Id_User`, `Id_Third`, `Enable`, `Create_Date`, `Last_Modify`) 
	VALUES (
	(SELECT us.id_User FROM mp_user us  WHERE us.Id_User_Public=V_Id_User_Public), 
	(SELECT th.Id_Third FROM mp_third th WHERE th.Id_Third_Public=V_Id_Third_Public), b'0', CURDATE(), CURDATE());


	INSERT INTO `bepartners`.`mp_user_third_terms` (`Id_User_Third`, `Id_Terms`, `Enable`, `Create_Date`, `Last_Modify`) 
	VALUES (
	(

	SELECT usr_th.Id_User_Third FROM bepartners.mp_user_third usr_th 
	JOIN mp_user us1 ON usr_th.Id_User=us1.id_User AND us1.Id_User_Public=V_Id_User_Public
	JOIN mp_third th1 ON usr_th.Id_Third = th1.Id_Third AND  th1.Id_Third_Public=V_Id_Third_Public

	)
	, 
	(SELECT tr.Id_terms FROM bo_terms tr WHERE tr.Enable=b'0')
	, V_Enable, CURDATE(), CURDATE());

END IF;

	SELECT ust.* FROM mp_user_third  ust
	JOIN mp_user us ON ust.Id_User=us.Id_User
	JOIN mp_third th ON ust.Id_Third=th.Id_Third
	WHERE us.Id_User_Public=V_Id_User_Public
	AND th.Id_Third_Public=V_Id_Third_Public;


END$$

DELIMITER ;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
