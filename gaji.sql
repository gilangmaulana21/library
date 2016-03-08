-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2015 at 07:54 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gaji`
--

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE IF NOT EXISTS `jabatan` (
`id` int(3) NOT NULL,
  `jabatan` enum('General Manager','Manager','Supervisor','Kepala Cabang','Bagian Umum','Staf Administrasi','Marketing') NOT NULL,
  `gaji_pokok` int(8) NOT NULL,
  `gaji_lembur` int(8) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id`, `jabatan`, `gaji_pokok`, `gaji_lembur`) VALUES
(1, 'General Manager', 5000000, 200000),
(2, 'Manager', 4500000, 180000),
(3, 'Supervisor', 4300000, 170000),
(4, 'Kepala Cabang', 4100000, 160000),
(5, 'Bagian Umum', 3900000, 150000),
(6, 'Staf Administrasi', 3700000, 130000),
(7, 'Marketing', 3500000, 110000);

-- --------------------------------------------------------

--
-- Table structure for table `lembur`
--

CREATE TABLE IF NOT EXISTS `lembur` (
`id` int(11) NOT NULL,
  `nip` int(5) NOT NULL,
  `tanggal_lembur` date NOT NULL,
  `masa_waktu` int(2) NOT NULL,
  `gaji_lembur` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE IF NOT EXISTS `pegawai` (
  `nip` bigint(5) NOT NULL,
  `nama_lengkap` text NOT NULL,
  `tempat_lahir` text NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('Pria','Wanita') NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` bigint(11) NOT NULL,
  `pendidikan` enum('SD','SMP','SMA','D1','D2','D3','S1','S2','S3') NOT NULL,
  `jabatan` enum('General Manager','Manager','Supervisor','Kepala Cabang','Bagian Umum','Staf Administrasi','Marketing') NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `status` enum('Karyawan Tetap','Karyawan Kontrak') NOT NULL,
  `agama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nip`, `nama_lengkap`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `no_telp`, `pendidikan`, `jabatan`, `tanggal_masuk`, `status`, `agama`) VALUES
(12345, 'Rahmat Ansori', 'Surabaya', '2000-09-21', 'Pria', 'Menganti', 85731041731, 'SMA', 'General Manager', '2015-12-15', 'Karyawan Tetap', 'Islam');

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE IF NOT EXISTS `presensi` (
`id` int(3) NOT NULL,
  `nip` bigint(5) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rekap`
--

CREATE TABLE IF NOT EXISTS `rekap` (
  `nip` bigint(5) NOT NULL,
  `nama_lengkap` varchar(25) NOT NULL,
  `jabatan` enum('General Manager','Manager','Supervisor','Kepala Cabang','Bagian Umum','Staf Administrasi','Marketing') NOT NULL,
  `gaji_pokok` int(8) NOT NULL,
  `tambahan` int(8) NOT NULL,
  `gaji_lembur` int(8) NOT NULL,
  `total_lembur` int(2) NOT NULL,
  `lama_kerja` int(2) NOT NULL,
  `tunjangan_kerja` int(8) NOT NULL,
  `gaji_kotor` int(8) NOT NULL,
  `potongan` int(8) NOT NULL,
  `gaji_bersih` int(8) NOT NULL,
  `tanggal_ambil` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(3) NOT NULL,
  `nama_lengkap` varchar(25) NOT NULL,
  `nip` bigint(5) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` enum('admin','user') NOT NULL DEFAULT 'user' COMMENT 'Level User'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama_lengkap`, `nip`, `password`, `level`) VALUES
(1, 'Administrator', 77777, 'ansori21092', 'admin'),
(5, 'Rahmat Ansori', 12345, '12345', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lembur`
--
ALTER TABLE `lembur`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
 ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `lembur`
--
ALTER TABLE `lembur`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `presensi`
--
ALTER TABLE `presensi`
MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
