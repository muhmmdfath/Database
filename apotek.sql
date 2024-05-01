-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2024 at 04:03 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_shift_karyawan`
--

CREATE TABLE `jadwal_shift_karyawan` (
  `no` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `jam_kerja` varchar(25) NOT NULL,
  `gaji` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_shift_karyawan`
--

INSERT INTO `jadwal_shift_karyawan` (`no`, `nama`, `jam_kerja`, `gaji`) VALUES
(1, 'Anton', '08.00 - 15.30', 3000000),
(2, 'Andi', '15.30 - 22.00', 3200000),
(3, 'Febri', '08.00 - 15.30', 3000000),
(5, 'Tiara', '15.30 - 22.00', 3200000);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `jumlah`, `harga`) VALUES
(0, 'democolin', 10, '7000.00'),
(1, 'Oskadon', 20, '20000.00'),
(2, 'Bodrex', 12, '50000.00'),
(4, 'Paracetamol', 100, '5000.00'),
(5, 'Amoxicillin', 25, '10000.00'),
(6, 'Omeprazole', 80, '8000.00'),
(7, 'Cetirizine', 120, '7000.00'),
(8, 'Loratadine', 70, '6000.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jadwal_shift_karyawan`
--
ALTER TABLE `jadwal_shift_karyawan`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jadwal_shift_karyawan`
--
ALTER TABLE `jadwal_shift_karyawan`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
