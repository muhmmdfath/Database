-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2024 at 04:14 AM
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
-- Database: `rumah_sakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(4) NOT NULL,
  `id_spesialis` int(4) DEFAULT NULL,
  `nama_dokter` varchar(40) DEFAULT NULL,
  `tempat_lahir` varchar(20) DEFAULT NULL,
  `tgl_lahir` varchar(30) DEFAULT NULL,
  `no_telpon` varchar(15) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `id_spesialis`, `nama_dokter`, `tempat_lahir`, `tgl_lahir`, `no_telpon`, `email`, `alamat`) VALUES
(1, 1, 'Dr. Muhammad fauzi', 'Jakarta', '19 Januari 1983', '082169472428', 'fauzi@email.com', 'Jakarta'),
(2, 3, 'Dr. Arif yahya', 'Semarang', '20 Maret 1986', '08110843758', 'arif@email.com', 'Semarang'),
(3, 5, 'Dr. Siti Rahmawati', 'Semarang', '07 Februari 1985', '08227438910', 'rahmat@email.com', 'Semarang'),
(4, 8, 'Dr. Susanto', 'Yogyakarta', '02 Desember 1975', '08274789390', 'susanto@email.com', 'Yogyakarta'),
(5, 1, 'Dr. Taufik Hidayat', 'Semarang', '02 Februari 1978', '08118584939', 'taufik@email.com', 'Semarang'),
(6, 4, 'Dr. Dian Lestari', 'solo', '17 April 1979', '08363882929', 'dian@email.com', 'solo'),
(8, 9, 'Dr. Septi Suhesti', 'Bandung', '05 Maret 1976', '08778373819', 'septi@email.com', 'Bandung'),
(9, 3, 'Dr. Bagas', 'Depok', '18 Juni 1978', '08436828918', 'bagas@email.com', 'Depok'),
(10, 2, 'Dr. Toni Setiawan', 'Yogya', '20 Mei 1972', '084368828918', 'toni@email.com', 'Yogya'),
(11, 7, 'Dr. Ali Firmansyah', 'Jakarta', '10 November 1978', '', 'ali@email.com', 'Jakarta'),
(12, 2, 'Dr. wawan', 'Yogyakarta', '01 Juli 1978', '08119347792', '', 'Yogyakarta'),
(13, 7, 'Dr. Ali Firmansyah', 'Jakarta', '10 November 1987', NULL, 'ali@gmail.com', 'Jakarta'),
(14, 5, 'Dr.Ulfa', 'Semarang', '10 Februari 1986', '082133567728', NULL, 'Semarang'),
(16, 5, 'Dr.Ula', 'Semarang', '10 Februari 1976', NULL, NULL, 'Semarang'),
(17, 7, 'Dr. Ahmad Riyan', 'Kendal', '04 Agustus 1987', NULL, NULL, 'Kendal');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_dokter`
--

CREATE TABLE `jadwal_dokter` (
  `id_jadwal` int(4) NOT NULL,
  `id_dokter` int(4) DEFAULT NULL,
  `jam_kerja` time DEFAULT NULL,
  `jam_pulang` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_dokter`
--

INSERT INTO `jadwal_dokter` (`id_jadwal`, `id_dokter`, `jam_kerja`, `jam_pulang`) VALUES
(2, 2, '08:30:00', '14:30:00'),
(3, 3, '08:30:00', '14:30:00'),
(4, 4, '08:30:00', '14:30:00'),
(5, 5, '14:30:00', '20:30:00'),
(6, 6, '14:30:00', '20:30:00'),
(7, 7, '14:30:00', '20:30:00'),
(8, 8, '14:30:00', '20:30:00'),
(9, 9, '15:00:00', '21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(4) NOT NULL,
  `jenis` varchar(15) DEFAULT NULL,
  `harga` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `jenis`, `harga`) VALUES
(1, 'Ekslusif', '4.500.000'),
(2, 'Kelas Utama', '4.000.000'),
(3, 'VIP', '3.500.000'),
(4, 'VIP 2', '3.000.000'),
(5, 'Kelas Ekonomi', '700.000'),
(6, 'Isolasi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(4) NOT NULL,
  `kd_pasien` int(4) DEFAULT NULL,
  `nama_pasien` varchar(40) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` varchar(40) DEFAULT NULL,
  `golongan_darah` enum('A','B','AB','O') DEFAULT NULL,
  `berat_badan` float DEFAULT NULL,
  `tinggi_badan` int(3) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `kd_pasien`, `nama_pasien`, `tempat_lahir`, `tgl_lahir`, `golongan_darah`, `berat_badan`, `tinggi_badan`, `jenis_kelamin`, `alamat`) VALUES
(2, 1011, 'Rizal', 'Semarang', '03 Januari 1992', 'AB', 70, 162, 'L', 'Semarang'),
(3, 1012, 'Lukman', 'Solo', '23 Maret 1998', 'O', 80, 170, 'L', 'Solo'),
(4, 1013, 'Ridwan', 'Bandung', '14 Agustus 1978', 'B', 56, 156, 'L', 'Bandung'),
(5, 1014, 'Susanti', 'Jakarta', '02 Februari 1968', 'A', 52, 145, 'P', 'Jakarta'),
(6, 1015, 'Wati', 'Semarang', '09 April 1984', 'AB', 65, 158, 'P', 'Semarang'),
(7, 1016, 'Bagas', 'Solo', '12 Jui 1994', 'O', 64, 161, 'L', 'Solo'),
(8, 1017, 'Toni', 'Depok', '02 Oktober 2002', 'A', 40, 120, 'L', 'Depok'),
(10, 1019, 'Nur Zaenab', 'Yogya', '13 Maret 2994', 'B', 65, 164, 'P', 'Semarang');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(4) NOT NULL,
  `id_pasien` int(4) DEFAULT NULL,
  `id_kamar` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spesialis`
--

CREATE TABLE `spesialis` (
  `id_spesialis` int(4) NOT NULL,
  `spesialis` varchar(35) DEFAULT 'umum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spesialis`
--

INSERT INTO `spesialis` (`id_spesialis`, `spesialis`) VALUES
(2, 'Bedah'),
(3, 'Gigi'),
(4, 'Jantung'),
(5, 'Kandungan'),
(6, 'Kulit'),
(7, 'Saraf'),
(8, 'THT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_spesialis` (`id_spesialis`);

--
-- Indexes for table `jadwal_dokter`
--
ALTER TABLE `jadwal_dokter`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD UNIQUE KEY `kd_pasien` (`kd_pasien`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- Indexes for table `spesialis`
--
ALTER TABLE `spesialis`
  ADD PRIMARY KEY (`id_spesialis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `jadwal_dokter`
--
ALTER TABLE `jadwal_dokter`
  MODIFY `id_jadwal` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spesialis`
--
ALTER TABLE `spesialis`
  MODIFY `id_spesialis` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_kamar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
