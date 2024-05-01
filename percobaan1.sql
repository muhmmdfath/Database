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
-- Database: `percobaan1`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `id_alumni` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `id_prodi` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`id_alumni`, `nama`, `id_prodi`) VALUES
(1, 'Ani', 4),
(2, 'Kodi', 3),
(3, 'Lala', 1),
(4, 'Mina', 4),
(5, 'Neni', 2),
(6, 'Opi', 4),
(7, 'Rani', 3),
(8, 'Cindi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id_fakultas` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jumlah_mahasiswa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`id_fakultas`, `nama`, `jumlah_mahasiswa`) VALUES
(1, 'Fakultas Agama Islam', '5'),
(2, 'Fakultas Teknologi Industri', '3');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mhs` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `ip` float DEFAULT NULL,
  `id_prodi` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mhs`, `nama`, `ip`, `id_prodi`) VALUES
(1, 'Ani', 3.22, 4),
(2, 'Budi', 3.15, 2),
(4, 'Doni', 3.36, 4),
(5, 'Edi', 3.75, 3),
(6, 'Fredi', 3.69, 1),
(7, 'Gani', 3.51, 2),
(8, 'Nama Mahasiswa Baru', NULL, 1),
(9, 'fatih', 0, 2);

--
-- Triggers `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `add_ip` BEFORE INSERT ON `mahasiswa` FOR EACH ROW BEGIN
    IF NEW.ip IS NULL THEN
        SET NEW.ip = 0;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_delete_mahasiswa` AFTER DELETE ON `mahasiswa` FOR EACH ROW BEGIN
    
    INSERT INTO alumni (nama, id_prodi)
    VALUES (OLD.nama, OLD.id_prodi);
    
    
    UPDATE prodi
    SET jumlah_mahasiswa = jumlah_mahasiswa - 1
    WHERE id_prodi = OLD.id_prodi;
    
    
    UPDATE fakultas
    SET jumlah_mahasiswa = jumlah_mahasiswa - 1
    WHERE id_fakultas = (SELECT id_fakultas FROM prodi WHERE id_prodi = OLD.id_prodi);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_mahasiswa` AFTER INSERT ON `mahasiswa` FOR EACH ROW BEGIN
    
    UPDATE prodi
    SET jumlah_mahasiswa = jumlah_mahasiswa + 1
    WHERE id_prodi = NEW.id_prodi;

    
    UPDATE fakultas
    SET jumlah_mahasiswa = jumlah_mahasiswa + 1
    WHERE id_fakultas = (SELECT id_fakultas FROM prodi WHERE id_prodi = NEW.id_prodi);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_mahasiswa` BEFORE DELETE ON `mahasiswa` FOR EACH ROW BEGIN
    INSERT INTO mahasiswa_keluar (id_mhs, nama, id_prodi, tahun)
    VALUES (OLD.id_mhs, OLD.nama, OLD.id_prodi, YEAR(CURDATE()));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa_keluar`
--

CREATE TABLE `mahasiswa_keluar` (
  `id_mhs` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `id_prodi` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa_keluar`
--

INSERT INTO `mahasiswa_keluar` (`id_mhs`, `nama`, `id_prodi`, `tahun`) VALUES
(3, 'Cindi', 1, 2023);

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
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jumlah_mahasiswa` int(10) DEFAULT NULL,
  `id_fakultas` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `nama`, `jumlah_mahasiswa`, `id_fakultas`) VALUES
(1, 'Syariah', 2, 1),
(2, 'Tarbiyah', 3, 1),
(3, 'Elektro', 1, 2),
(4, 'Informatika', 2, 2);

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
-- Indexes for dumped tables
--

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`id_alumni`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id_fakultas`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mhs`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indexes for table `penjualan_laptop`
--
ALTER TABLE `penjualan_laptop`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `serial_number` (`serial_number`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`),
  ADD KEY `id_fakultas` (`id_fakultas`);

--
-- Indexes for table `stock_laptop`
--
ALTER TABLE `stock_laptop`
  ADD PRIMARY KEY (`serial_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumni`
--
ALTER TABLE `alumni`
  MODIFY `id_alumni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id_fakultas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `penjualan_laptop`
--
ALTER TABLE `penjualan_laptop`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni`
--
ALTER TABLE `alumni`
  ADD CONSTRAINT `alumni_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`);

--
-- Constraints for table `penjualan_laptop`
--
ALTER TABLE `penjualan_laptop`
  ADD CONSTRAINT `penjualan_laptop_ibfk_1` FOREIGN KEY (`serial_number`) REFERENCES `stock_laptop` (`serial_number`) ON DELETE CASCADE;

--
-- Constraints for table `prodi`
--
ALTER TABLE `prodi`
  ADD CONSTRAINT `prodi_ibfk_1` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id_fakultas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
