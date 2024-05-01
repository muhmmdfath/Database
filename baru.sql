-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2024 at 04:04 AM
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
-- Database: `baru`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_karyawan`
--

CREATE TABLE `data_karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `posisi` varchar(255) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `id_seragam` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `data_karyawan`
--
DELIMITER $$
CREATE TRIGGER `after_insert_data_karyawan` AFTER INSERT ON `data_karyawan` FOR EACH ROW BEGIN
    
    UPDATE stock_seragam
    SET jumlah_stock = jumlah_stock - 1
    WHERE id_seragam = NEW.id_seragam;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock_seragam`
--

CREATE TABLE `stock_seragam` (
  `id_seragam` int(11) NOT NULL,
  `jenis_seragam` varchar(255) DEFAULT NULL,
  `jumlah_stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_karyawan`
--
ALTER TABLE `data_karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_seragam` (`id_seragam`);

--
-- Indexes for table `stock_seragam`
--
ALTER TABLE `stock_seragam`
  ADD PRIMARY KEY (`id_seragam`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_karyawan`
--
ALTER TABLE `data_karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_seragam`
--
ALTER TABLE `stock_seragam`
  MODIFY `id_seragam` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_karyawan`
--
ALTER TABLE `data_karyawan`
  ADD CONSTRAINT `data_karyawan_ibfk_1` FOREIGN KEY (`id_seragam`) REFERENCES `stock_seragam` (`id_seragam`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
