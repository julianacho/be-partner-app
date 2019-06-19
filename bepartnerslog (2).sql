-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2019 a las 17:45:18
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
-- Base de datos: `bepartnerslog`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Insert_User_Log` (IN `v_Id_Third_Public` VARCHAR(80), IN `v_Id_User_Public` VARCHAR(80), IN `V_Id_Razon` VARCHAR(80), IN `V_Id_Estatus` VARCHAR(80))  BEGIN

INSERT INTO `bepartnerslog`.`mp_log_transacion_user` (`Id_Third_Public`, `Id_User_Public`, `Id_Reason_Type`, `Date_Time_Register`, `Id_Status`) 
VALUES (v_Id_Third_Public, v_Id_User_Public, V_Id_Razon, CURDATE(), V_Id_Estatus);

SELECT MAX(Id_Log_transaction_User) as Id_Log_transaction_User FROM `bepartnerslog`.`mp_log_transacion_user`
WHERE Id_Third_Public=v_Id_Third_Public AND Id_User_Public=v_Id_User_Public;

	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Insert_User_Log_Info` (IN `V_Id_Log_Transaction_User` INT, IN `V_Value` VARCHAR(100000), IN `V_Transaction_Type` VARCHAR(80))  BEGIN

INSERT INTO `bepartnerslog`.`mp_log_transaction_user_info` (`Id_Log_Transaction_User`, `Value`, `Transaction_Type`, `Create_Date`) 
VALUES (V_Id_Log_Transaction_User, V_Value, V_Transaction_Type, CURDATE());
	
END$$

DELIMITER ;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
