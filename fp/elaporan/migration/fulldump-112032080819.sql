-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: testing
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditor`
--

DROP TABLE IF EXISTS `auditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditor` (
  `id_jadwal_pelaksanaan_opd` int(11) DEFAULT NULL,
  `nama_auditor` varchar(64) DEFAULT NULL,
  `jabatan` varchar(32) DEFAULT NULL,
  `editable` int(1) NOT NULL DEFAULT '1',
  KEY `fk_relationship_30` (`id_jadwal_pelaksanaan_opd`),
  CONSTRAINT `fk_relationship_30` FOREIGN KEY (`id_jadwal_pelaksanaan_opd`) REFERENCES `jadwal_pelaksanaan_opd` (`id_jadwal_pelaksanaan_opd`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor`
--

LOCK TABLES `auditor` WRITE;
/*!40000 ALTER TABLE `auditor` DISABLE KEYS */;
INSERT INTO `auditor` VALUES (19,'zxc','inspektur',1),(19,'tono','',1),(22,'ccc','',1),(19,'SRI HERMININGSIH','SEKRETARIS',0),(23,'Malik Asmany, S.Sos, M.Si','Pembantu Penanggungjawab',1),(23,'Heni Setyawati, SP','Pengendali Teknis',1),(23,'Aning Purwati, S.Sos','Ketua Tim',1),(23,'Andri Dwi K, ST','Anggota',1),(23,'Oliek Wahyu K., SE','Anggota',1),(24,'Drs. Sunarto, ST','Pembantu Penanggungjawab',1),(24,'Ir. Sunarti','Pengendali Teknis',1),(24,'Donny Sandhi W., ST','Ketua Tim',1),(24,'Puspitasari, SH','Anggota',1),(24,'Dedhy Priyo N., SH','Anggota',1);
/*!40000 ALTER TABLE `auditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_laporan_kinerja_triwulan`
--

DROP TABLE IF EXISTS `detail_laporan_kinerja_triwulan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_laporan_kinerja_triwulan` (
  `id_laporan` int(11) NOT NULL,
  `uraian` varchar(128) DEFAULT NULL,
  `indikator_kinerja` varchar(64) DEFAULT NULL,
  `target` float DEFAULT NULL,
  `realisasi_target` int(11) DEFAULT NULL,
  `program` varchar(128) DEFAULT NULL,
  `anggaran` int(11) DEFAULT NULL,
  `capaian_realisasi_keuangan` int(11) DEFAULT NULL,
  KEY `fk_detail_laporan_kinerja_triwulan_1_idx` (`id_laporan`),
  CONSTRAINT `fk_detail_laporan_kinerja_triwulan_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_kinerja_triwulan` (`id_laporan`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_laporan_kinerja_triwulan`
--

LOCK TABLES `detail_laporan_kinerja_triwulan` WRITE;
/*!40000 ALTER TABLE `detail_laporan_kinerja_triwulan` DISABLE KEYS */;
INSERT INTO `detail_laporan_kinerja_triwulan` VALUES (22,'aaa','',124,0,'',0,0),(58,'Terlaksananya Koordinasi dan Konsultasi Keluar Daerah','Jumlah Koordinasi',100,98,'Program Pelayanan dan Administrasi Perkantoran',351305,344514),(58,'Terlaksananya Pemeliharaan Rutin/Berkala Gedung dan Bangunan','Jumlah Gedung',100,15,'Program Pemeliharan Barang Daerah',13000,1963),(58,'Terlaksananya Penyediaan Jasa Peralatan & Perlengkapan Kantor','Jumlah Peralatan Barang dan Jasa Kantor',100,64,'Program Pelayanan dan Administrasi Perkantoran',434242,278463);
/*!40000 ALTER TABLE `detail_laporan_kinerja_triwulan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_rekap_pokja`
--

DROP TABLE IF EXISTS `detail_rekap_pokja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_rekap_pokja` (
  `id_pegawai` int(11) NOT NULL,
  `id_detail_rekap_tender` int(11) NOT NULL,
  `jabatan` varchar(64) DEFAULT NULL,
  `ket` text,
  KEY `fk_detail_rekap_pokja_1_idx` (`id_pegawai`),
  KEY `fk_detail_rekap_pokja_2_idx` (`id_detail_rekap_tender`),
  CONSTRAINT `fk_detail_rekap_pokja_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_detail_rekap_pokja_2` FOREIGN KEY (`id_detail_rekap_tender`) REFERENCES `detail_rekap_tender` (`id_detail_rekap_tender`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_rekap_pokja`
--

LOCK TABLES `detail_rekap_pokja` WRITE;
/*!40000 ALTER TABLE `detail_rekap_pokja` DISABLE KEYS */;
INSERT INTO `detail_rekap_pokja` VALUES (8,15,'Ketua',''),(8,16,'Sekretaris',''),(8,17,'Ketua',''),(9,22,'Ketua',''),(9,19,'Ketua','');
/*!40000 ALTER TABLE `detail_rekap_pokja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_rekap_tender`
--

DROP TABLE IF EXISTS `detail_rekap_tender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_rekap_tender` (
  `id_opd` int(11) DEFAULT NULL,
  `id_laporan` int(11) DEFAULT NULL,
  `nilai_hps` int(11) DEFAULT NULL,
  `pemenang` varchar(256) DEFAULT NULL,
  `harga_kontrak` int(11) DEFAULT NULL,
  `ket` text,
  `nama_paket_kerja` varchar(128) DEFAULT NULL,
  `pagu` int(11) DEFAULT NULL,
  `id_detail_rekap_tender` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_detail_rekap_tender`),
  KEY `fk_relationship_41` (`id_opd`),
  KEY `fk_relationship_14` (`id_laporan`),
  CONSTRAINT `fk_relationship_14` FOREIGN KEY (`id_laporan`) REFERENCES `rekap_tender` (`id_laporan`) ON DELETE CASCADE,
  CONSTRAINT `fk_relationship_41` FOREIGN KEY (`id_opd`) REFERENCES `opd` (`id_opd`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_rekap_tender`
--

LOCK TABLES `detail_rekap_tender` WRITE;
/*!40000 ALTER TABLE `detail_rekap_tender` DISABLE KEYS */;
INSERT INTO `detail_rekap_tender` VALUES (9,23,0,'',0,'','Belanja mamin pra evaluasi pembangunan TW II',2000000,15),(11,23,0,'',0,'','Belanja Makanan dan Minuman Tamu',4000000,16),(10,23,0,'',0,'','Pengadaan makanan dan minuman peserta',151875000,17),(10,56,0,'',0,'','Pengadaan makanan dan minuman tamu dan plakat Kota Madiun',70000000,18),(10,56,0,'',0,'','Sewa tenda dan perlengkapannya, dan pengadaan makan dan minum rapat',151410000,19),(10,56,0,'',0,'','Pengadaan makanan dan minuman peserta ',28312000,20),(10,56,0,'',0,'','Pengadaan makanan dan minuman peserta',27817000,21),(10,56,0,'',0,'','Pengadaan buku LKPJ dan nota pengatar LKPJ',24141000,22);
/*!40000 ALTER TABLE `detail_rekap_tender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hasil_temuan`
--

DROP TABLE IF EXISTS `hasil_temuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hasil_temuan` (
  `id_temuan` int(11) DEFAULT NULL,
  `rekomendasi` text,
  `status_rekomendasi` char(2) DEFAULT NULL,
  `tindak_lanjut` text,
  `status_tindak_lanjut` char(2) DEFAULT NULL,
  `catatan_bpk` text,
  KEY `fk_relationship_25` (`id_temuan`),
  CONSTRAINT `fk_relationship_25` FOREIGN KEY (`id_temuan`) REFERENCES `temuan` (`id_temuan`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasil_temuan`
--

LOCK TABLES `hasil_temuan` WRITE;
/*!40000 ALTER TABLE `hasil_temuan` DISABLE KEYS */;
INSERT INTO `hasil_temuan` VALUES (8,'zzzz','T','sss','T','ddd'),(7,'<p>sfsadfsadfsad</p>','TS','<p>asdfasdfasfasdfasdfdsaasfasdf</p>','TS','<p>asdfasdfafasdfdsf</p>'),(7,'<p>ss</p>',NULL,'<p>ss</p>',NULL,'<p>sss</p>'),(11,'<p>Memerintahkan Kepala Bappenda agar Meningkatkan koordinasi dengan Kepala KPP Pratama Madiun dalam verifikasi dan validasi data pelimpahan piutang PBB sebesar Rp.294.925.242,00 dan Rp. 669.648.587,00</p>','TB','<p>Ditindaklanjuti dengan Surat Kepala Badan Pendapatan Daerah tgl 31 Oktober 2018 Nomor : 700/698/401.101/2018 yang berisikan :<br>- Telah berkoordinasi dg KPP Pratama, namun belum ada tanggapan&nbsp;<br>- Validasi data piutang PBB-P2 Rp.669.648.587 sedang dalam proses dgn membetuk 5 tim<br>- Data realisasi PBB Pajak 2002-2012 periode 1 Januari - 29 Oktober 2018 sebesar RP. 8.793.032,-</p>','TB','<p>- Koordinasi dengan KPP Pratama belum membuahkan hasil. Bapenda akan melakukan verifikasi dan validasi data pelimpahan piutang PBB pada Semester II 2018<br>- Tim validasi PBB telah dibentuk dan telah melaksanakan tugas. Namun hasil validasi belum disusun.</p>'),(11,'<p>Memerintahkan Kepala Bidang Penagihan, Pemeriksaan, dan Pelayanan melakukan inventarisasi hasil pendataan untuk memvalidasi data pelimpahan piutang PBB-P2</p>','TS','<p>&nbsp;</p>','TS','<p>Inventarisasi belum selesai dilakukan. Tindak lanjut dianggap sesuai jika poin a selesai dilaksanakan.</p>'),(11,'<p>Memerintahkan Kepala Sub Bidang Penagihan melakukan penatausahaan piutang dan realisasi pendapatan PBB-P2 sesuai dengan data SISMIOP yang valid dan realisasi Kas Daerah</p>','TS','<p>&nbsp;</p>','TS','<p>Penatausahaan piutang belum selesai dilakukan.<br>Tindak lanjut dianggap sesuai jika poin a selesai dilaksanakan.</p>');
/*!40000 ALTER TABLE `hasil_temuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ikm`
--

DROP TABLE IF EXISTS `ikm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ikm` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl` date DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_inheritance_6` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ikm`
--

LOCK TABLES `ikm` WRITE;
/*!40000 ALTER TABLE `ikm` DISABLE KEYS */;
INSERT INTO `ikm` VALUES (24,8,9,'2019-08-04 03:10:31','2019-08-04 03:10:31','2019-08-09'),(52,18,9,'2019-08-08 02:13:11','2019-08-08 02:13:11','2019-08-08');
/*!40000 ALTER TABLE `ikm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ikm_opd`
--

DROP TABLE IF EXISTS `ikm_opd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ikm_opd` (
  `id_opd` int(11) DEFAULT NULL,
  `id_laporan` int(11) DEFAULT NULL,
  `nilai` float DEFAULT NULL,
  `predikat` varchar(16) DEFAULT NULL,
  KEY `fk_relationship_29` (`id_opd`),
  KEY `fk_relationship_28` (`id_laporan`),
  CONSTRAINT `fk_relationship_28` FOREIGN KEY (`id_laporan`) REFERENCES `ikm` (`id_laporan`) ON DELETE CASCADE,
  CONSTRAINT `fk_relationship_29` FOREIGN KEY (`id_opd`) REFERENCES `opd` (`id_opd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ikm_opd`
--

LOCK TABLES `ikm_opd` WRITE;
/*!40000 ALTER TABLE `ikm_opd` DISABLE KEYS */;
INSERT INTO `ikm_opd` VALUES (144,24,0,''),(154,24,3,''),(13,52,85.66,'BAIK'),(144,52,81.9,'BAIK'),(2,52,80.69,'BAIK'),(5,52,80.23,'BAIK'),(18,52,82,'BAIK');
/*!40000 ALTER TABLE `ikm_opd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwal_pelaksanaan`
--

DROP TABLE IF EXISTS `jadwal_pelaksanaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwal_pelaksanaan` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl` date DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_inheritance_10` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal_pelaksanaan`
--

LOCK TABLES `jadwal_pelaksanaan` WRITE;
/*!40000 ALTER TABLE `jadwal_pelaksanaan` DISABLE KEYS */;
INSERT INTO `jadwal_pelaksanaan` VALUES (21,8,6,'2019-08-03 14:00:05','2019-08-03 14:00:05','2019-08-13'),(54,18,6,'2019-08-08 02:41:01','2019-08-08 02:41:01','2019-08-16');
/*!40000 ALTER TABLE `jadwal_pelaksanaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwal_pelaksanaan_opd`
--

DROP TABLE IF EXISTS `jadwal_pelaksanaan_opd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwal_pelaksanaan_opd` (
  `id_jadwal_pelaksanaan_opd` int(11) NOT NULL AUTO_INCREMENT,
  `id_opd` int(11) DEFAULT NULL,
  `id_laporan` int(11) DEFAULT NULL,
  `jenis_pengawasan` varchar(64) DEFAULT NULL,
  `rmp` varchar(32) DEFAULT NULL,
  `rpl` varchar(32) DEFAULT NULL,
  `output_lhp` int(11) DEFAULT NULL,
  `hari_pengawasan` int(11) DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`id_jadwal_pelaksanaan_opd`),
  KEY `fk_relationship_33` (`id_opd`),
  KEY `fk_relationship_32` (`id_laporan`),
  CONSTRAINT `fk_relationship_32` FOREIGN KEY (`id_laporan`) REFERENCES `jadwal_pelaksanaan` (`id_laporan`) ON DELETE CASCADE,
  CONSTRAINT `fk_relationship_33` FOREIGN KEY (`id_opd`) REFERENCES `opd` (`id_opd`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal_pelaksanaan_opd`
--

LOCK TABLES `jadwal_pelaksanaan_opd` WRITE;
/*!40000 ALTER TABLE `jadwal_pelaksanaan_opd` DISABLE KEYS */;
INSERT INTO `jadwal_pelaksanaan_opd` VALUES (19,144,21,'sss','das','ads',0,0,''),(22,82,21,'','','',0,0,'123'),(23,144,54,'AUDIT KETAATAN','VII-4','VIII-2',1,25,'IRBAN I'),(24,9,54,'AUDIT KETAATAN','VI-3','VII-1',1,25,'IRBAN III');
/*!40000 ALTER TABLE `jadwal_pelaksanaan_opd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kegiatan`
--

DROP TABLE IF EXISTS `kegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kegiatan` (
  `kode_kegiatan` varchar(30) NOT NULL,
  `kode_program` varchar(30) DEFAULT NULL,
  `nama_kegiatan` varchar(128) DEFAULT NULL,
  `pagu_ppas_final` int(11) DEFAULT NULL,
  `keluaran_indikator` varchar(64) DEFAULT NULL,
  `keluaran_target_ppas_final` float DEFAULT NULL,
  `keluaran_realisasi_kinerja` float DEFAULT NULL,
  `keluaran_realisasi_kinerja_persen` float DEFAULT NULL,
  `keluaran_satuan` varchar(16) DEFAULT NULL,
  `hasil_indikator` varchar(64) DEFAULT NULL,
  `hasil_target_ppas_final` float DEFAULT NULL,
  `realisasi_keuangan` int(11) DEFAULT NULL,
  `realisasi_keuangan_persen` float DEFAULT NULL,
  `hasil_realisasi_kinerja` float DEFAULT NULL,
  `hasil_realisasi_kinerja_persen` float DEFAULT NULL,
  `hasil_satuan` varchar(16) DEFAULT NULL,
  `ket` text,
  PRIMARY KEY (`kode_kegiatan`),
  KEY `fk_relationship_35` (`kode_program`),
  CONSTRAINT `fk_relationship_35` FOREIGN KEY (`kode_program`) REFERENCES `program` (`kode_program`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kegiatan`
--

LOCK TABLES `kegiatan` WRITE;
/*!40000 ALTER TABLE `kegiatan` DISABLE KEYS */;
INSERT INTO `kegiatan` VALUES ('31-01-001','31-01','Kegiatan Penyediaan Jasa, Peralatan dan Perlengkapan Kantor',2147483647,'jumlah lembaga',1,1,NULL,'lembaga','akuntabilitas kinerja dinas pendidikan bernilai baik',77,1,NULL,1,NULL,'BB',NULL),('31-01-002','31-01','Kegiatan Koordinasi dan Konsultasi Keluar Daerah',443750000,'jumlah kali',105,0,NULL,'kali','akuntabilitas kinerja dinas pendidikan bernilai baik',77,0,NULL,0,NULL,'BB',NULL),('31-02-001','31-02','Kegiatan Pemeliharaan Rutin/ Berkala Gedung dan Bangunan Kantor',70250000,'jumlah lembaga',1,0,NULL,'lembaga','akuntabilitas kinerja dinas pendidikan bernilai baik',77,0,NULL,0,NULL,'BB',NULL),('31-02-002','31-02','Kegiatan Pemeliharaan Rutin/ Berkala Kendaraan Dinas',136100000,'jumlah unit',123,0,NULL,'kendaraan','akuntabilitas kinerja dinas pendidikan bernilai baik',77,0,NULL,0,NULL,'BB',NULL),('31-02-003','31-02','Kegiatan Pemeliharaan Rutin/ Berkala Sarana Prasarana Kantor',400000000,'jumlah lembaga',1,0,NULL,'lembaga','akuntabilitas kinerja dinas pendidikan bernilai baik',77,0,NULL,0,NULL,'BB',NULL),('31-03-001','31-03','Kegiatan Pengadaan Sarana dan Prasarana Kantor',600000000,'jumlah paket',1,0,NULL,'paket','akuntabilitas kinerja dinas pendidikan bernilai baik',77,0,NULL,0,NULL,'BB',NULL),('31-04-001','31-04','Kegiatan Penyusunan Perencanaan serta Pelaporan Kinerja dan Ikhtisar Realisasi Kinerja Perangkat Daerah',100000000,'jumlah dokumen',9,0,NULL,'lembaga','akuntabilitas kinerja dinas pendidikan bernilai baik',77,0,NULL,0,NULL,'BB',NULL),('31-15-001','31-15','Kegiatan Operasional BOS Tingkat Kota',90000000,'jumlah lembaga yang memenuhi standar pendidikan',94,0,NULL,'lembaga','satuan pendidikan semua jenjang melaksanakan manajemen berbasis ',94,0,NULL,0,NULL,'lembaga',NULL),('31-15-002','31-15','Kegiatan Pembinaan Komite Sekolah dalam Pengelolaan Sumber Daya Pendidikan',99750000,'jumlah komite yang memahami pendidikan meningkat',184,0,NULL,'orang','satuan pendidikan semua jenjang melaksanakan manajemen berbasis ',94,0,NULL,0,NULL,'lembaga',NULL),('31-15-003','31-15','Kegiatan Pengembangan dan Implementasi Informasi Pendidikan Berbasis IT',200000000,'jumlah lembaga yang sesuai dengan SPM',142,0,NULL,'lembaga','satuan pendidikan semua jenjang melaksanakan manajemen berbasis ',94,0,NULL,0,NULL,'lembaga',NULL),('31-15-004','31-15','Kegiatan Operasional BOS Madrasah Diniyah (BOSDA MADIN) BK Prov',105000000,'jumlah lembaga yang mendapat BOS',49,0,NULL,'lembaga','satuan pendidikan semua jenjang melaksanakan manajemen berbasis ',94,0,NULL,0,NULL,'lembaga',NULL),('31-15-005','31-15','Kegiatan BOP Bantuan Beasiswa Mahasiswa (BBM)',65000000,'jumlah mahasiswa berprestasi yang menerima bantuan',300,0,NULL,'mahasiswa','satuan pendidikan semua jenjang melaksanakan manajemen berbasis ',94,0,NULL,0,NULL,'lembaga',NULL),('31-16-001','31-16','Kegiatan Sertifikasi Guru',224054000,'jumlah guru yang bersertifikasi',125,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-16-002','31-16','Kegiatan Penilaian Angka Kredit Jabatan Fungsional Guru',144375000,'jumlah guru yang mengikuti penilaian angka kredit',500,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-16-003','31-16','Kegiatan Seleksi Guru, Kepala Sekolah, dan Pengawas Sekolah Berprestasi, OGN, Inobel, Literasi, Media Pembelajaran Berbasis IT s',700000000,'jumlah guru/kasek berkinerja baik',500,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-16-005','31-16','Kegiatan Bantuan Beasiswa Pendidikan S1/S2/S3',120000000,'jumlah guru yang berkualifikasi S1',10,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-16-006','31-16','Kegiatan Peningkatan Kompetensi SDM Guru Kelas dan Mapel Online serta Pengembangan Keprofesian Berkelanjutan (PKB)',400000000,'jumlah guru yang memahami materi',500,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-16-007','31-16','Kegiatan Peningkatan SDM Tenaga Kependidikan (TU)',50000000,'jumlah TU yang taat aturan',50,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-16-008','31-16','Kegiatan Outdoor Learning Guru',325000000,'jumlah guru yang mengikuti outdoor learning\r\n',400,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-17-001','31-17','Kegiatan Penyelenggaraan SMP Terbuka',78556000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-002','31-17','Kegiatan Penyelenggaraan SMPN 1',1807273000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-003','31-17','Kegiatan Penyelenggaraan SMPN 2',1555369000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-004','31-17','Kegiatan Penyelenggaraan SMPN 3',1071885000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-005','31-17','Kegiatan Penyelenggaraan SMPN 4',1391293100,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-006','31-17','Kegiatan Penyelenggaraan SMPN 5',836852000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-007','31-17','Kegiatan Penyelenggaraan SMPN 6',1264776000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-008','31-17','Kegiatan Penyelenggaraan SMPN 7',1458032000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-009','31-17','Kegiatan Penyelenggaraan SMPN 8',1204131000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-010','31-17','Kegiatan Penyelenggaraan SMPN 9',1306194000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-011','31-17','Kegiatan Penyelenggaraan SMPN 10',1485995000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-012','31-17','Kegiatan Penyelenggaraan SMPN 11',990536000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-013','31-17','Kegiatan Penyelenggaraan SMPN 12',1376178500,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-014','31-17','Kegiatan Penyelenggaraan SMPN 13',1286469000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-015','31-17','Kegiatan Penyelenggaraan SMPN 14',906011000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-016','31-17','Kegiatan Penyelenggaraan SDN 01 Kartoharjo',489806300,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-017','31-17','Kegiatan Penyelenggaraan SDN 02 Kartoharjo',188786000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-018','31-17','Kegiatan Penyelenggaraan SDN 03 Kartoharjo',181399400,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-019','31-17','Kegiatan Penyelenggaraan SDN 01 Klegen',534335800,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-020','31-17','Kegiatan Penyelenggaraan SDN 02 Klegen',264324800,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-021','31-17','Kegiatan Penyelenggaraan SDN 03 Klegen',521516000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-022','31-17','Kegiatan Penyelenggaraan SDN 04 Klegen',219344500,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-023','31-17','Kegiatan Penyelenggaraan SDN Oro Oro Ombo',414544000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-024','31-17','Kegiatan Penyelenggaraan SDN 01 Rejomulyo',195813000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-025','31-17','Kegiatan Penyelenggaraan SDN 02 Rejomulyo',159546000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-026','31-17','Kegiatan Penyelenggaraan SDN 01 Kanigoro',223088500,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-027','31-17','Kegiatan Penyelenggaraan SDN 02 Kanigoro',290733400,'jumlah lembaga yang beroperasional baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-028','31-17','Kegiatan Penyelenggaraan SDN 03 Kanigoro',318658600,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-029','31-17','Kegiatan Penyelenggaraan SDN Sukosari',140292000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-030','31-17','Kegiatan Penyelengaraan SDN Pilangbango',499116800,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-031','31-17','Kegiatan Penyelenggaraan SDN 01 Tawangrejo',264241400,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-032','31-17','Kegiatan Penyelenggaraan SDN 02 Tawangrejo',228726400,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-033','31-17','Kegiatan Penyelenggaraan SDN Kelun',272934400,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-034','31-17','Kegiatan Penyelenggaraan SDN 01 Manguharjo',567730000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-035','31-17','Kegiatan Penyelenggaraan SDN 01 Nambangan Lor',483047000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-036','31-17','Kegiatan Penyelenggaraan SDN 02 Nambangan Lor',237330000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-037','31-17','Kegiatan Penyelenggaraan SDN 01 Madiun Lor',277889000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-038','31-17','Kegiatan Penyelenggaraan SDN 02 Madiun Lor',269837000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-039','31-17','Kegiatan Penyelenggaraan SDN 03 Madiun Lor',766267000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-040','31-17','Kegiatan Penyelenggaraan SDN 04 Madiun Lor',496014000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-041','31-17','Kegiatan Penyelenggaraan SDN 05 Madiun Lor',564228000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-042','31-17','Kegiatan Penyelenggaraan SDN 01 Nambangan Kidul',257405000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-043','31-17','Kegiatan Penyelenggaraan SDN 02 Nambangan Kidul',229253000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-044','31-17','Kegiatan Penyelenggaraan SDN 03 Nambangan Kidul',484579000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-045','31-17','Kegiatan Penyelenggaraan SDN 04 Nambangan Kidul',219053000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-046','31-17','Kegiatan Penyelenggaraan SDN 01 Winongo',449150000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-047','31-17','Kegiatan Penyelenggaraan SDN 02 Winongo',229892000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-048','31-17','Kegiatan Penyelenggaraan SDN Ngegong',227755000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNPbaik',92,0,NULL,0,NULL,'%',NULL),('31-17-049','31-17','Kegiatan Penyelenggaraan SDN Patihan',521015000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-050','31-17','Kegiatan Penyelenggaraan SDN 01 Pangongangan',223037000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-051','31-17','Kegiatan Penyelenggaraan SDN 02 Pangongangan',448071000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-052','31-17','Kegiatan Penyelenggaraan SDN Sogaten',300555000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-053','31-17','Kegiatan Penyelenggaraan SDN 01 Taman',658217000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-054','31-17','Kegiatan Penyelenggaraan SDN 02 Taman',141303000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-055','31-17','Kegiatan Penyelenggaraan SDN 03 Taman',232131000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-056','31-17','Kegiatan Penyelenggaraan SDN 01 Pandean',530143000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-057','31-17','Kegiatan Penyelenggaraan SDN 02 Pandean',527977000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-058','31-17','Kegiatan Penyelenggaraan SDN Banjarejo',657702000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-059','31-17','Kegiatan Penyelenggaraan SDN 01 Mojorejo',301846000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-060','31-17','Kegiatan Penyelenggaraan SDN 02 Mojorejo',798078000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-061','31-17','Kegiatan Penyelenggaraan SDN 01 Manisrejo',536593000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-062','31-17','Kegiatan Penyelenggaraan SDN 02 Manisrejo',486133000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-063','31-17','Kegiatan Penyelenggaraan SDN 03 Manisrejo',317695000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-064','31-17','Kegiatan Penyelenggaraan SDN 04 Manisrejo',446495000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-065','31-17','Kegiatan Penyelenggaraan SDN 01 Demangan',267498000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-066','31-17','Kegiatan Penyelenggaraan SDN 02 Demangan',289105000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-067','31-17','Kegiatan Penyelenggaraan SDN 01 Josenan',299741000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-068','31-17','Kegiatan Penyelenggaraan SDN 02 Josenan',298978000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-069','31-17','Kegiatan Penyelenggaraan SDN 03 Josenan',240785000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-070','31-17','Kegiatan Penyelenggaraan SDN Kejuron',189828000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-071','31-17','Kegiatan Penyelenggaraan SDN Kuncen',183014000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-072','31-17','Kegiatan Dana BOS pada SMP Negeri 1',873939000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-073','31-17','Kegiatan Dana BOS pada SMP Negeri 2',800073000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-074','31-17','Kegiatan Dana BOS pada SMP Negeri 3',599835000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-075','31-17','Kegiatan Dana BOS pada SMP Negeri 4',1024135000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-076','31-17','Kegiatan Dana BOS pada SMP Negeri 5',531156000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-077','31-17','Kegiatan Dana BOS pada SMP Negeri 6',764211000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-078','31-17','Kegiatan Dana BOS pada SMP Negeri 7',958995000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-079','31-17','Kegiatan Dana BOS pada SMP Negeri 8',579513000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-080','31-17','Kegiatan Dana BOS pada SMP Negeri 9',659444000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-081','31-17','Kegiatan Dana BOS pada SMP Negeri 10',738899000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-082','31-17','Kegiatan Dana BOS pada SMP Negeri 11',697083000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-083','31-17','Kegiatan Dana BOS pada SMP Negeri 12',988205000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-084','31-17','Kegiatan Dana BOS pada SMP Negeri 13',915317000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-085','31-17','Kegiatan Dana BOS pada SMP Negeri 14',499220000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-086','31-17','Kegiatan Dana BOS pada SDN 01 Kartoharjo',320926000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-087','31-17','Kegiatan Dana BOS pada SDN 02 Kartoharjo',73536000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-088','31-17','Kegiatan Dana BOS pada SDN 03 Kartoharjo',71933000,'jumlah lembaga yang memenuhi standar pendidikan\r\n',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-089','31-17','Kegiatan Dana BOS pada SDN 01 Klegen',319645000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-090','31-17','Kegiatan Dana BOS pada SDN 02 Klegen',133726000,'jumlah  lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-091','31-17','Kegiatan Dana BOS pada SDN 03 Klegen',311283000,'jumlah lembaga yang memenuhi standar pendidikan\r\n',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-092','31-17','Kegiatan Dana BOS pada SDN 04 Klegen',101395000,'jumlah lembaga yang memenuhi standar pendidikan\r\n',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-093','31-17','Kegiatan Dana BOS pada SDN Oro Oro Ombo',262449000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-094','31-17','Kegiatan Dana BOS pada SDN 01 Rejomulyo',88981000,'jumlah lembaga yang memenuhi standar pendidikan\r\n',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-095','31-17','Kegiatan Dana BOS pada SDN 02 Rejomulyo',60282000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-096','31-17','Kegiatan Dana BOS pada SDN 01 Kanigoro',124730000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-097','31-17','Kegiatan Dana BOS pada SDN 02 Kanigoro',140700000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-098','31-17','Kegiatan Dana BOS pada SDN 03 Kanigoro',155219000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-099','31-17','Kegiatan Dana BOS pada SDN Sukosari',45845000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-100','31-17','Kegiatan Dana BOS pada SDN Pilangbango',213078000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-101','31-17','Kegiatan Dana BOS pada SDN 01 Tawangrejo',141427000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-102','31-17','Kegiatan Dana BOS pada SDN 02 Tawangrejo',93640000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-103','31-17','Kegiatan Dana BOS pada SDN Kelun',160652000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-104','31-17','Kegiatan Dana BOS pada SDN 01 Manguharjo',312775000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-105','31-17','Kegiatan Dana BOS pada SDN 01 Nambangan Lor',266739000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-106','31-17','Kegiatan Dana BOS pada SDN 02 Nambangan Lor',123256000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-107','31-17','Kegiatan Dana BOS pada SDN 01 Madiun Lor',115645000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-108','31-17','Kegiatan Dana BOS pada SDN 02 Madiun Lor',143626000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-109','31-17','Kegiatan Dana BOS pada SDN 03 Madiun Lor',435013000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-110','31-17','Kegiatan Dana BOS pada SDN 04 Madiun Lor',337500000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-111','31-17','Kegiatan Dana BOS pada SDN 05 Madiun Lor',382044000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-112','31-17','Kegiatan Dana BOS pada SDN 01 Nambangan Kidul',142596000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-113','31-17','Kegiatan Dana BOS pada SDN 02 Nambangan Kidul',99547000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-114','31-17','Kegiatan Dana BOS pada SDN 03 Nambangan Kidul',269766000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-115','31-17','Kegiatan Dana BOS pada SDN 04 Nambangan Kidul',253742000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-116','31-17','Kegiatan Dana BOS pada SDN 01 Winongo',451612000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-117','31-17','Kegiatan Dana BOS pada SDN 02 Winongo',81318000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-118','31-17','Kegiatan Dana BOS pada SDN Ngegong',120208000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-119','31-17','Kegiatan Dana BOS pada SDN Patihan',320119000,'jumlah lembaga yang memenuhi standar pendidikan',0,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-120','31-17','Kegiatan Dana BOS pada SDN 01 Pangongangan',97123000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-121','31-17','Kegiatan Dana BOS pada SDN 02 Pangongangan',276668000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-122','31-17','Kegiatan Dana BOS pada SDN Sogaten',157701000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-123','31-17','Kegiatan Dana BOS pada SDN 01 Taman',391001000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-124','31-17','Kegiatan Dana BOS pada SDN 02 Taman',58019000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-125','31-17','Kegiatan Dana BOS pada SDN 03 Taman',97397000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-126','31-17','Kegiatan Dana BOS pada SDN 01 Pandean',314294000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-127','31-17','Kegiatan Dana BOS pada SDN 02 Pandean',260329000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-128','31-17','Kegiatan Dana BOS pada SDN Banjarejo',398826000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-129','31-17','Kegiatan Dana BOS pada SDN 01 Mojorejo',123382000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-130','31-17','Kegiatan Dana BOS pada SDN 02 Mojorejo',470162000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-131','31-17','Kegiatan Dana BOS pada SDN 01 Manisrejo',312117000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-132','31-17','Kegiatan Dana BOS pada SDN 02 Manisrejo',275557000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-133','31-17','Kegiatan Dana BOS pada SDN 03 Manisrejo',154239000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-134','31-17','Kegiatan Dana BOS pada SDN 04 Manisrejo',229087000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-135','31-17','Kegiatan Dana BOS pada SDN 01 Demangan',134754000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-136','31-17','Kegiatan Dana BOS pada SDN 02 Demangan',152616000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-137','31-17','Kegiatan Dana BOS pada SDN 01 Josenan',161468000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-138','31-17','Kegiatan Dana BOS pada SDN 02 Josenan',159629000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-139','31-17','Kegiatan Dana BOS pada SDN 03 Josenan',94350000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-140','31-17','Kegiatan Dana BOS pada SDN Kejuron',63440000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-141','31-17','Kegiatan Dana BOS pada SDN Kuncen',73347000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-142','31-17','Kegiatan Penerimaan Peserta Didik Baru',2147483647,'angka partisipasi murni sd smp, jumlah siswa yang memenuhi krite',71,0,NULL,'lembaga','prosentase sekolah yang mengikuti SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-143','31-17','Kegiatan Pelaksanaan Uji Coba USBN SD, SMP, Kegiatan USBN Pendidikan Agama SD dan SMP, Kegiatan USBN SD, SMP dan UN SMP',1051292000,'jumlah lembaga yang mengikuti ujicoba USBN dan UN SD dan SMP',93,0,NULL,'lembaga','prosentase sekolah yang mengikuti SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-144','31-17','Kegiatan OSN dan Cerdas Cermat SD, SMP',410527000,'jumlah siswa yang berprestasi',522,0,NULL,'siswa','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-145','31-17','Kegiatan Olimpiade Olah Raga Siswa Nasional dan Festival Lomba Seni Siswa Nasional SD dan SMP',562631000,'jumlah siswa yang berprestasi',309,0,NULL,'siswa','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-146','31-17','Kegiatan Penjaminan Mutu, Akreditasi Sekolah dan Best Practice',880380000,'jumlah lembaga yang terakreditasi',106,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-147','31-17','Kegiatan Pemberdayaan Tim Pengembang Kurikulum 2013 SD, SMP, Workshop Peningkatan Kualitas KKG dan MGMP, Komunitas Pembelajar',1035132000,'jumlah lembaga yang memahami materi pemberdayaan pengembang kuri',93,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-148','31-17','Kegiatan Pembinaan Pengembangan Gugus Sekolah TK, SD, Lomba Lingkungan Sekolah Sehat (LLSS), Gerakan Disiplin Siswa, Pengelolaan',615198000,'jumlah lembaga yang sesuai dengan SPM',106,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-151','31-17','Kegiatan Pembangunan/ Rehabilitasi Gedung Sekolah',2147483647,'jumlah gedung sekolah yang dibangun sesuai kebutuhan',7,0,NULL,'paket','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-153','31-17','Kegiatan Pengadaan Sarana Pendidikan',2147483647,'jumlah paket',2,0,NULL,'paket','persentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-18-001','31-18','Kegiatan Penyelenggaraan TK Pembina',175000000,'jumlah lembaga yang beroperasional',1,0,NULL,'lembaga','lembaga PAUD yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-18-002','31-18','Kegiatan Workshop Kurikulum PAUD',410210000,'jumlah lembaga yang memahami kurikulum PAUD',169,0,NULL,'lembaga','lembaga PAUD yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-18-003','31-18','Kegiatan Pusat Kegiatan Gugus PAUD Terpadu Kota Madiun',468930000,'jumlah gugus yang berprestasi',22,0,NULL,'gugus','lembaga PAUD yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-18-004','31-18','Kegiatan Bantuan BOP PAUD',175140000,'jumlah lembaga yang mendapat BOP',169,0,NULL,'lembaga','lembaga PAUD yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-18-006','31-18','Kegiatan Rehabilitasi Bangunan PAUD',2147483647,'jumlah gedung PAUD yang direhab',1,0,NULL,'lembaga','lembaga PAUD yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-18-007','31-18','Kegiatan Pagelaran Hari Anak Nasional',595980000,'jumlah anak yang mengikuti HAN',2000,0,NULL,'anak','lembaga PAUD yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-19-001','31-19','Kegiatan Penyelenggaraan Pendidikan Kesetaraan',293790000,'jumlah peserta lulus ujian',200,0,NULL,'peserta','lembaga non formal yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-19-002','31-19','Kegiatan Pembinaan Lembaga PAUD dan PNF',390400000,'jumlah lembaga yang sesuai dengan aturan yang berlaku',230,0,NULL,'lembaga','lembaga non formal yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-19-003','31-19','Kegiatan Bimbingan Teknis Exstra Kurikuler Pembina Pramuka',609000000,'jumlah peserta yang mengikuti bimtek ekskul pembina pramuka',263,0,NULL,'peserta','lembaga non formal yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-19-004','31-19','Kegiatan Workshop Peningkatan Pengelolaan Perpustakaan Sekolah',393916000,'jumlah peserta yang memahami workshop pengelolaan perpustakaan',169,0,NULL,'peserta','lembaga non formal yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('49-01-001','49-01','kegiatan penyediaan jasa, peralatan dan perlengkapan kantor',794357750,'jumlah peralatan, barang dan jasa',11,NULL,NULL,'paket','nilai akuntabilitas kinerja pada bappeda',0,NULL,NULL,NULL,NULL,'BB',NULL),('49-01-002','49-01','kegiatan koordinasi dan konsultasi keluar daerah',351305840,'jumlah perjalanan dinas ke luar daerah',9,NULL,NULL,'kali','nilai akuntabilitas kinerja pada bappeda',0,NULL,NULL,NULL,NULL,'BB',NULL),('49-02-001','49-02','kegiatan pemeliharaan rutin/ berkala gedung dan bangunan',13000000,'jumlah gedung',1,NULL,NULL,'gedung','nilai akuntabilitas kinerja pada bappeda',0,NULL,NULL,NULL,NULL,'BB',NULL),('49-02-002','49-02','kegiatan pemeliharaan rutin/ berkala kendaraan dinas',31035600,'jumlah kendaraan dinas',28,NULL,NULL,'unit','nilai akuntabilitas kinerja pada bappeda',0,NULL,NULL,NULL,NULL,'BB',NULL),('49-02-003','49-02','kegiatan pemeliharaan rutin/ berkala sarana prasarana kantor',31540000,'jumlah sarpras kantor yang layak pakai',1,NULL,NULL,'paket','nilai akuntabilitas kinerja pada bappeda',0,NULL,NULL,NULL,NULL,'BB',NULL),('49-04-001','49-04','kegiatan penyusunan laporan capaian kinerja dan ikhtisar realisasi kinerja perangkat daerah',96096800,'jumlah dokumen',12,NULL,NULL,'dokumen','nilai akuntabilitas kinerja pada bappeda',0,NULL,NULL,NULL,NULL,'BB',NULL),('49-15-005','49-15','kegiatan penelitian dan pengembangan bidang ekonomi, sosial, budaya dan pemerintahan umum',309919848,'jumlah dokumen',1,NULL,NULL,'dokumen','Tingkat kontribusi APBD terhadap RKPD',100,NULL,NULL,NULL,NULL,'%',NULL),('49-15-006','49-15','kegiatan penelitian dan pengembangan bidang fisik dan prasarana',345669848,'jumlah dokumen',1,NULL,NULL,'dokumen','Tingkat kontribusi APBD terhadap RKPD',100,NULL,NULL,NULL,NULL,'%',NULL),('49-15-009','49-15','kegiatan perencanaan pemerintahan umum',936555400,'jumlah dokumen',7,NULL,NULL,'dokumen','Tingkat kontribusi RKPD terhadap RPJMD',100,NULL,NULL,NULL,NULL,'%',NULL),('49-15-010','49-15','kegiatan pengendalian, monitoring dan evaluasi pembangunan',119094000,'jumlah dokumen',5,NULL,NULL,'dokumen','Persentase Pelaksanaan Program Pembangunan yang sesuai dengan Pe',100,NULL,NULL,NULL,NULL,'%',NULL),('49-16-006','49-16','kegiatan perencanaan umum tata ruang dan lingkungan hidup',220109600,'jumlah dokumen',1,NULL,NULL,'dokumen','Tingkat kontribusi Renstra OPD terhadap RPJMD',100,NULL,NULL,NULL,NULL,'%',NULL),('49-16-007','49-16','kegiatan perencanaan sarana prasarana perkotaan',118422000,'jumlah dokumen',2,NULL,NULL,'dokumen','Tingkat kontribusi Renstra OPD terhadap RPJMD',100,NULL,NULL,NULL,NULL,'%',NULL),('49-17-004','49-17','kegiatan perencanaan bidang ekonomi',135718000,'jumlah dokumen',1,NULL,NULL,'dokumen','Tingkat kontribusi Renstra OPD terhadap RPJMD',100,NULL,NULL,NULL,NULL,'%',NULL),('49-18-003','49-18','kegiatan perencanaan bidang sosial budaya',120276000,'jumlah dokumen',2,NULL,NULL,'dokumen','Tingkat kontribusi Renstra OPD terhadap RPJMD',100,NULL,NULL,NULL,NULL,'%',NULL),('59-01-001','59-01','kegiatan penyediaan jasa, peralatan dan perlengkapan kantor',794357750,'jumlah peralatan, barang dan jasa',11,11,NULL,'paket','nilai akuntabilitas kinerja pada bappeda',0,794357750,NULL,0,NULL,'BB',NULL),('59-01-002','59-01','kegiatan koordinasi dan konsultasi keluar daerah',351305840,'jumlah perjalanan dinas ke luar daerah',9,8,NULL,'kali','nilai akuntabilitas kinerja pada bappeda',0,300000000,NULL,0,NULL,'BB',NULL),('59-02-001','59-02','kegiatan pemeliharaan rutin/ berkala gedung dan bangunan',13000000,'jumlah gedung',1,1,NULL,'gedung','nilai akuntabilitas kinerja pada bappeda',0,10000000,NULL,0,NULL,'BB',NULL),('59-02-002','59-02','kegiatan pemeliharaan rutin/ berkala kendaraan dinas',31035600,'jumlah kendaraan dinas',28,25,NULL,'unit','nilai akuntabilitas kinerja pada bappeda',0,30000000,NULL,0,NULL,'BB',NULL),('59-02-003','59-02','kegiatan pemeliharaan rutin/ berkala sarana prasarana kantor',31540000,'jumlah sarpras kantor yang layak pakai',1,1,NULL,'paket','nilai akuntabilitas kinerja pada bappeda',0,30000000,NULL,0,NULL,'BB',NULL),('59-04-001','59-04','kegiatan penyusunan laporan capaian kinerja dan ikhtisar realisasi kinerja perangkat daerah',96096800,'jumlah dokumen',12,7,NULL,'dokumen','nilai akuntabilitas kinerja pada bappeda',0,50000000,NULL,0,NULL,'BB',NULL),('59-15-005','59-15','kegiatan penelitian dan pengembangan bidang ekonomi, sosial, budaya dan pemerintahan umum',309919848,'jumlah dokumen',1,1,NULL,'dokumen','Tingkat kontribusi APBD terhadap RKPD',100,300000000,NULL,75,NULL,'%',NULL),('59-15-006','59-15','kegiatan penelitian dan pengembangan bidang fisik dan prasarana',345669848,'jumlah dokumen',1,1,NULL,'dokumen','Tingkat kontribusi APBD terhadap RKPD',100,250000000,NULL,80,NULL,'%',NULL),('59-15-009','59-15','kegiatan perencanaan pemerintahan umum',936555400,'jumlah dokumen',7,5,NULL,'dokumen','Tingkat kontribusi RKPD terhadap RPJMD',100,870000000,NULL,80,NULL,'%',NULL),('59-15-010','59-15','kegiatan pengendalian, monitoring dan evaluasi pembangunan',119094000,'jumlah dokumen',5,0,NULL,'dokumen','Persentase Pelaksanaan Program Pembangunan yang sesuai dengan Pe',100,0,NULL,0,NULL,'%',NULL),('59-16-006','59-16','kegiatan perencanaan umum tata ruang dan lingkungan hidup',220109600,'jumlah dokumen',1,0,NULL,'dokumen','Tingkat kontribusi Renstra OPD terhadap RPJMD',100,0,NULL,0,NULL,'%',NULL),('59-16-007','59-16','kegiatan perencanaan sarana prasarana perkotaan',118422000,'jumlah dokumen',2,0,NULL,'dokumen','Tingkat kontribusi Renstra OPD terhadap RPJMD',100,0,NULL,0,NULL,'%',NULL),('59-17-004','59-17','kegiatan perencanaan bidang ekonomi',135718000,'jumlah dokumen',1,0,NULL,'dokumen','Tingkat kontribusi Renstra OPD terhadap RPJMD',100,0,NULL,0,NULL,'%',NULL),('59-18-003','59-18','kegiatan perencanaan bidang sosial budaya',120276000,'jumlah dokumen',2,0,NULL,'dokumen','Tingkat kontribusi Renstra OPD terhadap RPJMD',100,0,NULL,0,NULL,'%',NULL);
/*!40000 ALTER TABLE `kegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laporan`
--

DROP TABLE IF EXISTS `laporan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laporan` (
  `id_laporan` int(11) NOT NULL AUTO_INCREMENT,
  `id_opd` int(11) NOT NULL,
  `id_tipe` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_laporan`),
  KEY `fk_laporan_opd` (`id_opd`),
  KEY `fk_tipelaporan_dari_laporan` (`id_tipe`),
  CONSTRAINT `fk_laporan_opd` FOREIGN KEY (`id_opd`) REFERENCES `opd` (`id_opd`),
  CONSTRAINT `fk_tipelaporan_dari_laporan` FOREIGN KEY (`id_tipe`) REFERENCES `tipe_laporan` (`id_tipe`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laporan`
--

LOCK TABLES `laporan` WRITE;
/*!40000 ALTER TABLE `laporan` DISABLE KEYS */;
INSERT INTO `laporan` VALUES (20,8,5,'2019-08-03 13:49:57','2019-08-03 13:49:57'),(21,8,6,'2019-08-03 14:00:05','2019-08-03 14:00:05'),(22,8,4,'2019-08-04 00:20:33','2019-08-04 00:20:33'),(23,8,3,'2019-08-04 00:21:14','2019-08-04 00:21:14'),(24,8,9,'2019-08-04 03:10:31','2019-08-04 03:10:31'),(25,8,2,'2019-08-04 04:31:19','2019-08-04 04:31:19'),(26,8,8,'2019-08-05 01:47:20','2019-08-05 01:47:20'),(27,8,11,'2019-08-05 01:55:09','2019-08-05 01:55:09'),(28,8,10,'2019-08-05 02:01:22','2019-08-05 02:01:22'),(29,8,12,'2019-08-05 03:12:58','2019-08-05 03:12:58'),(31,8,1,'2019-08-05 06:08:01','2019-08-05 06:08:01'),(34,8,16,'2019-08-06 10:01:20','2019-08-06 10:01:20'),(35,8,13,'2019-08-06 10:02:59','2019-08-06 10:02:59'),(36,8,15,'2019-08-06 14:12:13','2019-08-06 14:12:13'),(37,8,14,'2019-08-06 14:16:51','2019-08-06 14:16:51'),(38,8,7,'2019-08-06 15:40:40','2019-08-06 15:40:40'),(39,8,2,'2019-08-07 06:24:17','2019-08-07 06:24:17'),(40,8,3,'2019-08-07 06:32:36','2019-08-07 06:32:36'),(49,8,1,'2019-08-07 23:32:04','2019-08-07 23:32:04'),(50,8,14,'2019-08-07 23:36:07','2019-08-07 23:36:07'),(51,8,13,'2019-08-08 01:14:48','2019-08-08 01:14:48'),(52,18,9,'2019-08-08 02:13:11','2019-08-08 02:13:11'),(53,18,11,'2019-08-08 02:36:28','2019-08-08 02:36:28'),(54,18,6,'2019-08-08 02:41:01','2019-08-08 02:41:01'),(55,18,8,'2019-08-08 02:46:09','2019-08-08 02:46:09'),(56,18,3,'2019-08-08 02:49:00','2019-08-08 02:49:00'),(57,18,2,'2019-08-08 02:49:08','2019-08-08 02:49:08'),(58,18,4,'2019-08-08 02:50:14','2019-08-08 02:50:14'),(59,18,1,'2019-08-08 02:58:49','2019-08-08 02:58:49'),(60,18,7,'2019-08-08 03:00:41','2019-08-08 03:00:41'),(61,18,10,'2019-08-08 03:06:20','2019-08-08 03:06:20'),(62,18,16,'2019-08-08 03:08:00','2019-08-08 03:08:00'),(63,18,12,'2019-08-08 03:09:15','2019-08-08 03:09:15'),(64,18,15,'2019-08-08 03:15:36','2019-08-08 03:15:36'),(65,18,13,'2019-08-08 03:20:45','2019-08-08 03:20:45'),(66,18,14,'2019-08-08 03:25:11','2019-08-08 03:25:11'),(67,18,5,'2019-08-08 03:27:30','2019-08-08 03:27:30');
/*!40000 ALTER TABLE `laporan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laporan_kinerja_triwulan`
--

DROP TABLE IF EXISTS `laporan_kinerja_triwulan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laporan_kinerja_triwulan` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_inheritance_3` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laporan_kinerja_triwulan`
--

LOCK TABLES `laporan_kinerja_triwulan` WRITE;
/*!40000 ALTER TABLE `laporan_kinerja_triwulan` DISABLE KEYS */;
INSERT INTO `laporan_kinerja_triwulan` VALUES (22,8,4,'2019-08-04 00:20:33','2019-08-04 00:20:33','2019-08-15'),(58,18,4,'2019-08-08 02:50:14','2019-08-08 02:50:14','2019-08-16');
/*!40000 ALTER TABLE `laporan_kinerja_triwulan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laporan_rb_area_perubahan`
--

DROP TABLE IF EXISTS `laporan_rb_area_perubahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laporan_rb_area_perubahan` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl` date DEFAULT NULL,
  `judul_rb` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_inheritance_12` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laporan_rb_area_perubahan`
--

LOCK TABLES `laporan_rb_area_perubahan` WRITE;
/*!40000 ALTER TABLE `laporan_rb_area_perubahan` DISABLE KEYS */;
INSERT INTO `laporan_rb_area_perubahan` VALUES (38,8,7,'2019-08-06 15:40:40','2019-08-06 15:40:40','2019-08-06',NULL),(60,18,7,'2019-08-08 03:00:41','2019-08-08 03:00:41','2019-08-16',NULL);
/*!40000 ALTER TABLE `laporan_rb_area_perubahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laporan_rb_fokus`
--

DROP TABLE IF EXISTS `laporan_rb_fokus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laporan_rb_fokus` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl` date DEFAULT NULL,
  `judul_rb` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_laporan_rb_fokus_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laporan_rb_fokus`
--

LOCK TABLES `laporan_rb_fokus` WRITE;
/*!40000 ALTER TABLE `laporan_rb_fokus` DISABLE KEYS */;
INSERT INTO `laporan_rb_fokus` VALUES (34,8,16,'2019-08-06 10:01:20','2019-08-06 10:01:20','2019-08-06',NULL),(62,18,16,'2019-08-08 03:08:00','2019-08-08 03:08:00','2019-08-16',NULL);
/*!40000 ALTER TABLE `laporan_rb_fokus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laporan_rb_prioritas`
--

DROP TABLE IF EXISTS `laporan_rb_prioritas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laporan_rb_prioritas` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl` date DEFAULT NULL,
  `judul_rb` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_laporan_rb_prioritas_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laporan_rb_prioritas`
--

LOCK TABLES `laporan_rb_prioritas` WRITE;
/*!40000 ALTER TABLE `laporan_rb_prioritas` DISABLE KEYS */;
INSERT INTO `laporan_rb_prioritas` VALUES (36,8,15,'2019-08-06 14:12:13','2019-08-06 14:12:13','2019-08-06',NULL),(64,18,15,'2019-08-08 03:15:36','2019-08-08 03:15:36','2019-08-16',NULL);
/*!40000 ALTER TABLE `laporan_rb_prioritas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laporan_rb_quick_wins`
--

DROP TABLE IF EXISTS `laporan_rb_quick_wins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laporan_rb_quick_wins` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl` date DEFAULT NULL,
  `judul_rb` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_laporan_rb_quick_wins_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laporan_rb_quick_wins`
--

LOCK TABLES `laporan_rb_quick_wins` WRITE;
/*!40000 ALTER TABLE `laporan_rb_quick_wins` DISABLE KEYS */;
INSERT INTO `laporan_rb_quick_wins` VALUES (35,8,13,'2019-08-06 10:02:59','2019-08-06 10:02:59','2019-08-06',NULL),(51,8,13,'2019-08-08 01:14:48','2019-08-08 01:14:48','2019-08-16',NULL),(65,18,13,'2019-08-08 03:20:45','2019-08-08 03:20:45','2019-08-16',NULL);
/*!40000 ALTER TABLE `laporan_rb_quick_wins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laporan_rb_zi_wbk`
--

DROP TABLE IF EXISTS `laporan_rb_zi_wbk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laporan_rb_zi_wbk` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl` date DEFAULT NULL,
  `judul_rb` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_laporan_rb_zi_wbk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laporan_rb_zi_wbk`
--

LOCK TABLES `laporan_rb_zi_wbk` WRITE;
/*!40000 ALTER TABLE `laporan_rb_zi_wbk` DISABLE KEYS */;
INSERT INTO `laporan_rb_zi_wbk` VALUES (50,8,14,'2019-08-07 23:36:07','2019-08-07 23:36:07','2019-08-08',NULL),(66,18,14,'2019-08-08 03:25:11','2019-08-08 03:25:11','2019-08-16',NULL);
/*!40000 ALTER TABLE `laporan_rb_zi_wbk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `log_act` varchar(12) DEFAULT NULL,
  `log_query` text,
  `log_user_id` varchar(32) DEFAULT NULL,
  `log_username` varchar(64) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'update','UPDATE `user` SET `last_login` = \'2019-08-08 00:21:49\'\nWHERE `id` = \'26\'','26','40101','2019-08-07 17:21:49'),(18,'update','UPDATE `user` SET `last_login` = \'2019-08-08 00:37:42\'\nWHERE `id` = \'26\'','26','40101','2019-08-07 17:37:42'),(27,'update','UPDATE `user` SET `last_login` = \'2019-08-08 05:53:05\'\nWHERE `id` = \'26\'','26','40101','2019-08-07 22:53:05'),(28,'update','UPDATE `user` SET `last_login` = \'2019-08-08 05:57:27\'\nWHERE `id` = \'26\'','26','40101','2019-08-07 22:57:27'),(37,'update','UPDATE `user` SET `last_login` = \'2019-08-08 06:31:26\'\nWHERE `id` = \'26\'','26','40101','2019-08-07 23:31:26'),(38,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'8\', \'1\', \'2019-08-08 06:32:04\', \'2019-08-08 06:32:04\')','26','40101','2019-08-07 23:32:04'),(39,'insert','INSERT INTO `realisasi_fisik` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'49\', \'8\', \'1\', \'2019-08-08 06:32:04\', \'2019-08-08 06:32:04\', \'2019-08-08\')','26','40101','2019-08-07 23:32:04'),(40,'insert','INSERT INTO `program` (`capaian_indikator`, `capaian_satuan`, `capaian_target_ppas_final`, `id_laporan`, `kode_program`, `nama_program`) VALUES (\'Jumlah dokumen perencanaan pembangunan yang mengakomodir kepentingan masyarakat Kota Madiun\',\'dokumen\',\'12\',\'49\',\'49-15\',\'program perencanaan pembangunan daerah\'), (\'Jumlah dokumen perencanaan pembangunan prasarana wilayah\',\'dokumen\',\'3\',\'49\',\'49-16\',\'program perencanaan pembangunan prasarana wilayah\'), (\'Jumlah dokumen perencanaan pembangunan bidang ekonomi\',\'dokumen\',\'1\',\'49\',\'49-17\',\'program perencanaan pembangunan ekonomi\'), (\'Jumlah dokumen perencanaan pembangunan bidang sosial budaya\',\'dokumen\',\'2\',\'49\',\'49-18\',\'program perencanaan pembangunan bidang sosial budaya\'), (\'Persentase Terlaksananya Administrasi Perkantoran\',\'%\',\'100\',\'49\',\'49-01\',\'program pelayanan administrasi perkantoran\'), (\'Persentase Barang Inventaris Kantor dalam Kondisi Baik\',\'%\',\'100\',\'49\',\'49-02\',\'program pemeliharaan barang milik daerah\'), (\'Persentase Dokumen Perencanaan/ Laporan yang disusun tepat waktu\',\'%\',\'100\',\'49\',\'49-04\',\'program peningkatan pengembangan sistem pelaporan capaian kinerja dan keuangan\')','26','40101','2019-08-07 23:32:17'),(41,'insert','INSERT INTO `kegiatan` (`hasil_indikator`, `hasil_satuan`, `hasil_target_ppas_final`, `keluaran_indikator`, `keluaran_satuan`, `keluaran_target_ppas_final`, `kode_kegiatan`, `kode_program`, `nama_kegiatan`, `pagu_ppas_final`) VALUES (\'Tingkat kontribusi RKPD terhadap RPJMD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'7\',\'49-15-009\',\'49-15\',\'kegiatan perencanaan pemerintahan umum\',\'936555400\'), (\'Persentase Pelaksanaan Program Pembangunan yang sesuai dengan Perencanaan\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'5\',\'49-15-010\',\'49-15\',\'kegiatan pengendalian, monitoring dan evaluasi pembangunan\',\'119094000\'), (\'Tingkat kontribusi Renstra OPD terhadap RPJMD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'1\',\'49-16-006\',\'49-16\',\'kegiatan perencanaan umum tata ruang dan lingkungan hidup\',\'220109600\'), (\'Tingkat kontribusi Renstra OPD terhadap RPJMD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'2\',\'49-16-007\',\'49-16\',\'kegiatan perencanaan sarana prasarana perkotaan\',\'118422000\'), (\'Tingkat kontribusi Renstra OPD terhadap RPJMD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'1\',\'49-17-004\',\'49-17\',\'kegiatan perencanaan bidang ekonomi\',\'135718000\'), (\'Tingkat kontribusi Renstra OPD terhadap RPJMD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'2\',\'49-18-003\',\'49-18\',\'kegiatan perencanaan bidang sosial budaya\',\'120276000\'), (\'Tingkat kontribusi APBD terhadap RKPD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'1\',\'49-15-005\',\'49-15\',\'kegiatan penelitian dan pengembangan bidang ekonomi, sosial, budaya dan pemerintahan umum\',\'309919848\'), (\'Tingkat kontribusi APBD terhadap RKPD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'1\',\'49-15-006\',\'49-15\',\'kegiatan penelitian dan pengembangan bidang fisik dan prasarana\',\'345669848\'), (\'nilai akuntabilitas kinerja pada bappeda\',\'BB\',\'0\',\'jumlah peralatan, barang dan jasa\',\'paket\',\'11\',\'49-01-001\',\'49-01\',\'kegiatan penyediaan jasa, peralatan dan perlengkapan kantor\',\'794357750\'), (\'nilai akuntabilitas kinerja pada bappeda\',\'BB\',\'0\',\'jumlah perjalanan dinas ke luar daerah\',\'kali\',\'9\',\'49-01-002\',\'49-01\',\'kegiatan koordinasi dan konsultasi keluar daerah\',\'351305840\'), (\'nilai akuntabilitas kinerja pada bappeda\',\'BB\',\'0\',\'jumlah gedung\',\'gedung\',\'1\',\'49-02-001\',\'49-02\',\'kegiatan pemeliharaan rutin/ berkala gedung dan bangunan\',\'13000000\'), (\'nilai akuntabilitas kinerja pada bappeda\',\'BB\',\'0\',\'jumlah kendaraan dinas\',\'unit\',\'28\',\'49-02-002\',\'49-02\',\'kegiatan pemeliharaan rutin/ berkala kendaraan dinas\',\'31035600\'), (\'nilai akuntabilitas kinerja pada bappeda\',\'BB\',\'0\',\'jumlah sarpras kantor yang layak pakai\',\'paket\',\'1\',\'49-02-003\',\'49-02\',\'kegiatan pemeliharaan rutin/ berkala sarana prasarana kantor\',\'31540000\'), (\'nilai akuntabilitas kinerja pada bappeda\',\'BB\',\'0\',\'jumlah dokumen\',\'dokumen\',\'12\',\'49-04-001\',\'49-04\',\'kegiatan penyusunan laporan capaian kinerja dan ikhtisar realisasi kinerja perangkat daerah\',\'96096800\')','26','40101','2019-08-07 23:32:17'),(42,'update','UPDATE `pegawai` SET `id_laporan` = CASE \nWHEN `id_pegawai` = \'7\' THEN \'25\'\nELSE `id_laporan` END, `nama` = CASE \nWHEN `id_pegawai` = \'7\' THEN \'Tono\'\nELSE `nama` END\nWHERE `id_pegawai` IN(\'7\')','26','40101','2019-08-07 23:35:21'),(43,'delete','DELETE FROM `pegawai`\nWHERE `id_pegawai` IN(\'7\')','26','40101','2019-08-07 23:35:41'),(44,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'8\', \'14\', \'2019-08-08 06:36:07\', \'2019-08-08 06:36:07\')','26','40101','2019-08-07 23:36:07'),(45,'insert','INSERT INTO `laporan_rb_zi_wbk` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'50\', \'8\', \'14\', \'2019-08-08 06:36:07\', \'2019-08-08 06:36:07\', \'2019-08-08\')','26','40101','2019-08-07 23:36:07'),(46,'update','UPDATE `user` SET `last_login` = \'2019-08-08 07:52:51\'\nWHERE `id` = \'26\'','26','40101','2019-08-08 00:52:51'),(47,'update','UPDATE `pemantauan_tindak_lanjut` SET `tgl_status_rekomendasi` = \'2019-08-13\', `tgl_status_tindak_lanjut` = \'2019-08-16\', `judul_laporan` = \'Test\'\nWHERE `id_laporan` = 20','26','40101','2019-08-08 00:53:41'),(48,'delete','DELETE FROM `hasil_temuan`\nWHERE `id_temuan` IN(\'7\', \'7\')','26','40101','2019-08-08 00:54:32'),(49,'insert','INSERT INTO `hasil_temuan` (`catatan_bpk`, `id_temuan`, `rekomendasi`, `status_rekomendasi`, `status_tindak_lanjut`, `tindak_lanjut`) VALUES (\'<p>asdfasdfafasdfdsf</p>\',\'7\',\'<p>sfsadfsadfsad</p>\',\'TS\',\'TS\',\'<p>asdfasdfasfasdfasdfdsaasfasdf</p>\'), (\'<p>sss</p>\',\'7\',\'<p>ss</p>\',NULL,NULL,\'<p>ss</p>\')','26','40101','2019-08-08 00:54:32'),(50,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'1\', `hasil_realisasi_kinerja` = \'1\', `realisasi_keuangan` = \'1\'\nWHERE `kode_kegiatan` = \'31-01-001\'','26','40101','2019-08-08 00:58:24'),(51,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-01-002\'','26','40101','2019-08-08 00:58:24'),(52,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-02-001\'','26','40101','2019-08-08 00:58:24'),(53,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-02-002\'','26','40101','2019-08-08 00:58:24'),(54,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-02-003\'','26','40101','2019-08-08 00:58:24'),(55,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-03-001\'','26','40101','2019-08-08 00:58:24'),(56,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-04-001\'','26','40101','2019-08-08 00:58:24'),(57,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-15-001\'','26','40101','2019-08-08 00:58:24'),(58,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-15-002\'','26','40101','2019-08-08 00:58:24'),(59,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-15-003\'','26','40101','2019-08-08 00:58:24'),(60,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-15-004\'','26','40101','2019-08-08 00:58:24'),(61,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-15-005\'','26','40101','2019-08-08 00:58:24'),(62,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-16-001\'','26','40101','2019-08-08 00:58:24'),(63,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-16-002\'','26','40101','2019-08-08 00:58:24'),(64,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-16-003\'','26','40101','2019-08-08 00:58:24'),(65,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-16-005\'','26','40101','2019-08-08 00:58:24'),(66,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-16-006\'','26','40101','2019-08-08 00:58:24'),(67,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-16-007\'','26','40101','2019-08-08 00:58:24'),(68,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-16-008\'','26','40101','2019-08-08 00:58:24'),(69,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-001\'','26','40101','2019-08-08 00:58:24'),(70,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-002\'','26','40101','2019-08-08 00:58:24'),(71,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-003\'','26','40101','2019-08-08 00:58:24'),(72,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-004\'','26','40101','2019-08-08 00:58:24'),(73,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-005\'','26','40101','2019-08-08 00:58:24'),(74,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-006\'','26','40101','2019-08-08 00:58:24'),(75,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-007\'','26','40101','2019-08-08 00:58:24'),(76,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-008\'','26','40101','2019-08-08 00:58:24'),(77,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-009\'','26','40101','2019-08-08 00:58:24'),(78,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-010\'','26','40101','2019-08-08 00:58:24'),(79,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-011\'','26','40101','2019-08-08 00:58:24'),(80,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-012\'','26','40101','2019-08-08 00:58:24'),(81,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-013\'','26','40101','2019-08-08 00:58:24'),(82,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-014\'','26','40101','2019-08-08 00:58:24'),(83,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-015\'','26','40101','2019-08-08 00:58:24'),(84,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-016\'','26','40101','2019-08-08 00:58:24'),(85,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-017\'','26','40101','2019-08-08 00:58:24'),(86,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-018\'','26','40101','2019-08-08 00:58:24'),(87,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-019\'','26','40101','2019-08-08 00:58:24'),(88,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-020\'','26','40101','2019-08-08 00:58:24'),(89,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-021\'','26','40101','2019-08-08 00:58:24'),(90,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-022\'','26','40101','2019-08-08 00:58:24'),(91,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-023\'','26','40101','2019-08-08 00:58:24'),(92,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-024\'','26','40101','2019-08-08 00:58:24'),(93,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-025\'','26','40101','2019-08-08 00:58:24'),(94,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-026\'','26','40101','2019-08-08 00:58:24'),(95,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-027\'','26','40101','2019-08-08 00:58:24'),(96,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-028\'','26','40101','2019-08-08 00:58:24'),(97,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-029\'','26','40101','2019-08-08 00:58:24'),(98,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-030\'','26','40101','2019-08-08 00:58:24'),(99,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-031\'','26','40101','2019-08-08 00:58:24'),(100,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-032\'','26','40101','2019-08-08 00:58:24'),(101,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-033\'','26','40101','2019-08-08 00:58:24'),(102,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-034\'','26','40101','2019-08-08 00:58:24'),(103,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-035\'','26','40101','2019-08-08 00:58:24'),(104,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-036\'','26','40101','2019-08-08 00:58:24'),(105,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-037\'','26','40101','2019-08-08 00:58:24'),(106,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-038\'','26','40101','2019-08-08 00:58:24'),(107,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-039\'','26','40101','2019-08-08 00:58:24'),(108,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-040\'','26','40101','2019-08-08 00:58:24'),(109,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-041\'','26','40101','2019-08-08 00:58:24'),(110,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-042\'','26','40101','2019-08-08 00:58:24'),(111,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-043\'','26','40101','2019-08-08 00:58:24'),(112,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-044\'','26','40101','2019-08-08 00:58:24'),(113,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-045\'','26','40101','2019-08-08 00:58:24'),(114,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-046\'','26','40101','2019-08-08 00:58:24'),(115,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-047\'','26','40101','2019-08-08 00:58:24'),(116,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-048\'','26','40101','2019-08-08 00:58:24'),(117,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-049\'','26','40101','2019-08-08 00:58:24'),(118,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-050\'','26','40101','2019-08-08 00:58:24'),(119,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-051\'','26','40101','2019-08-08 00:58:24'),(120,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-052\'','26','40101','2019-08-08 00:58:24'),(121,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-053\'','26','40101','2019-08-08 00:58:24'),(122,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-054\'','26','40101','2019-08-08 00:58:24'),(123,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-055\'','26','40101','2019-08-08 00:58:24'),(124,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-056\'','26','40101','2019-08-08 00:58:24'),(125,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-057\'','26','40101','2019-08-08 00:58:24'),(126,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-058\'','26','40101','2019-08-08 00:58:24'),(127,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-059\'','26','40101','2019-08-08 00:58:24'),(128,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-060\'','26','40101','2019-08-08 00:58:24'),(129,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-061\'','26','40101','2019-08-08 00:58:24'),(130,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-062\'','26','40101','2019-08-08 00:58:24'),(131,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-063\'','26','40101','2019-08-08 00:58:24'),(132,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-064\'','26','40101','2019-08-08 00:58:25'),(133,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-065\'','26','40101','2019-08-08 00:58:25'),(134,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-066\'','26','40101','2019-08-08 00:58:25'),(135,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-067\'','26','40101','2019-08-08 00:58:25'),(136,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-068\'','26','40101','2019-08-08 00:58:25'),(137,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-069\'','26','40101','2019-08-08 00:58:25'),(138,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-070\'','26','40101','2019-08-08 00:58:25'),(139,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-071\'','26','40101','2019-08-08 00:58:25'),(140,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-072\'','26','40101','2019-08-08 00:58:25'),(141,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-073\'','26','40101','2019-08-08 00:58:25'),(142,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-074\'','26','40101','2019-08-08 00:58:25'),(143,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-075\'','26','40101','2019-08-08 00:58:25'),(144,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-076\'','26','40101','2019-08-08 00:58:25'),(145,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-077\'','26','40101','2019-08-08 00:58:25'),(146,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-078\'','26','40101','2019-08-08 00:58:25'),(147,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-079\'','26','40101','2019-08-08 00:58:25'),(148,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-080\'','26','40101','2019-08-08 00:58:25'),(149,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-081\'','26','40101','2019-08-08 00:58:25'),(150,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-082\'','26','40101','2019-08-08 00:58:25'),(151,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-083\'','26','40101','2019-08-08 00:58:25'),(152,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-084\'','26','40101','2019-08-08 00:58:25'),(153,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-085\'','26','40101','2019-08-08 00:58:25'),(154,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-086\'','26','40101','2019-08-08 00:58:25'),(155,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-087\'','26','40101','2019-08-08 00:58:25'),(156,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-088\'','26','40101','2019-08-08 00:58:25'),(157,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-089\'','26','40101','2019-08-08 00:58:25'),(158,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-090\'','26','40101','2019-08-08 00:58:25'),(159,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-091\'','26','40101','2019-08-08 00:58:25'),(160,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-092\'','26','40101','2019-08-08 00:58:25'),(161,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-093\'','26','40101','2019-08-08 00:58:25'),(162,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-094\'','26','40101','2019-08-08 00:58:25'),(163,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-095\'','26','40101','2019-08-08 00:58:25'),(164,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-096\'','26','40101','2019-08-08 00:58:25'),(165,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-097\'','26','40101','2019-08-08 00:58:25'),(166,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-098\'','26','40101','2019-08-08 00:58:25'),(167,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-099\'','26','40101','2019-08-08 00:58:25'),(168,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-100\'','26','40101','2019-08-08 00:58:25'),(169,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-101\'','26','40101','2019-08-08 00:58:25'),(170,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-102\'','26','40101','2019-08-08 00:58:25'),(171,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-103\'','26','40101','2019-08-08 00:58:25'),(172,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-104\'','26','40101','2019-08-08 00:58:25'),(173,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-105\'','26','40101','2019-08-08 00:58:25'),(174,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-106\'','26','40101','2019-08-08 00:58:25'),(175,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-107\'','26','40101','2019-08-08 00:58:25'),(176,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-108\'','26','40101','2019-08-08 00:58:25'),(177,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-109\'','26','40101','2019-08-08 00:58:25'),(178,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-110\'','26','40101','2019-08-08 00:58:25'),(179,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-111\'','26','40101','2019-08-08 00:58:25'),(180,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-112\'','26','40101','2019-08-08 00:58:25'),(181,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-113\'','26','40101','2019-08-08 00:58:25'),(182,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-114\'','26','40101','2019-08-08 00:58:25'),(183,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-115\'','26','40101','2019-08-08 00:58:25'),(184,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-116\'','26','40101','2019-08-08 00:58:25'),(185,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-117\'','26','40101','2019-08-08 00:58:25'),(186,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-118\'','26','40101','2019-08-08 00:58:25'),(187,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-119\'','26','40101','2019-08-08 00:58:25'),(188,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-120\'','26','40101','2019-08-08 00:58:25'),(189,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-121\'','26','40101','2019-08-08 00:58:25'),(190,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-122\'','26','40101','2019-08-08 00:58:25'),(191,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-123\'','26','40101','2019-08-08 00:58:25'),(192,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-124\'','26','40101','2019-08-08 00:58:25'),(193,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-125\'','26','40101','2019-08-08 00:58:25'),(194,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-126\'','26','40101','2019-08-08 00:58:25'),(195,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-127\'','26','40101','2019-08-08 00:58:25'),(196,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-128\'','26','40101','2019-08-08 00:58:25'),(197,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-129\'','26','40101','2019-08-08 00:58:25'),(198,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-130\'','26','40101','2019-08-08 00:58:25'),(199,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-131\'','26','40101','2019-08-08 00:58:25'),(200,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-132\'','26','40101','2019-08-08 00:58:25'),(201,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-133\'','26','40101','2019-08-08 00:58:25'),(202,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-134\'','26','40101','2019-08-08 00:58:25'),(203,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-135\'','26','40101','2019-08-08 00:58:25'),(204,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-136\'','26','40101','2019-08-08 00:58:25'),(205,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-137\'','26','40101','2019-08-08 00:58:25'),(206,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-138\'','26','40101','2019-08-08 00:58:25'),(207,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-139\'','26','40101','2019-08-08 00:58:25'),(208,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-140\'','26','40101','2019-08-08 00:58:25'),(209,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-141\'','26','40101','2019-08-08 00:58:25'),(210,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-142\'','26','40101','2019-08-08 00:58:25'),(211,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-143\'','26','40101','2019-08-08 00:58:25'),(212,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-144\'','26','40101','2019-08-08 00:58:25'),(213,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-145\'','26','40101','2019-08-08 00:58:25'),(214,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-146\'','26','40101','2019-08-08 00:58:25'),(215,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-147\'','26','40101','2019-08-08 00:58:25'),(216,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-148\'','26','40101','2019-08-08 00:58:25'),(217,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-151\'','26','40101','2019-08-08 00:58:25'),(218,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-17-153\'','26','40101','2019-08-08 00:58:25'),(219,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-18-001\'','26','40101','2019-08-08 00:58:25'),(220,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-18-002\'','26','40101','2019-08-08 00:58:25'),(221,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-18-003\'','26','40101','2019-08-08 00:58:25'),(222,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-18-004\'','26','40101','2019-08-08 00:58:25'),(223,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-18-006\'','26','40101','2019-08-08 00:58:25'),(224,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-18-007\'','26','40101','2019-08-08 00:58:25'),(225,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-19-001\'','26','40101','2019-08-08 00:58:25'),(226,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-19-002\'','26','40101','2019-08-08 00:58:25'),(227,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-19-003\'','26','40101','2019-08-08 00:58:25'),(228,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'0\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'0\'\nWHERE `kode_kegiatan` = \'31-19-004\'','26','40101','2019-08-08 00:58:25'),(229,'delete','DELETE FROM `tatalaksana_opd`\nWHERE `id_laporan` = 27','26','40101','2019-08-08 01:00:22'),(230,'insert','INSERT INTO `tatalaksana_opd` (`id_laporan`, `id_opd`, `jam_kerja`, `jml_nilai`, `ket`, `pakaian_dinas`, `sop`, `tata_naskah_dinas`, `uji_kompetensi`) VALUES (\'27\',\'144\',\'1\',NULL,\'xzxczx\',\'1\',\'1\',\'1\',\'1\'), (\'27\',\'144\',\'20\',NULL,\'haha\',\'20\',\'101\',\'20.5\',\'20.5\')','26','40101','2019-08-08 01:00:22'),(231,'delete','DELETE FROM `tatalaksana_opd`\nWHERE `id_laporan` = 27','26','40101','2019-08-08 01:01:21'),(232,'insert','INSERT INTO `tatalaksana_opd` (`id_laporan`, `id_opd`, `jam_kerja`, `jml_nilai`, `ket`, `pakaian_dinas`, `sop`, `tata_naskah_dinas`, `uji_kompetensi`) VALUES (\'27\',\'144\',\'4\',NULL,\'GOOD\',\'3\',\'2\',\'2\',\'1\'), (\'27\',\'144\',\'1\',NULL,\'xzxczx\',\'1\',\'1\',\'1\',\'1\'), (\'27\',\'144\',\'20\',NULL,\'haha\',\'20\',\'101\',\'20.5\',\'20.5\')','26','40101','2019-08-08 01:01:21'),(233,'delete','DELETE FROM `tatalaksana_opd`\nWHERE `id_laporan` = 27','26','40101','2019-08-08 01:02:06'),(234,'insert','INSERT INTO `tatalaksana_opd` (`id_laporan`, `id_opd`, `jam_kerja`, `jml_nilai`, `ket`, `pakaian_dinas`, `sop`, `tata_naskah_dinas`, `uji_kompetensi`) VALUES (\'27\',\'144\',\'12\',NULL,\'GOOD\',\'2\',\'21\',\'21\',\'12\'), (\'27\',\'144\',\'1\',NULL,\'xzxczx\',\'1\',\'1\',\'1\',\'1\'), (\'27\',\'144\',\'20\',NULL,\'haha\',\'20\',\'101\',\'20.5\',\'20.5\')','26','40101','2019-08-08 01:02:06'),(235,'update','UPDATE `user` SET `last_login` = \'2019-08-08 08:09:53\'\nWHERE `id` = \'1\'','1','admin','2019-08-08 01:09:53'),(236,'update','UPDATE `user` SET `last_login` = \'2019-08-08 08:10:26\'\nWHERE `id` = \'26\'','26','40101','2019-08-08 01:10:26'),(237,'insert','INSERT INTO `temuan` (`id_laporan`, `nama_temuan`) VALUES (\'20\',\'c\')','26','40101','2019-08-08 01:11:00'),(238,'update','UPDATE `temuan` SET `nama_temuan` = CASE \nWHEN `id_temuan` = \'7\' THEN \'a\'\nWHEN `id_temuan` = \'8\' THEN \'b\'\nELSE `nama_temuan` END\nWHERE `id_temuan` IN(\'7\',\'8\')','26','40101','2019-08-08 01:11:00'),(239,'update','UPDATE `user` SET `last_login` = \'2019-08-08 08:11:10\'\nWHERE `id` = \'26\'','26','40101','2019-08-08 01:11:10'),(240,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'8\', \'13\', \'2019-08-08 08:14:48\', \'2019-08-08 08:14:48\')','26','40101','2019-08-08 01:14:48'),(241,'insert','INSERT INTO `laporan_rb_quick_wins` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'51\', \'8\', \'13\', \'2019-08-08 08:14:48\', \'2019-08-08 08:14:48\', \'2019-08-16\')','26','40101','2019-08-08 01:14:48'),(242,'insert','INSERT INTO `rb_quick_wins` (`id_laporan`, `rincian`) VALUES (\'51\',\'test\')','26','40101','2019-08-08 01:14:59'),(243,'insert','INSERT INTO `rb_quick_wins_sasaran` (`id_rb_quick_wins`, `nama_program`, `sasaran`) VALUES (\'7\',\'test2\',\'test2\')','26','40101','2019-08-08 01:15:11'),(244,'delete','DELETE FROM `rb_quick_wins_kegiatan`\nWHERE `id_rb_quick_wins_sasaran` IN(\'17\')','26','40101','2019-08-08 01:16:00'),(245,'insert','INSERT INTO `rb_quick_wins_kegiatan` (`capaian`, `id_rb_quick_wins_sasaran`, `indikator`, `ket`, `nama_kegiatan`, `realisasi_anggaran`, `realisasi_output`, `realisasi_waktu`, `target_anggaran`, `target_output`, `target_waktu`) VALUES (\'1\',\'17\',\'qwe\',\'bagus\',\'qwe\',\'1\',\'qwe\',\'eee\',\'sd\',\'qwe\',\'qwe\')','26','40101','2019-08-08 01:16:00'),(246,'insert','INSERT INTO `sotk_opd` (`besaran`, `id_laporan`, `id_opd`) VALUES (\'TIPE A\',\'26\',\'144\'), (\'TIPE A\',\'26\',\'144\'), (\'TIPE A\',\'26\',\'144\'), (\'TIPE A\',\'26\',\'144\'), (\'TIPE A\',\'26\',\'144\'), (\'TIPE A\',\'26\',\'144\'), (\'TIPE A\',\'26\',\'144\')','26','40101','2019-08-08 01:17:33'),(247,'update','UPDATE `user` SET `last_login` = \'2019-08-08 08:23:56\'\nWHERE `id` = \'1\'','1','admin','2019-08-08 01:23:56'),(248,'update','UPDATE `user` SET `last_login` = \'2019-08-08 08:35:03\'\nWHERE `id` = \'1\'','1','admin','2019-08-08 01:35:03'),(249,'update','UPDATE `user` SET `last_login` = \'2019-08-08 08:48:34\'\nWHERE `id` = \'1\'','1','admin','2019-08-08 01:48:34'),(250,'update','UPDATE `user` SET `last_login` = \'2019-08-08 09:09:13\'\nWHERE `id` = \'26\'','26','40101','2019-08-08 02:09:13'),(251,'update','UPDATE `user` SET `last_login` = \'2019-08-08 09:09:53\'\nWHERE `id` = \'1\'','1','admin','2019-08-08 02:09:53'),(252,'delete','DELETE FROM `tipelaporan_per_opd`\nWHERE `id_opd` = \'18\'','1','admin','2019-08-08 02:12:23'),(253,'insert','INSERT INTO `tipelaporan_per_opd` (`id_opd`, `id_tipe`) VALUES (\'18\',\'1\'), (\'18\',\'2\'), (\'18\',\'3\'), (\'18\',\'4\'), (\'18\',\'5\'), (\'18\',\'6\'), (\'18\',\'7\'), (\'18\',\'8\'), (\'18\',\'9\'), (\'18\',\'10\'), (\'18\',\'11\'), (\'18\',\'12\'), (\'18\',\'13\'), (\'18\',\'14\'), (\'18\',\'15\'), (\'18\',\'16\')','1','admin','2019-08-08 02:12:23'),(254,'update','UPDATE `user` SET `last_login` = \'2019-08-08 09:12:48\'\nWHERE `id` = \'2\'','2','21001','2019-08-08 02:12:48'),(255,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'9\', \'2019-08-08 09:13:11\', \'2019-08-08 09:13:11\')','2','21001','2019-08-08 02:13:11'),(256,'insert','INSERT INTO `ikm` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'52\', \'18\', \'9\', \'2019-08-08 09:13:11\', \'2019-08-08 09:13:11\', \'2019-08-08\')','2','21001','2019-08-08 02:13:11'),(257,'update','UPDATE `user` SET `last_login` = \'2019-08-08 09:33:27\'\nWHERE `id` = \'1\'','1','admin','2019-08-08 02:33:27'),(258,'update','UPDATE `user` SET `last_login` = \'2019-08-08 09:34:02\'\nWHERE `id` = \'2\'','2','21001','2019-08-08 02:34:02'),(259,'update','UPDATE `user` SET `last_login` = \'2019-08-08 09:36:11\'\nWHERE `id` = \'2\'','2','21001','2019-08-08 02:36:11'),(260,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'11\', \'2019-08-08 09:36:28\', \'2019-08-08 09:36:28\')','2','21001','2019-08-08 02:36:28'),(261,'insert','INSERT INTO `tatalaksana` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'53\', \'18\', \'11\', \'2019-08-08 09:36:28\', \'2019-08-08 09:36:28\', \'2019-08-08\')','2','21001','2019-08-08 02:36:28'),(262,'delete','DELETE FROM `ikm_opd`\nWHERE `id_laporan` = 52','2','21001','2019-08-08 02:38:18'),(263,'insert','INSERT INTO `ikm_opd` (`id_laporan`, `id_opd`, `nilai`, `predikat`) VALUES (\'52\',\'2\',\'80.69\',\'BAIK\'), (\'52\',\'18\',\'82\',\'BAIK\')','2','21001','2019-08-08 02:38:18'),(264,'delete','DELETE FROM `ikm_opd`\nWHERE `id_laporan` = 52','2','21001','2019-08-08 02:39:09'),(265,'insert','INSERT INTO `ikm_opd` (`id_laporan`, `id_opd`, `nilai`, `predikat`) VALUES (\'52\',\'5\',\'80.23\',\'BAIK\'), (\'52\',\'144\',\'81.90\',\'BAIK\'), (\'52\',\'2\',\'80.69\',\'BAIK\'), (\'52\',\'18\',\'82\',\'BAIK\')','2','21001','2019-08-08 02:39:09'),(266,'delete','DELETE FROM `ikm_opd`\nWHERE `id_laporan` = 52','2','21001','2019-08-08 02:39:48'),(267,'insert','INSERT INTO `ikm_opd` (`id_laporan`, `id_opd`, `nilai`, `predikat`) VALUES (\'52\',\'13\',\'85.66\',\'BAIK\'), (\'52\',\'144\',\'81.9\',\'BAIK\'), (\'52\',\'2\',\'80.69\',\'BAIK\'), (\'52\',\'5\',\'80.23\',\'BAIK\'), (\'52\',\'18\',\'82\',\'BAIK\')','2','21001','2019-08-08 02:39:48'),(268,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'6\', \'2019-08-08 09:41:01\', \'2019-08-08 09:41:01\')','2','21001','2019-08-08 02:41:01'),(269,'insert','INSERT INTO `jadwal_pelaksanaan` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'54\', \'18\', \'6\', \'2019-08-08 09:41:01\', \'2019-08-08 09:41:01\', \'2019-08-16\')','2','21001','2019-08-08 02:41:01'),(270,'delete','DELETE FROM `tatalaksana_opd`\nWHERE `id_laporan` = 53','2','21001','2019-08-08 02:41:02'),(271,'insert','INSERT INTO `tatalaksana_opd` (`id_laporan`, `id_opd`, `jam_kerja`, `jml_nilai`, `ket`, `pakaian_dinas`, `sop`, `tata_naskah_dinas`, `uji_kompetensi`) VALUES (\'53\',\'143\',\'20\',NULL,\'baik\',\'18\',\'27\',\'17.4\',\'70\')','2','21001','2019-08-08 02:41:02'),(272,'insert','INSERT INTO `jadwal_pelaksanaan_opd` (`hari_pengawasan`, `id_laporan`, `id_opd`, `jenis_pengawasan`, `keterangan`, `output_lhp`, `rmp`, `rpl`) VALUES (\'25\',\'54\',\'144\',\'AUDIT KETAATAN\',\'IRBAN I\',\'1\',\'VII-4\',\'VIII-2\')','2','21001','2019-08-08 02:42:12'),(273,'insert','INSERT INTO `log` (`log_query`, `log_user_id`, `log_username`, `log_act`) VALUES (\'INSERT INTO `jadwal_pelaksanaan_opd` (`hari_pengawasan`, `id_laporan`, `id_opd`, `jenis_pengawasan`, `keterangan`, `output_lhp`, `rmp`, `rpl`) VALUES (\\\'25\\\',\\\'54\\\',\\\'144\\\',\\\'AUDIT KETAATAN\\\',\\\'IRBAN I\\\',\\\'1\\\',\\\'VII-4\\\',\\\'VIII-2\\\')\', \'2\', \'21001\', \'insert\')','2','21001','2019-08-08 02:42:12'),(274,'delete','DELETE FROM `tatalaksana_opd`\nWHERE `id_laporan` = 53','2','21001','2019-08-08 02:42:13'),(275,'insert','INSERT INTO `tatalaksana_opd` (`id_laporan`, `id_opd`, `jam_kerja`, `jml_nilai`, `ket`, `pakaian_dinas`, `sop`, `tata_naskah_dinas`, `uji_kompetensi`) VALUES (\'53\',\'144\',\'\',NULL,\'\',\'\',\'\',\'\',\'\'), (\'53\',\'144\',\'\',NULL,\'\',\'\',\'\',\'\',\'\'), (\'53\',\'144\',\'\',NULL,\'\',\'\',\'\',\'\',\'\'), (\'53\',\'2\',\'20\',NULL,\'Baik\',\'18\',\'24\',\'18.3\',\'69\'), (\'53\',\'143\',\'20\',NULL,\'baik\',\'18\',\'27\',\'17.4\',\'70\')','2','21001','2019-08-08 02:42:13'),(276,'insert','INSERT INTO `jadwal_pelaksanaan_opd` (`hari_pengawasan`, `id_laporan`, `id_opd`, `jenis_pengawasan`, `keterangan`, `output_lhp`, `rmp`, `rpl`) VALUES (\'25\',\'54\',\'9\',\'AUDIT KETAATAN\',\'IRBAN III\',\'1\',\'VI-3\',\'VII-1\')','2','21001','2019-08-08 02:43:07'),(277,'update','UPDATE `jadwal_pelaksanaan_opd` SET `id_laporan` = CASE \nWHEN `id_jadwal_pelaksanaan_opd` = \'23\' THEN \'54\'\nELSE `id_laporan` END, `id_opd` = CASE \nWHEN `id_jadwal_pelaksanaan_opd` = \'23\' THEN \'144\'\nELSE `id_opd` END, `jenis_pengawasan` = CASE \nWHEN `id_jadwal_pelaksanaan_opd` = \'23\' THEN \'AUDIT KETAATAN\'\nELSE `jenis_pengawasan` END, `rmp` = CASE \nWHEN `id_jadwal_pelaksanaan_opd` = \'23\' THEN \'VII-4\'\nELSE `rmp` END, `rpl` = CASE \nWHEN `id_jadwal_pelaksanaan_opd` = \'23\' THEN \'VIII-2\'\nELSE `rpl` END, `output_lhp` = CASE \nWHEN `id_jadwal_pelaksanaan_opd` = \'23\' THEN \'1\'\nELSE `output_lhp` END, `hari_pengawasan` = CASE \nWHEN `id_jadwal_pelaksanaan_opd` = \'23\' THEN \'25\'\nELSE `hari_pengawasan` END, `keterangan` = CASE \nWHEN `id_jadwal_pelaksanaan_opd` = \'23\' THEN \'IRBAN I\'\nELSE `keterangan` END\nWHERE `id_jadwal_pelaksanaan_opd` IN(\'23\')','2','21001','2019-08-08 02:43:07'),(278,'insert','INSERT INTO `log` (`log_query`, `log_user_id`, `log_username`, `log_act`) VALUES (\'UPDATE `jadwal_pelaksanaan_opd` SET `id_laporan` = CASE \\nWHEN `id_jadwal_pelaksanaan_opd` = \\\'23\\\' THEN \\\'54\\\'\\nELSE `id_laporan` END, `id_opd` = CASE \\nWHEN `id_jadwal_pelaksanaan_opd` = \\\'23\\\' THEN \\\'144\\\'\\nELSE `id_opd` END, `jenis_pengawasan` = CASE \\nWHEN `id_jadwal_pelaksanaan_opd` = \\\'23\\\' THEN \\\'AUDIT KETAATAN\\\'\\nELSE `jenis_pengawasan` END, `rmp` = CASE \\nWHEN `id_jadwal_pelaksanaan_opd` = \\\'23\\\' THEN \\\'VII-4\\\'\\nELSE `rmp` END, `rpl` = CASE \\nWHEN `id_jadwal_pelaksanaan_opd` = \\\'23\\\' THEN \\\'VIII-2\\\'\\nELSE `rpl` END, `output_lhp` = CASE \\nWHEN `id_jadwal_pelaksanaan_opd` = \\\'23\\\' THEN \\\'1\\\'\\nELSE `output_lhp` END, `hari_pengawasan` = CASE \\nWHEN `id_jadwal_pelaksanaan_opd` = \\\'23\\\' THEN \\\'25\\\'\\nELSE `hari_pengawasan` END, `keterangan` = CASE \\nWHEN `id_jadwal_pelaksanaan_opd` = \\\'23\\\' THEN \\\'IRBAN I\\\'\\nELSE `keterangan` END\\nWHERE `id_jadwal_pelaksanaan_opd` IN(\\\'23\\\')\', \'2\', \'21001\', \'update\')','2','21001','2019-08-08 02:43:07'),(279,'insert','INSERT INTO `auditor` (`id_jadwal_pelaksanaan_opd`, `nama_auditor`, `jabatan`, `editable`) VALUES (\'23\', \'Malik Asmany, S.Sos, M.Si\', \'Pembantu Penanggungjawab\', 1)','2','21001','2019-08-08 02:43:55'),(280,'insert','INSERT INTO `auditor` (`id_jadwal_pelaksanaan_opd`, `nama_auditor`, `jabatan`, `editable`) VALUES (\'23\', \'Heni Setyawati, SP\', \'Pengendali Teknis\', 1)','2','21001','2019-08-08 02:44:23'),(281,'insert','INSERT INTO `auditor` (`id_jadwal_pelaksanaan_opd`, `nama_auditor`, `jabatan`, `editable`) VALUES (\'23\', \'Aning Purwati, S.Sos\', \'Ketua Tim\', 1)','2','21001','2019-08-08 02:45:04'),(282,'insert','INSERT INTO `auditor` (`id_jadwal_pelaksanaan_opd`, `nama_auditor`, `jabatan`, `editable`) VALUES (\'23\', \'Andri Dwi K, ST\', \'Anggota\', 1)','2','21001','2019-08-08 02:45:22'),(283,'delete','DELETE FROM `tatalaksana_opd`\nWHERE `id_laporan` = 53','2','21001','2019-08-08 02:45:31'),(284,'insert','INSERT INTO `tatalaksana_opd` (`id_laporan`, `id_opd`, `jam_kerja`, `jml_nilai`, `ket`, `pakaian_dinas`, `sop`, `tata_naskah_dinas`, `uji_kompetensi`) VALUES (\'53\',\'60\',\'15\',NULL,\'Baik\',\'11\',\'27\',\'16.8\',\'77\'), (\'53\',\'6\',\'15\',NULL,\'Baik\',\'14.9\',\'27\',\'21.84\',\'64\'), (\'53\',\'53\',\'15\',NULL,\'Baik\',\'12\',\'27\',\'16.2\',\'78\'), (\'53\',\'2\',\'20\',NULL,\'Baik\',\'18\',\'24\',\'18.3\',\'69\'), (\'53\',\'143\',\'20\',NULL,\'baik\',\'18\',\'27\',\'17.4\',\'70\')','2','21001','2019-08-08 02:45:31'),(285,'insert','INSERT INTO `auditor` (`id_jadwal_pelaksanaan_opd`, `nama_auditor`, `jabatan`, `editable`) VALUES (\'23\', \'Oliek Wahyu K., SE\', \'Anggota\', 1)','2','21001','2019-08-08 02:46:05'),(286,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'8\', \'2019-08-08 09:46:09\', \'2019-08-08 09:46:09\')','2','21001','2019-08-08 02:46:09'),(287,'insert','INSERT INTO `sotk` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'55\', \'18\', \'8\', \'2019-08-08 09:46:09\', \'2019-08-08 09:46:09\', \'2019-08-08\')','2','21001','2019-08-08 02:46:09'),(288,'insert','INSERT INTO `auditor` (`id_jadwal_pelaksanaan_opd`, `nama_auditor`, `jabatan`, `editable`) VALUES (\'24\', \'Drs. Sunarto, ST\', \'Pembantu Penanggungjawab\', 1)','2','21001','2019-08-08 02:47:03'),(289,'insert','INSERT INTO `auditor` (`id_jadwal_pelaksanaan_opd`, `nama_auditor`, `jabatan`, `editable`) VALUES (\'24\', \'Ir. Sunarti\', \'Pengendali Teknis\', 1)','2','21001','2019-08-08 02:47:46'),(290,'insert','INSERT INTO `auditor` (`id_jadwal_pelaksanaan_opd`, `nama_auditor`, `jabatan`, `editable`) VALUES (\'24\', \'Donny Sandhi W., ST\', \'Ketua Tim\', 1)','2','21001','2019-08-08 02:48:23'),(291,'insert','INSERT INTO `sotk_opd` (`besaran`, `id_laporan`, `id_opd`) VALUES (\'TIPE B\',\'55\',\'2\'), (\'TIPE B\',\'55\',\'6\'), (\'TIPE C\',\'55\',\'126\'), (\'TIPE C\',\'55\',\'18\'), (\'TIPE B\',\'55\',\'22\')','2','21001','2019-08-08 02:48:32'),(292,'insert','INSERT INTO `auditor` (`id_jadwal_pelaksanaan_opd`, `nama_auditor`, `jabatan`, `editable`) VALUES (\'24\', \'Puspitasari, SH\', \'Anggota\', 1)','2','21001','2019-08-08 02:48:55'),(293,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'3\', \'2019-08-08 09:49:00\', \'2019-08-08 09:49:00\')','2','21001','2019-08-08 02:49:00'),(294,'insert','INSERT INTO `rekap_tender` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'56\', \'18\', \'3\', \'2019-08-08 09:49:00\', \'2019-08-08 09:49:00\', \'2019-08-08\')','2','21001','2019-08-08 02:49:00'),(295,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'2\', \'2019-08-08 09:49:08\', \'2019-08-08 09:49:08\')','2','21001','2019-08-08 02:49:08'),(296,'insert','INSERT INTO `rekap_pokja` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'57\', \'18\', \'2\', \'2019-08-08 09:49:08\', \'2019-08-08 09:49:08\', \'2019-08-08\')','2','21001','2019-08-08 02:49:08'),(297,'insert','INSERT INTO `auditor` (`id_jadwal_pelaksanaan_opd`, `nama_auditor`, `jabatan`, `editable`) VALUES (\'24\', \'Dedhy Priyo N., SH\', \'Anggota\', 1)','2','21001','2019-08-08 02:49:30'),(298,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'4\', \'2019-08-08 09:50:14\', \'2019-08-08 09:50:14\')','2','21001','2019-08-08 02:50:14'),(299,'insert','INSERT INTO `laporan_kinerja_triwulan` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'58\', \'18\', \'4\', \'2019-08-08 09:50:14\', \'2019-08-08 09:50:14\', \'2019-08-16\')','2','21001','2019-08-08 02:50:14'),(300,'insert','INSERT INTO `detail_rekap_tender` (`harga_kontrak`, `id_laporan`, `id_opd`, `ket`, `nama_paket_kerja`, `nilai_hps`, `pagu`, `pemenang`) VALUES (\'\',\'56\',\'10\',\'\',\'Pengadaan makanan dan minuman tamu dan plakat Kota Madiun\',\'\',\'70000000\',\'\'), (\'\',\'56\',\'10\',\'\',\'Sewa tenda dan perlengkapannya, dan pengadaan makan dan minum rapat\',\'\',\'151410000\',\'\'), (\'\',\'56\',\'10\',\'\',\'Pengadaan makanan dan minuman peserta \',\'\',\'28312000\',\'\'), (\'\',\'56\',\'10\',\'\',\'Pengadaan makanan dan minuman peserta\',\'\',\'27817000\',\'\'), (\'\',\'56\',\'10\',\'\',\'Pengadaan buku LKPJ dan nota pengatar LKPJ\',\'\',\'24141000\',\'\')','2','21001','2019-08-08 02:53:52'),(301,'delete','DELETE FROM `detail_laporan_kinerja_triwulan`\nWHERE `id_laporan` = 58','2','21001','2019-08-08 02:54:06'),(302,'insert','INSERT INTO `detail_laporan_kinerja_triwulan` (`anggaran`, `capaian_realisasi_keuangan`, `id_laporan`, `indikator_kinerja`, `program`, `realisasi_target`, `target`, `uraian`) VALUES (\'434.242.920\',\'278.463.478\',\'58\',\'Jumlah Peralatan Barang dan Jasa Kantor\',\'Program Pelayanan dan Administrasi Perkantoran\',\'64.11%\',\'100%\',\'Terlaksananya Penyediaan Jasa Peralatan & Perlengkapan Kantor\')','2','21001','2019-08-08 02:54:06'),(303,'insert','INSERT INTO `pegawai` (`id_laporan`, `nama`) VALUES (\'57\',\'Sulistanti P.\')','2','21001','2019-08-08 02:54:56'),(304,'delete','DELETE FROM `detail_rekap_pokja`\nWHERE `id_pegawai` IN(\'8\', \'8\', \'8\')','2','21001','2019-08-08 02:56:45'),(305,'insert','INSERT INTO `detail_rekap_pokja` (`id_detail_rekap_tender`, `id_pegawai`, `jabatan`, `ket`) VALUES (\'15\',\'8\',\'Ketua\',\'\'), (\'16\',\'8\',\'Sekretaris\',\'\'), (\'17\',\'8\',\'Ketua\',\'\')','2','21001','2019-08-08 02:56:45'),(306,'delete','DELETE FROM `detail_laporan_kinerja_triwulan`\nWHERE `id_laporan` = 58','2','21001','2019-08-08 02:57:06'),(307,'insert','INSERT INTO `detail_laporan_kinerja_triwulan` (`anggaran`, `capaian_realisasi_keuangan`, `id_laporan`, `indikator_kinerja`, `program`, `realisasi_target`, `target`, `uraian`) VALUES (\'351.305.840\',\'344.514.325\',\'58\',\'Jumlah Koordinasi\',\'Program Pelayanan dan Administrasi Perkantoran\',\'98%\',\'100%\',\'Terlaksananya Koordinasi dan Konsultasi Keluar Daerah\'), (\'13.000.000\',\'1.963.636\',\'58\',\'Jumlah Gedung\',\'Program Pemeliharan Barang Daerah\',\'15%\',\'100%\',\'Terlaksananya Pemeliharaan Rutin/Berkala Gedung dan Bangunan\'), (\'434242\',\'278463\',\'58\',\'Jumlah Peralatan Barang dan Jasa Kantor\',\'Program Pelayanan dan Administrasi Perkantoran\',\'64\',\'100\',\'Terlaksananya Penyediaan Jasa Peralatan & Perlengkapan Kantor\')','2','21001','2019-08-08 02:57:06'),(308,'insert','INSERT INTO `pegawai` (`id_laporan`, `nama`) VALUES (\'57\',\'Budi Agung W., ST\')','2','21001','2019-08-08 02:57:22'),(309,'update','UPDATE `pegawai` SET `id_laporan` = CASE \nWHEN `id_pegawai` = \'8\' THEN \'57\'\nELSE `id_laporan` END, `nama` = CASE \nWHEN `id_pegawai` = \'8\' THEN \'Sulistanti P.\'\nELSE `nama` END\nWHERE `id_pegawai` IN(\'8\')','2','21001','2019-08-08 02:57:22'),(310,'delete','DELETE FROM `detail_rekap_pokja`\nWHERE `id_pegawai` IN(\'8\', \'8\', \'8\', \'9\', \'9\')','2','21001','2019-08-08 02:57:53'),(311,'insert','INSERT INTO `detail_rekap_pokja` (`id_detail_rekap_tender`, `id_pegawai`, `jabatan`, `ket`) VALUES (\'15\',\'8\',\'Ketua\',\'\'), (\'16\',\'8\',\'Sekretaris\',\'\'), (\'17\',\'8\',\'Ketua\',\'\'), (\'22\',\'9\',\'Ketua\',\'\'), (\'19\',\'9\',\'Ketua\',\'\')','2','21001','2019-08-08 02:57:53'),(312,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'1\', \'2019-08-08 09:58:49\', \'2019-08-08 09:58:49\')','2','21001','2019-08-08 02:58:49'),(313,'insert','INSERT INTO `realisasi_fisik` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'59\', \'18\', \'1\', \'2019-08-08 09:58:49\', \'2019-08-08 09:58:49\', \'2019-08-08\')','2','21001','2019-08-08 02:58:49'),(314,'insert','INSERT INTO `program` (`capaian_indikator`, `capaian_satuan`, `capaian_target_ppas_final`, `id_laporan`, `kode_program`, `nama_program`) VALUES (\'Jumlah dokumen perencanaan pembangunan yang mengakomodir kepentingan masyarakat Kota Madiun\',\'dokumen\',\'12\',\'59\',\'59-15\',\'program perencanaan pembangunan daerah\'), (\'Jumlah dokumen perencanaan pembangunan prasarana wilayah\',\'dokumen\',\'3\',\'59\',\'59-16\',\'program perencanaan pembangunan prasarana wilayah\'), (\'Jumlah dokumen perencanaan pembangunan bidang ekonomi\',\'dokumen\',\'1\',\'59\',\'59-17\',\'program perencanaan pembangunan ekonomi\'), (\'Jumlah dokumen perencanaan pembangunan bidang sosial budaya\',\'dokumen\',\'2\',\'59\',\'59-18\',\'program perencanaan pembangunan bidang sosial budaya\'), (\'Persentase Terlaksananya Administrasi Perkantoran\',\'%\',\'100\',\'59\',\'59-01\',\'program pelayanan administrasi perkantoran\'), (\'Persentase Barang Inventaris Kantor dalam Kondisi Baik\',\'%\',\'100\',\'59\',\'59-02\',\'program pemeliharaan barang milik daerah\'), (\'Persentase Dokumen Perencanaan/ Laporan yang disusun tepat waktu\',\'%\',\'100\',\'59\',\'59-04\',\'program peningkatan pengembangan sistem pelaporan capaian kinerja dan keuangan\')','2','21001','2019-08-08 02:59:04'),(315,'insert','INSERT INTO `kegiatan` (`hasil_indikator`, `hasil_satuan`, `hasil_target_ppas_final`, `keluaran_indikator`, `keluaran_satuan`, `keluaran_target_ppas_final`, `kode_kegiatan`, `kode_program`, `nama_kegiatan`, `pagu_ppas_final`) VALUES (\'Tingkat kontribusi RKPD terhadap RPJMD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'7\',\'59-15-009\',\'59-15\',\'kegiatan perencanaan pemerintahan umum\',\'936555400\'), (\'Persentase Pelaksanaan Program Pembangunan yang sesuai dengan Perencanaan\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'5\',\'59-15-010\',\'59-15\',\'kegiatan pengendalian, monitoring dan evaluasi pembangunan\',\'119094000\'), (\'Tingkat kontribusi Renstra OPD terhadap RPJMD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'1\',\'59-16-006\',\'59-16\',\'kegiatan perencanaan umum tata ruang dan lingkungan hidup\',\'220109600\'), (\'Tingkat kontribusi Renstra OPD terhadap RPJMD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'2\',\'59-16-007\',\'59-16\',\'kegiatan perencanaan sarana prasarana perkotaan\',\'118422000\'), (\'Tingkat kontribusi Renstra OPD terhadap RPJMD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'1\',\'59-17-004\',\'59-17\',\'kegiatan perencanaan bidang ekonomi\',\'135718000\'), (\'Tingkat kontribusi Renstra OPD terhadap RPJMD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'2\',\'59-18-003\',\'59-18\',\'kegiatan perencanaan bidang sosial budaya\',\'120276000\'), (\'Tingkat kontribusi APBD terhadap RKPD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'1\',\'59-15-005\',\'59-15\',\'kegiatan penelitian dan pengembangan bidang ekonomi, sosial, budaya dan pemerintahan umum\',\'309919848\'), (\'Tingkat kontribusi APBD terhadap RKPD\',\'%\',\'100\',\'jumlah dokumen\',\'dokumen\',\'1\',\'59-15-006\',\'59-15\',\'kegiatan penelitian dan pengembangan bidang fisik dan prasarana\',\'345669848\'), (\'nilai akuntabilitas kinerja pada bappeda\',\'BB\',\'0\',\'jumlah peralatan, barang dan jasa\',\'paket\',\'11\',\'59-01-001\',\'59-01\',\'kegiatan penyediaan jasa, peralatan dan perlengkapan kantor\',\'794357750\'), (\'nilai akuntabilitas kinerja pada bappeda\',\'BB\',\'0\',\'jumlah perjalanan dinas ke luar daerah\',\'kali\',\'9\',\'59-01-002\',\'59-01\',\'kegiatan koordinasi dan konsultasi keluar daerah\',\'351305840\'), (\'nilai akuntabilitas kinerja pada bappeda\',\'BB\',\'0\',\'jumlah gedung\',\'gedung\',\'1\',\'59-02-001\',\'59-02\',\'kegiatan pemeliharaan rutin/ berkala gedung dan bangunan\',\'13000000\'), (\'nilai akuntabilitas kinerja pada bappeda\',\'BB\',\'0\',\'jumlah kendaraan dinas\',\'unit\',\'28\',\'59-02-002\',\'59-02\',\'kegiatan pemeliharaan rutin/ berkala kendaraan dinas\',\'31035600\'), (\'nilai akuntabilitas kinerja pada bappeda\',\'BB\',\'0\',\'jumlah sarpras kantor yang layak pakai\',\'paket\',\'1\',\'59-02-003\',\'59-02\',\'kegiatan pemeliharaan rutin/ berkala sarana prasarana kantor\',\'31540000\'), (\'nilai akuntabilitas kinerja pada bappeda\',\'BB\',\'0\',\'jumlah dokumen\',\'dokumen\',\'12\',\'59-04-001\',\'59-04\',\'kegiatan penyusunan laporan capaian kinerja dan ikhtisar realisasi kinerja perangkat daerah\',\'96096800\')','2','21001','2019-08-08 02:59:04'),(316,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'7\', \'2019-08-08 10:00:41\', \'2019-08-08 10:00:41\')','2','21001','2019-08-08 03:00:41'),(317,'insert','INSERT INTO `laporan_rb_area_perubahan` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'60\', \'18\', \'7\', \'2019-08-08 10:00:41\', \'2019-08-08 10:00:41\', \'2019-08-16\')','2','21001','2019-08-08 03:00:41'),(318,'insert','INSERT INTO `rb_area_perubahan` (`id_laporan`, `rincian`) VALUES (\'60\',\'MANAJEMEN PERUBAHAN\')','2','21001','2019-08-08 03:01:02'),(319,'insert','INSERT INTO `log` (`log_query`, `log_user_id`, `log_username`, `log_act`) VALUES (\'INSERT INTO `rb_area_perubahan` (`id_laporan`, `rincian`) VALUES (\\\'60\\\',\\\'MANAJEMEN PERUBAHAN\\\')\', \'2\', \'21001\', \'insert\')','2','21001','2019-08-08 03:01:02'),(320,'insert','INSERT INTO `rb_area_perubahan_program` (`id_rb_area_perubahan`, `nama_program`) VALUES (\'5\',\'Penyusunan Strategi Manajemen Perubahan dan Strategi Komunikasi\')','2','21001','2019-08-08 03:01:47'),(321,'insert','INSERT INTO `log` (`log_query`, `log_user_id`, `log_username`, `log_act`) VALUES (\'INSERT INTO `rb_area_perubahan_program` (`id_rb_area_perubahan`, `nama_program`) VALUES (\\\'5\\\',\\\'Penyusunan Strategi Manajemen Perubahan dan Strategi Komunikasi\\\')\', \'2\', \'21001\', \'insert\')','2','21001','2019-08-08 03:01:47'),(322,'delete','DELETE FROM `rb_area_perubahan_kegiatan`\nWHERE `id_rb_area_perubahan_program` IN(\'7\')','2','21001','2019-08-08 03:03:03'),(323,'insert','INSERT INTO `rb_area_perubahan_kegiatan` (`capaian`, `id_rb_area_perubahan_program`, `ket`, `nama_kegiatan`, `realisasi_anggaran`, `realisasi_waktu`, `target_anggaran`, `target_waktu`) VALUES (\'1\',\'7\',\'\',\'Pembentukan Tim Manajemen Perubahan\',\'51.969\',\'1 s/d 12\',\'33\',\'1 s/d 12\')','2','21001','2019-08-08 03:03:03'),(324,'delete','DELETE FROM `rb_area_perubahan_kegiatan`\nWHERE `id_rb_area_perubahan_program` IN(\'7\')','2','21001','2019-08-08 03:03:42'),(325,'insert','INSERT INTO `rb_area_perubahan_kegiatan` (`capaian`, `id_rb_area_perubahan_program`, `ket`, `nama_kegiatan`, `realisasi_anggaran`, `realisasi_waktu`, `target_anggaran`, `target_waktu`) VALUES (\'1\',\'7\',\'\',\'Pembentukan Tim Manajemen Perubahan\',\'52\',\'1 s/d 12\',\'33\',\'1 s/d 12\'), (\'1\',\'7\',\'\',\'Pelaksanaan Reformasi Birokrasi\',\'51.969\',\'1 s/d 12\',\'33\',\'1 s/d 12\')','2','21001','2019-08-08 03:03:42'),(326,'delete','DELETE FROM `rb_area_perubahan_kegiatan`\nWHERE `id_rb_area_perubahan_program` IN(\'7\')','2','21001','2019-08-08 03:05:31'),(327,'insert','INSERT INTO `rb_area_perubahan_kegiatan` (`capaian`, `id_rb_area_perubahan_program`, `ket`, `nama_kegiatan`, `realisasi_anggaran`, `realisasi_waktu`, `target_anggaran`, `target_waktu`) VALUES (\'1\',\'7\',\'\',\'Pembentukan Tim Manajemen Perubahan\',\'52\',\'1 s/d 12\',\'33\',\'1 s/d 12\'), (\'1\',\'7\',\'\',\'Pelaksanaan Reformasi Birokrasi\',\'52\',\'1 s/d 12\',\'33\',\'1 s/d 12\'), (\'1\',\'7\',\'\',\'Monitoring dan Evaluasi Rencana Aksi RB\',\'51.969\',\'1 s/d 12\',\'33\',\'1 s/d 12\'), (\'0\',\'7\',\'\',\'Penilaian RB\',\'\',\'1 s/d 3 & 9 s/d 12\',\'26\',\'1 s/d 3 & 9 s/d 12\')','2','21001','2019-08-08 03:05:31'),(328,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'11\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'794357750\'\nWHERE `kode_kegiatan` = \'59-01-001\'','2','21001','2019-08-08 03:05:56'),(329,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'8\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'300000000\'\nWHERE `kode_kegiatan` = \'59-01-002\'','2','21001','2019-08-08 03:05:56'),(330,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'1\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'10000000\'\nWHERE `kode_kegiatan` = \'59-02-001\'','2','21001','2019-08-08 03:05:56'),(331,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'25\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'30000000\'\nWHERE `kode_kegiatan` = \'59-02-002\'','2','21001','2019-08-08 03:05:56'),(332,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'1\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'30000000\'\nWHERE `kode_kegiatan` = \'59-02-003\'','2','21001','2019-08-08 03:05:56'),(333,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'7\', `hasil_realisasi_kinerja` = \'0\', `realisasi_keuangan` = \'50000000\'\nWHERE `kode_kegiatan` = \'59-04-001\'','2','21001','2019-08-08 03:05:56'),(334,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'1\', `hasil_realisasi_kinerja` = \'75\', `realisasi_keuangan` = \'300000000\'\nWHERE `kode_kegiatan` = \'59-15-005\'','2','21001','2019-08-08 03:05:56'),(335,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'1\', `hasil_realisasi_kinerja` = \'80\', `realisasi_keuangan` = \'250000000\'\nWHERE `kode_kegiatan` = \'59-15-006\'','2','21001','2019-08-08 03:05:56'),(336,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'5\', `hasil_realisasi_kinerja` = \'80\', `realisasi_keuangan` = \'870000000\'\nWHERE `kode_kegiatan` = \'59-15-009\'','2','21001','2019-08-08 03:05:56'),(337,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'\', `hasil_realisasi_kinerja` = \'\', `realisasi_keuangan` = \'\'\nWHERE `kode_kegiatan` = \'59-15-010\'','2','21001','2019-08-08 03:05:56'),(338,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'\', `hasil_realisasi_kinerja` = \'\', `realisasi_keuangan` = \'\'\nWHERE `kode_kegiatan` = \'59-16-006\'','2','21001','2019-08-08 03:05:56'),(339,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'\', `hasil_realisasi_kinerja` = \'\', `realisasi_keuangan` = \'\'\nWHERE `kode_kegiatan` = \'59-16-007\'','2','21001','2019-08-08 03:05:56'),(340,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'\', `hasil_realisasi_kinerja` = \'\', `realisasi_keuangan` = \'\'\nWHERE `kode_kegiatan` = \'59-17-004\'','2','21001','2019-08-08 03:05:56'),(341,'update','UPDATE `kegiatan` SET `keluaran_realisasi_kinerja` = \'\', `hasil_realisasi_kinerja` = \'\', `realisasi_keuangan` = \'\'\nWHERE `kode_kegiatan` = \'59-18-003\'','2','21001','2019-08-08 03:05:56'),(342,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'10\', \'2019-08-08 10:06:20\', \'2019-08-08 10:06:20\')','2','21001','2019-08-08 03:06:20'),(343,'insert','INSERT INTO `pelayanan_publik` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'61\', \'18\', \'10\', \'2019-08-08 10:06:20\', \'2019-08-08 10:06:20\', \'2019-08-08\')','2','21001','2019-08-08 03:06:20'),(344,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'16\', \'2019-08-08 10:08:00\', \'2019-08-08 10:08:00\')','2','21001','2019-08-08 03:08:00'),(345,'insert','INSERT INTO `laporan_rb_fokus` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'62\', \'18\', \'16\', \'2019-08-08 10:08:00\', \'2019-08-08 10:08:00\', \'2019-08-16\')','2','21001','2019-08-08 03:08:00'),(346,'insert','INSERT INTO `rb_fokus` (`id_laporan`, `rincian`) VALUES (\'62\',\'Pendidikan\')','2','21001','2019-08-08 03:08:11'),(347,'insert','INSERT INTO `log` (`log_query`, `log_user_id`, `log_username`, `log_act`) VALUES (\'INSERT INTO `rb_fokus` (`id_laporan`, `rincian`) VALUES (\\\'62\\\',\\\'Pendidikan\\\')\', \'2\', \'21001\', \'insert\')','2','21001','2019-08-08 03:08:11'),(348,'delete','DELETE FROM `pelayanan_publik_opd`\nWHERE `id_laporan` = 61','2','21001','2019-08-08 03:08:45'),(349,'insert','INSERT INTO `pelayanan_publik_opd` (`id_laporan`, `id_opd`, `indeks_pelayanan_publik`) VALUES (\'61\',\'16\',\'3.94\'), (\'61\',\'65\',\'3.12\'), (\'61\',\'32\',\'2.96\'), (\'61\',\'18\',\'2.94\'), (\'61\',\'66\',\'2.87\')','2','21001','2019-08-08 03:08:45'),(350,'insert','INSERT INTO `rb_fokus_sasaran` (`id_rb_fokus`, `nama_program`, `sasaran`) VALUES (\'4\',\'Peningkatan mutu pendidik dan tenaga kependidikan\',\'Meningkatnya mutu pendidikan tenaga kependidikan\')','2','21001','2019-08-08 03:09:02'),(351,'insert','INSERT INTO `log` (`log_query`, `log_user_id`, `log_username`, `log_act`) VALUES (\'INSERT INTO `rb_fokus_sasaran` (`id_rb_fokus`, `nama_program`, `sasaran`) VALUES (\\\'4\\\',\\\'Peningkatan mutu pendidik dan tenaga kependidikan\\\',\\\'Meningkatnya mutu pendidikan tenaga kependidikan\\\')\', \'2\', \'21001\', \'insert\')','2','21001','2019-08-08 03:09:02'),(352,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'12\', \'2019-08-08 10:09:15\', \'2019-08-08 10:09:15\')','2','21001','2019-08-08 03:09:15'),(353,'insert','INSERT INTO `monitoring_kelembagaan` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'63\', \'18\', \'12\', \'2019-08-08 10:09:15\', \'2019-08-08 10:09:15\', \'2019-08-08\')','2','21001','2019-08-08 03:09:15'),(354,'insert','INSERT INTO `permasalahan_kelembagaan` (`id_laporan`, `id_opd`, `permasalahan_kelembagaan`, `usulan`, `dasar_hukum`, `ket`) VALUES (\'63\', \'144\', \'Urusan Pemberdayaan Masyarakat merupakan Urusan Pemerintahan Wajib\', \'<p>&lt;!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}--&gt;Pasal 1 ayat 14 UU Nomor 23 Tahun 2014 tentang Pemerintahan Daerah, bahwa Urusan Pemerintahan Wajib adalah Urusan Pemerintahan yang wajib diselenggarakan oleh semua daerah</p>\', \'<p>&lt;!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}--&gt;Urusan Pemberdayaan Masyarakat harus diampu oleh salah satu OPD</p>\', \'\')','2','21001','2019-08-08 03:10:21'),(355,'delete','DELETE FROM `permasalahan_kelembagaan`\nWHERE `id_laporan` = 63','2','21001','2019-08-08 03:11:19'),(356,'insert','INSERT INTO `permasalahan_kelembagaan` (`dasar_hukum`, `id_laporan`, `id_opd`, `ket`, `permasalahan_kelembagaan`, `usulan`) VALUES (\'<p>Urusan Pemberdayaan Masyarakat harus diampu oleh salah satu OPD</p>\',\'63\',\'144\',\'\',\'Urusan Pemberdayaan Masyarakat merupakan Urusan Pemerintahan Wajib\',\'<p>Pasal 1 ayat 14 UU Nomor 23 Tahun 2014 tentang Pemerintahan Daerah, bahwa Urusan Pemerintahan Wajib adalah Urusan Pemerintahan yang wajib diselenggarakan oleh semua daerah</p>\')','2','21001','2019-08-08 03:11:19'),(357,'delete','DELETE FROM `rb_fokus_kegiatan`\nWHERE `id_rb_fokus_sasaran` IN(\'7\')','2','21001','2019-08-08 03:11:23'),(358,'insert','INSERT INTO `rb_fokus_kegiatan` (`capaian`, `id_rb_fokus_sasaran`, `indikator`, `ket`, `nama_kegiatan`, `realisasi_anggaran`, `realisasi_output`, `realisasi_waktu`, `target_anggaran`, `target_output`, `target_waktu`) VALUES (\'1\',\'7\',\'Prosentase jumlah guru yang memenuhi kualifikasi S1/S2/S3\',\'Target sesuai dengan suplemen dari BAPPEDA untuk realisasi capaian output sudah tercapai tetapi untuk anggaran belum terserap\',\'Melaksanakan peningkatan kompetensi dan kualitas guru\',\'966.255\',\'67.74$\',\'1 s/d 12\',\'1.426.431.000\',\'92%\',\'1 s/d 12\')','2','21001','2019-08-08 03:11:23'),(359,'insert','INSERT INTO `permasalahan_kelembagaan` (`id_laporan`, `id_opd`, `permasalahan_kelembagaan`, `usulan`, `dasar_hukum`, `ket`) VALUES (\'63\', \'9\', \'Bagian Administrasi Pembangunan masih terintegrasi dengan Unit Layanan Pengadaan, yang mana Unit Layanan Pegadaan diharapkan menjadi ULP Permanen Struktural sebagai Pusat Keunggulan (Center of Exellence) Pengadaan Barang/Jasa Pemerintah. \', \'<ol><li>Pendirian ULP diintegrasikan pada Bagian Administrasi Pembangunan sebagaimana Peraturan Walikota Madiun No. 15 Tahun 2012 yang dirubah dengan Peraturan Walikota Madiun No. 46 Tahun 2015 tentang Organisasi dan Tata Kerja Unit Layanan Pengadaan Pemerintah Kota Madiun</li><li>&nbsp;</li></ol>\', \'<p>&nbsp;</p>\', \'\')','2','21001','2019-08-08 03:13:39'),(360,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'15\', \'2019-08-08 10:15:36\', \'2019-08-08 10:15:36\')','2','21001','2019-08-08 03:15:36'),(361,'insert','INSERT INTO `laporan_rb_prioritas` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'64\', \'18\', \'15\', \'2019-08-08 10:15:36\', \'2019-08-08 10:15:36\', \'2019-08-16\')','2','21001','2019-08-08 03:15:36'),(362,'insert','INSERT INTO `rb_prioritas` (`id_laporan`, `rincian`) VALUES (\'64\',\'Pemenuhan kewajiban bagi Pimpinan untuk menyerahkan LHKPN\')','2','21001','2019-08-08 03:16:08'),(363,'insert','INSERT INTO `log` (`log_query`, `log_user_id`, `log_username`, `log_act`) VALUES (\'INSERT INTO `rb_prioritas` (`id_laporan`, `rincian`) VALUES (\\\'64\\\',\\\'Pemenuhan kewajiban bagi Pimpinan untuk menyerahkan LHKPN\\\')\', \'2\', \'21001\', \'insert\')','2','21001','2019-08-08 03:16:08'),(364,'insert','INSERT INTO `rb_prioritas_sasaran` (`id_rb_prioritas`, `nama_program`, `sasaran`) VALUES (\'2\',\'Peningkatan Pejabat yang menyerahkan LHKPN\',\'Terwujudnya pemerintahan yang bersih dan bebas KKN\')','2','21001','2019-08-08 03:16:43'),(365,'insert','INSERT INTO `log` (`log_query`, `log_user_id`, `log_username`, `log_act`) VALUES (\'INSERT INTO `rb_prioritas_sasaran` (`id_rb_prioritas`, `nama_program`, `sasaran`) VALUES (\\\'2\\\',\\\'Peningkatan Pejabat yang menyerahkan LHKPN\\\',\\\'Terwujudnya pemerintahan yang bersih dan bebas KKN\\\')\', \'2\', \'21001\', \'insert\')','2','21001','2019-08-08 03:16:43'),(366,'delete','DELETE FROM `rb_prioritas_kegiatan`\nWHERE `id_rb_prioritas_sasaran` IN(\'3\')','2','21001','2019-08-08 03:20:13'),(367,'insert','INSERT INTO `rb_prioritas_kegiatan` (`capaian`, `id_rb_prioritas_sasaran`, `indikator`, `ket`, `nama_kegiatan`, `realisasi_anggaran`, `realisasi_output`, `realisasi_waktu`, `target_anggaran`, `target_output`, `target_waktu`) VALUES (\'1\',\'3\',\'Prosentase jumlah guru yang memenuhi kualifikasi S1/S2/S3\',\'Target sesuai dengan suplemen dari BAPPEDA untuk realisasi capaian output sudah tercapai tetapi untuk anggaran belum terserap\',\'Melaksanakan peningkatan kompetensi dan kualitas gutu\',\'966.255\',\'67.74%\',\'1 s/d 12\',\'1.426.431.000\',\'92%\',\'1 s/d 12\')','2','21001','2019-08-08 03:20:13'),(368,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'13\', \'2019-08-08 10:20:45\', \'2019-08-08 10:20:45\')','2','21001','2019-08-08 03:20:45'),(369,'insert','INSERT INTO `laporan_rb_quick_wins` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'65\', \'18\', \'13\', \'2019-08-08 10:20:45\', \'2019-08-08 10:20:45\', \'2019-08-16\')','2','21001','2019-08-08 03:20:45'),(370,'delete','DELETE FROM `permasalahan_kelembagaan`\nWHERE `id_laporan` = 63','2','21001','2019-08-08 03:21:15'),(371,'insert','INSERT INTO `permasalahan_kelembagaan` (`dasar_hukum`, `id_laporan`, `id_opd`, `ket`, `permasalahan_kelembagaan`, `usulan`) VALUES (\'<p>Pasal 1 ayat 14 UU Nomor 23 Tahun 2014 tentang Pemerintahan Daerah, bahwa Urusan Pemerintahan Wajib adalah Urusan Pemerintahan yang wajib diselenggarakan oleh semua daerah</p>\',\'63\',\'144\',\'\',\'Urusan Pemberdayaan Masyarakat merupakan Urusan Pemerintahan Wajib\',\'<p>Urusan Pemberdayaan Masyarakat harus diampu oleh salah satu OPD</p>\'), (\'<ol><li>Pendirian ULP diintegrasikan pada Bagian Administrasi Pembangunan sebagaimana Peraturan Walikota Madiun No. 15 Tahun 2012 yang dirubah dengan Peraturan Walikota Madiun No. 46 Tahun 2015 tentang Organisasi dan Tata Kerja Unit Layanan Pengadaan Pemerintah Kota Madiun</li><li>Peraturan Presiden No. 54 Tahun 2010 Jo Peraturan Presiden No. 4 Tahun 2015 Pasal 14 ayat (1), yaitu: Kementerian/Lembaga/Pemerintah Daerah/Institusi diwajibkan mempunyai ULP yang dapat memberikan pelayanan/pembinaan di bidang Pengadaan Barang/Jasa</li><li>Peraturan Kepala LKPP No. 5 Tahun 2012 Jo Peraturan Kepala LKPP No. 5 Tahun 2015 tentang Unit Layanan Pengadaan</li><li>Rapat Koordinasi ULP di Jakarta pada tanggal 3 Agustus 2017</li></ol>\',\'63\',\'9\',\'Apabila ULP menjadi Bagian/Unit Kerja Pengadaan Barang/Jasa, dapat dibentuk dengan 1 (satu) orang Kepala Bagian/UKPBJ dan  3 Sub Bagian (sebagai masukan/pertimbangan) : \\r\\n1. Sub Bagian Pembinaan Pengadaan Barang/Jasa\\r\\n2. Sub Bagian Pelaksanaan Pengadaan Barang/Jasa\\r\\n3. Sub Bagian Pengelolaan sistem Informasi Pengadaan Barang/Jasa\',\'Bagian Administrasi Pembangunan masih terintegrasi dengan Unit Layanan Pengadaan, yang mana Unit Layanan Pegadaan diharapkan menjadi ULP Permanen Struktural sebagai Pusat Keunggulan (Center of Exellence) Pengadaan Barang/Jasa Pemerintah. \',\'<ol><li>Pemisahan antara Bagian Administrasi pembangunan dengan Unit Layanan pengadaan (ULP menjadi Bagian dengan Pokjanya Permanen)</li><li>Unit Layanan Pengadaan nantinya akan berganti namanya menjadi Unit Kerja Pengadaan Barang/Jasa (UKPBJ)</li><li>Unit Layanan Pengadaan berada dalam bagian tugas dan fungsi pada Bagian Administrasi Pembangunan dengan rincian tugas masuk pada Sub Bagian Pengadaan Barang/Jasa,dengan catatan uraian tugas pada sub bagian Pengadaan Barang/Jasa pada administrasi pembangunan uraian tugasnya disesuikan dengan uraian tugas sebagaimana uraian tugas UKPBJ</li><li>&nbsp;</li></ol>\')','2','21001','2019-08-08 03:21:15'),(372,'insert','INSERT INTO `rb_quick_wins` (`id_laporan`, `rincian`) VALUES (\'65\',\'Dokumentasi hukun secara elektronik (E-doc) Sistem Jaringan Dokumentasi dan Informasi (SJDIH)\')','2','21001','2019-08-08 03:21:37'),(373,'insert','INSERT INTO `rb_quick_wins_sasaran` (`id_rb_quick_wins`, `nama_program`, `sasaran`) VALUES (\'8\',\'Meningkatnya dokumentasi hukun secara elektronik (E-doc) Sistem Jaringan Dokumentasi dan Informasi Hukum (SJDIH)\',\'Meningkatnya dokumentasi hukun secara elektronik (E-doc) Sistem Jaringan Dokumentasi dan Informasi Hukum (SJDIH)\')','2','21001','2019-08-08 03:22:46'),(374,'delete','DELETE FROM `rb_quick_wins_kegiatan`\nWHERE `id_rb_quick_wins_sasaran` IN(\'18\')','2','21001','2019-08-08 03:24:24'),(375,'insert','INSERT INTO `rb_quick_wins_kegiatan` (`capaian`, `id_rb_quick_wins_sasaran`, `indikator`, `ket`, `nama_kegiatan`, `realisasi_anggaran`, `realisasi_output`, `realisasi_waktu`, `target_anggaran`, `target_output`, `target_waktu`) VALUES (\'1\',\'18\',\'Presentase tersedianya peraturan perundang yang dapat mudah diakses masyarakat\',\'\',\'Publikasi Peraturan perundang-undangan\',\'171\',\'100%\',\'1 s/d 12\',\'175\',\'100%\',\'1 s/d 12\')','2','21001','2019-08-08 03:24:24'),(376,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'14\', \'2019-08-08 10:25:11\', \'2019-08-08 10:25:11\')','2','21001','2019-08-08 03:25:11'),(377,'insert','INSERT INTO `laporan_rb_zi_wbk` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'66\', \'18\', \'14\', \'2019-08-08 10:25:11\', \'2019-08-08 10:25:11\', \'2019-08-16\')','2','21001','2019-08-08 03:25:11'),(378,'insert','INSERT INTO `rb_zi_wbk_sasaran` (`id_laporan`, `nama_program`, `sasaran`) VALUES (\'66\',\'Pelaksanaan zona integritas menuju Wilayah Bebas Korupsi (WBK)\',\'Meningkatnya kualitas pelayanan publik\')','2','21001','2019-08-08 03:26:08'),(379,'delete','DELETE FROM `permasalahan_kelembagaan`\nWHERE `id_laporan` = 63','2','21001','2019-08-08 03:27:07'),(380,'insert','INSERT INTO `permasalahan_kelembagaan` (`dasar_hukum`, `id_laporan`, `id_opd`, `ket`, `permasalahan_kelembagaan`, `usulan`) VALUES (\'<p>Pasal 1 ayat 14 UU Nomor 23 Tahun 2014 tentang Pemerintahan Daerah, bahwa Urusan Pemerintahan Wajib adalah Urusan Pemerintahan yang wajib diselenggarakan oleh semua daerah</p>\',\'63\',\'144\',\'\',\'Urusan Pemberdayaan Masyarakat merupakan Urusan Pemerintahan Wajib\',\'<p>Urusan Pemberdayaan Masyarakat harus diampu oleh salah satu OPD</p>\'), (\'<ol><li>Pendirian ULP diintegrasikan pada Bagian Administrasi Pembangunan sebagaimana Peraturan Walikota Madiun No. 15 Tahun 2012 yang dirubah dengan Peraturan Walikota Madiun No. 46 Tahun 2015 tentang Organisasi dan Tata Kerja Unit Layanan Pengadaan Pemerintah Kota Madiun</li><li>Peraturan Presiden No. 54 Tahun 2010 Jo Peraturan Presiden No. 4 Tahun 2015 Pasal 14 ayat (1), yaitu: Kementerian/Lembaga/Pemerintah Daerah/Institusi diwajibkan mempunyai ULP yang dapat memberikan pelayanan/pembinaan di bidang Pengadaan Barang/Jasa</li><li>Peraturan Kepala LKPP No. 5 Tahun 2012 Jo Peraturan Kepala LKPP No. 5 Tahun 2015 tentang Unit Layanan Pengadaan</li><li>Rapat Koordinasi ULP di Jakarta pada tanggal 3 Agustus 2017</li></ol>\',\'63\',\'9\',\'\',\'Bagian Administrasi Pembangunan masih terintegrasi dengan Unit Layanan Pengadaan, yang mana Unit Layanan Pegadaan diharapkan menjadi ULP Permanen Struktural sebagai Pusat Keunggulan (Center of Exellence) Pengadaan Barang/Jasa Pemerintah. \',\'<ol><li>Pemisahan antara Bagian Administrasi pembangunan dengan Unit Layanan pengadaan (ULP menjadi Bagian dengan Pokjanya Permanen)</li><li>Unit Layanan Pengadaan nantinya akan berganti namanya menjadi Unit Kerja Pengadaan Barang/Jasa (UKPBJ)</li><li>Unit Layanan Pengadaan berada dalam bagian tugas dan fungsi pada Bagian Administrasi Pembangunan dengan rincian tugas masuk pada Sub Bagian Pengadaan Barang/Jasa,dengan catatan uraian tugas pada sub bagian Pengadaan Barang/Jasa pada administrasi pembangunan uraian tugasnya disesuikan dengan uraian tugas sebagaimana uraian tugas UKPBJ</li><li>&nbsp;</li></ol>\')','2','21001','2019-08-08 03:27:07'),(381,'insert','INSERT INTO `laporan` (`id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES (\'18\', \'5\', \'2019-08-08 10:27:30\', \'2019-08-08 10:27:30\')','2','21001','2019-08-08 03:27:30'),(382,'insert','INSERT INTO `pemantauan_tindak_lanjut` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES (\'67\', \'18\', \'5\', \'2019-08-08 10:27:30\', \'2019-08-08 10:27:30\', \'2019-08-08\')','2','21001','2019-08-08 03:27:30'),(383,'delete','DELETE FROM `rb_zi_wbk_kegiatan`\nWHERE `id_rb_zi_wbk_sasaran` IN(\'6\')','2','21001','2019-08-08 03:29:04'),(384,'insert','INSERT INTO `rb_zi_wbk_kegiatan` (`capaian`, `id_rb_zi_wbk_sasaran`, `indikator`, `ket`, `nama_kegiatan`, `realisasi_anggaran`, `realisasi_output`, `realisasi_waktu`, `target_anggaran`, `target_output`, `target_waktu`) VALUES (\'0\',\'6\',\'Jumlah unit kerja yang ditetapkan\',\'\',\'Penyiapan Perangkat Daerah sebagai unit yang ditetapkan untuk Zona Integritas Menuju WBK\',\'\',\'\',\'\',\'-\',\'1 unit\',\'1 s/d 12\'), (\'0\',\'6\',\'Jumlah unit kerja yang dicanangkan\',\'Nilai hasil belum memenuhi standar yang dibutuhkan\',\'Pencanangan Zona Integritas Menuju WBK\',\'10.698\',\'\',\'4\',\'13.991\',\'1 unit\',\'6 s/d 12\'), (\'0\',\'6\',\'Laporan kegiatan\',\'\',\'Pelaksanaan Zona Integritas Menuju WBK\',\'\',\'\',\'\',\'-\',\'-\',\'-\')','2','21001','2019-08-08 03:29:04'),(385,'update','UPDATE `pemantauan_tindak_lanjut` SET `tgl_status_rekomendasi` = \'2019-01-01\', `tgl_status_tindak_lanjut` = \'2019-08-08\', `judul_laporan` = \'PEMANTAUAN TINDAK LANJUT SEMESTER I TH 2018 LAPORAN  HASIL PEMERIKSAAN BPK RI ATAS PDTT PAD KOTA MADIUN  TAHUN ANGGARAN 2017\'\nWHERE `id_laporan` = 67','2','21001','2019-08-08 03:30:25'),(386,'insert','INSERT INTO `temuan` (`id_laporan`, `nama_temuan`) VALUES (\'67\',\'Penatausahaan Piutang Pajak Bumi dan Bangunan Perdesaan dan Perkotaan Tidak Memadai Sebesar Rp.1.327.855.702,00\')','2','21001','2019-08-08 03:30:49'),(387,'insert','INSERT INTO `hasil_temuan` (`id_temuan`, `rekomendasi`, `status_rekomendasi`, `tindak_lanjut`, `status_tindak_lanjut`, `catatan_bpk`) VALUES (\'11\', \'<ol><li>Memerintahkan Kepala Bappenda agar Meningkatkan koordinasi dengan Kepala KPP Pratama Madiun dalam verifikasi dan validasi data pelimpahan piutang PBB sebesar Rp.294.925.242,00 dan Rp. 669.648.587,00;</li><li>Memerintahkan Kepala Bidang Penagihan, Pemeriksaan, dan Pelayanan melakukan inventarisasi hasil pendataan untuk memvalidasi data pelimpahan piutang PBB-P2</li></ol>\', NULL, \'<p>&nbsp;</p>\', NULL, \'<p>&nbsp;</p>\')','2','21001','2019-08-08 03:36:08'),(388,'delete','DELETE FROM `hasil_temuan`\nWHERE `id_temuan` IN(\'11\')','2','21001','2019-08-08 03:36:43'),(389,'insert','INSERT INTO `hasil_temuan` (`catatan_bpk`, `id_temuan`, `rekomendasi`, `status_rekomendasi`, `status_tindak_lanjut`, `tindak_lanjut`) VALUES (\'<p>&nbsp;</p>\',\'11\',\'<ol><li>Memerintahkan Kepala Bappenda agar Meningkatkan koordinasi dengan Kepala KPP Pratama Madiun dalam verifikasi dan validasi data pelimpahan piutang PBB sebesar Rp.294.925.242,00 dan Rp. 669.648.587,00</li></ol>\',\'TS\',\'TS\',\'<p>&nbsp;</p>\')','2','21001','2019-08-08 03:36:43'),(390,'insert','INSERT INTO `hasil_temuan` (`id_temuan`, `rekomendasi`, `status_rekomendasi`, `tindak_lanjut`, `status_tindak_lanjut`, `catatan_bpk`) VALUES (\'11\', \'<p>Memerintahkan Kepala Bidang Penagihan, Pemeriksaan, dan Pelayanan melakukan inventarisasi hasil pendataan untuk memvalidasi data pelimpahan piutang PBB-P2</p>\', NULL, \'<p>&nbsp;</p>\', NULL, \'<p>&nbsp;</p>\')','2','21001','2019-08-08 03:37:30'),(391,'insert','INSERT INTO `hasil_temuan` (`id_temuan`, `rekomendasi`, `status_rekomendasi`, `tindak_lanjut`, `status_tindak_lanjut`, `catatan_bpk`) VALUES (\'11\', \'<p>Memerintahkan Kepala Sub Bidang Penagihan melakukan penatausahaan piutang dan realisasi pendapatan PBB-P2 sesuai dengan data SISMIOP yang valid dan realisasi Kas Daerah</p>\', NULL, \'<p>&nbsp;</p>\', NULL, \'<p>&nbsp;</p>\')','2','21001','2019-08-08 03:37:59'),(392,'delete','DELETE FROM `hasil_temuan`\nWHERE `id_temuan` IN(\'11\', \'11\', \'11\')','2','21001','2019-08-08 03:45:04'),(393,'insert','INSERT INTO `hasil_temuan` (`catatan_bpk`, `id_temuan`, `rekomendasi`, `status_rekomendasi`, `status_tindak_lanjut`, `tindak_lanjut`) VALUES (\'<p>- Koordinasi dengan KPP Pratama belum membuahkan hasil. Bapenda akan melakukan verifikasi dan validasi data pelimpahan piutang PBB pada Semester II 2018<br>- Tim validasi PBB telah dibentuk dan telah melaksanakan tugas. Namun hasil validasi belum disusun.</p>\',\'11\',\'<p>Memerintahkan Kepala Bappenda agar Meningkatkan koordinasi dengan Kepala KPP Pratama Madiun dalam verifikasi dan validasi data pelimpahan piutang PBB sebesar Rp.294.925.242,00 dan Rp. 669.648.587,00</p>\',\'TB\',\'TB\',\'<p>Ditindaklanjuti dengan Surat Kepala Badan Pendapatan Daerah tgl 31 Oktober 2018 Nomor : 700/698/401.101/2018 yang berisikan :<br>- Telah berkoordinasi dg KPP Pratama, namun belum ada tanggapan&nbsp;<br>- Validasi data piutang PBB-P2 Rp.669.648.587 sedang dalam proses dgn membetuk 5 tim<br>- Data realisasi PBB Pajak 2002-2012 periode 1 Januari - 29 Oktober 2018 sebesar RP. 8.793.032,-</p>\'), (\'<p>Inventarisasi belum selesai dilakukan. Tindak lanjut dianggap sesuai jika poin a selesai dilaksanakan.</p>\',\'11\',\'<p>Memerintahkan Kepala Bidang Penagihan, Pemeriksaan, dan Pelayanan melakukan inventarisasi hasil pendataan untuk memvalidasi data pelimpahan piutang PBB-P2</p>\',\'TS\',\'TS\',\'<p>&nbsp;</p>\'), (\'<p>Penatausahaan piutang belum selesai dilakukan.<br>Tindak lanjut dianggap sesuai jika poin a selesai dilaksanakan.</p>\',\'11\',\'<p>Memerintahkan Kepala Sub Bidang Penagihan melakukan penatausahaan piutang dan realisasi pendapatan PBB-P2 sesuai dengan data SISMIOP yang valid dan realisasi Kas Daerah</p>\',\'TS\',\'TS\',\'<p>&nbsp;</p>\')','2','21001','2019-08-08 03:45:04'),(394,'update','UPDATE `user` SET `last_login` = \'2019-08-08 10:54:26\'\nWHERE `id` = \'1\'','1','admin','2019-08-08 03:54:28'),(395,'update','UPDATE `user` SET `password` = \'$2y$10$6sZkqaZBtLUKEcDbjy/bw.cHRzJXnZ3LLAdyzgfFClcpXCq169bGK\'\nWHERE `id` = \'2\'','1','admin','2019-08-08 03:58:51'),(396,'update','UPDATE `user` SET `last_login` = \'2019-08-08 11:05:01\'\nWHERE `id` = \'2\'','2','21001','2019-08-08 04:05:01');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoring_kelembagaan`
--

DROP TABLE IF EXISTS `monitoring_kelembagaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitoring_kelembagaan` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl` date DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_inheritance_8` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoring_kelembagaan`
--

LOCK TABLES `monitoring_kelembagaan` WRITE;
/*!40000 ALTER TABLE `monitoring_kelembagaan` DISABLE KEYS */;
INSERT INTO `monitoring_kelembagaan` VALUES (29,8,12,'2019-08-05 03:12:58','2019-08-05 03:12:58','2019-08-05'),(63,18,12,'2019-08-08 03:09:15','2019-08-08 03:09:15','2019-08-08');
/*!40000 ALTER TABLE `monitoring_kelembagaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd`
--

DROP TABLE IF EXISTS `opd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd` (
  `id_opd` int(11) NOT NULL AUTO_INCREMENT,
  `nama_opd` varchar(128) NOT NULL,
  `kode_ebud` varchar(16) DEFAULT NULL,
  `kode_ekin` varchar(16) DEFAULT NULL,
  `kode_emov` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id_opd`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd`
--

LOCK TABLES `opd` WRITE;
/*!40000 ALTER TABLE `opd` DISABLE KEYS */;
INSERT INTO `opd` VALUES (1,'ADMIN',NULL,NULL,NULL),(2,'BADAN KEPEGAWAIAN DAERAH','40601','14','1.18.01'),(3,'BADAN KESATUAN BANGSA DAN POLITIK','40801','37','1.23.01'),(4,'BADAN PENANGGULANGAN BENCANA DAERAH','10502','36','01.05.02'),(5,'BADAN PENDAPATAN DAERAH','40202','35','1.19.03'),(6,'BADAN PENGELOLAAN KEUANGAN DAN ASET DAERAH','40501','13','1.19.01'),(7,'BADAN PENGELOLAAN KEUANGAN DAN ASET DAERAH (SKPKD)',NULL,NULL,'1.19.02'),(8,'BADAN PERENCANAAN PEMBANGUNAN DAERAH','40101','15','1.21.01'),(9,'BAGIAN ADMINISTRASI PEMBANGUNAN',NULL,'103','1.16.01.06'),(10,'BAGIAN ADMINISTRASI PEMERINTAHAN UMUM',NULL,'102','1.16.01.01'),(11,'BAGIAN ADMINISTRASI PEREKONOMIAN DAN KESEJAHTERAAN RAKYAT',NULL,'106','1.16.01.05'),(12,'BAGIAN HUKUM',NULL,'104','1.16.01.04'),(13,'BAGIAN ORGANISASI',NULL,'105','1.16.01.02'),(14,'BAGIAN UMUM',NULL,'101','1.16.01.03'),(15,'DINAS KEBUDAYAAN, PARIWISATA, KEPEMUDAAN DAN OLAH RAGA','21301','31','1.13.01'),(16,'DINAS KEPENDUDUKAN DAN PENCATATAN SIPIL','20601','33','01.09.01'),(17,'DINAS KESEHATAN DAN KELUARGA BERENCANA','10201','28','01.02.01'),(18,'DINAS KOMUNIKASI DAN INFORMATIKA','21001','27','1.11.01'),(19,'DINAS LINGKUNGAN HIDUP','20501','23','01.08.01'),(20,'DINAS PEKERJAAN UMUM DAN TATA RUANG','10301','26','01.03.01'),(21,'DINAS PENANAMAN MODAL, PELAYANAN TERPADU SATU PINTU, KOPERASI DAN USAHA MIKRO','21101','32','1.12.01'),(22,'DINAS PENDIDIKAN','10101','22','1.01.01.02'),(23,'DINAS PERDAGANGAN','30601','29','02.02.01'),(24,'DINAS PERHUBUNGAN','20901','24','1.10.01'),(25,'DINAS PERPUSTAKAAN DAN KEARSIPAN','21701','21','1.14.01'),(26,'DINAS PERTANIAN DAN KETAHANAN PANGAN','20301','20','02.01.01'),(27,'DINAS PERUMAHAN DAN KAWASAN PERMUKIMAN','10401','25','01.04.01'),(28,'DINAS SOSIAL, PEMBERDAYAAN PEREMPUAN DAN PERLINDUNGAN ANAK','10601','30','01.06.01'),(29,'DINAS TENAGA KERJA','20101','34','01.07.01'),(30,'DPRD',NULL,NULL,'1.15.02'),(31,'INSPEKTORAT DAERAH','40301','12','1.20.01'),(32,'KECAMATAN KARTOHARJO','40902','51','1.22.01'),(33,'KECAMATAN KARTOHARJO',NULL,NULL,'1.22.01.01'),(34,'KECAMATAN MANGUHARJO','40901','52','1.22.02'),(35,'KECAMATAN MANGUHARJO',NULL,NULL,'1.22.02.01'),(36,'KECAMATAN TAMAN','40903','53','1.22.03'),(37,'KECAMATAN TAMAN',NULL,NULL,'1.22.03.01'),(38,'KELURAHAN BANJAREJO',NULL,NULL,'1.22.03.04'),(39,'KELURAHAN DEMANGAN',NULL,NULL,'1.22.03.09'),(40,'KELURAHAN JOSENAN',NULL,NULL,'1.22.03.08'),(41,'KELURAHAN KANIGORO',NULL,NULL,'1.22.01.10'),(42,'KELURAHAN KARTOHARJO',NULL,NULL,'1.22.01.03'),(43,'KELURAHAN KEJURON',NULL,NULL,'1.22.03.07'),(44,'KELURAHAN KELUN',NULL,NULL,'1.22.01.09'),(45,'KELURAHAN KLEGEN',NULL,NULL,'1.22.01.04'),(46,'KELURAHAN KUNCEN',NULL,NULL,'1.22.03.05'),(47,'KELURAHAN MADIUN LOR',NULL,NULL,'1.22.02.07'),(48,'KELURAHAN MANGUHARJO',NULL,NULL,'1.22.02.02'),(49,'KELURAHAN MANISREJO',NULL,NULL,'1.22.03.06'),(50,'KELURAHAN MOJOREJO',NULL,NULL,'1.22.03.02'),(51,'KELURAHAN NAMBANGAN KIDUL',NULL,NULL,'1.22.02.10'),(52,'KELURAHAN NAMBANGAN LOR',NULL,NULL,'1.22.02.09'),(53,'KELURAHAN NGEGONG',NULL,NULL,'1.22.02.05'),(54,'KELURAHAN ORO - ORO OMBO',NULL,NULL,'1.22.01.02'),(55,'KELURAHAN PANDEAN',NULL,NULL,'1.22.03.03'),(56,'KELURAHAN PANGONGANGAN',NULL,NULL,'1.22.02.08'),(57,'KELURAHAN PATIHAN',NULL,NULL,'1.22.02.04'),(58,'KELURAHAN PILANG BANGO',NULL,NULL,'1.22.01.07'),(59,'KELURAHAN REJOMULYO',NULL,NULL,'1.22.01.05'),(60,'KELURAHAN SOGATEN',NULL,NULL,'1.22.02.03'),(61,'KELURAHAN SUKOSARI',NULL,NULL,'1.22.01.06'),(62,'KELURAHAN TAMAN',NULL,NULL,'1.22.03.10'),(63,'KELURAHAN TAWANG REJO',NULL,NULL,'1.22.01.08'),(64,'KELURAHAN WINONGO',NULL,NULL,'1.22.02.06'),(65,'RUMAH SAKIT UMUM DAERAH','10202','17','01.02.02'),(66,'SATUAN POLISI PAMONG PRAJA','10501','16','01.05.01'),(67,'SD CABANG DINAS KECAMATAN KARTOHARJO',NULL,NULL,'1.01.01.03'),(68,'SD CABANG DINAS KECAMATAN MANGUHARJO',NULL,NULL,'1.01.01.04'),(69,'SD CABANG DINAS KECAMATAN TAMAN',NULL,NULL,'1.01.01.05'),(70,'SDN 01 DEMANGAN',NULL,NULL,'1.01.01.69'),(71,'SDN 01 JOSENAN',NULL,NULL,'1.01.01.71'),(72,'SDN 01 KANIGORO',NULL,NULL,'1.01.01.30'),(73,'SDN 01 KARTOHARJO',NULL,NULL,'1.01.01.20'),(74,'SDN 01 KLEGEN',NULL,NULL,'1.01.01.23'),(75,'SDN 01 MADIUN LOR',NULL,NULL,'1.01.01.41'),(76,'SDN 01 MANGUHARJO',NULL,NULL,'1.01.01.38'),(77,'SDN 01 MANISREJO',NULL,NULL,'1.01.01.65'),(78,'SDN 01 MOJOREJO',NULL,NULL,'1.01.01.63'),(79,'SDN 01 NAMBANGAN KIDUL',NULL,NULL,'1.01.01.46'),(80,'SDN 01 NAMBANGAN LOR',NULL,NULL,'1.01.01.39'),(81,'SDN 01 PANDEAN',NULL,NULL,'1.01.01.60'),(82,'SDN 01 PANGONGANGAN',NULL,NULL,'1.01.01.54'),(83,'SDN 01 REJOMULYO',NULL,NULL,'1.01.01.28'),(84,'SDN 01 TAMAN',NULL,NULL,'1.01.01.57'),(85,'SDN 01 TAWANGREJO',NULL,NULL,'1.01.01.35'),(86,'SDN 01 WINONGO',NULL,NULL,'1.01.01.50'),(87,'SDN 02 DEMANGAN',NULL,NULL,'1.01.01.70'),(88,'SDN 02 JOSENAN',NULL,NULL,'1.01.01.72'),(89,'SDN 02 KANIGORO',NULL,NULL,'1.01.01.31'),(90,'SDN 02 KARTOHARJO',NULL,NULL,'1.01.01.21'),(91,'SDN 02 KLEGEN',NULL,NULL,'1.01.01.24'),(92,'SDN 02 MADIUN LOR',NULL,NULL,'1.01.01.42'),(93,'SDN 02 MANISREJO',NULL,NULL,'1.01.01.66'),(94,'SDN 02 MOJOREJO',NULL,NULL,'1.01.01.64'),(95,'SDN 02 NAMBANGAN KIDUL',NULL,NULL,'1.01.01.47'),(96,'SDN 02 NAMBANGAN LOR',NULL,NULL,'1.01.01.40'),(97,'SDN 02 PANDEAN',NULL,NULL,'1.01.01.61'),(98,'SDN 02 PANGONGANGAN',NULL,NULL,'1.01.01.55'),(99,'SDN 02 REJOMULYO',NULL,NULL,'1.01.01.29'),(100,'SDN 02 TAMAN',NULL,NULL,'1.01.01.58'),(101,'SDN 02 TAWANGREJO',NULL,NULL,'1.01.01.36'),(102,'SDN 02 WINONGO',NULL,NULL,'1.01.01.51'),(103,'SDN 03 JOSENAN',NULL,NULL,'1.01.01.73'),(104,'SDN 03 KANIGORO',NULL,NULL,'1.01.01.32'),(105,'SDN 03 KARTOHARJO',NULL,NULL,'1.01.01.22'),(106,'SDN 03 KLEGEN',NULL,NULL,'1.01.01.25'),(107,'SDN 03 MADIUN LOR',NULL,NULL,'1.01.01.43'),(108,'SDN 03 MANISREJO',NULL,NULL,'1.01.01.67'),(109,'SDN 03 NAMBANGAN KIDUL',NULL,NULL,'1.01.01.48'),(110,'SDN 03 TAMAN',NULL,NULL,'1.01.01.59'),(111,'SDN 04 KLEGEN',NULL,NULL,'1.01.01.26'),(112,'SDN 04 MADIUN LOR',NULL,NULL,'1.01.01.44'),(113,'SDN 04 MANISREJO',NULL,NULL,'1.01.01.68'),(114,'SDN 04 NAMBANGAN KIDUL',NULL,NULL,'1.01.01.49'),(115,'SDN 05 MADIUN LOR',NULL,NULL,'1.01.01.45'),(116,'SDN BANJAREJO',NULL,NULL,'1.01.01.62'),(117,'SDN KEJURON',NULL,NULL,'1.01.01.74'),(118,'SDN KELUN',NULL,NULL,'1.01.01.37'),(119,'SDN KUNCEN',NULL,NULL,'1.01.01.75'),(120,'SDN NGEGONG',NULL,NULL,'1.01.01.52'),(121,'SDN ORO ORO OMBO',NULL,NULL,'1.01.01.27'),(122,'SDN PATIHAN',NULL,NULL,'1.01.01.53'),(123,'SDN PILANGBANGO',NULL,NULL,'1.01.01.34'),(124,'SDN SOGATEN',NULL,NULL,'1.01.01.56'),(125,'SDN SUKOSARI',NULL,NULL,'1.01.01.33'),(126,'SEKRETARIAT DAERAH','sakjane 40101','10','1.16.01'),(127,'SEKRETARIAT DPRD','40201','11','1.17.01'),(128,'SMP NEGERI 01',NULL,NULL,'1.01.01.06'),(129,'SMP NEGERI 02',NULL,NULL,'1.01.01.07'),(130,'SMP NEGERI 03',NULL,NULL,'1.01.01.08'),(131,'SMP NEGERI 04',NULL,NULL,'1.01.01.09'),(132,'SMP NEGERI 05',NULL,NULL,'1.01.01.10'),(133,'SMP NEGERI 06',NULL,NULL,'1.01.01.11'),(134,'SMP NEGERI 07',NULL,NULL,'1.01.01.12'),(135,'SMP NEGERI 08',NULL,NULL,'1.01.01.13'),(136,'SMP NEGERI 09',NULL,NULL,'1.01.01.14'),(137,'SMP NEGERI 10',NULL,NULL,'1.01.01.15'),(138,'SMP NEGERI 11',NULL,NULL,'1.01.01.16'),(139,'SMP NEGERI 12',NULL,NULL,'1.01.01.17'),(140,'SMP NEGERI 13',NULL,NULL,'1.01.01.18'),(141,'SMP NEGERI 14',NULL,NULL,'1.01.01.19'),(142,'WALIKOTA DAN WAKIL WALIKOTA',NULL,NULL,'1.15.01'),(143,'INSPEKTORAT','40701',NULL,NULL),(144,'BADAN ADMINISTRASI PEMERINTAH UMUM','4010104',NULL,NULL),(145,'BAGIAN UMUM SEKRETARIAT DAERAH','40503',NULL,NULL),(146,'BAGIAN HUKUM SEKRETARIAT DAERAH','40504',NULL,NULL),(147,'BAGIAN ADMINISTRASI PEREKONOMIAN DAN KESEJAHTERAAN RAKYAT SEKRETARIAT DAERAH','40505',NULL,NULL),(148,'BAGIAN ORGANISASI SEKRETARIAT DAERAH','40502',NULL,NULL),(149,'BAGIAN ADMINISTRASI PEMBANGUNAN SEKRETARIAT DAERAH','40506',NULL,NULL),(150,'BADAN PERENCANAAN PEMBANGUNAN DAERAH KOTA MADIUN','40401',NULL,NULL),(151,'DINAS PERTANIAN DAN KETAHANAN PANGAN KOTA MADIUN','30301',NULL,NULL),(152,'DINAS PENANAMAN MODAL, PELAYANAN TERPADU SATU PINTU, KOPERASI DAN USAHA MIKRO KOTA MADIUN','21201',NULL,NULL),(153,'DINAS KEBUDAYAAN, PARIWISATA, KEPEMUDAAN DAN OLAH RAGA KOTA MADIUN','21601',NULL,NULL),(154,'BAGIAN ADMINISTRASI PEMBANGUNAN SEKRETARIAT DAERAH','4010101',NULL,NULL),(155,'BAGIAN UMUM SEKRETARIAT DAERAH','4010102',NULL,NULL),(156,'BAGIAN ADMINISTRASI PEREKONOMIAN DAN KESEJAHTERAAN RAKYAT SEKRETARIAT DAERAH','4010103',NULL,NULL),(157,'BAGIAN HUKUM SEKRETARIAT DAERAH','4010105',NULL,NULL),(158,'BAGIAN ORGANISASI SEKRETARIAT DAERAH','4010106',NULL,NULL);
/*!40000 ALTER TABLE `opd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(128) DEFAULT NULL,
  `id_laporan` int(11) NOT NULL,
  PRIMARY KEY (`id_pegawai`),
  KEY `fk_pegawai_1_idx` (`id_laporan`),
  CONSTRAINT `fk_pegawai_1` FOREIGN KEY (`id_laporan`) REFERENCES `rekap_pokja` (`id_laporan`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` VALUES (8,'Sulistanti P.',57),(9,'Budi Agung W., ST',57);
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelayanan_publik`
--

DROP TABLE IF EXISTS `pelayanan_publik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelayanan_publik` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tgl` date DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_inheritance_4` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelayanan_publik`
--

LOCK TABLES `pelayanan_publik` WRITE;
/*!40000 ALTER TABLE `pelayanan_publik` DISABLE KEYS */;
INSERT INTO `pelayanan_publik` VALUES (28,8,10,'2019-08-05 02:01:22','2019-08-05 02:01:22','2019-08-05'),(61,18,10,'2019-08-08 03:06:20','2019-08-08 03:06:20','2019-08-08');
/*!40000 ALTER TABLE `pelayanan_publik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelayanan_publik_opd`
--

DROP TABLE IF EXISTS `pelayanan_publik_opd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelayanan_publik_opd` (
  `id_opd` int(11) DEFAULT NULL,
  `id_laporan` int(11) DEFAULT NULL,
  `indeks_pelayanan_publik` float DEFAULT NULL,
  `konversi_100` float DEFAULT NULL,
  `ket` text,
  KEY `fk_relationship_19` (`id_opd`),
  KEY `fk_relationship_18` (`id_laporan`),
  CONSTRAINT `fk_relationship_18` FOREIGN KEY (`id_laporan`) REFERENCES `pelayanan_publik` (`id_laporan`) ON DELETE CASCADE,
  CONSTRAINT `fk_relationship_19` FOREIGN KEY (`id_opd`) REFERENCES `opd` (`id_opd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelayanan_publik_opd`
--

LOCK TABLES `pelayanan_publik_opd` WRITE;
/*!40000 ALTER TABLE `pelayanan_publik_opd` DISABLE KEYS */;
INSERT INTO `pelayanan_publik_opd` VALUES (7,28,5,NULL,NULL),(11,28,0.5,NULL,NULL),(16,61,3.94,NULL,NULL),(65,61,3.12,NULL,NULL),(32,61,2.96,NULL,NULL),(18,61,2.94,NULL,NULL),(66,61,2.87,NULL,NULL);
/*!40000 ALTER TABLE `pelayanan_publik_opd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemantauan_tindak_lanjut`
--

DROP TABLE IF EXISTS `pemantauan_tindak_lanjut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemantauan_tindak_lanjut` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `judul_laporan` varchar(64) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `tgl_status_rekomendasi` date DEFAULT NULL,
  `tgl_status_tindak_lanjut` date DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_inheritance_9` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemantauan_tindak_lanjut`
--

LOCK TABLES `pemantauan_tindak_lanjut` WRITE;
/*!40000 ALTER TABLE `pemantauan_tindak_lanjut` DISABLE KEYS */;
INSERT INTO `pemantauan_tindak_lanjut` VALUES (20,8,5,'2019-08-04 04:24:30','2019-08-08 00:53:41','Test','2019-08-14','2019-08-13','2019-08-16'),(67,18,5,'2019-08-08 03:27:30','2019-08-08 03:30:25','PEMANTAUAN TINDAK LANJUT SEMESTER I TH 2018 LAPORAN  HASIL PEMER','2019-08-08','2019-01-01','2019-08-08');
/*!40000 ALTER TABLE `pemantauan_tindak_lanjut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permasalahan_kelembagaan`
--

DROP TABLE IF EXISTS `permasalahan_kelembagaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permasalahan_kelembagaan` (
  `id_opd` int(11) DEFAULT NULL,
  `id_laporan` int(11) DEFAULT NULL,
  `permasalahan_kelembagaan` varchar(256) DEFAULT NULL,
  `usulan` text,
  `dasar_hukum` text,
  `ket` text,
  KEY `fk_relationship_23` (`id_opd`),
  KEY `fk_relationship_22` (`id_laporan`),
  CONSTRAINT `fk_relationship_22` FOREIGN KEY (`id_laporan`) REFERENCES `monitoring_kelembagaan` (`id_laporan`) ON DELETE CASCADE,
  CONSTRAINT `fk_relationship_23` FOREIGN KEY (`id_opd`) REFERENCES `opd` (`id_opd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permasalahan_kelembagaan`
--

LOCK TABLES `permasalahan_kelembagaan` WRITE;
/*!40000 ALTER TABLE `permasalahan_kelembagaan` DISABLE KEYS */;
INSERT INTO `permasalahan_kelembagaan` VALUES (144,63,'Urusan Pemberdayaan Masyarakat merupakan Urusan Pemerintahan Wajib','<p>Urusan Pemberdayaan Masyarakat harus diampu oleh salah satu OPD</p>','<p>Pasal 1 ayat 14 UU Nomor 23 Tahun 2014 tentang Pemerintahan Daerah, bahwa Urusan Pemerintahan Wajib adalah Urusan Pemerintahan yang wajib diselenggarakan oleh semua daerah</p>',''),(9,63,'Bagian Administrasi Pembangunan masih terintegrasi dengan Unit Layanan Pengadaan, yang mana Unit Layanan Pegadaan diharapkan menjadi ULP Permanen Struktural sebagai Pusat Keunggulan (Center of Exellence) Pengadaan Barang/Jasa Pemerintah. ','<ol><li>Pemisahan antara Bagian Administrasi pembangunan dengan Unit Layanan pengadaan (ULP menjadi Bagian dengan Pokjanya Permanen)</li><li>Unit Layanan Pengadaan nantinya akan berganti namanya menjadi Unit Kerja Pengadaan Barang/Jasa (UKPBJ)</li><li>Unit Layanan Pengadaan berada dalam bagian tugas dan fungsi pada Bagian Administrasi Pembangunan dengan rincian tugas masuk pada Sub Bagian Pengadaan Barang/Jasa,dengan catatan uraian tugas pada sub bagian Pengadaan Barang/Jasa pada administrasi pembangunan uraian tugasnya disesuikan dengan uraian tugas sebagaimana uraian tugas UKPBJ</li><li>&nbsp;</li></ol>','<ol><li>Pendirian ULP diintegrasikan pada Bagian Administrasi Pembangunan sebagaimana Peraturan Walikota Madiun No. 15 Tahun 2012 yang dirubah dengan Peraturan Walikota Madiun No. 46 Tahun 2015 tentang Organisasi dan Tata Kerja Unit Layanan Pengadaan Pemerintah Kota Madiun</li><li>Peraturan Presiden No. 54 Tahun 2010 Jo Peraturan Presiden No. 4 Tahun 2015 Pasal 14 ayat (1), yaitu: Kementerian/Lembaga/Pemerintah Daerah/Institusi diwajibkan mempunyai ULP yang dapat memberikan pelayanan/pembinaan di bidang Pengadaan Barang/Jasa</li><li>Peraturan Kepala LKPP No. 5 Tahun 2012 Jo Peraturan Kepala LKPP No. 5 Tahun 2015 tentang Unit Layanan Pengadaan</li><li>Rapat Koordinasi ULP di Jakarta pada tanggal 3 Agustus 2017</li></ol>','');
/*!40000 ALTER TABLE `permasalahan_kelembagaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `kode_program` varchar(30) NOT NULL,
  `id_laporan` int(11) DEFAULT NULL,
  `nama_program` varchar(128) DEFAULT NULL,
  `capaian_indikator` varchar(64) DEFAULT NULL,
  `capaian_target_ppas_final` float DEFAULT NULL,
  `capaian_anggaran_keuangan` int(11) DEFAULT NULL,
  `capaian_realisasi_keuangan` int(11) DEFAULT NULL,
  `capaian_realisasi_keuangan_persen` float DEFAULT NULL,
  `capaian_realisasi_kinerja` float DEFAULT NULL,
  `capaian_realisasi_kinerja_persen` float DEFAULT NULL,
  `capaian_satuan` varchar(16) DEFAULT NULL,
  `ket` text,
  PRIMARY KEY (`kode_program`),
  KEY `fk_relationship_34` (`id_laporan`),
  CONSTRAINT `fk_relationship_34` FOREIGN KEY (`id_laporan`) REFERENCES `realisasi_fisik` (`id_laporan`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES ('31-01',31,'Program Pelayanan Administrasi Perkantoran','Persentase terlaksananya administrasi perkantoran',100,NULL,0,NULL,0,NULL,'%',NULL),('31-02',31,'Program Pemeliharaan Barang Milik Daerah','Persentase Barang Milik Daerah dalam kondisi baik',100,NULL,0,NULL,0,NULL,'%',NULL),('31-03',31,'Program Peningkatan Sarana dan Prasarana Aparatur','Persentase pemenuhan kebutuhan sarana dan prasarana aparatur',100,NULL,0,NULL,0,NULL,'%',NULL),('31-04',31,'Program Peningkatan, Pengembangan Sistem Pelaporan Capaian Kinerja dan Keuangan','Persentase dokumen perencanaan/laporan yang disusun tepat waktu',100,NULL,0,NULL,0,NULL,'%',NULL),('31-15',31,'Program Manajemen Pelayanan Pendidikan','Pengolahan database informasi pendidikan dan evaluasi pelaporan ',100,NULL,0,NULL,0,NULL,'%',NULL),('31-16',31,'Program Peningkatan Mutu Pendidik dan Tenaga Kependidikan','Persentase Pendidik dan Tenaga Kependidikan yang Lulus Pelatihan',100,NULL,0,NULL,0,NULL,'%',NULL),('31-17',31,'Program Pendidikan Dasar','Angka Partisipasi Murni SD/SMP ',100,NULL,0,NULL,0,NULL,'%',NULL),('31-18',31,'Program Pendidikan Anak Usia Dini','Angka Partisipasi Kasar PAUD',100,NULL,0,NULL,0,NULL,'%',NULL),('31-19',31,'Program Pendidikan Non Formal','Jumlah Lembaga yang Terakreditasi',1,NULL,0,NULL,0,NULL,'lembaga',NULL),('49-01',49,'program pelayanan administrasi perkantoran','Persentase Terlaksananya Administrasi Perkantoran',100,NULL,NULL,NULL,NULL,NULL,'%',NULL),('49-02',49,'program pemeliharaan barang milik daerah','Persentase Barang Inventaris Kantor dalam Kondisi Baik',100,NULL,NULL,NULL,NULL,NULL,'%',NULL),('49-04',49,'program peningkatan pengembangan sistem pelaporan capaian kinerja dan keuangan','Persentase Dokumen Perencanaan/ Laporan yang disusun tepat waktu',100,NULL,NULL,NULL,NULL,NULL,'%',NULL),('49-15',49,'program perencanaan pembangunan daerah','Jumlah dokumen perencanaan pembangunan yang mengakomodir kepenti',12,NULL,NULL,NULL,NULL,NULL,'dokumen',NULL),('49-16',49,'program perencanaan pembangunan prasarana wilayah','Jumlah dokumen perencanaan pembangunan prasarana wilayah',3,NULL,NULL,NULL,NULL,NULL,'dokumen',NULL),('49-17',49,'program perencanaan pembangunan ekonomi','Jumlah dokumen perencanaan pembangunan bidang ekonomi',1,NULL,NULL,NULL,NULL,NULL,'dokumen',NULL),('49-18',49,'program perencanaan pembangunan bidang sosial budaya','Jumlah dokumen perencanaan pembangunan bidang sosial budaya',2,NULL,NULL,NULL,NULL,NULL,'dokumen',NULL),('59-01',59,'program pelayanan administrasi perkantoran','Persentase Terlaksananya Administrasi Perkantoran',100,NULL,NULL,NULL,NULL,NULL,'%',NULL),('59-02',59,'program pemeliharaan barang milik daerah','Persentase Barang Inventaris Kantor dalam Kondisi Baik',100,NULL,NULL,NULL,NULL,NULL,'%',NULL),('59-04',59,'program peningkatan pengembangan sistem pelaporan capaian kinerja dan keuangan','Persentase Dokumen Perencanaan/ Laporan yang disusun tepat waktu',100,NULL,NULL,NULL,NULL,NULL,'%',NULL),('59-15',59,'program perencanaan pembangunan daerah','Jumlah dokumen perencanaan pembangunan yang mengakomodir kepenti',12,NULL,NULL,NULL,NULL,NULL,'dokumen',NULL),('59-16',59,'program perencanaan pembangunan prasarana wilayah','Jumlah dokumen perencanaan pembangunan prasarana wilayah',3,NULL,NULL,NULL,NULL,NULL,'dokumen',NULL),('59-17',59,'program perencanaan pembangunan ekonomi','Jumlah dokumen perencanaan pembangunan bidang ekonomi',1,NULL,NULL,NULL,NULL,NULL,'dokumen',NULL),('59-18',59,'program perencanaan pembangunan bidang sosial budaya','Jumlah dokumen perencanaan pembangunan bidang sosial budaya',2,NULL,NULL,NULL,NULL,NULL,'dokumen',NULL);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_area_perubahan`
--

DROP TABLE IF EXISTS `rb_area_perubahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_area_perubahan` (
  `id_rb_area_perubahan` int(11) NOT NULL AUTO_INCREMENT,
  `id_laporan` int(11) NOT NULL,
  `rincian` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_rb_area_perubahan`),
  KEY `fk_rb_area_perubahan_1_idx` (`id_laporan`),
  CONSTRAINT `fk_rb_area_perubahan_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_rb_area_perubahan` (`id_laporan`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_area_perubahan`
--

LOCK TABLES `rb_area_perubahan` WRITE;
/*!40000 ALTER TABLE `rb_area_perubahan` DISABLE KEYS */;
INSERT INTO `rb_area_perubahan` VALUES (2,38,'rincian 1'),(3,38,'rincian 2'),(4,38,'rincian 3'),(5,60,'MANAJEMEN PERUBAHAN');
/*!40000 ALTER TABLE `rb_area_perubahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_area_perubahan_kegiatan`
--

DROP TABLE IF EXISTS `rb_area_perubahan_kegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_area_perubahan_kegiatan` (
  `id_opd` int(11) DEFAULT NULL,
  `id_rb_area_perubahan_program` int(11) NOT NULL,
  `nama_kegiatan` varchar(128) DEFAULT NULL,
  `target_waktu` varchar(32) DEFAULT NULL,
  `realisasi_waktu` varchar(32) DEFAULT NULL,
  `target_anggaran` int(11) DEFAULT NULL,
  `realisasi_anggaran` int(11) DEFAULT NULL,
  `capaian` tinyint(1) DEFAULT NULL,
  `ket` text,
  KEY `fk_rbap_kegiatan_1_idx` (`id_rb_area_perubahan_program`),
  CONSTRAINT `fk_rbap_kegiatan_1` FOREIGN KEY (`id_rb_area_perubahan_program`) REFERENCES `rb_area_perubahan_program` (`id_rb_area_perubahan_program`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_area_perubahan_kegiatan`
--

LOCK TABLES `rb_area_perubahan_kegiatan` WRITE;
/*!40000 ALTER TABLE `rb_area_perubahan_kegiatan` DISABLE KEYS */;
INSERT INTO `rb_area_perubahan_kegiatan` VALUES (NULL,3,'','','',0,0,0,'a'),(NULL,4,'','','',0,0,0,''),(NULL,5,'','','',0,0,0,''),(NULL,6,'','','',0,0,0,''),(NULL,6,'','','',0,0,0,''),(NULL,7,'Pembentukan Tim Manajemen Perubahan','1 s/d 12','1 s/d 12',33,52,1,''),(NULL,7,'Pelaksanaan Reformasi Birokrasi','1 s/d 12','1 s/d 12',33,52,1,''),(NULL,7,'Monitoring dan Evaluasi Rencana Aksi RB','1 s/d 12','1 s/d 12',33,52,1,''),(NULL,7,'Penilaian RB','1 s/d 3 & 9 s/d 12','1 s/d 3 & 9 s/d 12',26,0,0,'');
/*!40000 ALTER TABLE `rb_area_perubahan_kegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_area_perubahan_program`
--

DROP TABLE IF EXISTS `rb_area_perubahan_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_area_perubahan_program` (
  `id_rb_area_perubahan_program` int(11) NOT NULL AUTO_INCREMENT,
  `id_rb_area_perubahan` int(11) NOT NULL,
  `nama_program` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_rb_area_perubahan_program`),
  KEY `fk_rbap_program_1_idx` (`id_rb_area_perubahan`),
  CONSTRAINT `fk_rbap_program_1` FOREIGN KEY (`id_rb_area_perubahan`) REFERENCES `rb_area_perubahan` (`id_rb_area_perubahan`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_area_perubahan_program`
--

LOCK TABLES `rb_area_perubahan_program` WRITE;
/*!40000 ALTER TABLE `rb_area_perubahan_program` DISABLE KEYS */;
INSERT INTO `rb_area_perubahan_program` VALUES (3,2,'Program 1.1'),(4,3,'program 2.1'),(5,3,'program 2.2'),(6,4,'program 3.1'),(7,5,'Penyusunan Strategi Manajemen Perubahan dan Strategi Komunikasi');
/*!40000 ALTER TABLE `rb_area_perubahan_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_fokus`
--

DROP TABLE IF EXISTS `rb_fokus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_fokus` (
  `id_rb_fokus` int(11) NOT NULL AUTO_INCREMENT,
  `id_laporan` int(11) NOT NULL,
  `rincian` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_rb_fokus`),
  KEY `fk_rb_fokus_1_idx` (`id_laporan`),
  CONSTRAINT `fk_rb_fokus_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_rb_fokus` (`id_laporan`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_fokus`
--

LOCK TABLES `rb_fokus` WRITE;
/*!40000 ALTER TABLE `rb_fokus` DISABLE KEYS */;
INSERT INTO `rb_fokus` VALUES (3,34,'ddd'),(4,62,'Pendidikan');
/*!40000 ALTER TABLE `rb_fokus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_fokus_kegiatan`
--

DROP TABLE IF EXISTS `rb_fokus_kegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_fokus_kegiatan` (
  `id_rb_fokus_sasaran` int(11) DEFAULT NULL,
  `nama_kegiatan` varchar(128) DEFAULT NULL,
  `indikator` varchar(64) DEFAULT NULL,
  `target_output` varchar(64) DEFAULT NULL,
  `realisasi_output` varchar(64) DEFAULT NULL,
  `target_waktu` varchar(32) DEFAULT NULL,
  `realisasi_waktu` varchar(32) DEFAULT NULL,
  `target_anggaran` int(11) DEFAULT NULL,
  `realisasi_anggaran` int(11) DEFAULT NULL,
  `capaian` tinyint(1) DEFAULT NULL,
  `ket` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_fokus_kegiatan`
--

LOCK TABLES `rb_fokus_kegiatan` WRITE;
/*!40000 ALTER TABLE `rb_fokus_kegiatan` DISABLE KEYS */;
INSERT INTO `rb_fokus_kegiatan` VALUES (2,'','dd','','','','',NULL,0,0,''),(1,'qqq','','','','','',NULL,0,0,'ddd'),(3,'qqqq','','','','','',NULL,0,0,''),(4,'','','atta','','','',0,0,0,''),(4,'','','','','','',0,0,0,''),(7,'Melaksanakan peningkatan kompetensi dan kualitas guru','Prosentase jumlah guru yang memenuhi kualifikasi S1/S2/S3','92%','67.74$','1 s/d 12','1 s/d 12',1426,966,1,'Target sesuai dengan suplemen dari BAPPEDA untuk realisasi capaian output sudah tercapai tetapi untuk anggaran belum terserap');
/*!40000 ALTER TABLE `rb_fokus_kegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_fokus_sasaran`
--

DROP TABLE IF EXISTS `rb_fokus_sasaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_fokus_sasaran` (
  `id_rb_fokus_sasaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_rb_fokus` int(11) DEFAULT NULL,
  `sasaran` varchar(256) DEFAULT NULL,
  `nama_program` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_rb_fokus_sasaran`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_fokus_sasaran`
--

LOCK TABLES `rb_fokus_sasaran` WRITE;
/*!40000 ALTER TABLE `rb_fokus_sasaran` DISABLE KEYS */;
INSERT INTO `rb_fokus_sasaran` VALUES (1,2,'sss','ccc'),(3,1,'fff','qqqqq'),(6,3,'sdsd',''),(7,4,'Meningkatnya mutu pendidikan tenaga kependidikan','Peningkatan mutu pendidik dan tenaga kependidikan');
/*!40000 ALTER TABLE `rb_fokus_sasaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_prioritas`
--

DROP TABLE IF EXISTS `rb_prioritas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_prioritas` (
  `id_rb_prioritas` int(11) NOT NULL AUTO_INCREMENT,
  `id_laporan` int(11) NOT NULL,
  `rincian` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_rb_prioritas`),
  KEY `fk_rb_prioritas_1_idx` (`id_laporan`),
  CONSTRAINT `fk_rb_prioritas_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_rb_prioritas` (`id_laporan`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_prioritas`
--

LOCK TABLES `rb_prioritas` WRITE;
/*!40000 ALTER TABLE `rb_prioritas` DISABLE KEYS */;
INSERT INTO `rb_prioritas` VALUES (1,36,''),(2,64,'Pemenuhan kewajiban bagi Pimpinan untuk menyerahkan LHKPN');
/*!40000 ALTER TABLE `rb_prioritas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_prioritas_kegiatan`
--

DROP TABLE IF EXISTS `rb_prioritas_kegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_prioritas_kegiatan` (
  `id_rb_prioritas_sasaran` int(11) NOT NULL,
  `nama_kegiatan` varchar(128) DEFAULT NULL,
  `indikator` varchar(64) DEFAULT NULL,
  `target_output` varchar(64) DEFAULT NULL,
  `realisasi_output` varchar(64) DEFAULT NULL,
  `target_waktu` varchar(32) DEFAULT NULL,
  `realisasi_waktu` varchar(32) DEFAULT NULL,
  `target_anggaran` int(11) DEFAULT NULL,
  `realisasi_anggaran` int(11) DEFAULT NULL,
  `capaian` tinyint(1) DEFAULT NULL,
  `ket` text,
  KEY `fk_rb_prioritas_kegiatan_1_idx` (`id_rb_prioritas_sasaran`),
  CONSTRAINT `fk_rb_prioritas_kegiatan_1` FOREIGN KEY (`id_rb_prioritas_sasaran`) REFERENCES `rb_prioritas_sasaran` (`id_rb_prioritas_sasaran`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_prioritas_kegiatan`
--

LOCK TABLES `rb_prioritas_kegiatan` WRITE;
/*!40000 ALTER TABLE `rb_prioritas_kegiatan` DISABLE KEYS */;
INSERT INTO `rb_prioritas_kegiatan` VALUES (2,'','','','','','fff',0,0,0,''),(3,'Melaksanakan peningkatan kompetensi dan kualitas gutu','Prosentase jumlah guru yang memenuhi kualifikasi S1/S2/S3','92%','67.74%','1 s/d 12','1 s/d 12',1426,966,1,'Target sesuai dengan suplemen dari BAPPEDA untuk realisasi capaian output sudah tercapai tetapi untuk anggaran belum terserap');
/*!40000 ALTER TABLE `rb_prioritas_kegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_prioritas_sasaran`
--

DROP TABLE IF EXISTS `rb_prioritas_sasaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_prioritas_sasaran` (
  `id_rb_prioritas_sasaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_rb_prioritas` int(11) NOT NULL,
  `sasaran` varchar(256) DEFAULT NULL,
  `nama_program` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_rb_prioritas_sasaran`),
  KEY `fk_rb_prioritas_sasaran_1_idx` (`id_rb_prioritas`),
  CONSTRAINT `fk_rb_prioritas_sasaran_1` FOREIGN KEY (`id_rb_prioritas`) REFERENCES `rb_prioritas` (`id_rb_prioritas`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_prioritas_sasaran`
--

LOCK TABLES `rb_prioritas_sasaran` WRITE;
/*!40000 ALTER TABLE `rb_prioritas_sasaran` DISABLE KEYS */;
INSERT INTO `rb_prioritas_sasaran` VALUES (2,1,'',''),(3,2,'Terwujudnya pemerintahan yang bersih dan bebas KKN','Peningkatan Pejabat yang menyerahkan LHKPN');
/*!40000 ALTER TABLE `rb_prioritas_sasaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_quick_wins`
--

DROP TABLE IF EXISTS `rb_quick_wins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_quick_wins` (
  `id_rb_quick_wins` int(11) NOT NULL AUTO_INCREMENT,
  `id_laporan` int(11) NOT NULL,
  `rincian` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_rb_quick_wins`),
  KEY `fk_rb_quick_wins_1_idx` (`id_laporan`),
  CONSTRAINT `fk_rb_quick_wins_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_rb_quick_wins` (`id_laporan`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_quick_wins`
--

LOCK TABLES `rb_quick_wins` WRITE;
/*!40000 ALTER TABLE `rb_quick_wins` DISABLE KEYS */;
INSERT INTO `rb_quick_wins` VALUES (5,35,'Menurunkan Lemak'),(7,51,'test'),(8,65,'Dokumentasi hukun secara elektronik (E-doc) Sistem Jaringan Dokumentasi dan Informasi (SJDIH)');
/*!40000 ALTER TABLE `rb_quick_wins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_quick_wins_kegiatan`
--

DROP TABLE IF EXISTS `rb_quick_wins_kegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_quick_wins_kegiatan` (
  `id_rb_quick_wins_sasaran` int(11) NOT NULL,
  `nama_kegiatan` varchar(128) DEFAULT NULL,
  `indikator` varchar(64) DEFAULT NULL,
  `target_output` varchar(64) DEFAULT NULL,
  `realisasi_output` varchar(64) DEFAULT NULL,
  `target_waktu` varchar(32) DEFAULT NULL,
  `realisasi_waktu` varchar(32) DEFAULT NULL,
  `target_anggaran` int(11) DEFAULT NULL,
  `realisasi_anggaran` int(11) DEFAULT NULL,
  `capaian` tinyint(1) DEFAULT NULL,
  `ket` text,
  KEY `fk_rb_quick_wins_kegiatan_1_idx` (`id_rb_quick_wins_sasaran`),
  CONSTRAINT `fk_rb_quick_wins_kegiatan_1` FOREIGN KEY (`id_rb_quick_wins_sasaran`) REFERENCES `rb_quick_wins_sasaran` (`id_rb_quick_wins_sasaran`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_quick_wins_kegiatan`
--

LOCK TABLES `rb_quick_wins_kegiatan` WRITE;
/*!40000 ALTER TABLE `rb_quick_wins_kegiatan` DISABLE KEYS */;
INSERT INTO `rb_quick_wins_kegiatan` VALUES (13,'Mancing','','','','','',0,0,0,'aaaa'),(13,'Mukul','','','','','',0,0,0,''),(16,'Mangan','','','','','',0,0,0,''),(16,'Turu','','','','','',0,0,0,''),(16,'Nglamun','','','','','',0,0,0,''),(16,'nyambi','','','','','',0,0,0,''),(17,'qwe','qwe','qwe','qwe','qwe','eee',0,1,1,'bagus'),(18,'Publikasi Peraturan perundang-undangan','Presentase tersedianya peraturan perundang yang dapat mudah diak','100%','100%','1 s/d 12','1 s/d 12',175,171,1,'');
/*!40000 ALTER TABLE `rb_quick_wins_kegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_quick_wins_sasaran`
--

DROP TABLE IF EXISTS `rb_quick_wins_sasaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_quick_wins_sasaran` (
  `id_rb_quick_wins_sasaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_rb_quick_wins` int(11) NOT NULL,
  `sasaran` varchar(256) DEFAULT NULL,
  `nama_program` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_rb_quick_wins_sasaran`),
  KEY `fk_rb_quick_wins_sasaran_1_idx` (`id_rb_quick_wins`),
  CONSTRAINT `fk_rb_quick_wins_sasaran_1` FOREIGN KEY (`id_rb_quick_wins`) REFERENCES `rb_quick_wins` (`id_rb_quick_wins`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_quick_wins_sasaran`
--

LOCK TABLES `rb_quick_wins_sasaran` WRITE;
/*!40000 ALTER TABLE `rb_quick_wins_sasaran` DISABLE KEYS */;
INSERT INTO `rb_quick_wins_sasaran` VALUES (13,5,'aaaa','sss'),(16,5,'haha',''),(17,7,'test2','test2'),(18,8,'Meningkatnya dokumentasi hukun secara elektronik (E-doc) Sistem Jaringan Dokumentasi dan Informasi Hukum (SJDIH)','Meningkatnya dokumentasi hukun secara elektronik (E-doc) Sistem Jaringan Dokumentasi dan Informasi Hukum (SJDIH)');
/*!40000 ALTER TABLE `rb_quick_wins_sasaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_zi_wbk_kegiatan`
--

DROP TABLE IF EXISTS `rb_zi_wbk_kegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_zi_wbk_kegiatan` (
  `id_rb_zi_wbk_sasaran` int(11) DEFAULT NULL,
  `nama_kegiatan` varchar(128) DEFAULT NULL,
  `indikator` varchar(64) DEFAULT NULL,
  `target_output` varchar(64) DEFAULT NULL,
  `realisasi_output` varchar(64) DEFAULT NULL,
  `target_waktu` varchar(32) DEFAULT NULL,
  `realisasi_waktu` varchar(32) DEFAULT NULL,
  `target_anggaran` int(11) DEFAULT NULL,
  `realisasi_anggaran` int(11) DEFAULT NULL,
  `capaian` tinyint(1) DEFAULT NULL,
  `ket` text,
  KEY `fk_rb_zi_wbk_kegiatan_1_idx` (`id_rb_zi_wbk_sasaran`),
  CONSTRAINT `fk_rb_zi_wbk_kegiatan_1` FOREIGN KEY (`id_rb_zi_wbk_sasaran`) REFERENCES `rb_zi_wbk_sasaran` (`id_rb_zi_wbk_sasaran`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_zi_wbk_kegiatan`
--

LOCK TABLES `rb_zi_wbk_kegiatan` WRITE;
/*!40000 ALTER TABLE `rb_zi_wbk_kegiatan` DISABLE KEYS */;
INSERT INTO `rb_zi_wbk_kegiatan` VALUES (6,'Penyiapan Perangkat Daerah sebagai unit yang ditetapkan untuk Zona Integritas Menuju WBK','Jumlah unit kerja yang ditetapkan','1 unit','','1 s/d 12','',0,0,0,''),(6,'Pencanangan Zona Integritas Menuju WBK','Jumlah unit kerja yang dicanangkan','1 unit','','6 s/d 12','4',14,11,0,'Nilai hasil belum memenuhi standar yang dibutuhkan'),(6,'Pelaksanaan Zona Integritas Menuju WBK','Laporan kegiatan','-','','-','',0,0,0,'');
/*!40000 ALTER TABLE `rb_zi_wbk_kegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_zi_wbk_sasaran`
--

DROP TABLE IF EXISTS `rb_zi_wbk_sasaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_zi_wbk_sasaran` (
  `id_rb_zi_wbk_sasaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_laporan` int(11) NOT NULL,
  `sasaran` varchar(256) DEFAULT NULL,
  `nama_program` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_rb_zi_wbk_sasaran`),
  KEY `fk_rb_zi_wbk_sasaran_1_idx` (`id_laporan`),
  CONSTRAINT `fk_rb_zi_wbk_sasaran_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_rb_zi_wbk` (`id_laporan`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_zi_wbk_sasaran`
--

LOCK TABLES `rb_zi_wbk_sasaran` WRITE;
/*!40000 ALTER TABLE `rb_zi_wbk_sasaran` DISABLE KEYS */;
INSERT INTO `rb_zi_wbk_sasaran` VALUES (6,66,'Meningkatnya kualitas pelayanan publik','Pelaksanaan zona integritas menuju Wilayah Bebas Korupsi (WBK)');
/*!40000 ALTER TABLE `rb_zi_wbk_sasaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realisasi_fisik`
--

DROP TABLE IF EXISTS `realisasi_fisik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realisasi_fisik` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `judul_realisasi_fisik` varchar(128) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_inheritance_11` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realisasi_fisik`
--

LOCK TABLES `realisasi_fisik` WRITE;
/*!40000 ALTER TABLE `realisasi_fisik` DISABLE KEYS */;
INSERT INTO `realisasi_fisik` VALUES (31,8,1,'2019-08-05 06:08:01','2019-08-05 06:08:01',NULL,'2020-08-05'),(49,8,1,'2019-08-07 23:32:04','2019-08-07 23:32:04',NULL,'2019-08-08'),(59,18,1,'2019-08-08 02:58:49','2019-08-08 02:58:49',NULL,'2019-08-08');
/*!40000 ALTER TABLE `realisasi_fisik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rekap_pokja`
--

DROP TABLE IF EXISTS `rekap_pokja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rekap_pokja` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl` date DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_inheritance_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rekap_pokja`
--

LOCK TABLES `rekap_pokja` WRITE;
/*!40000 ALTER TABLE `rekap_pokja` DISABLE KEYS */;
INSERT INTO `rekap_pokja` VALUES (25,8,2,'2019-08-04 04:31:19','2019-08-04 04:31:19','2019-08-14'),(39,8,2,'2019-08-07 06:24:17','2019-08-07 06:24:17','2019-08-07'),(57,18,2,'2019-08-08 02:49:08','2019-08-08 02:49:08','2019-08-08');
/*!40000 ALTER TABLE `rekap_pokja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rekap_tender`
--

DROP TABLE IF EXISTS `rekap_tender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rekap_tender` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `judul_rekap_tender` varchar(128) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_inheritance_2` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rekap_tender`
--

LOCK TABLES `rekap_tender` WRITE;
/*!40000 ALTER TABLE `rekap_tender` DISABLE KEYS */;
INSERT INTO `rekap_tender` VALUES (23,8,3,'2019-08-04 01:09:31','2019-08-04 00:21:14','Judul Rekap Tenders','2019-08-14'),(40,8,3,'2019-08-07 06:32:36','2019-08-07 06:32:36',NULL,'2019-08-07'),(56,18,3,'2019-08-08 02:49:00','2019-08-08 02:50:43','REKAPITULASI PELAKSANAAN PENGADAAN  BARANG JASA YANG SUDAH DI TENDER LPSE KOTA MADIUN','2019-08-08');
/*!40000 ALTER TABLE `rekap_tender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sotk`
--

DROP TABLE IF EXISTS `sotk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sotk` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl` date DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_inheritance_5` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sotk`
--

LOCK TABLES `sotk` WRITE;
/*!40000 ALTER TABLE `sotk` DISABLE KEYS */;
INSERT INTO `sotk` VALUES (26,8,8,'2019-08-05 01:47:20','2019-08-05 01:47:20','2019-08-05'),(55,18,8,'2019-08-08 02:46:09','2019-08-08 02:46:09','2019-08-08');
/*!40000 ALTER TABLE `sotk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sotk_opd`
--

DROP TABLE IF EXISTS `sotk_opd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sotk_opd` (
  `id_opd` int(11) DEFAULT NULL,
  `id_laporan` int(11) DEFAULT NULL,
  `besaran` varchar(6) DEFAULT NULL,
  KEY `fk_relationship_26` (`id_opd`),
  KEY `fk_relationship_27` (`id_laporan`),
  CONSTRAINT `fk_relationship_26` FOREIGN KEY (`id_opd`) REFERENCES `opd` (`id_opd`),
  CONSTRAINT `fk_relationship_27` FOREIGN KEY (`id_laporan`) REFERENCES `sotk` (`id_laporan`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sotk_opd`
--

LOCK TABLES `sotk_opd` WRITE;
/*!40000 ALTER TABLE `sotk_opd` DISABLE KEYS */;
INSERT INTO `sotk_opd` VALUES (144,26,'TIPE A'),(144,26,'TIPE A'),(144,26,'TIPE A'),(144,26,'TIPE A'),(144,26,'TIPE A'),(144,26,'TIPE A'),(144,26,'TIPE A'),(2,55,'TIPE B'),(6,55,'TIPE B'),(126,55,'TIPE C'),(18,55,'TIPE C'),(22,55,'TIPE B');
/*!40000 ALTER TABLE `sotk_opd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tatalaksana`
--

DROP TABLE IF EXISTS `tatalaksana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tatalaksana` (
  `id_laporan` int(11) NOT NULL,
  `id_opd` int(11) DEFAULT NULL,
  `id_tipe` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl` date DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  CONSTRAINT `fk_inheritance_7` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tatalaksana`
--

LOCK TABLES `tatalaksana` WRITE;
/*!40000 ALTER TABLE `tatalaksana` DISABLE KEYS */;
INSERT INTO `tatalaksana` VALUES (27,8,11,'2019-08-05 01:55:09','2019-08-05 01:55:09','2019-08-05'),(53,18,11,'2019-08-08 02:36:28','2019-08-08 02:36:28','2019-08-08');
/*!40000 ALTER TABLE `tatalaksana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tatalaksana_opd`
--

DROP TABLE IF EXISTS `tatalaksana_opd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tatalaksana_opd` (
  `id_opd` int(11) DEFAULT NULL,
  `id_laporan` int(11) DEFAULT NULL,
  `uji_kompetensi` float DEFAULT NULL,
  `sop` float DEFAULT NULL,
  `tata_naskah_dinas` float DEFAULT NULL,
  `pakaian_dinas` float DEFAULT NULL,
  `jam_kerja` float DEFAULT NULL,
  `jml_nilai` float DEFAULT NULL,
  `ket` text,
  KEY `fk_relationship_21` (`id_opd`),
  KEY `fk_relationship_20` (`id_laporan`),
  CONSTRAINT `fk_relationship_20` FOREIGN KEY (`id_laporan`) REFERENCES `tatalaksana` (`id_laporan`) ON DELETE CASCADE,
  CONSTRAINT `fk_relationship_21` FOREIGN KEY (`id_opd`) REFERENCES `opd` (`id_opd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tatalaksana_opd`
--

LOCK TABLES `tatalaksana_opd` WRITE;
/*!40000 ALTER TABLE `tatalaksana_opd` DISABLE KEYS */;
INSERT INTO `tatalaksana_opd` VALUES (144,27,12,21,21,2,12,NULL,'GOOD'),(144,27,1,1,1,1,1,NULL,'xzxczx'),(144,27,20.5,101,20.5,20,20,NULL,'haha'),(60,53,77,27,16.8,11,15,NULL,'Baik'),(6,53,64,27,21.84,14.9,15,NULL,'Baik'),(53,53,78,27,16.2,12,15,NULL,'Baik'),(2,53,69,24,18.3,18,20,NULL,'Baik'),(143,53,70,27,17.4,18,20,NULL,'baik');
/*!40000 ALTER TABLE `tatalaksana_opd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temuan`
--

DROP TABLE IF EXISTS `temuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temuan` (
  `id_temuan` int(11) NOT NULL AUTO_INCREMENT,
  `id_laporan` int(11) DEFAULT NULL,
  `nama_temuan` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_temuan`),
  KEY `fk_relationship_24` (`id_laporan`),
  CONSTRAINT `fk_relationship_24` FOREIGN KEY (`id_laporan`) REFERENCES `pemantauan_tindak_lanjut` (`id_laporan`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temuan`
--

LOCK TABLES `temuan` WRITE;
/*!40000 ALTER TABLE `temuan` DISABLE KEYS */;
INSERT INTO `temuan` VALUES (7,20,'a'),(8,20,'b'),(10,20,'c'),(11,67,'Penatausahaan Piutang Pajak Bumi dan Bangunan Perdesaan dan Perkotaan Tidak Memadai Sebesar Rp.1.327.855.702,00');
/*!40000 ALTER TABLE `temuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipe_laporan`
--

DROP TABLE IF EXISTS `tipe_laporan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipe_laporan` (
  `id_tipe` int(11) NOT NULL AUTO_INCREMENT,
  `nama_laporan` varchar(64) DEFAULT NULL,
  `kode_tipe` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_tipe`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipe_laporan`
--

LOCK TABLES `tipe_laporan` WRITE;
/*!40000 ALTER TABLE `tipe_laporan` DISABLE KEYS */;
INSERT INTO `tipe_laporan` VALUES (1,'Realisasi Fisik','realisasi_fisik'),(2,'Rekap Pokja','rekap_pokja'),(3,'Rekap Tender','rekap_tender'),(4,'Laporan Kinerja Triwulan','laporan_kinerja_triwulan'),(5,'Pemantauan Tindak Lanjut','pemantauan_tindak_lanjut'),(6,'Jadwal Pelaksanaan','jadwal_pelaksanaan'),(7,'Laporan RB Area Perubahan','laporan_rb_area_perubahan'),(8,'SOTK','sotk'),(9,'IKM','ikm'),(10,'Pelayanan Publik','pelayanan_publik'),(11,'Tatalaksana','tatalaksana'),(12,'Monitoring Kelembagaan','monitoring_kelembagaan'),(13,'Laporan RB Quick Wins','laporan_rb_quick_wins'),(14,'Laporan RB ZI WBK','laporan_rb_zi_wbk'),(15,'Laporan RB Prioritas','laporan_rb_prioritas'),(16,'Laporan RB Fokus','laporan_rb_fokus');
/*!40000 ALTER TABLE `tipe_laporan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipelaporan_per_opd`
--

DROP TABLE IF EXISTS `tipelaporan_per_opd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipelaporan_per_opd` (
  `id_opd` int(11) NOT NULL,
  `id_tipe` int(11) NOT NULL,
  PRIMARY KEY (`id_opd`,`id_tipe`),
  KEY `fk_tipelaporan_per_opd2` (`id_tipe`),
  CONSTRAINT `fk_tipelaporan_per_opd` FOREIGN KEY (`id_opd`) REFERENCES `opd` (`id_opd`),
  CONSTRAINT `fk_tipelaporan_per_opd2` FOREIGN KEY (`id_tipe`) REFERENCES `tipe_laporan` (`id_tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipelaporan_per_opd`
--

LOCK TABLES `tipelaporan_per_opd` WRITE;
/*!40000 ALTER TABLE `tipelaporan_per_opd` DISABLE KEYS */;
INSERT INTO `tipelaporan_per_opd` VALUES (8,1),(18,1),(8,2),(18,2),(8,3),(18,3),(8,4),(18,4),(8,5),(18,5),(8,6),(18,6),(8,7),(18,7),(8,8),(18,8),(8,9),(18,9),(8,10),(18,10),(8,11),(18,11),(8,12),(18,12),(8,13),(18,13),(8,14),(18,14),(8,15),(18,15),(8,16),(18,16);
/*!40000 ALTER TABLE `tipelaporan_per_opd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_opd` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` char(60) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_user_opd` (`id_opd`),
  CONSTRAINT `fk_user_opd` FOREIGN KEY (`id_opd`) REFERENCES `opd` (`id_opd`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'admin','$2y$10$xZ/LdOuXl/7Mid/amZFHPuN/AAeKXav/2YRmuFpJKpCT0R.TesCGq','2019-08-04 12:48:52','2019-08-08 03:54:26'),(2,18,'21001','$2y$10$6sZkqaZBtLUKEcDbjy/bw.cHRzJXnZ3LLAdyzgfFClcpXCq169bGK','2019-07-30 13:00:45','2019-08-08 04:05:01'),(3,22,'10101','$2y$10$GUGvu1ZPzVlPRpfw8TzuDeLtzhQ9Ow/VlKU/szhARkTwNvoHswJE2','2019-07-30 13:01:13','2019-07-30 13:01:13'),(4,2,'40601','$2y$10$i6Te6ECW/CazF2dDJB8h5Ou8t6NbEIb9Mxy.u1QQXveGOxC6ty4R6','2019-07-30 13:01:31','2019-07-30 13:01:31'),(5,4,'10502','$2y$10$PLJtpDPY9obyeSOx/GIPge7lJhJx2GqxhjQo0HbM8GWg7GAWqbEAy','2019-07-30 12:41:20','2019-07-30 12:41:20'),(6,148,'40502','$2y$10$wovYyN0SwVcSFEsALhh.xebhg9a941NcnImvnAM6aytNeVvhRe.YO','2019-07-30 12:41:48','2019-07-30 12:41:48'),(7,23,'30601','$2y$10$dBtW66wfqZp7kuenrXEF/eygFuJ5Civqtj93SqNt1iOc.Q4vJW1wi','2019-07-30 13:06:17','2019-07-30 13:06:17'),(8,24,'20901','$2y$10$.BkMRm70SGuXGUOmYoOALeD1SDi0TN6UPdBN9iSyZ31420zVsE.eq','2019-07-30 12:45:39','2019-07-30 12:45:39'),(9,17,'10201','$2y$10$beFpPb4VkWwVC8pCd9.Kjuss19F5EQeTsXXHc.CWqW/BfmggMtYsS','2019-07-30 12:46:39','2019-07-30 12:46:39'),(10,29,'20101','$2y$10$Y1I47suJM4v7xdXgXNEfoODirpxJiCtWOEASldI2LIbw.CINthQJa','2019-07-30 13:02:15','2019-07-30 13:02:15'),(11,66,'10501','$2y$10$XbxzSWVqqP8OP1fFIqnoxegbob0uBh35tDpfQpACIiAkR/nWAKP1O','2019-07-30 12:47:14','2019-07-30 12:47:14'),(12,25,'21701','$2y$10$Xo/dS5MlFfXNKrJZc.q01.e.b8JePkQ3E34YpFXQUWJ.U/2J9U8W.','2019-07-30 12:47:38','2019-07-30 12:47:38'),(13,28,'10601','$2y$10$kS7bYUmh/Rbimoru5kstLOqY/BqHbEzGwkuAPWp1trCGbv/8fCtEq','2019-07-30 12:48:35','2019-07-30 12:48:35'),(14,19,'20501','$2y$10$Pr.zjMeGAuYLdtl1.zWw5.9/Jt55Gpw/JeeIjhgpAHQ7bn0/avgA.','2019-07-30 12:48:50','2019-07-30 12:48:50'),(15,36,'40903','$2y$10$FAv7fRRXGE4iVEAG5Cgoe.xtDHhDawj9GsjQywEESnacjbyuc/g2O','2019-07-30 12:51:57','2019-07-30 12:51:57'),(16,34,'40901','$2y$10$sqhBwNH95PCV9s1GXWJme.2BLyBrZgycLkcF7cWCVybNaGe4c5JUS','2019-07-30 12:52:17','2019-07-30 12:52:17'),(17,127,'40201','$2y$10$8CtdkCWmRQKtGjOhUxFkk.6Iye.gQ7.W.ONBKMXc4ncmJuNII5/zG','2019-07-30 12:53:03','2019-07-30 12:53:03'),(18,6,'40501','$2y$10$5O.VXWCDUKKHrvik04Lzg.Ezn7K5gvWT5tKxHKazOP7uryqXzL1LO','2019-07-30 12:53:39','2019-07-30 12:53:39'),(19,32,'40902','$2y$10$kTq90jWkv9YdeRny1tKtme2UMWBkr2Dfpb0ZFHT0FiHQl0ZzmOE6m','2019-07-30 12:54:02','2019-07-30 12:54:02'),(20,16,'20601','$2y$10$.pQdaLvnNxfn.2FrceEoX.vWR0QZuo9.iNKAwD4hf9.sja0Mf/hdm','2019-07-30 12:55:21','2019-07-30 12:55:21'),(21,143,'40701','$2y$10$LHQm4ZlXqOSiqMrUUP4n.OrTZ3x14I0SA7tuOMLF0YLsSAm/G18dC','2019-07-30 12:55:47','2019-07-30 12:55:47'),(22,27,'10401','$2y$10$P0zg54ep65QjiiPO3wQeyegX/Fh.pJoQgvR.ZSMK34Ql1eZcPVWw6','2019-07-30 12:57:43','2019-07-30 12:57:43'),(23,3,'40801','$2y$10$Mc6oBmMMoNMKUR9FJG.RYOv2agliQzNam724fbvJSh56ZtDVCnNlq','2019-07-30 13:03:57','2019-07-30 13:03:57'),(24,20,'10301','$2y$10$rUVQuJOxGrozvPIN7Lz1MuRO6gEzuQU3NOuv2/gAxwpISKxjmq3Uu','2019-07-30 13:05:05','2019-07-30 13:05:05'),(25,151,'30301','$2y$10$TPwLWu1G6X4JSwpA8Eys0uI69HJ8viTSQ8GkIgsC1v86jyee4Ip1S','2019-07-30 13:08:20','2019-07-30 13:08:20'),(26,8,'40101','$2y$10$IhCN7/VMLP3LfJ66TeASzO114.8iHdfqg6fmy5Tg38xX41GIx5y1y','2019-08-07 07:57:38','2019-08-08 02:09:13');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-08 11:20:18
