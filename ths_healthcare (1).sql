-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2024 at 03:14 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ths_healthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminpatient_record`
--

CREATE TABLE `adminpatient_record` (
  `patient_id` varchar(50) NOT NULL,
  `patient_name` varchar(50) NOT NULL,
  `age` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `birthdate` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='DATABASEOF PATIENT''S RECORD';

--
-- Dumping data for table `adminpatient_record`
--

INSERT INTO `adminpatient_record` (`patient_id`, `patient_name`, `age`, `gender`, `birthdate`, `address`) VALUES
('20-2002', 'IAN MIGUEL APOLINAR', '100', 'MALE', '2024-11-05', 'BALINTAWAK'),
('24-1111', 'JESSRHON TOYHORADA', '5', 'MALE', '2024-11-13', 'OMYCCO'),
('24-2222', 'DEV MEMANGS', '23', 'MALE', '2024-11-13', 'BONBON');

-- --------------------------------------------------------

--
-- Table structure for table `admin_healthcare_unit`
--

CREATE TABLE `admin_healthcare_unit` (
  `healthcare_id` varchar(50) NOT NULL,
  `healthcarestaff_name` varchar(50) NOT NULL,
  `position_of_staff` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='ADMIN''S POSITION IN HEALTHCARE';

--
-- Dumping data for table `admin_healthcare_unit`
--

INSERT INTO `admin_healthcare_unit` (`healthcare_id`, `healthcarestaff_name`, `position_of_staff`, `address`) VALUES
('10-0916', 'GUILLER JAMES C MANTALA', 'BHW', 'BONBON.CAT.CAM'),
('22-5555', 'MEMANGS', 'BHW', 'BALINTAWAK');

-- --------------------------------------------------------

--
-- Table structure for table `admin_loginsessions`
--

CREATE TABLE `admin_loginsessions` (
  `log_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_id` varchar(50) NOT NULL,
  `login_time` datetime DEFAULT current_timestamp(),
  `logout_time` datetime NOT NULL DEFAULT current_timestamp(),
  `action_type` enum('login','logout') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_loginsessions`
--

INSERT INTO `admin_loginsessions` (`log_id`, `admin_name`, `admin_id`, `login_time`, `logout_time`, `action_type`) VALUES
(1, 'GUILLER JAMES C MANTALA', '1', '2024-11-14 11:07:03', '0000-00-00 00:00:00', 'login'),
(2, 'GUILLER JAMES C MANTALA', '1', '2024-11-14 11:10:06', '0000-00-00 00:00:00', 'login'),
(3, 'GUILLER JAMES C MANTALA', '1', '2024-11-14 11:15:52', '2024-11-14 11:15:52', 'login'),
(4, 'MEMANGS', '', '2024-11-14 13:14:48', '2024-11-14 13:14:48', 'login'),
(5, 'GUILLER JAMES C MANTALA', '1', '2024-11-14 13:17:01', '2024-11-14 13:17:01', 'login'),
(6, 'GUILLER JAMES C MANTALA', '1', '2024-11-14 13:17:22', '2024-11-14 13:17:22', 'login'),
(7, 'MEMANGS', '', '2024-11-14 13:18:38', '2024-11-14 13:18:38', 'login'),
(8, 'GUILLER JAMES C MANTALA', '1', '2024-11-14 13:24:56', '2024-11-14 13:24:56', 'login'),
(9, 'GUILLER JAMES C MANTALA', '1', '2024-11-14 13:30:04', '2024-11-14 13:30:04', 'login'),
(10, '', '', '2024-11-26 19:20:55', '2024-11-26 19:20:55', 'login'),
(11, '', '', '2024-11-26 19:33:31', '2024-11-26 19:33:31', 'login'),
(12, '', '', '2024-11-26 21:12:19', '2024-11-26 21:12:19', 'login');

-- --------------------------------------------------------

--
-- Table structure for table `admin_medicine_inventory`
--

