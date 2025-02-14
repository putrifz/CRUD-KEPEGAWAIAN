-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2025 at 08:21 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kepegawaian`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_pegawai` ()   BEGIN
    SELECT pegawai.id_pegawai, pegawai.nama, jabatan.nama_jabatan, departemen.nama_departemen, pegawai.tanggal_masuk 
    FROM pegawai
    JOIN jabatan ON pegawai.id_jabatan = jabatan.id_jabatan
    JOIN departemen ON pegawai.id_departemen = departemen.id_departemen;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_pegawai` (IN `p_nama` VARCHAR(100), IN `p_tanggal_lahir` DATE, IN `p_id_jabatan` INT, IN `p_id_departemen` INT, IN `p_tanggal_masuk` DATE, IN `p_email` VARCHAR(100), IN `p_no_hp` VARCHAR(15))   BEGIN
    INSERT INTO pegawai (nama, tanggal_lahir, id_jabatan, id_departemen, tanggal_masuk, email, no_hp)
    VALUES (p_nama, p_tanggal_lahir, p_id_jabatan, p_id_departemen, p_tanggal_masuk, p_email, p_no_hp);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `id_departemen` int(11) NOT NULL,
  `nama_departemen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`id_departemen`, `nama_departemen`) VALUES
(1, 'HRD'),
(2, 'IT'),
(3, 'Keuangan'),
(4, 'Marketing');

-- --------------------------------------------------------

--
-- Table structure for table `gaji`
--

CREATE TABLE `gaji` (
  `id_gaji` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `tanggal_pembayaran` date NOT NULL,
  `jumlah` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gaji`
--

INSERT INTO `gaji` (`id_gaji`, `id_pegawai`, `tanggal_pembayaran`, `jumlah`) VALUES
(1, 1, '2024-01-30', '10000000.00'),
(2, 2, '2024-01-30', '8000000.00'),
(5, 14, '2025-02-12', '10000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(50) NOT NULL,
  `gaji_pokok` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`, `gaji_pokok`) VALUES
(1, 'Manager', '10000000.00'),
(2, 'Supervisor', '8000000.00'),
(3, 'Staff', '6000000.00'),
(4, 'Admin', '5000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `log_hapus_pegawai`
--

CREATE TABLE `log_hapus_pegawai` (
  `id_log` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `id_jabatan` int(11) DEFAULT NULL,
  `id_departemen` int(11) DEFAULT NULL,
  `tanggal_hapus` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_hapus_pegawai`
--

INSERT INTO `log_hapus_pegawai` (`id_log`, `id_pegawai`, `nama`, `id_jabatan`, `id_departemen`, `tanggal_hapus`) VALUES
(1, 5, 'Stefanie Pinky', 1, 1, '2025-02-11 16:56:08'),
(2, 3, 'Ahmad Fauzi', 3, 3, '2025-02-11 18:43:55'),
(3, 4, 'Dewi Lestari', 4, 2, '2025-02-11 19:33:31'),
(4, 8, 'siti', 1, 3, '2025-02-12 08:52:25'),
(5, 9, 'siti', 1, 3, '2025-02-12 08:53:03'),
(6, 10, 'siti', 1, 1, '2025-02-12 08:56:52'),
(7, 11, 'cimio', 2, 4, '2025-02-12 09:19:30'),
(8, 6, 'Stefanie Pinky', 2, 3, '2025-02-12 12:00:02'),
(9, 7, 'Putri', 1, 2, '2025-02-12 12:00:06'),
(10, 12, 'Stefanie Pinky', 3, 2, '2025-02-12 12:09:14');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `id_jabatan` int(11) DEFAULT NULL,
  `id_departemen` int(11) DEFAULT NULL,
  `tanggal_masuk` date NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama`, `tanggal_lahir`, `id_jabatan`, `id_departemen`, `tanggal_masuk`, `email`, `no_hp`) VALUES
(1, 'Budi Santoso', '1990-03-15', 1, 3, '2022-05-10', 'budi@email.com', '081234567890'),
(2, 'Siti Rahmawati', '1995-07-21', 3, 1, '2023-11-15', 'siti@email.com', '081298765432'),
(14, 'Stefanie Pinky', NULL, 1, 2, '2022-02-11', NULL, NULL);

--
-- Triggers `pegawai`
--
DELIMITER $$
CREATE TRIGGER `after_pegawai_delete` AFTER DELETE ON `pegawai` FOR EACH ROW BEGIN
    INSERT INTO log_hapus_pegawai (id_pegawai, nama, id_jabatan, id_departemen)
    VALUES (OLD.id_pegawai, OLD.nama, OLD.id_jabatan, OLD.id_departemen);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_pegawai_insert` AFTER INSERT ON `pegawai` FOR EACH ROW BEGIN
    DECLARE gaji DECIMAL(10,2);

    -- Ambil gaji berdasarkan id_jabatan
    SELECT gaji_pokok INTO gaji 
    FROM jabatan 
    WHERE id_jabatan = NEW.id_jabatan;

    -- Jika gaji ditemukan, masukkan data ke tabel gaji
    IF gaji IS NOT NULL THEN
        INSERT INTO gaji (id_pegawai, tanggal_pembayaran, jumlah)
        VALUES (NEW.id_pegawai, CURDATE(), gaji);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','pegawai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `role`) VALUES
(11, 'admin1', '$2y$12$unA.2m/i5iz0OXOgLYVW8.PunaRfw6yKDHACphg7rWc4ZwzokplZu', 'admin'),
(12, 'pegawai', '$2y$12$IaPWW8SIkA0Qj4jJw.2ML.FFMv.HqC4yvXHSKUOWHZXKJMb2S.3wC', 'pegawai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id_departemen`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`id_gaji`),
  ADD KEY `gaji_ibfk_1` (`id_pegawai`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `log_hapus_pegawai`
--
ALTER TABLE `log_hapus_pegawai`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_jabatan` (`id_jabatan`),
  ADD KEY `id_departemen` (`id_departemen`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id_departemen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gaji`
--
ALTER TABLE `gaji`
  MODIFY `id_gaji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `log_hapus_pegawai`
--
ALTER TABLE `log_hapus_pegawai`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gaji`
--
ALTER TABLE `gaji`
  ADD CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`),
  ADD CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
