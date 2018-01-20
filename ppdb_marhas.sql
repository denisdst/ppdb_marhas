-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19 Jan 2018 pada 13.59
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppdb_marhas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agama`
--

CREATE TABLE `agama` (
  `agama_id` int(11) NOT NULL,
  `agama_nama` varchar(64) NOT NULL,
  `agama_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `agama`
--

INSERT INTO `agama` (`agama_id`, `agama_nama`, `agama_keterangan`) VALUES
(1, 'Islam', NULL),
(2, 'Katolik', NULL),
(3, 'Kristen', NULL),
(4, 'Hindu', NULL),
(7, 'Budha', NULL),
(8, 'Konghuchu', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `asal_sekolah`
--

CREATE TABLE `asal_sekolah` (
  `asal_id` int(10) NOT NULL,
  `asal_namasekolah` varchar(50) DEFAULT NULL,
  `asal_alamat` text,
  `asal_status` enum('SWASTA','NEGERI','','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `asal_sekolah`
--

INSERT INTO `asal_sekolah` (`asal_id`, `asal_namasekolah`, `asal_alamat`, `asal_status`) VALUES
(20206035, 'SMPN 1 CIWIDEY', 'Jl. Babakantiga No. 70', 'NEGERI'),
(20228399, 'SMPN 2 CIWIDEY', 'Jl. Lebakmuncang Ciwidey', 'NEGERI'),
(20253365, 'SMPN 3 CIWIDEY', 'Jl. Simpang Tiga No. 02 Rawabogo', 'NEGERI'),
(20278094, 'MTS AL-HUDA MA RANCAGEDE CIWIDEY', 'Jl. Kehutanan Cibeber Km.2 Ciwidey Rt. 03/28', 'SWASTA'),
(20278095, 'MTS MA SUKAWENING', 'Jl. Ciwidey Sukawening Km. 04', 'SWASTA'),
(20278096, 'MTS PERSIS AL-MANAR', 'Jl. Raya Sukasari No. 85', 'SWASTA'),
(20278097, 'MTS SALAFIYAH AL-MUSLIHIN', 'Nengkelan-Ciwidey Km.05', 'SWASTA'),
(20278098, 'MTS WANASARI', 'Jl. Ciwidey Panyocokan Km.01', 'SWASTA'),
(20278099, 'MTS YAMISA CIWIDEY', 'Jl. Otong Kardana / Komp Mesjid Besar', 'SWASTA'),
(20278100, 'MTS NURUL HIDAYAH MIFTAHURROJA', 'Raya Ciwidey Lebakmuncang Km. 06 Rt. 02 Rw. 05', 'SWASTA'),
(69829371, 'SMP AL-WAFA CIWIDEY', 'JL. RAYA CIWIDEY KM.02', 'SWASTA'),
(69927337, 'MTS ULUL ALBAB CIWIDEY', 'Jl. Gombong Pasirmala Rt/rw.02/17', 'SWASTA'),
(69966319, 'SMP PLUS DARUL AMANAH CIWIDEY', 'Kp. Ciloa RT. 04/06', 'SWASTA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `captcha`
--

CREATE TABLE `captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gelombang`
--

CREATE TABLE `gelombang` (
  `gel_id` int(11) NOT NULL,
  `gel_ta` year(4) NOT NULL,
  `gel_kode` int(4) NOT NULL,
  `gel_nama` varchar(128) NOT NULL,
  `gel_tanggal_mulai` date NOT NULL,
  `gel_tanggal_selesai` date NOT NULL,
  `gel_jumlah_pilihan` smallint(2) NOT NULL DEFAULT '1',
  `gel_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_test`
--

CREATE TABLE `jenis_test` (
  `jentest_id` int(11) NOT NULL,
  `jentest_gel` int(11) DEFAULT NULL,
  `jentest_nama` varchar(64) NOT NULL,
  `jentest_singkatan` char(16) DEFAULT NULL,
  `jentest_persen` decimal(5,2) NOT NULL,
  `jentest_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `jur_id` int(11) NOT NULL,
  `jur_nama` varchar(128) NOT NULL,
  `jur_singkatan` char(16) DEFAULT NULL,
  `jur_no_sk` varchar(255) DEFAULT NULL,
  `jur_tanggal` date DEFAULT NULL,
  `jur_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`jur_id`, `jur_nama`, `jur_singkatan`, `jur_no_sk`, `jur_tanggal`, `jur_keterangan`) VALUES
(1, 'Teknik Pemesinan', 'TPM', NULL, '2004-06-01', NULL),
(2, 'Rekayasa Perangkat Lunak', 'RPL', NULL, '2010-06-01', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kuota`
--

CREATE TABLE `kuota` (
  `kuota_id` int(11) NOT NULL,
  `kuota_gel` int(11) DEFAULT NULL,
  `kuota_jur` int(11) DEFAULT NULL,
  `kuota_jumlah` int(11) NOT NULL,
  `kuota_cadangan` int(11) NOT NULL,
  `kuota_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `link`
--

CREATE TABLE `link` (
  `link_id` int(11) NOT NULL,
  `link_text` varchar(255) NOT NULL,
  `link_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `link`
--

INSERT INTO `link` (`link_id`, `link_text`, `link_url`) VALUES
(6, 'FaceBook', 'http://facebook.com'),
(7, 'Twitter', 'http://twitter.com'),
(8, 'Google', 'google.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `mapel_id` int(11) NOT NULL,
  `mapel_gel` int(11) DEFAULT NULL,
  `mapel_nama` varchar(64) NOT NULL,
  `mapel_singkatan` char(16) DEFAULT NULL,
  `mapel_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `nilai_id` int(11) NOT NULL,
  `nilai_siswa` int(11) DEFAULT NULL,
  `nilai_mapel` int(11) DEFAULT NULL,
  `nilai_uan` decimal(5,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orang_tua`
--

CREATE TABLE `orang_tua` (
  `ot_id` int(11) NOT NULL,
  `ot_siswa` int(11) DEFAULT NULL,
  `ot_nama_ayah` varchar(255) DEFAULT NULL,
  `ot_pend_ayah` int(11) DEFAULT NULL,
  `ot_pek_ayah` int(11) DEFAULT NULL,
  `ot_gaji_ayah` char(16) DEFAULT NULL,
  `ot_hp_ayah` varchar(16) DEFAULT NULL,
  `ot_nama_ibu` varchar(255) DEFAULT NULL,
  `ot_pend_ibu` int(11) DEFAULT NULL,
  `ot_pek_ibu` int(11) DEFAULT NULL,
  `ot_gaji_ibu` char(16) DEFAULT NULL,
  `ot_hp_ibu` varchar(16) DEFAULT NULL,
  `ot_alamat_ortu` varchar(255) DEFAULT NULL,
  `ot_nama_wali` varchar(255) DEFAULT NULL,
  `ot_pend_wali` int(11) DEFAULT NULL,
  `ot_pek_wali` int(11) DEFAULT NULL,
  `ot_gaji_wali` char(16) DEFAULT NULL,
  `ot_hp_wali` varchar(16) DEFAULT NULL,
  `ot_alamat_wali` varchar(255) DEFAULT NULL,
  `ot_status_asuh` enum('ortu','wali') DEFAULT 'ortu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pekerjaan`
--

CREATE TABLE `pekerjaan` (
  `pek_id` int(11) NOT NULL,
  `pek_nama` varchar(64) NOT NULL,
  `pek_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pekerjaan`
--

INSERT INTO `pekerjaan` (`pek_id`, `pek_nama`, `pek_keterangan`) VALUES
(1, 'PNS', NULL),
(2, 'Swasta', NULL),
(3, 'TNI/POLRI', NULL),
(4, 'Petani', NULL),
(5, 'Wiraswasta', NULL),
(6, 'Buruh', NULL),
(7, 'Lain-Lain', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendidikan`
--

CREATE TABLE `pendidikan` (
  `pend_id` int(11) NOT NULL,
  `pend_nama` varchar(64) NOT NULL,
  `pend_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pendidikan`
--

INSERT INTO `pendidikan` (`pend_id`, `pend_nama`, `pend_keterangan`) VALUES
(1, 'Tidak Tamat SD', NULL),
(2, 'SD', NULL),
(3, 'SMP', NULL),
(4, 'SMA', NULL),
(5, 'Diploma 1', NULL),
(6, 'Diploma 2', NULL),
(7, 'Diploma 3', NULL),
(8, 'S1', NULL),
(9, 'S2', NULL),
(10, 'S3', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pilihan`
--

CREATE TABLE `pilihan` (
  `pilihan_id` int(11) NOT NULL,
  `pilihan_siswa` int(11) DEFAULT NULL,
  `pilihan_jur` int(11) DEFAULT NULL,
  `pilihan_ke` smallint(1) NOT NULL,
  `pilihan_status` enum('kosong','diterima','cadangan','ditolak') DEFAULT 'kosong'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `post_judul` text NOT NULL,
  `post_link` text NOT NULL,
  `post_isi` longtext,
  `post_user` int(11) DEFAULT NULL,
  `post_tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `post`
--

INSERT INTO `post` (`post_id`, `post_judul`, `post_link`, `post_isi`, `post_user`, `post_tanggal`) VALUES
(1, 'Motto SMK Nusantara Indah', 'motto-smk-nusantara-indah', '<p><strong>Tujuan</strong></p>\n<p>Tujuan SMK Ma\'arif Kota Mungkid dijabarkan berdasarkan tujuan umum pendidikan, visi dan misi sekolah. Berdasarkan tiga hal tersebut, dapat dijabarkan tujuan dari SMK Ma\'arif SMK Nusantara Indah adalah</p>\n<ol>\n<li>Terdepan, Terbaik, dan Terpercaya dalam hal ketakwaan terhadap Tuhan Yang Maha Esa</li>\n<li>Terdepan, Terbaik dan Terpercaya dalam pengembangan potensi, kecerdasan dan minat</li>\n<li>Terdepan, Terbaik dan Terpercaya dalam perolehan Nilai UAN</li>\n<li>Terdepan, Terbaik dan Terpercaya dalam persaingan masuk jenjang Perguruan Tinggi dan Dunia Kerja</li>\n<li>Terdepan, Terbaik dan Terpercaya dalam membekali peserta didik agar memiliki keterampilan teknologi informasi dan komunikasi serta mampu mengembangkan diri secara mandiri.</li>\n<li>Terdepan, Terbaik dan Terpercaya dalam persaingan secara global</li>\n<li>Terdepan, Terbaik dan Terpercaya dalam pelayanan</li>\n</ol>', 1, '2013-09-07'),
(3, 'Visi dan Misi SMK Nusantara Indah', 'visi-dan-misi-smk-nusantara-indah', '<p><strong>Visi Sekolah</strong></p>\n<p>Mencetak tamatan berakhlakul karimah, kompeten, berkarakter dan berdaya saing global.</p>\n<p><strong>Misi Sekolah</strong></p>\n<ol>\n<li>Mengembangkan sikap dan perilaku agamis yang sesuai akidah Ahlusunah wal jama&rsquo;ah.</li>\n<li>Meningkatkan peran sekolah dalam membentuk&nbsp; peserta didik agar mempunyai kompetensi yang dijiwai nilai-nilai budaya dan karakter bangsa.</li>\n<li>Mengembangkan lembaga di lingkungan pendidikan yang berwawasan mutu dan keunggulan, profesional, berorientasi masa depan.</li>\n<li>Menjalin kerja sama yang baik antara sekolah, yayasan, pemerintah dan masyarakat</li>\n<li>Mengutamakan layanan prima dalam upaya pemberdayaan sekolah dan masyarakat.</li>\n</ol>', 1, '2013-09-07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prestasi`
--

CREATE TABLE `prestasi` (
  `prestasi_id` int(11) NOT NULL,
  `prestasi_siswa` int(11) DEFAULT NULL,
  `prestasi_nilai` decimal(5,1) DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `provinsi`
--

CREATE TABLE `provinsi` (
  `prov_id` int(11) NOT NULL,
  `prov_nama` varchar(64) NOT NULL,
  `prov_pulau` varchar(64) DEFAULT NULL,
  `prov_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `provinsi`
--

INSERT INTO `provinsi` (`prov_id`, `prov_nama`, `prov_pulau`, `prov_keterangan`) VALUES
(1, 'Jawa Tengah', 'Jawa', 'Semarang'),
(2, 'Sumatera Utara', 'Sumatera', 'Medan'),
(3, 'Sumatera Barat', 'Sumatera', 'Padang'),
(4, 'Riau', 'Sumatera', 'Pekan Baru'),
(5, 'Kepulauan Riau', 'Sumatera', 'Tanjung Pinang'),
(6, 'Jambi', 'Sumatera', 'Jambi'),
(7, 'Sumatera Selatan', 'Sumatera', 'Palembang'),
(8, 'Bangka Belitung', 'Sumatera', 'Pangkal Pinang'),
(9, 'Bengkulu', 'Sumatera', 'Bengkulu'),
(10, 'Lampung', 'Sumatera', 'Bandar Lampung'),
(11, 'DKI Jakarta', 'Jawa', 'Jakarta'),
(12, 'Jawa Barat', 'Jawa', 'Bandung'),
(13, 'Banten', 'Jawa', 'Serang'),
(14, 'Daerah Istimewa Yogyakarta', 'Jawa', 'Yogyakarta'),
(15, 'Nanggro Aceh Darussalam', 'Sumatera', 'Banda Aceh'),
(16, 'Jawa Timur', 'Jawa', 'Surabaya'),
(17, 'Bali', 'Bali', 'Denpasar'),
(18, 'Nusa Tenggara Barat', 'Nusa Tenggara', 'Mataram'),
(19, 'Nusa Tenggara Timur', 'Nusa Tenggara', 'Kupang'),
(20, 'Kalimantan Barat', 'Kalimantan', 'Pontianak'),
(21, 'Kalimantan Tengah', 'Kalimantan', 'Palangkaraya'),
(22, 'Kalimantan Selatan', 'Kalimantan', 'Banjarmasin'),
(23, 'Kalimantan Timur', 'Kalimantan', 'Samarinda'),
(24, 'Sulawesi Utara', 'Sulawesi', 'Manado'),
(25, 'Sulawesi Barat', 'Sulawesi', 'Kota Mamuju'),
(26, 'Sulawesi Tengah', 'Sulawesi', 'Palu'),
(27, 'Sulawesi Tenggara', 'Sulawesi', 'Kendari'),
(28, 'Sulawesi Selatan', 'Sulawesi', 'Makassar'),
(29, 'Gorontalo', 'Sulawesi', 'Gorontalo'),
(30, 'Maluku', 'Maluku', 'Ambon'),
(31, 'Maluku Utara', 'Maluku', 'Ternate'),
(32, 'Papua Barat', 'Papua', 'Kota Manokwari'),
(33, 'Papua', 'Papua', 'Jayapura'),
(34, 'Kepulauan Bangka Belitung', 'Kepulauan Bangka Belitung', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reset_pass`
--

CREATE TABLE `reset_pass` (
  `reset_id` int(11) NOT NULL,
  `reset_users` int(11) DEFAULT NULL,
  `reset_link` varchar(255) DEFAULT NULL,
  `reset_input` datetime DEFAULT NULL,
  `reset_expired` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting`
--

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL,
  `setting_nama` char(128) DEFAULT NULL,
  `setting_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`setting_id`, `setting_nama`, `setting_value`) VALUES
(1, 'web_judul', 'Penerimaan Siswa Baru'),
(2, 'sekolah_nama', 'SMK MARHAS MARGAHAYU'),
(3, 'sekolah_alamat', 'Jalan Terusan Kopo No. 385/299 Margahayu Kabupaten Bandung 40226'),
(4, 'sekolah_telpon', '(022) 5410926'),
(5, 'sekolah_email', 'info@marhas.sch.id');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `siswa_id` int(11) NOT NULL,
  `siswa_gel` int(11) NOT NULL,
  `siswa_no_pendaftaran` int(8) NOT NULL,
  `siswa_nama` varchar(128) NOT NULL,
  `siswa_nama_panggilan` varchar(32) DEFAULT NULL,
  `siswa_jenis_kelamin` enum('l','p') DEFAULT 'l',
  `siswa_tempat_lahir` varchar(64) NOT NULL,
  `siswa_tanggal_lahir` date NOT NULL,
  `siswa_agama` int(11) DEFAULT NULL,
  `siswa_warganegara` varchar(64) DEFAULT NULL,
  `siswa_sekolah_asal` varchar(128) NOT NULL,
  `siswa_sekolah_alamat` varchar(255) DEFAULT NULL,
  `siswa_nomorpesertaun` varchar(15) NOT NULL,
  `siswa_nomorseriskhun` varchar(20) NOT NULL,
  `siswa_nomorseriijazah` varchar(20) NOT NULL,
  `siswa_nisn` varchar(20) NOT NULL,
  `siswa_jumlah_saudara` int(2) DEFAULT NULL,
  `siswa_alamat` varchar(255) DEFAULT NULL,
  `siswa_prov` int(11) DEFAULT NULL,
  `siswa_kabupaten` varchar(64) DEFAULT NULL,
  `siswa_kecamatan` varchar(64) DEFAULT NULL,
  `siswa_kode_pos` char(16) DEFAULT NULL,
  `siswa_alamat_pos` varchar(255) DEFAULT NULL,
  `siswa_telepon` char(16) DEFAULT NULL,
  `siswa_hp` char(16) DEFAULT NULL,
  `siswa_email` varchar(128) DEFAULT NULL,
  `siswa_gol_darah` enum('none','a','b','ab','o') DEFAULT 'none',
  `siswa_anak_ke` int(2) DEFAULT NULL,
  `siswa_tinggi_badan` char(16) DEFAULT NULL,
  `siswa_berat_badan` char(16) DEFAULT NULL,
  `siswa_penyakit` varchar(255) DEFAULT NULL,
  `siswa_tanggal_daftar` date DEFAULT NULL,
  `siswa_status` enum('blm_dicek','sdh_dicek') NOT NULL DEFAULT 'blm_dicek',
  `siswa_ulang` enum('sudah','belum') DEFAULT 'belum',
  `siswa_tanggal_ulang` date DEFAULT NULL,
  `siswa_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `test`
--

CREATE TABLE `test` (
  `test_id` int(11) NOT NULL,
  `test_siswa` int(11) DEFAULT NULL,
  `test_jentest` int(11) DEFAULT NULL,
  `test_nilai` decimal(5,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_username` varchar(128) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_pangkat` enum('admin','user') NOT NULL DEFAULT 'user',
  `user_nama` varchar(128) DEFAULT NULL,
  `user_tanggal` date DEFAULT NULL,
  `user_keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `user_username`, `user_password`, `user_email`, `user_pangkat`, `user_nama`, `user_tanggal`, `user_keterangan`) VALUES
(1, 'admin', '0c7540eb7e65b553ec1ba6b20de79608', 'admin@localhost.com', 'admin', 'Nama Saya Admin', '2014-08-05', 'Password = admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`agama_id`),
  ADD UNIQUE KEY `UNIQUE` (`agama_nama`);

--
-- Indexes for table `asal_sekolah`
--
ALTER TABLE `asal_sekolah`
  ADD PRIMARY KEY (`asal_id`);

--
-- Indexes for table `captcha`
--
ALTER TABLE `captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `gelombang`
--
ALTER TABLE `gelombang`
  ADD PRIMARY KEY (`gel_id`);

--
-- Indexes for table `jenis_test`
--
ALTER TABLE `jenis_test`
  ADD PRIMARY KEY (`jentest_id`),
  ADD UNIQUE KEY `UNIQUE` (`jentest_nama`,`jentest_gel`),
  ADD KEY `jentest_gel` (`jentest_gel`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`jur_id`),
  ADD UNIQUE KEY `UNIQUE` (`jur_nama`);

--
-- Indexes for table `kuota`
--
ALTER TABLE `kuota`
  ADD PRIMARY KEY (`kuota_id`),
  ADD UNIQUE KEY `UNIQUE` (`kuota_gel`,`kuota_jur`),
  ADD KEY `kuota_jur` (`kuota_jur`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD KEY `link_id` (`link_id`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`mapel_id`),
  ADD UNIQUE KEY `UNIQUE` (`mapel_nama`,`mapel_gel`),
  ADD KEY `mapel_gel` (`mapel_gel`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`nilai_id`),
  ADD UNIQUE KEY `UNIQUE` (`nilai_siswa`,`nilai_mapel`),
  ADD KEY `nilai_siswa` (`nilai_siswa`),
  ADD KEY `nilai_mapel` (`nilai_mapel`);

--
-- Indexes for table `orang_tua`
--
ALTER TABLE `orang_tua`
  ADD PRIMARY KEY (`ot_id`),
  ADD UNIQUE KEY `UNIQUE` (`ot_siswa`),
  ADD KEY `ot_siswa` (`ot_siswa`),
  ADD KEY `ot_pen_ayah` (`ot_pend_ayah`),
  ADD KEY `ot_pen_ibu` (`ot_pend_ibu`),
  ADD KEY `ot_pen_wali` (`ot_pend_wali`),
  ADD KEY `ot_pek_ayah` (`ot_pek_ayah`),
  ADD KEY `ot_pek_ibu` (`ot_pek_ibu`),
  ADD KEY `ot_pek_wali` (`ot_pek_wali`);

--
-- Indexes for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  ADD PRIMARY KEY (`pek_id`),
  ADD UNIQUE KEY `UNIQUE` (`pek_nama`);

--
-- Indexes for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD PRIMARY KEY (`pend_id`),
  ADD UNIQUE KEY `UNIQUE` (`pend_nama`);

--
-- Indexes for table `pilihan`
--
ALTER TABLE `pilihan`
  ADD PRIMARY KEY (`pilihan_id`),
  ADD UNIQUE KEY `UNIQUE` (`pilihan_siswa`,`pilihan_ke`),
  ADD KEY `pilihan_siswa` (`pilihan_siswa`),
  ADD KEY `pilihan_jur` (`pilihan_jur`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD KEY `post_id` (`post_id`),
  ADD KEY `post_user` (`post_user`);

--
-- Indexes for table `prestasi`
--
ALTER TABLE `prestasi`
  ADD PRIMARY KEY (`prestasi_id`),
  ADD KEY `prestasi_siswa` (`prestasi_siswa`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`prov_id`),
  ADD UNIQUE KEY `UNIQUE` (`prov_nama`);

--
-- Indexes for table `reset_pass`
--
ALTER TABLE `reset_pass`
  ADD KEY `reset_id` (`reset_id`),
  ADD KEY `reset_users` (`reset_users`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD UNIQUE KEY `UNIQUE` (`setting_nama`),
  ADD KEY `setting_id` (`setting_id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`siswa_id`),
  ADD UNIQUE KEY `UNIQUE` (`siswa_no_pendaftaran`),
  ADD KEY `siswa_agama` (`siswa_agama`),
  ADD KEY `siswa_suku` (`siswa_warganegara`),
  ADD KEY `siswa_prov` (`siswa_prov`),
  ADD KEY `siswa_gel` (`siswa_gel`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`test_id`),
  ADD UNIQUE KEY `UNIQUE` (`test_siswa`,`test_jentest`),
  ADD KEY `test_siswa` (`test_siswa`),
  ADD KEY `test_jenis` (`test_jentest`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UNIQUE` (`user_username`,`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agama`
--
ALTER TABLE `agama`
  MODIFY `agama_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `asal_sekolah`
--
ALTER TABLE `asal_sekolah`
  MODIFY `asal_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69966320;

--
-- AUTO_INCREMENT for table `captcha`
--
ALTER TABLE `captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `gelombang`
--
ALTER TABLE `gelombang`
  MODIFY `gel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jenis_test`
--
ALTER TABLE `jenis_test`
  MODIFY `jentest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `jur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kuota`
--
ALTER TABLE `kuota`
  MODIFY `kuota_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `mapel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `nilai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2109;

--
-- AUTO_INCREMENT for table `orang_tua`
--
ALTER TABLE `orang_tua`
  MODIFY `ot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;

--
-- AUTO_INCREMENT for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  MODIFY `pek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pendidikan`
--
ALTER TABLE `pendidikan`
  MODIFY `pend_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pilihan`
--
ALTER TABLE `pilihan`
  MODIFY `pilihan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1582;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `prestasi`
--
ALTER TABLE `prestasi`
  MODIFY `prestasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;

--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `prov_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `reset_pass`
--
ALTER TABLE `reset_pass`
  MODIFY `reset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `siswa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1582;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jenis_test`
--
ALTER TABLE `jenis_test`
  ADD CONSTRAINT `jentest_gel` FOREIGN KEY (`jentest_gel`) REFERENCES `gelombang` (`gel_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kuota`
--
ALTER TABLE `kuota`
  ADD CONSTRAINT `kuota_gel` FOREIGN KEY (`kuota_gel`) REFERENCES `gelombang` (`gel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kuota_jur` FOREIGN KEY (`kuota_jur`) REFERENCES `jurusan` (`jur_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD CONSTRAINT `mapel_gel` FOREIGN KEY (`mapel_gel`) REFERENCES `gelombang` (`gel_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_mapel` FOREIGN KEY (`nilai_mapel`) REFERENCES `mata_pelajaran` (`mapel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_siswa` FOREIGN KEY (`nilai_siswa`) REFERENCES `siswa` (`siswa_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orang_tua`
--
ALTER TABLE `orang_tua`
  ADD CONSTRAINT `ot_pek_ayah` FOREIGN KEY (`ot_pek_ayah`) REFERENCES `pekerjaan` (`pek_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ot_pek_ibu` FOREIGN KEY (`ot_pek_ibu`) REFERENCES `pekerjaan` (`pek_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ot_pek_wali` FOREIGN KEY (`ot_pek_wali`) REFERENCES `pekerjaan` (`pek_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ot_pen_ayah` FOREIGN KEY (`ot_pend_ayah`) REFERENCES `pendidikan` (`pend_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ot_pen_ibu` FOREIGN KEY (`ot_pend_ibu`) REFERENCES `pendidikan` (`pend_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ot_pen_wali` FOREIGN KEY (`ot_pend_wali`) REFERENCES `pendidikan` (`pend_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ot_siswa` FOREIGN KEY (`ot_siswa`) REFERENCES `siswa` (`siswa_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pilihan`
--
ALTER TABLE `pilihan`
  ADD CONSTRAINT `pilihan_jur` FOREIGN KEY (`pilihan_jur`) REFERENCES `jurusan` (`jur_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pilihan_siswa` FOREIGN KEY (`pilihan_siswa`) REFERENCES `siswa` (`siswa_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_user` FOREIGN KEY (`post_user`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  ADD CONSTRAINT `prestasi_siswa` FOREIGN KEY (`prestasi_siswa`) REFERENCES `siswa` (`siswa_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `reset_pass`
--
ALTER TABLE `reset_pass`
  ADD CONSTRAINT `reset_users` FOREIGN KEY (`reset_users`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_agama` FOREIGN KEY (`siswa_agama`) REFERENCES `agama` (`agama_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `siswa_gel` FOREIGN KEY (`siswa_gel`) REFERENCES `gelombang` (`gel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siswa_prov` FOREIGN KEY (`siswa_prov`) REFERENCES `provinsi` (`prov_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_jenis` FOREIGN KEY (`test_jentest`) REFERENCES `jenis_test` (`jentest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `test_siswa` FOREIGN KEY (`test_siswa`) REFERENCES `siswa` (`siswa_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
