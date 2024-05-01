-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2024 at 04:15 AM
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
-- Database: `toko_aybun`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(25) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `stok_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama_barang`, `harga_barang`, `stok_barang`) VALUES
(1, 'gamis ukhti munira', 250000, 20),
(3, 'koko nibras', 251000, 32);

-- --------------------------------------------------------

--
-- Table structure for table `kas`
--

CREATE TABLE `kas` (
  `id` int(11) NOT NULL,
  `jenis` varchar(12) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kas`
--

INSERT INTO `kas` (`id`, `jenis`, `jumlah`, `tanggal`) VALUES
(1, 'pembelian', 500000, '2023-05-12'),
(2, 'suplai baran', 500000, '2023-06-04');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `nama_pembeli` varchar(30) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `id_barang`, `nama_pembeli`, `jumlah`, `tanggal`) VALUES
(2, 1, 'joko sukijan', 1, '2023-07-03'),
(3, 3, 'andi suteno', 1, '2023-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `penyuplai`
--

CREATE TABLE `penyuplai` (
  `id` int(11) NOT NULL,
  `nama_penyuplai` varchar(30) NOT NULL,
  `alamat_penyuplai` varchar(70) NOT NULL,
  `no_telp_penyuplai` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyuplai`
--

INSERT INTO `penyuplai` (`id`, `nama_penyuplai`, `alamat_penyuplai`, `no_telp_penyuplai`) VALUES
(2, 'ukhti munira collection', 'Semarang', '085125921342');

-- --------------------------------------------------------

--
-- Table structure for table `suplai`
--

CREATE TABLE `suplai` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_penyuplai` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suplai`
--

INSERT INTO `suplai` (`id`, `id_barang`, `id_penyuplai`, `jumlah`, `tanggal`) VALUES
(3, 1, 2, 10, '2023-06-10'),
(4, 1, 2, 10, '2023-07-15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kas`
--
ALTER TABLE `kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualan_id_barang_barang_id_fk` (`id_barang`);

--
-- Indexes for table `penyuplai`
--
ALTER TABLE `penyuplai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suplai`
--
ALTER TABLE `suplai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suplai_id_barang_barang_id_fk` (`id_barang`),
  ADD KEY `suplai_id_penyuplai_penyuplai_id_fk` (`id_penyuplai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kas`
--
ALTER TABLE `kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `penyuplai`
--
ALTER TABLE `penyuplai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suplai`
--
ALTER TABLE `suplai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_id_barang_barang_id_fk` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`);

--
-- Constraints for table `suplai`
--
ALTER TABLE `suplai`
  ADD CONSTRAINT `suplai_id_barang_barang_id_fk` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `suplai_id_penyuplai_penyuplai_id_fk` FOREIGN KEY (`id_penyuplai`) REFERENCES `penyuplai` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