CREATE TABLE `admin_medicine_inventory` (
  `medicine_id` varchar(50) NOT NULL,
  `medicine_name` varchar(50) NOT NULL,
  `medicine_quantity` varchar(50) NOT NULL,
  `date_manufactured` varchar(50) NOT NULL,
  `expiration_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='DATABASE OF MEDICINE''S AVAILABILITY';

--
-- Dumping data for table `admin_medicine_inventory`
--

INSERT INTO `admin_medicine_inventory` (`medicine_id`, `medicine_name`, `medicine_quantity`, `date_manufactured`, `expiration_date`) VALUES
('2', 'CETEREZEN', '200', '2024-11-12', '2024-11-12'),
('alx-100', 'Alaxan', '500', '2024-11-12', '2024-11-12'),
('amx-10', 'AMOXICILLIM', '60', '2024-11-12', '2024-11-12'),
('pills-29922', 'PILLSS', '432', '2024-11-12', '2024-11-12'),
('tambal-100', 'para buang', '23182', '2024-11-12', '2024-11-12'),
('alx-10', 'ffffff', '23', '2024-11-13', '2024-11-13'),
('LSN-121', 'LOSARTAN', '900', '2024-11-13', '2024-11-13');

-- --------------------------------------------------------

--
-- Table structure for table `admin_register`
--

CREATE TABLE `admin_register` (
  `user_id` varchar(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `usertype` enum('User','Admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_register`
--

INSERT INTO `admin_register` (`user_id`, `username`, `password`, `name`, `email`, `usertype`) VALUES
('20-2222', 'JESSRHON', '4df81d4c045a9e51fc51357d034123da', 'JESSRHON TOYHORADA', 'jessrhon@gmail.com', 'User'),
('21-0916', 'ADMINGUILLER', 'c2ea28cb352204b55c5126f572a6d338', 'Guiller james c mantala', 'mantalaguillerjames@gmail', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `medical_record`
--

CREATE TABLE `medical_record` (
  `consultation_id` varchar(50) NOT NULL,
  `healthcare_id` varchar(50) NOT NULL,
  `patient_id` varchar(50) NOT NULL,
  `patient_name` varchar(50) NOT NULL,
  `medicine_id` varchar(50) NOT NULL,
  `medicine_name` varchar(50) NOT NULL,
  `quantity` int(50) NOT NULL,
  `time_` varchar(50) NOT NULL,
  `date_` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `medical_record`
--

INSERT INTO `medical_record` (`consultation_id`, `healthcare_id`, `patient_id`, `patient_name`, `medicine_id`, `medicine_name`, `quantity`, `time_`, `date_`) VALUES
('2', '22', '24-1111', 'JESSRHON TOYHORADA', 'LSN-121', 'LOSARTAN', 50, '11:49', '2024-11-13'),
('1', '22', '20-2002', 'IAN MIGUEL APOLINAR', 'LSN-121', 'LOSARTAN', 50, '22:17', '2024-11-13');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `Social_stat` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `otps` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `fullname`, `birthday`, `age`, `address`, `Social_stat`, `gender`, `username`, `password`, `otps`) VALUES
(1, 'JAY PABON MAHAYAG', '2024-11-26', '23', 'Alangilan,Sagay,Camiguin', 'single', 'male', 'jay123', '$2y$10$K7Ck4gxKeKKzrfztzlqckOVitaAlG7a7jRCajdK9JbQ8ZpUzwedPy', ''),
(2, 'Jay Mahayag ', '2024-11-27', '21', 'Alangilan,Sagay,Camiguin', 'single', 'male', 'Yaj24', '$2y$10$TQNXRVMRH9EQrcjXSlOZQOgeFYH8oIvks8QWC0N4udUW8z8k3ofvu', ''),
(3, 'Jay Mahayag ', '2024-11-27', '21', 'Alangilan,Sagay,Camiguin', 'single', 'male', 'Yaj24', '$2y$10$2rprkFv9I5LLdM1TrIMbw.Mbefm8m.UPLN3EtjuYcZKPVsEaD/9C2', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_loginsessions`
--
ALTER TABLE `admin_loginsessions`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `admin_register`
--
ALTER TABLE `admin_register`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_loginsessions`
--
ALTER TABLE `admin_loginsessions`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
