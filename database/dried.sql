-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2024 at 10:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dried`
--

-- --------------------------------------------------------

--
-- Table structure for table `messagein`
--

CREATE TABLE `messagein` (
  `Id` int(11) NOT NULL,
  `SendTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ReceiveTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `MessageFrom` varchar(80) DEFAULT NULL,
  `MessageTo` varchar(80) DEFAULT NULL,
  `SMSC` varchar(80) DEFAULT NULL,
  `MessageText` text DEFAULT NULL,
  `MessageType` varchar(80) DEFAULT NULL,
  `MessageParts` int(11) DEFAULT NULL,
  `MessagePDU` text DEFAULT NULL,
  `Gateway` varchar(80) DEFAULT NULL,
  `UserId` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messagelog`
--

CREATE TABLE `messagelog` (
  `Id` int(11) NOT NULL,
  `SendTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ReceiveTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `StatusCode` int(11) DEFAULT NULL,
  `StatusText` varchar(80) DEFAULT NULL,
  `MessageTo` varchar(80) DEFAULT NULL,
  `MessageFrom` varchar(80) DEFAULT NULL,
  `MessageText` text DEFAULT NULL,
  `MessageType` varchar(80) DEFAULT NULL,
  `MessageId` varchar(80) DEFAULT NULL,
  `ErrorCode` varchar(80) DEFAULT NULL,
  `ErrorText` varchar(80) DEFAULT NULL,
  `Gateway` varchar(80) DEFAULT NULL,
  `MessageParts` int(11) DEFAULT NULL,
  `MessagePDU` text DEFAULT NULL,
  `Connector` varchar(80) DEFAULT NULL,
  `UserId` varchar(80) DEFAULT NULL,
  `UserInfo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messageout`
--

