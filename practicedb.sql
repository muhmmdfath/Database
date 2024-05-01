-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2024 at 04:13 AM
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
-- Database: `practicedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_laptop`
--

CREATE TABLE `penjualan_laptop` (
  `id_penjualan` int(11) NOT NULL,
  `serial_number` int(11) DEFAULT NULL,
  `merek` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `tanggal_pembelian` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_penggunaan_laptop`
--

CREATE TABLE `riwayat_penggunaan_laptop` (
  `id_riwayat` int(11) NOT NULL,
  `serial_number` int(11) DEFAULT NULL,
  `id_pengguna_sebelumnya` int(11) DEFAULT NULL,
  `id_pengguna_baru` int(11) DEFAULT NULL,
  `tanggal_pemindahan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_laptop`
--

CREATE TABLE `stock_laptop` (
  `serial_number` int(11) NOT NULL,
  `merek` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `stock_laptop`
--
DELIMITER $$
CREATE TRIGGER `after_update_stock_laptop` AFTER UPDATE ON `stock_laptop` FOR EACH ROW BEGIN
    
    IF NEW.serial_number != OLD.serial_number THEN
        
        INSERT INTO riwayat_penggunaan_laptop (serial_number, id_pengguna_sebelumnya, id_pengguna_baru, tanggal_pemindahan)
        VALUES (NEW.serial_number, OLD.serial_number, NEW.serial_number, CURDATE());
    END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `penjualan_laptop`
--
ALTER TABLE `penjualan_laptop`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `serial_number` (`serial_number`);

--
-- Indexes for table `riwayat_penggunaan_laptop`
--
ALTER TABLE `riwayat_penggunaan_laptop`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `serial_number` (`serial_number`);

--
-- Indexes for table `stock_laptop`
--
ALTER TABLE `stock_laptop`
  ADD PRIMARY KEY (`serial_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `penjualan_laptop`
--
ALTER TABLE `penjualan_laptop`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat_penggunaan_laptop`
--
ALTER TABLE `riwayat_penggunaan_laptop`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penjualan_laptop`
--
ALTER TABLE `penjualan_laptop`
  ADD CONSTRAINT `penjualan_laptop_ibfk_1` FOREIGN KEY (`serial_number`) REFERENCES `stock_laptop` (`serial_number`) ON DELETE CASCADE;

--
-- Constraints for table `riwayat_penggunaan_laptop`
--
ALTER TABLE `riwayat_penggunaan_laptop`
  ADD CONSTRAINT `riwayat_penggunaan_laptop_ibfk_1` FOREIGN KEY (`serial_number`) REFERENCES `stock_laptop` (`serial_number`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
