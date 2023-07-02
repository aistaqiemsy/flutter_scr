-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2023 at 05:56 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pplg`
--

-- --------------------------------------------------------

--
-- Table structure for table `ket_piket`
--

CREATE TABLE `ket_piket` (
  `id_piket` int(4) NOT NULL,
  `id_ruang` int(4) DEFAULT NULL,
  `tgl_piket` date DEFAULT NULL,
  `checker` varchar(25) DEFAULT NULL,
  `sapu_lantai` varchar(6) DEFAULT NULL,
  `lap_kaca` varchar(6) DEFAULT NULL,
  `pel_lantai` varchar(6) DEFAULT NULL,
  `menata_meja_kursi` varchar(6) DEFAULT NULL,
  `clean_sampah` varchar(6) DEFAULT NULL,
  `lap_komputer` varchar(6) DEFAULT NULL,
  `lampu_komp_saklar` varchar(6) DEFAULT NULL,
  `ket_lain` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ket_piket`
--

INSERT INTO `ket_piket` (`id_piket`, `id_ruang`, `tgl_piket`, `checker`, `sapu_lantai`, `lap_kaca`, `pel_lantai`, `menata_meja_kursi`, `clean_sampah`, `lap_komputer`, `lampu_komp_saklar`, `ket_lain`) VALUES
(1, 203, '2022-10-25', 'Ahmad Istakim', 'v', 'v', 'v', 'v', 'v', '-', 'v', ''),
(44, 203, '2022-12-19', 'PJ', 'true', 'false', 'false', 'false', 'false', 'false', 'false', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembimbing`
--

CREATE TABLE `tb_pembimbing` (
  `id_pembimbing` int(3) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `pass` varchar(10) DEFAULT NULL,
  `jk` varchar(2) DEFAULT NULL,
  `id_ruang` int(4) DEFAULT NULL,
  `th_ajaran` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pembimbing`
--

INSERT INTO `tb_pembimbing` (`id_pembimbing`, `nama`, `username`, `pass`, `jk`, `id_ruang`, `th_ajaran`) VALUES
(1, 'Juliana Mansur, M.Kom', 'jm', '123', 'L', 203, '2022/2023'),
(2, 'Muslih, M.Kom', 'muslih', '123', 'L', 134, '2022/2023'),
(3, 'Nurdin', 'nurdin', '123', 'L', 206, '2022/2023'),
(4, 'Komalasari, S.Pd', 'mala', '123', 'P', 210, '2022/2023'),
(5, 'Acep Rahmat, S.Kom', 'acep', '123', 'L', 322, '2022/2023');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesdik`
--

CREATE TABLE `tb_pesdik` (
  `id_siswa` int(9) NOT NULL,
  `nisn` varchar(11) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jk` varchar(2) DEFAULT NULL,
  `rombel` varchar(10) DEFAULT NULL,
  `id_ruang` int(4) DEFAULT NULL,
  `status` varchar(13) DEFAULT NULL,
  `hari_piket` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pesdik`
--

INSERT INTO `tb_pesdik` (`id_siswa`, `nisn`, `nama`, `jk`, `rombel`, `id_ruang`, `status`, `hari_piket`) VALUES
(12007618, '0058051520', 'Achmad Abdul Latief', 'L', 'RPL XII-3', 134, NULL, NULL),
(12007623, '0047958586', 'Aden Ahmad Rifai', 'L', 'RPL XII-3', 134, NULL, NULL),
(12007628, '0051182642', 'Aditya', 'L', 'TKJ XII-1', 203, NULL, NULL),
(12007654, '0048975414', 'Alheychal', 'L', 'TKJ XII-2', 203, NULL, NULL),
(12007667, '0052854362', 'Amalia Haryanto', 'P', 'RPL XII-4', 203, NULL, NULL),
(12007697, '0055151228', 'Aripin Maulana', 'L', 'RPL XII-5', 203, NULL, NULL),
(12007706, '3043627227', 'Arya Maulana Supriadi', 'L', 'TKJ XII-4', 134, NULL, NULL),
(12007712, '0059766736', 'Auliya Salsabila', 'P', 'RPL XII-2', 203, NULL, NULL),
(12007721, '0057976557', 'Aztri Hana Pertiwi', 'P', 'RPL XII-3', 203, NULL, NULL),
(12007722, '0054764337', 'Azwa Faiza Rachmah', 'P', 'RPL XII-4', 203, NULL, NULL),
(12007761, '0049794722', 'Dewi Setyaningrum', 'P', 'HTL XII-1', 203, NULL, NULL),
(12007787, '0044260764', 'Eko Setyono Wibowo', 'L', 'RPL XII-5', 134, NULL, NULL),
(12007798, '0051794800', 'Fasya Assyifani Sofyan', 'P', 'OTKP XII-2', 203, NULL, NULL),
(12007810, '0044915769', 'Gian Bhanu Nandika', 'L', 'MMD XII-1', 203, NULL, NULL),
(12007813, '0056291536', 'Gugun Wiguna', 'L', 'TKJ XII-2', 134, NULL, NULL),
(12007831, '0007575929', 'Irena Jasintha', 'p', 'HTL XII-1', 134, NULL, NULL),
(12007869, '0051072298', 'M. Lutfi Ansori', 'L', 'TBG XII-1', 134, NULL, NULL),
(12007873, '3050687402', 'Muhamad Syahrul Fadillah', 'L', 'TKJ XII-2', 203, NULL, NULL),
(12007879, '0069973445', 'Mario Ferdiansyah', 'L', 'RPL XII-2', 203, NULL, NULL),
(12007887, '0059397568', 'Meisya Kurniawati', 'P', 'BDP XII-2', 203, NULL, NULL),
(12007892, '0050791416', 'Melly Hermawati', 'P', 'RPL XII-4', 134, NULL, NULL),
(12007900, '0050791419', 'Mochamad Abby Akhsan Razaky', 'L', 'TBG XII-2', 203, NULL, NULL),
(12007912, '0051794792', 'Muhamad Adrian Maulana', 'L', 'RPL XII-2', 203, NULL, NULL),
(12007923, '0051794810', 'Muhamad Fadillah Wijaya', 'L', 'PPLG XI-4', 203, NULL, 'Selasa'),
(12007932, '0048875651', 'Muhamad Kosasih', 'L', 'RPL XII-4', 203, NULL, NULL),
(12007935, '3041946742', 'Muhamad Novalsyah', 'L', 'TKJ XII-3', 203, NULL, NULL),
(12007969, '0045767746', 'Muhammad Alfaridzi', 'L', 'TKJ XII-1', 203, NULL, NULL),
(12007971, '0048730256', 'Muhammad Alfharizzi', 'L', 'TKJ XII-1', 203, NULL, NULL),
(12007978, '3045679858', 'Muhammad Azra Nurul Jaman', 'L', 'RPL XII-1', 134, NULL, NULL),
(12007990, '0053962642', 'Muhammad Ferdiansyah Ramadhan Yospi', 'L', 'TKJ XII-2', 134, NULL, NULL),
(12008003, '0045969622', 'Muhammad Nanda Saputra', 'L', 'RPL XII-3', 203, NULL, NULL),
(12008006, '0054740146', 'Muhammad Nazwiyansyah', 'L', 'TKJ XII-4', 203, NULL, NULL),
(12008072, '0022513899', 'Nurfauzia Maulida', 'P', 'MMD XII-1', 134, NULL, NULL),
(12008085, '0052678709', 'Putri Anggraeni', 'P', 'OTKP XII-2', 134, NULL, NULL),
(12008112, '0048410322', 'Rara Amelia', 'P', 'BDP XII-2', 203, NULL, NULL),
(12008114, '0051966643', 'Ratu Nazhilla Putri Indriani', 'P', 'BDP XII-1', 134, NULL, NULL),
(12008195, '0052449531', 'Siti Syafna Sajidah', 'P', 'OTKP XII-1', 203, NULL, NULL),
(12008214, '0048020541', 'Syakir Wardhan', 'L', 'TKJ XII-1', 134, NULL, NULL),
(12008217, '0050932407', 'Syisthan Duraida', 'P', 'BDP XII-1', 203, NULL, NULL),
(12008223, '0049170534', 'Tubagus Muhammad Luthfi', 'L', 'TKJ XII-4', 134, NULL, NULL),
(12108261, '0065712583', 'Abdul Fajar', 'L', 'DKV XI-1', 203, NULL, 'Senin'),
(12108278, '0055659639', 'Adrian Arya Saputra', 'L', 'PPLG XI-5', 134, NULL, 'Senin'),
(12108282, '0063259441', 'Aghiesna Nayla Solihin', 'P', 'PPLG XI-3', 134, NULL, 'Selasa'),
(12108299, '0061488296', 'Alfa Romeo Yudhistira', 'L', 'TJKT XI-1', 203, NULL, 'Jumat'),
(12108323, '0066033850', 'Aprilla Rahayu Ningtias', 'P', 'MPLB XI-2', 203, NULL, 'Selasa'),
(12108399, '0066525821', 'Dzaki Nurmuhammad Aflah Suherman', 'L', 'PPLG XI-3', 203, NULL, 'Selasa'),
(12108423, '3069079700', 'Fauzi Hernawan', 'L', 'PPLG XI-5', 134, NULL, 'Selasa'),
(12108427, '0055626242', 'Ferian Rahmat Fithratallahi', 'L', 'TJKT XI-4', 134, NULL, 'Jumat'),
(12108433, '0052866499', 'Firda Aulia', 'P', 'HTL XI-1', 134, NULL, 'Senin'),
(12108454, '0057554569', 'Ilham Wicaksono', 'L', 'TJKT XI-1', 203, NULL, 'Senin'),
(12108474, '0061743048', 'Kevin Aidhil Yospi', 'L', 'TJKT XI-1', 134, NULL, 'Kamis'),
(12108482, '0064928127', 'Laeticia Najla A\'Ida Zafira', 'P', 'HTL XI-1', 203, NULL, 'Kamis'),
(12108511, '0065177581', 'Maulidiya Sharla Qirana', 'P', 'MPLB XI-1', 203, NULL, 'Selasa'),
(12108514, '0062802797', 'Mayesa Agya Dwisa', 'P', 'PPLG XI-3', 134, NULL, 'Selasa'),
(12108579, '0052907567', 'Muhammad Fadhil Ayudha', 'L', 'PPLG XI-1', 203, NULL, 'Selasa'),
(12108581, '0058340058', 'Muhammad Fahmi Ramadani', 'L', 'TJKT XI-2', 134, NULL, 'Selasa'),
(12108588, '3052533515', 'Muhammad Fikri Firdaos', 'L', 'PPLG XI-3', 134, NULL, 'Rabu'),
(12108602, '0056426609', 'Muhammad Malik Akbar Sanusi', 'L', 'PPLG XI-2', 134, NULL, 'Rabu'),
(12108609, '0051921277', 'Muhammad Nurrasya Wijaya', 'L', 'PPLG XI-3', 134, NULL, 'Rabu'),
(12108630, '0055576414', 'Nabila Putri Lustari', 'P', 'PMN XI-1', 134, NULL, 'Kamis'),
(12108652, '0063594492', 'Natasha Aurelia', 'P', 'MPLB XI-1', 203, NULL, 'Rabu'),
(12108658, '0055029681', 'Nazril Ardiansyah', 'L', 'PPLG XI-2', 134, NULL, 'Jumat'),
(12108660, '0063354847', 'Nazwa Aulia Rahayu', 'P', 'PPLG XI-3', 203, NULL, 'Selasa'),
(12108762, '3059851574', 'Selsa Andalaswa Utami', 'P', 'MPLB XI-2', 134, NULL, 'Selasa'),
(12108769, '0059985434', 'Silvi Yuanita', 'P', 'MPLB XI-1', 203, NULL, 'Rabu'),
(12108776, '0068093381', 'Siti Fadla Fadila Munawar', 'P', 'KLN XI-1', 203, NULL, 'Jumat'),
(12108777, '0069211657', 'Siti Fatimah Azahra', 'P', 'MPLB XI-1', 134, NULL, 'Rabu'),
(12108784, '0062133392', 'Siti Nadya Sari', 'P', 'DKV XI-1', 134, NULL, 'Rabu'),
(12108789, '0067149662', 'Siti Nuraeni', 'P', 'PPLG XI-3', 134, NULL, 'Jumat'),
(12108792, '3053524397', 'Siti Putri Nurlaela', 'P', 'MPLB XI-2', 203, NULL, 'Kamis'),
(12108793, '3074582600', 'Siti Safina Maulydia', 'P', 'PMN XI-1', 134, NULL, 'Senin'),
(12108815, '3063470158', 'Tiara Putri', 'P', 'PMN XI-1', 134, NULL, 'Selasa'),
(12108850, '0069623155', 'Nazwa Aftita Eka Syafti', 'P', 'PMN XI-1', 134, NULL, 'Rabu'),
(12108852, '0062666224', 'Sinta Novia', 'P', 'PMN XI-1', 134, NULL, 'Selasa'),
(12208857, NULL, 'A\'Mal Maulana', 'L', 'TJKT X-1', 203, NULL, 'Jumat'),
(12208870, NULL, 'Afrida Meila Damayanti', 'P', 'KLN X-1', 134, NULL, 'Senin'),
(12208876, NULL, 'Ahmad Khadafi', 'L', 'TJKT X-2', 203, NULL, 'Kamis'),
(12208881, NULL, 'Alfareza Abi Putra Haidirasya', 'L', 'KLN X-1', 203, NULL, 'Jumat'),
(12208885, NULL, 'Alifa Zaskia Natiza', 'P', 'DKV X-1', 134, NULL, 'Jumat'),
(12208896, NULL, 'Andika Surya Elang Pratama', 'L', 'PPLG X-1', 134, NULL, 'Senin'),
(12208897, NULL, 'Andini', 'P', 'PMN X-1', 203, NULL, 'Jumat'),
(12208915, NULL, 'Arlyarafa Dinejat', 'L', 'HTL X-1', 203, NULL, 'Rabu'),
(12208928, NULL, 'Aulia Azahra', 'P', 'HTL X-1', 203, NULL, 'Senin'),
(12208945, NULL, 'Bintang Mayra Destianti', 'P', 'PPLG X-6', 203, NULL, 'Senin'),
(12208960, NULL, 'Desta Restiani Anwar', 'P', 'DKV X-1', 203, NULL, 'Kamis'),
(12208964, NULL, 'Dewi Rismawati', 'P', 'PPLG X-2', 134, NULL, 'Rabu'),
(12208965, NULL, 'Deyna Rachelsya', 'P', 'DKV X-3', 134, NULL, 'Kamis'),
(12208976, NULL, 'Dio Revino', 'L', 'TJKT X-3', 203, NULL, 'Senin'),
(12208995, NULL, 'Fakhri Shiddiq Rizkillah', 'L', 'PPLG X-4', 203, NULL, 'Senin'),
(12209000, NULL, 'Farah Najwaa Daaliyah', 'P', 'MPLB X-1', 203, NULL, 'Jumat'),
(12209038, NULL, 'Harry Hermawan', 'L', 'TJKT X-3', 134, NULL, 'Senin'),
(12209062, NULL, 'Irzi Salima Rosadi', 'P', 'PMN X-2', 134, NULL, 'Senin'),
(12209077, NULL, 'Kenzi Badrika', 'L', 'PPLG X-3', 134, NULL, 'Kamis'),
(12209089, NULL, 'Lira Maisyih Abd Kelanohon', 'P', 'MPLB X-2', 134, NULL, 'Jumat'),
(12209098, NULL, 'M Ikhfan Agustian', 'L', 'PPLG X-2', 203, NULL, 'Senin'),
(12209101, NULL, 'M Nabil Dzakwan', 'L', 'TJKT X-1', 134, NULL, 'Jumat'),
(12209103, NULL, 'M Zilly Zunaidi', 'L', 'MPLB X-2', 203, NULL, 'Rabu'),
(12209109, NULL, 'M. Fariz Aditya Putra', 'L', 'DKV X-2', 203, NULL, 'Kamis'),
(12209163, NULL, 'Muhamad Emil Satria', 'L', 'DKV X-1', 134, NULL, 'Jumat'),
(12209168, NULL, 'Muhamad Farhanudin', 'L', 'PPLG X-6', 134, NULL, 'Kamis'),
(12209178, NULL, 'Muhamad Latif Axsani', 'L', 'TJKT X-1', 203, NULL, 'Rabu'),
(12209179, NULL, 'Muhamad Mukti Badriyan', 'L', 'TJKT X-2', 134, NULL, 'Selasa'),
(12209181, NULL, 'Muhamad Noval', 'L', 'DKV X-2', 134, NULL, 'Rabu'),
(12209183, NULL, 'Muhamad Rafly Julian', 'L', 'PPLG X-5', 134, NULL, 'Kamis'),
(12209192, NULL, 'Muhamad Ruslan Rifaldi', 'L', 'TJKT X-3', 134, NULL, 'Jumat'),
(12209200, NULL, 'Muhamad Zaki Gunawan', 'L', 'DKV X-1', 134, NULL, 'Kamis'),
(12209218, NULL, 'Muhammad Danar Asdiansyah', 'L', 'HTL X-1', 203, NULL, 'Kamis'),
(12209232, NULL, 'Muhammad Fauzan Alkautsar', 'L', 'HTL X-1', 134, NULL, 'Jumat'),
(12209370, NULL, 'Rasya Alamsyah', 'L', 'PPLG X-1', 134, NULL, 'Kamis'),
(12209371, NULL, 'Ratu Kirana Andedasya', 'P', 'KLN X-1', 134, NULL, 'Senin'),
(12209376, NULL, 'Reffy Firliansyah', 'L', 'PMN X-1', 203, NULL, 'Rabu'),
(12209440, NULL, 'Sofia Nur Syahira', 'P', 'DKV X-2', 203, NULL, 'Rabu'),
(12209465, NULL, 'Yesti Aulia Desviani Putri', 'P', 'PMN X-2', 203, NULL, 'Kamis');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pinjam_siswa`
--

CREATE TABLE `tb_pinjam_siswa` (
  `id` int(11) NOT NULL,
  `id_siswa` int(9) DEFAULT NULL,
  `barang` varchar(20) NOT NULL,
  `nomor` int(3) NOT NULL,
  `rombel` varchar(10) NOT NULL,
  `rayon` varchar(15) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `keperluan` int(50) NOT NULL,
  `keterangan_alat` int(50) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pj`
--

CREATE TABLE `tb_pj` (
  `id_pj` int(3) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `pass` varchar(10) DEFAULT NULL,
  `jk` varchar(2) DEFAULT NULL,
  `id_ruang` int(4) DEFAULT NULL,
  `th_ajaran` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pj`
--

INSERT INTO `tb_pj` (`id_pj`, `nama`, `username`, `pass`, `jk`, `id_ruang`, `th_ajaran`) VALUES
(1, 'Muhammad Ali Sutan, S.Kom', 'ali', '123', 'L', 134, '2022/2023'),
(2, 'Ahmad Istakim, A.Md.Kom', 'ais', '123', 'L', 203, '2022/2023'),
(3, 'Fema Flamelina Putri', 'fm', '123', 'P', 322, '2022/2023'),
(4, 'David Satya W', 'dv', '123', 'L', 206, '2022/2023'),
(5, 'M. Rio Dewantoro', 'rio', '123', 'L', 207, '2022/2023'),
(6, 'Riska Mawardi', 'riska', '123', 'L', 210, '2022/2023'),
(7, 'Iqbal Fajar S, S.T', 'iqbal', '123', 'L', 323, '2022/2023');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ruang`
--

CREATE TABLE `tb_ruang` (
  `id_ruang` int(4) NOT NULL,
  `rayon` varchar(15) DEFAULT NULL,
  `id_pembimbing` int(3) DEFAULT NULL,
  `id_pj` int(3) DEFAULT NULL,
  `th_ajaran` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_ruang`
--

INSERT INTO `tb_ruang` (`id_ruang`, `rayon`, `id_pembimbing`, `id_pj`, `th_ajaran`) VALUES
(134, 'Cibedug 3', 2, 1, '2022/2023'),
(203, 'Ciawi 1', 1, 2, '2022/2023'),
(206, 'Cisarua 5', 3, 4, '2022/2023'),
(207, 'Cisarua 5', 3, 5, '2022/2023'),
(210, 'Cicurug 3', 4, 6, '2022/2023'),
(322, 'Wikrama 3', 5, 3, '2022/2023'),
(323, 'Wikrama 3', 5, 7, '2022/2023');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ket_piket`
--
ALTER TABLE `ket_piket`
  ADD PRIMARY KEY (`id_piket`),
  ADD KEY `id_ruang` (`id_ruang`);

--
-- Indexes for table `tb_pembimbing`
--
ALTER TABLE `tb_pembimbing`
  ADD PRIMARY KEY (`id_pembimbing`),
  ADD KEY `id_ruang` (`id_ruang`);

--
-- Indexes for table `tb_pesdik`
--
ALTER TABLE `tb_pesdik`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_ruang` (`id_ruang`);

--
-- Indexes for table `tb_pinjam_siswa`
--
ALTER TABLE `tb_pinjam_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `tb_pj`
--
ALTER TABLE `tb_pj`
  ADD PRIMARY KEY (`id_pj`),
  ADD KEY `id_pj` (`id_pj`),
  ADD KEY `id_ruang` (`id_ruang`);

--
-- Indexes for table `tb_ruang`
--
ALTER TABLE `tb_ruang`
  ADD PRIMARY KEY (`id_ruang`),
  ADD KEY `id_ruang` (`id_ruang`),
  ADD KEY `id_pembimbing` (`id_pembimbing`),
  ADD KEY `id_pj` (`id_pj`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ket_piket`
--
ALTER TABLE `ket_piket`
  MODIFY `id_piket` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tb_pembimbing`
--
ALTER TABLE `tb_pembimbing`
  MODIFY `id_pembimbing` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_pinjam_siswa`
--
ALTER TABLE `tb_pinjam_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_pj`
--
ALTER TABLE `tb_pj`
  MODIFY `id_pj` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ket_piket`
--
ALTER TABLE `ket_piket`
  ADD CONSTRAINT `ket_piket_ibfk_1` FOREIGN KEY (`id_ruang`) REFERENCES `tb_ruang` (`id_ruang`);

--
-- Constraints for table `tb_pembimbing`
--
ALTER TABLE `tb_pembimbing`
  ADD CONSTRAINT `tb_pembimbing_ibfk_1` FOREIGN KEY (`id_ruang`) REFERENCES `tb_ruang` (`id_ruang`);

--
-- Constraints for table `tb_pesdik`
--
ALTER TABLE `tb_pesdik`
  ADD CONSTRAINT `tb_pesdik_ibfk_1` FOREIGN KEY (`id_ruang`) REFERENCES `tb_ruang` (`id_ruang`);

--
-- Constraints for table `tb_pinjam_siswa`
--
ALTER TABLE `tb_pinjam_siswa`
  ADD CONSTRAINT `tb_pinjam_siswa_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tb_pesdik` (`id_siswa`);

--
-- Constraints for table `tb_pj`
--
ALTER TABLE `tb_pj`
  ADD CONSTRAINT `tb_pj_ibfk_1` FOREIGN KEY (`id_ruang`) REFERENCES `tb_ruang` (`id_ruang`);

--
-- Constraints for table `tb_ruang`
--
ALTER TABLE `tb_ruang`
  ADD CONSTRAINT `tb_ruang_ibfk_1` FOREIGN KEY (`id_pembimbing`) REFERENCES `tb_pembimbing` (`id_pembimbing`),
  ADD CONSTRAINT `tb_ruang_ibfk_3` FOREIGN KEY (`id_pj`) REFERENCES `tb_pj` (`id_pj`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