CREATE TABLE `messageout` (
  `Id` int(11) NOT NULL,
  `MessageTo` varchar(80) DEFAULT NULL,
  `MessageFrom` varchar(80) DEFAULT NULL,
  `MessageText` text DEFAULT NULL,
  `MessageType` varchar(80) DEFAULT NULL,
  `Gateway` varchar(80) DEFAULT NULL,
  `UserId` varchar(80) DEFAULT NULL,
  `UserInfo` text DEFAULT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Scheduled` datetime DEFAULT NULL,
  `ValidityPeriod` int(11) DEFAULT NULL,
  `IsSent` tinyint(1) NOT NULL DEFAULT 0,
  `IsRead` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messageout`
--

INSERT INTO `messageout` (`Id`, `MessageTo`, `MessageFrom`, `MessageText`, `MessageType`, `Gateway`, `UserId`, `UserInfo`, `Priority`, `Scheduled`, `ValidityPeriod`, `IsSent`, `IsRead`) VALUES
(1, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(2, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(3, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(4, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(5, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(6, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(7, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(8, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(9, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(10, '09996884424', 'Janno', 'FROM Bachelor of Science and Entrepreneurs : Your order has been Confirmed. The amount is 170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `id` int(11) NOT NULL,
  `orNumber` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productStock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pos`
--

INSERT INTO `pos` (`id`, `orNumber`, `productName`, `productPrice`, `productStock`, `created_at`) VALUES
(1, 71306, 'Hey', 23.00, 1, '2024-07-06 04:32:43'),
(2, 55503, 'Hey', 46.00, 2, '2024-07-06 04:45:51'),
(3, 23540, 'Hey', 46.00, 2, '2024-07-06 04:48:14'),
(4, 84982, 'Hey', 23.00, 1, '2024-07-06 05:33:51'),
(5, 59422, 'Hey', 23.00, 1, '2024-07-06 05:37:11'),
(6, 70196, 'Hey', 23.00, 1, '2024-07-06 05:54:32'),
(7, 85278, 'Hey', 23.00, 1, '2024-07-06 06:15:16'),
(8, 73123, 'Hey', 230.00, 10, '2024-07-06 06:16:17'),
(9, 94323, 'Joshua', 23.00, 1, '2024-07-06 06:23:55');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `PROID` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL,
  `images` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productCategory` varchar(100) DEFAULT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productStock` int(11) NOT NULL,
  `checkStock` int(11) DEFAULT NULL,
  `productDate` date DEFAULT NULL,
  `productStatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblautonumber`
--

CREATE TABLE `tblautonumber` (
  `ID` int(11) NOT NULL,
  `AUTOSTART` int(250) NOT NULL,
  `AUTOINC` int(11) NOT NULL,
  `AUTOEND` int(11) NOT NULL,
  `AUTOKEY` varchar(12) NOT NULL,
  `AUTONUM` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblautonumber`
--

INSERT INTO `tblautonumber` (`ID`, `AUTOSTART`, `AUTOINC`, `AUTOEND`, `AUTOKEY`, `AUTONUM`) VALUES
(1, 10, 1, 22, 'PROID', 10),
(2, 0, 1, 50, 'ordernumber', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `CATEGID` int(11) NOT NULL,
  `CATEGORIES` varchar(255) NOT NULL,
  `USERID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`CATEGID`, `CATEGORIES`, `USERID`) VALUES
(18, 'Dried Fish', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `CUSTOMERID` int(11) NOT NULL,
  `FNAME` varchar(30) NOT NULL,
  `LNAME` varchar(30) NOT NULL,
  `MNAME` varchar(30) NOT NULL,
  `CUSHOMENUM` varchar(90) NOT NULL,
  `STREETADD` text NOT NULL,
  `BRGYADD` text NOT NULL,
  `CITYADD` text NOT NULL,
  `PROVINCE` varchar(80) NOT NULL,
  `COUNTRY` varchar(30) NOT NULL,
  `DBIRTH` date NOT NULL,
  `GENDER` varchar(10) NOT NULL,
  `PHONE` varchar(20) NOT NULL,
  `EMAILADD` varchar(40) NOT NULL,
  `ZIPCODE` int(6) NOT NULL,
  `CUSUNAME` varchar(20) NOT NULL,
  `CUSPASS` varchar(90) NOT NULL,
  `CUSPHOTO` varchar(255) NOT NULL,
  `TERMS` tinyint(4) NOT NULL,
  `DATEJOIN` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`CUSTOMERID`, `FNAME`, `LNAME`, `MNAME`, `CUSHOMENUM`, `STREETADD`, `BRGYADD`, `CITYADD`, `PROVINCE`, `COUNTRY`, `DBIRTH`, `GENDER`, `PHONE`, `EMAILADD`, `ZIPCODE`, `CUSUNAME`, `CUSPASS`, `CUSPHOTO`, `TERMS`, `DATEJOIN`) VALUES
(14, 'jonas', 'dabalos', '', '', '', '', 'Talangnan, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09996884424', '', 0, 'jonas@gmail.com', '4c2f2c5a6f07af51c6cf3737c2e46cf59f262380', '', 1, '2024-07-03 01:28:37'),
(15, 'John Anthon', 'Gidayawan', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692880485', '', 0, 'delacruzjohnanthon@g', 'f222e3e3a319a95ef21de806314fc6ffebeaa71a', '', 1, '2024-07-03 04:23:34'),
(16, 'Johnanthon', 'Gidayawan', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09996644242', '', 0, 'delacruzjohnanthon@g', 'f222e3e3a319a95ef21de806314fc6ffebeaa71a', '', 1, '2024-07-03 04:25:12'),
(17, 'asd', 'asd', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692880485', '', 0, 'asd@gmail.com', 'c8499454bada15f6d76bbf8cf133960f93f9b4eb', '', 1, '2024-07-03 04:25:46'),
(18, 'asd asd', 'asd asd', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09123456768', '', 0, 'asd123@gmail.com', '29814ead80a2aea921cab0a7bebfaba73eeb16a2', '', 1, '2024-07-03 04:26:42'),
(19, 'Joshua Anthon', 'Dela Cruz', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09876456756', '', 0, 'joshuagidayawandelac', '8f0da62ccf5a95a280d4fb96ee918ee599e26949', '', 1, '2024-07-03 04:28:16'),
(20, 'asdasd asdsad', 'asdsad asdasd', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Female', '09996663542', '', 0, 'delacruzjohnanthon12', 'd26c36f7ea5636293fa25887cf67b5beec331230', '', 1, '2024-07-03 04:32:55'),
(21, 'ds', 'ds', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09123456768', '', 0, 'delacruzjohnanthon12', 'd26c36f7ea5636293fa25887cf67b5beec331230', '', 1, '2024-07-03 04:33:21'),
(22, 'John Anthon', 'Gidayawan', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09273847563', '', 0, 'asd123@gmail.com', '7d7e0ea78acf14b6537160923aa99796439ff20b', '', 1, '2024-07-03 04:41:47'),
(23, 'John Anthon', 'Gidayawan', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09273847563', '', 0, 'asd123@gmail.com', '7d7e0ea78acf14b6537160923aa99796439ff20b', '', 1, '2024-07-03 04:41:47'),
(24, 'John Anthon', 'Gidayawan', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09273847563', '', 0, 'asd123@gmail.com', '7d7e0ea78acf14b6537160923aa99796439ff20b', '', 1, '2024-07-03 04:45:46'),
(25, 'John Anthon', 'Gidayawan', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09273847563', '', 0, 'asd123@gmail.com', '7d7e0ea78acf14b6537160923aa99796439ff20b', '', 1, '2024-07-03 04:45:46'),
(26, 'John Anthons', 'Gidayawans', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09482736452', '', 0, 'delacruzjohnanthon25', '084e56c536c759735b3aec52be29610c86b38d40', '', 1, '2024-07-03 04:46:53'),
(27, 'John Anthons', 'Gidayawans', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09482736452', '', 0, 'delacruzjohnanthon25', '084e56c536c759735b3aec52be29610c86b38d40', '', 1, '2024-07-03 04:46:53'),
(28, 'John Anthonsss', 'Gidayawansss', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09665432456', '', 0, 'delacruzjohnanthon56', 'c8cd88d999678d650581ac2f7eb7be61d3bbc77d', '', 1, '2024-07-03 04:51:56'),
(29, 'John Anthonsss', 'Gidayawansss', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09665432456', '', 0, 'delacruzjohnanthon56', 'c8cd88d999678d650581ac2f7eb7be61d3bbc77d', '', 1, '2024-07-03 04:51:56'),
(30, 'John Anthonsss', 'Gidayawanss', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Female', '09876756453', '', 0, 'delacruz25johnanthon', '00ea1da4192a2030f9ae023de3b3143ed647bbab', '', 1, '2024-07-03 04:53:39'),
(31, 'John Anthonsss', 'Gidayawanss', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Female', '09876756453', '', 0, 'delacruz25johnanthon', '00ea1da4192a2030f9ae023de3b3143ed647bbab', '', 1, '2024-07-03 04:53:39'),
(32, 'John Anthonssssss', 'Gidayawansdsdsdas', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09678458234', '', 0, 'delacruz24johnanthon', '20ae8efa52cfebf8ffd3c999b06d0e5a61e5dcd3', '', 1, '2024-07-03 04:56:57'),
(33, 'John Anthonssssss', 'Gidayawansdsdsdas', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09678458234', '', 0, 'delacruz24johnanthon', '20ae8efa52cfebf8ffd3c999b06d0e5a61e5dcd3', '', 1, '2024-07-03 04:56:57'),
(34, 'John Anthonsd', 'Gidayawansdsd', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09486758451', '', 0, 'delacruzjohnanthon50', '442184da21866277dc3d8d2c4b03565791258090', '', 1, '2024-07-03 04:58:10'),
(35, 'John Anthonsd', 'Gidayawansdsd', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09486758451', '', 0, 'delacruzjohnanthon50', '442184da21866277dc3d8d2c4b03565791258090', '', 1, '2024-07-03 04:58:10'),
(36, 'John Anthonsss', 'Gidayawans', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692870456', '', 0, 'delacruzjohnanthon@g', '$2y$10$1LydMLyt4jU.KWnBs.PdvecGaPUVKIvDrJmz/bS7PBdPlC3SEvGOS', '', 1, '2024-07-02 17:03:58'),
(37, 'John Anthonsss', 'Gidayawans', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692870456', '', 0, 'delacruzjohnanthon@g', '$2y$10$1LydMLyt4jU.KWnBs.PdvecGaPUVKIvDrJmz/bS7PBdPlC3SEvGOS', '', 1, '2024-07-02 17:03:58'),
(38, 'John Anthonsss', 'Gidayawans', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692870456', '', 0, 'delacruzjohnanthon@g', '$2y$10$yu0Ckh/L3XMkXbz6hZqk1e8ijXy/OkQWFHsyxozOEDrz1jESsqpiC', '', 1, '2024-07-02 17:04:45'),
(39, 'John Anthonsss', 'Gidayawans', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692870456', '', 0, 'delacruzjohnanthon@g', '$2y$10$yu0Ckh/L3XMkXbz6hZqk1e8ijXy/OkQWFHsyxozOEDrz1jESsqpiC', '', 1, '2024-07-02 17:04:45'),
(40, 'John Anthonsss', 'Gidayawans', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692870456', '', 0, 'delacruzjohnanthon@g', '$2y$10$4QCdFeSKikCeFP9zvbAB8OR.iX50/taMfNnk4Dv7njbZB6CyQN2m2', '', 1, '2024-07-02 17:05:16'),
(41, 'John Anthonsss', 'Gidayawans', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692870456', '', 0, 'delacruzjohnanthon@g', '$2y$10$4QCdFeSKikCeFP9zvbAB8OR.iX50/taMfNnk4Dv7njbZB6CyQN2m2', '', 1, '2024-07-02 17:05:16'),
(42, 'John Anthonsss', 'Gidayawans', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692870456', '', 0, 'delacruzjohnanthon@g', '$2y$10$cEK8bN9TXnGzy7BmcsMnfO8OFeA9Hm09fMu2nXJQrDC6.BE6V5S2K', '', 1, '2024-07-02 17:05:31'),
(43, 'John Anthonsss', 'Gidayawans', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692870456', '', 0, 'delacruzjohnanthon@g', '$2y$10$cEK8bN9TXnGzy7BmcsMnfO8OFeA9Hm09fMu2nXJQrDC6.BE6V5S2K', '', 1, '2024-07-02 17:05:31'),
(44, 'Joasdhn Anthonsss', 'Gidayawasdns', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692870456', '', 0, 'delacruzjohnanthon@g', '$2y$10$2MalPk5ZlcJw/pZWTl.iMebVKKCALdYbV5AiB5ctTZaOeGk8DRHWq', '', 1, '2024-07-02 17:05:48'),
(45, 'Joasdhn Anthonsss', 'Gidayawasdns', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692870456', '', 0, 'delacruzjohnanthon@g', '$2y$10$2MalPk5ZlcJw/pZWTl.iMebVKKCALdYbV5AiB5ctTZaOeGk8DRHWq', '', 1, '2024-07-02 17:05:48'),
(46, 'Joasdhn Anthonsss', 'Gidayawasdns', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692870456', '', 0, 'delacruzjohnanthon@g', '$2y$10$WZP8yh2Z2Fa.vpevdtoYIOQ6InqKvkubZwQvOeIuIiOIL3W3mSTV2', '', 1, '2024-07-02 17:06:17'),
(47, 'Joasdhn Anthonsss', 'Gidayawasdns', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692870456', '', 0, 'delacruzjohnanthon@g', '$2y$10$WZP8yh2Z2Fa.vpevdtoYIOQ6InqKvkubZwQvOeIuIiOIL3W3mSTV2', '', 1, '2024-07-02 17:06:17'),
(48, 'Joasdhn Anthonsss', 'Gidayawasdns', '', '', '', '', 'Mancilang, Madridejos, Cebu', '', '', '0000-00-00', 'Male', '09692870456', '', 0, 'delacruzjohnanthon@g', '00ea1da4192a2030f9ae023de3b3143ed647bbab', '', 1, '2024-07-02 17:06:32');

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

CREATE TABLE `tblorder` (
  `ORDERID` int(11) NOT NULL,
  `PROID` int(11) NOT NULL,
  `ORDEREDQTY` int(11) NOT NULL,
  `ORDEREDPRICE` double NOT NULL,
  `ORDEREDNUM` int(11) NOT NULL,
  `USERID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblorder`
--

INSERT INTO `tblorder` (`ORDERID`, `PROID`, `ORDEREDQTY`, `ORDEREDPRICE`, `ORDEREDNUM`, `USERID`) VALUES
(59, 1021, 1, 150, 43, 0),
(60, 1021, 1, 150, 44, 0),
(61, 1021, 1, 150, 45, 0),
(62, 1021, 1, 150, 46, 0),
(63, 1021, 1, 150, 47, 0),
(64, 1021, 1, 150, 48, 0),
(65, 1021, 1, 150, 49, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

CREATE TABLE `tblproduct` (
  `PROID` int(11) NOT NULL,
  `PRODESC` varchar(255) DEFAULT NULL,
  `INGREDIENTS` varchar(255) NOT NULL,
  `PROQTY` int(11) DEFAULT NULL,
  `ORIGINALPRICE` double NOT NULL,
  `PROPRICE` double DEFAULT NULL,
  `CATEGID` int(11) DEFAULT NULL,
  `IMAGES` varchar(255) DEFAULT NULL,
  `PROSTATS` varchar(30) DEFAULT NULL,
  `OWNERNAME` varchar(90) NOT NULL,
  `OWNERPHONE` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblproduct`
--

INSERT INTO `tblproduct` (`PROID`, `PRODESC`, `INGREDIENTS`, `PROQTY`, `ORIGINALPRICE`, `PROPRICE`, `CATEGID`, `IMAGES`, `PROSTATS`, `OWNERNAME`, `OWNERPHONE`) VALUES
(1021, 'Tabagak 200/kilo', '', 0, 150, 150, 18, 'uploaded_photos/Tabagak.jpg', 'Available', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblpromopro`
--

CREATE TABLE `tblpromopro` (
  `PROMOID` int(11) NOT NULL,
  `PROID` int(11) NOT NULL,
  `PRODISCOUNT` double NOT NULL,
  `PRODISPRICE` double NOT NULL,
  `PROBANNER` tinyint(4) NOT NULL,
  `PRONEW` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpromopro`
--

INSERT INTO `tblpromopro` (`PROMOID`, `PROID`, `PRODISCOUNT`, `PRODISPRICE`, `PROBANNER`, `PRONEW`) VALUES
(1, 100, 0, 25, 0, 0),
(2, 101, 0, 45, 0, 0),
(3, 102, 0, 35, 1, 0),
(5, 104, 0, 25, 0, 0),
(6, 105, 0, 45, 0, 0),
(7, 106, 0, 35, 0, 0),
(8, 107, 0, 35, 0, 0),
(9, 108, 0, 35, 0, 0),
(10, 109, 0, 45, 0, 0),
(11, 1010, 0, 13, 0, 0),
(12, 1011, 0, 12, 0, 0),
(13, 1012, 0, 45, 0, 0),
(15, 1014, 0, 25, 0, 0),
(16, 1015, 0, 50, 1, 0),
(19, 1018, 0, 12, 0, 0),
(20, 1019, 0, 13, 0, 0),
(21, 1020, 0, 150, 0, 0),
(22, 1021, 0, 150, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblsetting`
--

CREATE TABLE `tblsetting` (
  `SETTINGID` int(11) NOT NULL,
  `PLACE` text NOT NULL,
  `BRGY` varchar(90) NOT NULL,
  `DELPRICE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsetting`
--

INSERT INTO `tblsetting` (`SETTINGID`, `PLACE`, `BRGY`, `DELPRICE`) VALUES
(1, 'Bantayan Island(local)', '', 20),
(2, 'Metro Manila', '', 100),
(3, 'Luzon', '', 90),
(4, 'Visayas ', '', 50),
(5, 'Mindanao', '', 80);

-- --------------------------------------------------------

--
-- Table structure for table `tblstockin`
--

CREATE TABLE `tblstockin` (
  `STOCKINID` int(11) NOT NULL,
  `STOCKDATE` datetime DEFAULT NULL,
  `PROID` int(11) DEFAULT NULL,
  `STOCKQTY` int(11) DEFAULT NULL,
  `STOCKPRICE` double DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblsummary`
--

CREATE TABLE `tblsummary` (
  `SUMMARYID` int(11) NOT NULL,
  `ORDEREDDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `CUSTOMERID` int(11) NOT NULL,
  `ORDEREDNUM` int(11) NOT NULL,
  `DELFEE` double NOT NULL,
  `PAYMENT` double NOT NULL,
  `PAYMENTMETHOD` varchar(30) NOT NULL,
  `ORDEREDSTATS` varchar(30) NOT NULL,
  `ORDEREDREMARKS` varchar(125) NOT NULL,
  `CLAIMEDADTE` datetime NOT NULL,
  `HVIEW` tinyint(4) NOT NULL,
  `DELADD` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsummary`
--

INSERT INTO `tblsummary` (`SUMMARYID`, `ORDEREDDATE`, `CUSTOMERID`, `ORDEREDNUM`, `DELFEE`, `PAYMENT`, `PAYMENTMETHOD`, `ORDEREDSTATS`, `ORDEREDREMARKS`, `CLAIMEDADTE`, `HVIEW`, `DELADD`) VALUES
(42, '2024-07-03 01:57:11', 13, 39, 20, 150, 'Cash on Delivery', 'Pending', 'Your order is on process.', '2024-07-03 00:00:00', 0, ''),
(55, '2024-07-03 01:58:20', 14, 40, 20, 170, 'Cash on Delivery', 'On The Way', 'Your order is on the way.', '2024-07-03 00:00:00', 0, ''),
(56, '2024-07-03 02:14:12', 14, 41, 100, 250, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 0, ''),
(57, '2024-07-03 02:16:50', 14, 42, 20, 170, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 0, ''),
(58, '2024-07-03 02:41:55', 14, 43, 20, 170, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 0, ''),
(59, '2024-07-03 02:48:16', 14, 44, 20, 170, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 0, ''),
(60, '2024-07-03 02:49:17', 14, 45, 20, 170, 'Cash on Delivery', 'Confirmed', 'Your order has been accepted.', '2024-07-04 00:00:00', 0, ''),
(61, '2024-07-03 02:51:16', 14, 46, 20, 170, 'Cash on Delivery', 'On The Way', 'Your order is on the way.', '2024-07-04 00:00:00', 0, ''),
(62, '2024-07-03 03:50:20', 14, 47, 20, 170, 'Cash on Delivery', 'On The Way', 'Your order is on the way.', '2024-07-04 00:00:00', 0, ''),
(63, '2024-07-03 03:58:35', 14, 48, 20, 170, 'Cash on Delivery', 'On The Way', 'Your order is on the way.', '2024-07-04 00:00:00', 0, ''),
(64, '2024-07-02 17:10:17', 14, 49, 100, 250, 'Cash on Delivery', 'On The Way', 'Your order is on the way.', '2024-07-04 00:00:00', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbluseraccount`
--

CREATE TABLE `tbluseraccount` (
  `USERID` int(11) NOT NULL,
  `U_NAME` varchar(122) NOT NULL,
  `U_USERNAME` varchar(122) NOT NULL,
  `U_CON` varchar(11) NOT NULL,
  `U_EMAIL` varchar(225) NOT NULL,
  `U_PASS` varchar(122) NOT NULL,
  `U_ROLE` varchar(30) NOT NULL,
  `USERIMAGE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbluseraccount`
--

INSERT INTO `tbluseraccount` (`USERID`, `U_NAME`, `U_USERNAME`, `U_CON`, `U_EMAIL`, `U_PASS`, `U_ROLE`, `USERIMAGE`) VALUES
(7, 'John Anthon Dela Cruz', 'DevJohn@gmail.com', '09692870485', 'delacruzjohnanthon@gmail.com', 'f222e3e3a319a95ef21de806314fc6ffebeaa71a', 'Administrator', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messagein`
--
ALTER TABLE `messagein`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `messagelog`
--
ALTER TABLE `messagelog`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IDX_MessageId` (`MessageId`,`SendTime`);

--
-- Indexes for table `messageout`
--
ALTER TABLE `messageout`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IDX_IsRead` (`IsRead`);

--
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblautonumber`
--
ALTER TABLE `tblautonumber`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`CATEGID`);

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`CUSTOMERID`);

--
-- Indexes for table `tblorder`
--
ALTER TABLE `tblorder`
  ADD PRIMARY KEY (`ORDERID`),
  ADD KEY `USERID` (`USERID`),
  ADD KEY `PROID` (`PROID`),
  ADD KEY `ORDEREDNUM` (`ORDEREDNUM`);

--
-- Indexes for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD PRIMARY KEY (`PROID`),
  ADD KEY `CATEGID` (`CATEGID`);

--
-- Indexes for table `tblpromopro`
--
ALTER TABLE `tblpromopro`
  ADD PRIMARY KEY (`PROMOID`),
  ADD UNIQUE KEY `PROID` (`PROID`);

--
-- Indexes for table `tblsetting`
--
ALTER TABLE `tblsetting`
  ADD PRIMARY KEY (`SETTINGID`);

--
-- Indexes for table `tblstockin`
--
ALTER TABLE `tblstockin`
  ADD PRIMARY KEY (`STOCKINID`),
  ADD KEY `PROID` (`PROID`,`USERID`),
  ADD KEY `USERID` (`USERID`);

--
-- Indexes for table `tblsummary`
--
ALTER TABLE `tblsummary`
  ADD PRIMARY KEY (`SUMMARYID`),
  ADD UNIQUE KEY `ORDEREDNUM` (`ORDEREDNUM`),
  ADD KEY `CUSTOMERID` (`CUSTOMERID`),
  ADD KEY `USERID` (`DELADD`);

--
-- Indexes for table `tbluseraccount`
--
ALTER TABLE `tbluseraccount`
  ADD PRIMARY KEY (`USERID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messagein`
--
ALTER TABLE `messagein`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `messagelog`
--
ALTER TABLE `messagelog`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messageout`
--
ALTER TABLE `messageout`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblautonumber`
--
ALTER TABLE `tblautonumber`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `CATEGID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  MODIFY `CUSTOMERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tblorder`
--
ALTER TABLE `tblorder`
  MODIFY `ORDERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `tblpromopro`
--
ALTER TABLE `tblpromopro`
  MODIFY `PROMOID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tblsetting`
--
ALTER TABLE `tblsetting`
  MODIFY `SETTINGID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblstockin`
--
ALTER TABLE `tblstockin`
  MODIFY `STOCKINID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblsummary`
--
ALTER TABLE `tblsummary`
  MODIFY `SUMMARYID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `tbluseraccount`
--
ALTER TABLE `tbluseraccount`
  MODIFY `USERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
