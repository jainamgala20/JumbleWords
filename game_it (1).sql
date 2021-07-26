-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2021 at 06:10 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `game_it`
--

-- --------------------------------------------------------

--
-- Table structure for table `create_quiz`
--

CREATE TABLE `create_quiz` (
  `subject` varchar(20) NOT NULL,
  `total_question` int(20) NOT NULL,
  `total_max_marks` int(10) NOT NULL,
  `quiz_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `create_quiz`
--

INSERT INTO `create_quiz` (`subject`, `total_question`, `total_max_marks`, `quiz_id`) VALUES
('AOA', 10, 100, '999'),
('OS', 10, 100, 'OS101');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_question`
--

CREATE TABLE `quiz_question` (
  `quiz_id` varchar(200) NOT NULL,
  `question` varchar(200) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `max_marks` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_question`
--

INSERT INTO `quiz_question` (`quiz_id`, `question`, `answer`, `max_marks`) VALUES
('999', 'Linera data structure', 'ARRAY', 5),
('999', '---- is Object Oriented language.', 'JAVA', 5),
('OS101', '--- is Page replacement algorithm', 'FIFO', 10);

-- --------------------------------------------------------

--
-- Table structure for table `student_registers`
--

CREATE TABLE `student_registers` (
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `student_contact` bigint(12) NOT NULL,
  `parent_contact` bigint(12) NOT NULL,
  `password` varchar(15) NOT NULL,
  `confirm_password` varchar(15) NOT NULL,
  `department` varchar(20) NOT NULL,
  `class` varchar(10) NOT NULL,
  `institution` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_registers`
--

INSERT INTO `student_registers` (`first_name`, `last_name`, `email`, `gender`, `student_contact`, `parent_contact`, `password`, `confirm_password`, `department`, `class`, `institution`) VALUES
('Jainam', 'Gala', 'jainam.gala12@sakec.ac.in', 'male', 9865741230, 7412589630, '1234', '1234', 'Computer Engineering', 'BE-3', 'Shah & Anchor Kutchhi Engineer'),
('abc', 'def', 'jainam.1gala@sakec.ac.in', 'male', 9865741230, 7412589630, '1234', '1234', 'Computer Engineering', 'BE-1', 'Vivekanand Education Society\'s Institute of Techno'),
('qwe', 'hbk', 'jainam.1gala@sakec.ac.in', 'male', 9865741230, 7412589630, '1234', '1234', 'Computer Engineering', 'BE-1', 'Shah & Anchor Kutchhi Engineering College, Chembur'),
('Jainish', 'Sakhidas', 'Jainish@gmail.com', 'male', 8655552468, 7412589630, '1234', '1234', 'Computer Engineering', 'TE-6', 'Vivekanand Education Society\'s Institute of Techno');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_registers`
--

CREATE TABLE `teacher_registers` (
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `teacher_contact` bigint(12) NOT NULL,
  `password` varchar(15) NOT NULL,
  `confirm_password` varchar(15) NOT NULL,
  `department` varchar(20) NOT NULL,
  `organisation` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_registers`
--

INSERT INTO `teacher_registers` (`first_name`, `last_name`, `email`, `teacher_contact`, `password`, `confirm_password`, `department`, `organisation`, `gender`) VALUES
('abc', 'def', 'abc@gmail', 1234123450, '1234', '1234', 'Computer Engineering', 'Shah & Anchor Kutchhi Engineering College, Chembur', 'male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `create_quiz`
--
ALTER TABLE `create_quiz`
  ADD PRIMARY KEY (`quiz_id`);

--
-- Indexes for table `quiz_question`
--
ALTER TABLE `quiz_question`
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `quiz_question`
--
ALTER TABLE `quiz_question`
  ADD CONSTRAINT `quiz_question_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `create_quiz` (`quiz_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
