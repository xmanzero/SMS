-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2014 at 03:54 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sunnet_sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_queue`
--

CREATE TABLE IF NOT EXISTS `account_queue` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(50) CHARACTER SET latin1 NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(20) CHARACTER SET latin1 DEFAULT 'user',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `account_queue`
--

INSERT INTO `account_queue` (`ID`, `account`, `password`, `role`) VALUES
(1, 'tony', '5acdc9ca5d99ae66afdfe1eea0e3b26b', 'user'),
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `all_sms_queue_in`
--

CREATE TABLE IF NOT EXISTS `all_sms_queue_in` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PhoneNumber` varchar(20) CHARACTER SET latin1 NOT NULL,
  `ServiceNumber` varchar(10) CHARACTER SET latin1 NOT NULL,
  `CommandName` varchar(20) CHARACTER SET latin1 NOT NULL,
  `FullContent` varchar(400) CHARACTER SET latin1 NOT NULL,
  `Datetime` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Operator` varchar(20) CHARACTER SET latin1 NOT NULL,
  `RequestID` varchar(100) CHARACTER SET latin1 NOT NULL,
  `UserName` varchar(45) CHARACTER SET latin1 NOT NULL,
  `MessageType` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '1',
  `Charge` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `GateRequestId` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Keyword` varchar(100) CHARACTER SET latin1 NOT NULL,
  `MessageTitle` varchar(45) CHARACTER SET latin1 NOT NULL,
  `FromPhone` varchar(20) CHARACTER SET latin1 NOT NULL,
  `ProcessTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PartNum` int(10) unsigned NOT NULL DEFAULT '1',
  `TotalPart` int(10) unsigned NOT NULL DEFAULT '1',
  `CalledNumber` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `all_sms_queue_in`
--

