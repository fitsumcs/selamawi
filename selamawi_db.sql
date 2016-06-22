-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2016 at 04:52 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `selamawi_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`ID` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `username`, `password`) VALUES
(1, 'atr/9889/07', 'pass');

-- --------------------------------------------------------

--
-- Table structure for table `audience`
--

CREATE TABLE IF NOT EXISTS `audience` (
  `petID` int(11) NOT NULL,
  `audience` varchar(20) NOT NULL COMMENT '1:year 2:department 3:section'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
`commentID` int(11) NOT NULL,
  `message` text NOT NULL,
  `commenter` int(11) NOT NULL,
  `petitionID` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seen` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1:unresolved 2:resolved'
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forgotpass`
--

CREATE TABLE IF NOT EXISTS `forgotpass` (
  `studID` int(11) NOT NULL,
  `token` char(40) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forgotpass`
--

INSERT INTO `forgotpass` (`studID`, `token`, `created`) VALUES
(1, 'dad5fe233d5ebb283a0812aae63daa49', '2016-06-22 11:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `last_modf`
--

CREATE TABLE IF NOT EXISTS `last_modf` (
  `studID` int(11) NOT NULL,
  `infotype` enum('1','2','3') NOT NULL COMMENT '1:year 2:section 3:name',
  `last_changed` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `last_modf`
--

INSERT INTO `last_modf` (`studID`, `infotype`, `last_changed`) VALUES
(1, '3', '2016-06-21');

-- --------------------------------------------------------

--
-- Table structure for table `petition`
--

CREATE TABLE IF NOT EXISTS `petition` (
`petID` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `post_date` datetime NOT NULL,
  `image_url` char(50) DEFAULT NULL,
  `send_to` varchar(30) NOT NULL,
  `owner` int(11) NOT NULL,
  `num_comments` int(11) NOT NULL DEFAULT '0',
  `num_up_votes` int(11) NOT NULL DEFAULT '0',
  `num_down_votes` int(11) NOT NULL DEFAULT '0',
  `audience` char(33) NOT NULL,
  `sent` enum('1','2') NOT NULL COMMENT '1:unresolved 2:resolved',
  `status` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '1:normal 2:reported 3:removed',
  `getNotifcation` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1:off 2:on'
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petition`
--

INSERT INTO `petition` (`petID`, `title`, `description`, `post_date`, `image_url`, `send_to`, `owner`, `num_comments`, `num_up_votes`, `num_down_votes`, `audience`, `sent`, `status`, `getNotifcation`) VALUES
(96, 'The length of the petition title must be atleast 20 and at most 100 characters long', 'The length of the petition title must be atleast 20 and at most 100 characters longThe length of the petition title must be atleast 20 and at most 100 characters longThe length of the petition title must be atleast 20 and at most 100 characters long', '2016-06-22 03:26:14', '1466601974becaeee6ad23934a7dbb828fb55ba404.jpg', 'tabor@gmail.com', 2, 0, 0, 0, '4c9184f37cff01bcdc32dc486ec36961', '1', '1', '2'),
(97, 'Mithun chackraporti hiding behind bicycle ', 'The length of the petition title must be atleast 20 and at most 100 characters longThe length of the petition title must be atleast 20 and at most 100 characters longThe length of the petition title must be atleast 20 and at most 100 characters long', '2016-06-22 03:37:47', '', 'tabor@gmail.com', 1, 0, 0, 0, '4c9184f37cff01bcdc32dc486ec36961', '1', '1', '2');

-- --------------------------------------------------------

--
-- Table structure for table `pet_tag`
--

CREATE TABLE IF NOT EXISTS `pet_tag` (
  `tagID` int(11) NOT NULL,
  `petID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pet_tag`
--

INSERT INTO `pet_tag` (`tagID`, `petID`) VALUES
(1, 96),
(4, 96),
(22, 97),
(23, 97);

-- --------------------------------------------------------

--
-- Table structure for table `regconf`
--

CREATE TABLE IF NOT EXISTS `regconf` (
  `studID` int(11) NOT NULL,
  `token` char(34) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regconf`
--

INSERT INTO `regconf` (`studID`, `token`) VALUES
(8, '4132c04b9ffe8ddc3f7173e609fa9750'),
(8, 'd0bff0ed00b11bbc9f67bed9dc74542b'),
(8, 'f02e49f9002d480aca9423d0e8041366');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
`studID` int(11) NOT NULL,
  `ID` char(15) NOT NULL,
  `fname` char(15) NOT NULL,
  `mname` char(15) NOT NULL,
  `lname` char(15) NOT NULL,
  `department` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `school` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `semester` int(11) NOT NULL,
  `password` char(32) NOT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '1:unreg 2:registered 3:blocked'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studID`, `ID`, `fname`, `mname`, `lname`, `department`, `section`, `school`, `year`, `email`, `semester`, `password`, `status`) VALUES
(1, 'atr/9889/07', 'tabor', 'nekatibeb', 'shiferaw', 1, 1, 1, 1, 'nekatibebtabor@gmail.com', 2, '1a1dc91c907325c69271ddf0c944bc72', '2'),
(2, 'atr/4554/07', 'Yehuala eshet', 'Abebe', 'Feleke', 2, 1, 3, 2, 'don.joe@gmail.com', 2, '1a1dc91c907325c69271ddf0c944bc72', '2'),
(3, 'atr/9110/08', 'Newal', 'Abrar', 'Mohammed', 2, 1, 3, 2, 'ne.ke@yahoo.com', 2, '1a1dc91c907325c69271ddf0c944bc72', '2'),
(4, 'atr/6486/07', 'Nati', 'awoke', 'Tarik', 1, 1, 1, 2, 'yeh.es@gmail.com', 2, '1a1dc91c907325c69271ddf0c944bc72', '2'),
(5, 'atr/1866/07', 'anteneh', 'kebede', 'alemu', 1, 2, 2, 2, 'ant.2@gmail.com', 2, '1a1dc91c907325c69271ddf0c944bc72', '2'),
(6, 'atr/3583/07', 'essey', 'bisrat', 'awoke', 1, 2, 1, 2, 'alem.esey@gmail.com', 2, '1a1dc91c907325c69271ddf0c944bc72', '2'),
(7, 'atr/1234/07', 'amanuel', 'kebede', 'anteneh', 1, 0, 0, 1, 'aman@gmail.com', 1, '81dc9bdb52d04dc20036dbd8313ed055', '2'),
(8, 'atr/9010/07', 'Yared', 'Taddese', 'Eshetu', 1, 4, 0, 4, 'yared@gmail.com', 3, '4e4316df8886f1bc822cd06e0a55a72e', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
`tagID` int(11) NOT NULL,
  `tagName` char(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tagID`, `tagName`) VALUES
(1, 'software engineering'),
(2, 'mechanical engineering'),
(3, 'chemical engineering'),
(4, 'Information technology'),
(5, 'Civil engineering'),
(6, 'teacher'),
(7, 'cafe'),
(8, 'lounge'),
(9, 'sport field'),
(10, 'computr laboratory'),
(11, 'Mechanical lab'),
(12, 'worshop'),
(13, 'library'),
(14, 'kinnedy library'),
(15, '5 kilo library'),
(16, 'Security guards'),
(17, 'Class room'),
(18, 'department'),
(19, 'department head'),
(20, 'Administration office'),
(22, 'alamneh'),
(23, 'aman'),
(24, 'aman');

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE IF NOT EXISTS `vote` (
`voteID` int(11) NOT NULL,
  `voter` int(11) NOT NULL,
  `petitionID` int(11) NOT NULL,
  `type` enum('1','2') NOT NULL COMMENT '1: up 2 : down',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seen` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1:unresolved 2:resolved'
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `audience`
--
ALTER TABLE `audience`
 ADD PRIMARY KEY (`petID`,`audience`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
 ADD PRIMARY KEY (`commentID`);

--
-- Indexes for table `forgotpass`
--
ALTER TABLE `forgotpass`
 ADD PRIMARY KEY (`studID`), ADD UNIQUE KEY `token` (`token`);

--
-- Indexes for table `last_modf`
--
ALTER TABLE `last_modf`
 ADD PRIMARY KEY (`studID`,`infotype`);

--
-- Indexes for table `petition`
--
ALTER TABLE `petition`
 ADD PRIMARY KEY (`petID`);

--
-- Indexes for table `pet_tag`
--
ALTER TABLE `pet_tag`
 ADD PRIMARY KEY (`tagID`,`petID`), ADD KEY `petID` (`petID`);

--
-- Indexes for table `regconf`
--
ALTER TABLE `regconf`
 ADD PRIMARY KEY (`studID`,`token`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
 ADD PRIMARY KEY (`studID`,`ID`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
 ADD PRIMARY KEY (`tagID`,`tagName`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
 ADD PRIMARY KEY (`voteID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `petition`
--
ALTER TABLE `petition`
MODIFY `petID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
MODIFY `studID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
MODIFY `tagID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `vote`
--
ALTER TABLE `vote`
MODIFY `voteID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pet_tag`
--
ALTER TABLE `pet_tag`
ADD CONSTRAINT `pet_tag_ibfk_1` FOREIGN KEY (`petID`) REFERENCES `petition` (`petID`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
