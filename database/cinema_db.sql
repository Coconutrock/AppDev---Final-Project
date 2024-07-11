-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2024 at 03:15 PM
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
-- Database: `cinema_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookingtable`
--

CREATE TABLE `bookingtable` (
  `bookingID` int(11) NOT NULL,
  `movieID` int(11) DEFAULT NULL,
  `bookingTheatre` varchar(100) NOT NULL,
  `bookingType` varchar(100) DEFAULT NULL,
  `bookingDate` varchar(50) NOT NULL,
  `bookingTime` varchar(50) NOT NULL,
  `bookingFName` varchar(100) NOT NULL,
  `bookingLName` varchar(100) DEFAULT NULL,
  `bookingPNumber` varchar(12) NOT NULL,
  `bookingEmail` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `ORDERID` varchar(255) NOT NULL,
  `DATE-TIME` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bookingtable`
--

INSERT INTO `bookingtable` (`bookingID`, `movieID`, `bookingTheatre`, `bookingType`, `bookingDate`, `bookingTime`, `bookingFName`, `bookingLName`, `bookingPNumber`, `bookingEmail`, `amount`, `ORDERID`, `DATE-TIME`) VALUES
(71, 6, 'private-hall', 'imax', '14-3', '15-00', 'xyz', 'abc', '000000000', '000@gmail.com', '5000.00', 'cash', '2020-12-14 12:20:31'),
(72, 1, 'main-hall', '3d', '12-3', '12-00', 'nero', 'dero', '099932242342', 'kantot@gmail.com', '300', 'ARVR87131253', '2024-07-09 18:43:31'),
(73, 3, 'vip-hall', '3d', '1-8', '18-00', 'Phol', 'Reid', '029380482038', 'pogi@gmail.com', 'Not Paid', 'ARVR86201383', '2024-07-09 20:02:29');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacktable`
--

CREATE TABLE `feedbacktable` (
  `msgID` int(12) NOT NULL,
  `senderfName` varchar(50) NOT NULL,
  `senderlName` varchar(50) DEFAULT NULL,
  `sendereMail` varchar(100) NOT NULL,
  `senderfeedback` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movietable`
--

CREATE TABLE `movietable` (
  `movieID` int(11) NOT NULL,
  `movieImg` varchar(150) NOT NULL,
  `movieTitle` varchar(100) NOT NULL,
  `movieGenre` varchar(50) NOT NULL,
  `movieDuration` int(11) NOT NULL,
  `movieRelDate` date NOT NULL,
  `movieDirector` varchar(50) NOT NULL,
  `movieActors` varchar(150) NOT NULL,
  `mainhall` int(11) NOT NULL,
  `viphall` int(11) NOT NULL,
  `privatehall` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `movietable`
--

INSERT INTO `movietable` (`movieID`, `movieImg`, `movieTitle`, `movieGenre`, `movieDuration`, `movieRelDate`, `movieDirector`, `movieActors`, `mainhall`, `viphall`, `privatehall`) VALUES
(1, 'img/movie 1.jpg', 'Spirited Away', 'Animation, Adventure, Drama', 127, '2021-10-18', 'Sean Anders', 'Kanna Hashimoto, Mone Kamishiraishi, Rina Kawaei, Kotaro Daigo, Hiroki Miura, Hikaru Yamano', 0, 0, 0),
(2, 'img/movie 2.jpg', 'Garfield The Movie', 'Animation, Comedy', 101, '2024-10-18', 'Mark Dindal', 'Chris Pratt, Will Ferrell, Elizabeth Banks', 0, 0, 0),
(3, 'img/movie 3.jpg', 'How to Make A Million Before Grandma Dies', 'Drama', 110, '2024-02-07', 'Pat Boonnitipat', 'Putthipong Assaratanakul · M ; Usha Seamkhum · Amah ; Tontawan Tantivejakul · Mui ; Sarinrat Thomas · M\'s Mother ; Sanya Kunakorn · Kiang', 0, 0, 0),
(4, 'img/movie 4.jpg', 'The Autopsy of Jane Doe', 'Horror, Thriller, Suspense', 86, '2021-01-23', 'André Øvredal', 'Brian Cox · Tommy ; Emile Hirsch · Austin ; Ophelia Lovibond', 0, 0, 0),
(5, 'img/movie 5.jpg', 'UNCHARTED', 'Adventure, Drama, Mystery, Action', 116, '2023-12-25', 'Ruben Fleischer', 'Tom Holland · Nathan Drake ; Mark Wahlberg · Victor Sullivan ; Antonio Banderas', 0, 0, 0),
(6, 'img/movie 6.jpg', 'Fall Guy', 'Comedy, Action, Adventure', 126, '2024-01-04', 'David Leitch', 'Ryan Gosling · Colt Seavers ; Emily Blunt · Jody Moreno ; Aaron Taylor-Johnson', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(80) NOT NULL,
  `name` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`) VALUES
(1, '123', 'john', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookingtable`
--
ALTER TABLE `bookingtable`
  ADD PRIMARY KEY (`bookingID`),
  ADD UNIQUE KEY `bookingID` (`bookingID`),
  ADD KEY `foreign_key_movieID` (`movieID`),
  ADD KEY `foreign_key_ORDERID` (`ORDERID`);

--
-- Indexes for table `feedbacktable`
--
ALTER TABLE `feedbacktable`
  ADD PRIMARY KEY (`msgID`),
  ADD UNIQUE KEY `msgID` (`msgID`);

--
-- Indexes for table `movietable`
--
ALTER TABLE `movietable`
  ADD PRIMARY KEY (`movieID`),
  ADD UNIQUE KEY `movieID` (`movieID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookingtable`
--
ALTER TABLE `bookingtable`
  MODIFY `bookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `feedbacktable`
--
ALTER TABLE `feedbacktable`
  MODIFY `msgID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `movietable`
--
ALTER TABLE `movietable`
  MODIFY `movieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookingtable`
--
ALTER TABLE `bookingtable`
  ADD CONSTRAINT `foreign_key_movieID` FOREIGN KEY (`movieID`) REFERENCES `movietable` (`movieID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