INSERT INTO `all_sms_queue_in` (`ID`, `PhoneNumber`, `ServiceNumber`, `CommandName`, `FullContent`, `Datetime`, `Operator`, `RequestID`, `UserName`, `MessageType`, `Charge`, `GateRequestId`, `Keyword`, `MessageTitle`, `FromPhone`, `ProcessTime`, `PartNum`, `TotalPart`, `CalledNumber`) VALUES
(3, '478445648', '', '', 'SMS -> 8730', '', '', '', '', '1', 1, '', '', '', '', '2014-05-27 01:41:05', 1, 1, 0),
(4, '848484', '', '', 'SMS->8530\r\nSMS->8730\r\n', '', '', '', '', '1', 1, '', '', '', '', '2014-05-27 01:41:14', 1, 1, 0),
(5, '148484', '', '', 'SMS->1900', '', '', '', '', '1', 1, '', '', '', '', '2014-05-27 01:43:46', 1, 1, 0),
(6, '226292', '', '', 'SMS->1900', '', '', '', '', '1', 1, '', '', '', '', '2014-05-27 01:42:04', 1, 1, 0),
(7, '55128', '', '', 'SMS->1900', '', '', '', '', '1', 1, '', '', '', '', '2014-05-27 01:43:46', 1, 1, 0),
(8, '5226269', '', '', 'SMS->1900', '', '', '', '', '1', 1, '', '', '', '', '2014-05-27 01:43:46', 1, 1, 0),
(9, '26262', '', '', 'SMS->1900', '', '', '', '', '1', 1, '', '', '', '', '2014-05-27 01:43:46', 1, 1, 0),
(10, '262626', '', '', '2SMS->1900', '', '', '', '', '1', 1, '', '', '', '', '2014-05-27 01:42:34', 1, 1, 0),
(11, '624411', '', '', 'SMS->1900', '', '', '', '', '1', 1, '', '', '', '', '2014-05-27 01:42:41', 1, 1, 0),
(12, '18443', '', '', 'sdsfe', '', '', '', '', '1', 1, '', '', '', '', '2014-05-27 01:42:50', 1, 1, 0),
(13, '2249', '', '', 'SMS->1900', '', '', '', '', '1', 1, '', '', '', '', '2014-05-27 01:43:46', 1, 1, 0),
(14, '849', '', '', 'SMS->1900', '', '', '', '', '1', 1, '', '', '', '', '2014-05-27 01:43:46', 1, 1, 0),
(15, '95959', '', '', 'SMS->1900', '', '', '', '', '1', 1, '', '', '', '', '2014-05-27 01:43:46', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `all_sms_queue_out`
--

CREATE TABLE IF NOT EXISTS `all_sms_queue_out` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PhoneNumber` varchar(20) CHARACTER SET latin1 NOT NULL,
  `ServiceNumber` varchar(10) CHARACTER SET latin1 NOT NULL,
  `CommandName` varchar(20) CHARACTER SET latin1 NOT NULL,
  `FullContent` varchar(2000) CHARACTER SET latin1 NOT NULL,
  `Datetime` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `Operator` varchar(20) CHARACTER SET latin1 NOT NULL,
  `RequestID` varchar(100) CHARACTER SET latin1 NOT NULL,
  `UserName` varchar(45) CHARACTER SET latin1 NOT NULL,
  `MessageType` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '1',
  `Charge` tinyint(1) NOT NULL,
  `GateRequestId` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Keyword` varchar(100) CHARACTER SET latin1 NOT NULL,
  `MessageTitle` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `FromPhone` varchar(20) CHARACTER SET latin1 NOT NULL,
  `ProcessTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PartNum` int(10) unsigned NOT NULL DEFAULT '1',
  `TotalPart` int(10) unsigned NOT NULL DEFAULT '1',
  `CalledNumber` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `all_sms_queue_out`
--

INSERT INTO `all_sms_queue_out` (`ID`, `PhoneNumber`, `ServiceNumber`, `CommandName`, `FullContent`, `Datetime`, `Operator`, `RequestID`, `UserName`, `MessageType`, `Charge`, `GateRequestId`, `Keyword`, `MessageTitle`, `FromPhone`, `ProcessTime`, `PartNum`, `TotalPart`, `CalledNumber`) VALUES
(5, '5959', '', '', 'BABD', NULL, '', '', '', '1', 0, '', '', NULL, '', '2014-05-23 03:07:26', 1, 1, 0),
(6, '5', '', '', 'GOOG\r\n', NULL, '', '', '', '1', 0, '', '', NULL, '', '2014-05-23 03:06:27', 1, 1, 0),
(7, '558', '', '', 'Excellent', NULL, '', '', '', '1', 0, '', '', NULL, '', '2014-05-27 01:45:28', 1, 1, 0),
(8, '662', '', '', 'Excellent', NULL, '', '', '', '1', 0, '', '', NULL, '', '2014-05-27 01:45:33', 1, 1, 0),
(9, '626', '', '', 'Excellent', NULL, '', '', '', '1', 0, '', '', NULL, '', '2014-05-27 01:45:38', 1, 1, 0),
(10, '2595', '', '', 'Excellent', NULL, '', '', '', '1', 0, '', '', NULL, '', '2014-05-27 01:45:42', 1, 1, 0),
(11, '62949', '', '', 'Excellent', NULL, '', '', '', '1', 0, '', '', NULL, '', '2014-05-27 01:45:47', 1, 1, 0),
(12, '248', '', '', 'Excellent', NULL, '', '', '', '1', 0, '', '', NULL, '', '2014-05-27 01:45:51', 1, 1, 0),
(13, '58484', '', '', 'Excellent', NULL, '', '', '', '1', 0, '', '', NULL, '', '2014-05-27 01:45:55', 1, 1, 0),
(14, '41', '', '', 'Excellent', NULL, '', '', '', '1', 0, '', '', NULL, '', '2014-05-27 01:45:59', 1, 1, 0),
(15, '94', '', '', 'Excellent', NULL, '', '', '', '1', 0, '', '', NULL, '', '2014-05-27 01:46:03', 1, 1, 0),
(16, '484', '', '', 'Excellent', NULL, '', '', '', '1', 0, '', '', NULL, '', '2014-05-27 01:46:09', 1, 1, 0),
(17, '', '', '', '', NULL, '', '', '', '1', 0, '', '', NULL, '', '2014-05-27 01:46:10', 1, 1, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
