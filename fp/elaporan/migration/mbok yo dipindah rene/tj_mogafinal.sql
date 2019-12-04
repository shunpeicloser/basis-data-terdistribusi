-- MySQL dump 10.16  Distrib 10.1.40-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: testang
-- ------------------------------------------------------
-- Server version	10.3.16-MariaDB

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
  KEY `fk_relationship_30` (`id_jadwal_pelaksanaan_opd`),
  CONSTRAINT `fk_relationship_30` FOREIGN KEY (`id_jadwal_pelaksanaan_opd`) REFERENCES `jadwal_pelaksanaan_opd` (`id_jadwal_pelaksanaan_opd`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor`
--

LOCK TABLES `auditor` WRITE;
/*!40000 ALTER TABLE `auditor` DISABLE KEYS */;
INSERT INTO `auditor` VALUES (19,'zxc','inspektur'),(19,'tono',''),(22,'ccc','');
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
INSERT INTO `detail_laporan_kinerja_triwulan` VALUES (22,'aaa','',124,0,'',0,0);
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
  `ket` text DEFAULT NULL,
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
  `ket` text DEFAULT NULL,
  `nama_paket_kerja` varchar(128) DEFAULT NULL,
  `pagu` int(11) DEFAULT NULL,
  `id_detail_rekap_tender` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_detail_rekap_tender`),
  KEY `fk_relationship_41` (`id_opd`),
  KEY `fk_relationship_14` (`id_laporan`),
  CONSTRAINT `fk_relationship_14` FOREIGN KEY (`id_laporan`) REFERENCES `rekap_tender` (`id_laporan`) ON DELETE CASCADE,
  CONSTRAINT `fk_relationship_41` FOREIGN KEY (`id_opd`) REFERENCES `opd` (`id_opd`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_rekap_tender`
--

LOCK TABLES `detail_rekap_tender` WRITE;
/*!40000 ALTER TABLE `detail_rekap_tender` DISABLE KEYS */;
INSERT INTO `detail_rekap_tender` VALUES (9,23,0,'',0,'','Belanja mamin pra evaluasi pembangunan TW II',2000000,15),(11,23,0,'',0,'','Belanja Makanan dan Minuman Tamu',4000000,16),(10,23,0,'',0,'','Pengadaan makanan dan minuman peserta',151875000,17);
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
  `rekomendasi` text DEFAULT NULL,
  `status_rekomendasi` char(2) DEFAULT NULL,
  `tindak_lanjut` text DEFAULT NULL,
  `status_tindak_lanjut` char(2) DEFAULT NULL,
  `catatan_bpk` text DEFAULT NULL,
  KEY `fk_relationship_25` (`id_temuan`),
  CONSTRAINT `fk_relationship_25` FOREIGN KEY (`id_temuan`) REFERENCES `temuan` (`id_temuan`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasil_temuan`
--

LOCK TABLES `hasil_temuan` WRITE;
/*!40000 ALTER TABLE `hasil_temuan` DISABLE KEYS */;
INSERT INTO `hasil_temuan` VALUES (7,'ss','TS','ss','TS','sss'),(8,'zzzz','T','sss','T','ddd');
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `ikm` VALUES (24,8,9,'2019-08-04 03:10:31','2019-08-04 03:10:31','2019-08-09');
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
INSERT INTO `ikm_opd` VALUES (144,24,0,''),(154,24,3,'');
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `jadwal_pelaksanaan` VALUES (21,8,6,'2019-08-03 14:00:05','2019-08-03 14:00:05','2019-08-13');
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
  `keterangan` text DEFAULT NULL,
  PRIMARY KEY (`id_jadwal_pelaksanaan_opd`),
  KEY `fk_relationship_33` (`id_opd`),
  KEY `fk_relationship_32` (`id_laporan`),
  CONSTRAINT `fk_relationship_32` FOREIGN KEY (`id_laporan`) REFERENCES `jadwal_pelaksanaan` (`id_laporan`) ON DELETE CASCADE,
  CONSTRAINT `fk_relationship_33` FOREIGN KEY (`id_opd`) REFERENCES `opd` (`id_opd`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal_pelaksanaan_opd`
--

LOCK TABLES `jadwal_pelaksanaan_opd` WRITE;
/*!40000 ALTER TABLE `jadwal_pelaksanaan_opd` DISABLE KEYS */;
INSERT INTO `jadwal_pelaksanaan_opd` VALUES (19,144,21,'sss','','',0,0,''),(22,82,21,'','','',0,0,'123');
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
  `ket` text DEFAULT NULL,
  PRIMARY KEY (`kode_kegiatan`),
  KEY `fk_relationship_35` (`kode_program`),
  CONSTRAINT `fk_relationship_35` FOREIGN KEY (`kode_program`) REFERENCES `program` (`kode_program`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kegiatan`
--

LOCK TABLES `kegiatan` WRITE;
/*!40000 ALTER TABLE `kegiatan` DISABLE KEYS */;
INSERT INTO `kegiatan` VALUES ('31-01-001','31-01','Kegiatan Penyediaan Jasa, Peralatan dan Perlengkapan Kantor',2147483647,'jumlah lembaga',1,0,NULL,'lembaga','akuntabilitas kinerja dinas pendidikan bernilai baik',77,0,NULL,0,NULL,'BB',NULL),('31-01-002','31-01','Kegiatan Koordinasi dan Konsultasi Keluar Daerah',443750000,'jumlah kali',105,0,NULL,'kali','akuntabilitas kinerja dinas pendidikan bernilai baik',77,0,NULL,0,NULL,'BB',NULL),('31-02-001','31-02','Kegiatan Pemeliharaan Rutin/ Berkala Gedung dan Bangunan Kantor',70250000,'jumlah lembaga',1,0,NULL,'lembaga','akuntabilitas kinerja dinas pendidikan bernilai baik',77,0,NULL,0,NULL,'BB',NULL),('31-02-002','31-02','Kegiatan Pemeliharaan Rutin/ Berkala Kendaraan Dinas',136100000,'jumlah unit',123,0,NULL,'kendaraan','akuntabilitas kinerja dinas pendidikan bernilai baik',77,0,NULL,0,NULL,'BB',NULL),('31-02-003','31-02','Kegiatan Pemeliharaan Rutin/ Berkala Sarana Prasarana Kantor',400000000,'jumlah lembaga',1,0,NULL,'lembaga','akuntabilitas kinerja dinas pendidikan bernilai baik',77,0,NULL,0,NULL,'BB',NULL),('31-03-001','31-03','Kegiatan Pengadaan Sarana dan Prasarana Kantor',600000000,'jumlah paket',1,0,NULL,'paket','akuntabilitas kinerja dinas pendidikan bernilai baik',77,0,NULL,0,NULL,'BB',NULL),('31-04-001','31-04','Kegiatan Penyusunan Perencanaan serta Pelaporan Kinerja dan Ikhtisar Realisasi Kinerja Perangkat Daerah',100000000,'jumlah dokumen',9,0,NULL,'lembaga','akuntabilitas kinerja dinas pendidikan bernilai baik',77,0,NULL,0,NULL,'BB',NULL),('31-15-001','31-15','Kegiatan Operasional BOS Tingkat Kota',90000000,'jumlah lembaga yang memenuhi standar pendidikan',94,0,NULL,'lembaga','satuan pendidikan semua jenjang melaksanakan manajemen berbasis ',94,0,NULL,0,NULL,'lembaga',NULL),('31-15-002','31-15','Kegiatan Pembinaan Komite Sekolah dalam Pengelolaan Sumber Daya Pendidikan',99750000,'jumlah komite yang memahami pendidikan meningkat',184,0,NULL,'orang','satuan pendidikan semua jenjang melaksanakan manajemen berbasis ',94,0,NULL,0,NULL,'lembaga',NULL),('31-15-003','31-15','Kegiatan Pengembangan dan Implementasi Informasi Pendidikan Berbasis IT',200000000,'jumlah lembaga yang sesuai dengan SPM',142,0,NULL,'lembaga','satuan pendidikan semua jenjang melaksanakan manajemen berbasis ',94,0,NULL,0,NULL,'lembaga',NULL),('31-15-004','31-15','Kegiatan Operasional BOS Madrasah Diniyah (BOSDA MADIN) BK Prov',105000000,'jumlah lembaga yang mendapat BOS',49,0,NULL,'lembaga','satuan pendidikan semua jenjang melaksanakan manajemen berbasis ',94,0,NULL,0,NULL,'lembaga',NULL),('31-15-005','31-15','Kegiatan BOP Bantuan Beasiswa Mahasiswa (BBM)',65000000,'jumlah mahasiswa berprestasi yang menerima bantuan',300,0,NULL,'mahasiswa','satuan pendidikan semua jenjang melaksanakan manajemen berbasis ',94,0,NULL,0,NULL,'lembaga',NULL),('31-16-001','31-16','Kegiatan Sertifikasi Guru',224054000,'jumlah guru yang bersertifikasi',125,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-16-002','31-16','Kegiatan Penilaian Angka Kredit Jabatan Fungsional Guru',144375000,'jumlah guru yang mengikuti penilaian angka kredit',500,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-16-003','31-16','Kegiatan Seleksi Guru, Kepala Sekolah, dan Pengawas Sekolah Berprestasi, OGN, Inobel, Literasi, Media Pembelajaran Berbasis IT s',700000000,'jumlah guru/kasek berkinerja baik',500,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-16-005','31-16','Kegiatan Bantuan Beasiswa Pendidikan S1/S2/S3',120000000,'jumlah guru yang berkualifikasi S1',10,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-16-006','31-16','Kegiatan Peningkatan Kompetensi SDM Guru Kelas dan Mapel Online serta Pengembangan Keprofesian Berkelanjutan (PKB)',400000000,'jumlah guru yang memahami materi',500,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-16-007','31-16','Kegiatan Peningkatan SDM Tenaga Kependidikan (TU)',50000000,'jumlah TU yang taat aturan',50,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-16-008','31-16','Kegiatan Outdoor Learning Guru',325000000,'jumlah guru yang mengikuti outdoor learning\r\n',400,0,NULL,'guru','prosentase guru, kasek dan pengawas berkompetensi',100,0,NULL,0,NULL,'%',NULL),('31-17-001','31-17','Kegiatan Penyelenggaraan SMP Terbuka',78556000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-002','31-17','Kegiatan Penyelenggaraan SMPN 1',1807273000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-003','31-17','Kegiatan Penyelenggaraan SMPN 2',1555369000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-004','31-17','Kegiatan Penyelenggaraan SMPN 3',1071885000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-005','31-17','Kegiatan Penyelenggaraan SMPN 4',1391293100,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-006','31-17','Kegiatan Penyelenggaraan SMPN 5',836852000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-007','31-17','Kegiatan Penyelenggaraan SMPN 6',1264776000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-008','31-17','Kegiatan Penyelenggaraan SMPN 7',1458032000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-009','31-17','Kegiatan Penyelenggaraan SMPN 8',1204131000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-010','31-17','Kegiatan Penyelenggaraan SMPN 9',1306194000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-011','31-17','Kegiatan Penyelenggaraan SMPN 10',1485995000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-012','31-17','Kegiatan Penyelenggaraan SMPN 11',990536000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-013','31-17','Kegiatan Penyelenggaraan SMPN 12',1376178500,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-014','31-17','Kegiatan Penyelenggaraan SMPN 13',1286469000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-015','31-17','Kegiatan Penyelenggaraan SMPN 14',906011000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-016','31-17','Kegiatan Penyelenggaraan SDN 01 Kartoharjo',489806300,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-017','31-17','Kegiatan Penyelenggaraan SDN 02 Kartoharjo',188786000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-018','31-17','Kegiatan Penyelenggaraan SDN 03 Kartoharjo',181399400,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-019','31-17','Kegiatan Penyelenggaraan SDN 01 Klegen',534335800,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-020','31-17','Kegiatan Penyelenggaraan SDN 02 Klegen',264324800,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-021','31-17','Kegiatan Penyelenggaraan SDN 03 Klegen',521516000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-022','31-17','Kegiatan Penyelenggaraan SDN 04 Klegen',219344500,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-023','31-17','Kegiatan Penyelenggaraan SDN Oro Oro Ombo',414544000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-024','31-17','Kegiatan Penyelenggaraan SDN 01 Rejomulyo',195813000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-025','31-17','Kegiatan Penyelenggaraan SDN 02 Rejomulyo',159546000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-026','31-17','Kegiatan Penyelenggaraan SDN 01 Kanigoro',223088500,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-027','31-17','Kegiatan Penyelenggaraan SDN 02 Kanigoro',290733400,'jumlah lembaga yang beroperasional baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-028','31-17','Kegiatan Penyelenggaraan SDN 03 Kanigoro',318658600,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-029','31-17','Kegiatan Penyelenggaraan SDN Sukosari',140292000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-030','31-17','Kegiatan Penyelengaraan SDN Pilangbango',499116800,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-031','31-17','Kegiatan Penyelenggaraan SDN 01 Tawangrejo',264241400,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-032','31-17','Kegiatan Penyelenggaraan SDN 02 Tawangrejo',228726400,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-033','31-17','Kegiatan Penyelenggaraan SDN Kelun',272934400,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-034','31-17','Kegiatan Penyelenggaraan SDN 01 Manguharjo',567730000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-035','31-17','Kegiatan Penyelenggaraan SDN 01 Nambangan Lor',483047000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-036','31-17','Kegiatan Penyelenggaraan SDN 02 Nambangan Lor',237330000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-037','31-17','Kegiatan Penyelenggaraan SDN 01 Madiun Lor',277889000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-038','31-17','Kegiatan Penyelenggaraan SDN 02 Madiun Lor',269837000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-039','31-17','Kegiatan Penyelenggaraan SDN 03 Madiun Lor',766267000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-040','31-17','Kegiatan Penyelenggaraan SDN 04 Madiun Lor',496014000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-041','31-17','Kegiatan Penyelenggaraan SDN 05 Madiun Lor',564228000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-042','31-17','Kegiatan Penyelenggaraan SDN 01 Nambangan Kidul',257405000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-043','31-17','Kegiatan Penyelenggaraan SDN 02 Nambangan Kidul',229253000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-044','31-17','Kegiatan Penyelenggaraan SDN 03 Nambangan Kidul',484579000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-045','31-17','Kegiatan Penyelenggaraan SDN 04 Nambangan Kidul',219053000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-046','31-17','Kegiatan Penyelenggaraan SDN 01 Winongo',449150000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-047','31-17','Kegiatan Penyelenggaraan SDN 02 Winongo',229892000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-048','31-17','Kegiatan Penyelenggaraan SDN Ngegong',227755000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNPbaik',92,0,NULL,0,NULL,'%',NULL),('31-17-049','31-17','Kegiatan Penyelenggaraan SDN Patihan',521015000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-050','31-17','Kegiatan Penyelenggaraan SDN 01 Pangongangan',223037000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-051','31-17','Kegiatan Penyelenggaraan SDN 02 Pangongangan',448071000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-052','31-17','Kegiatan Penyelenggaraan SDN Sogaten',300555000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-053','31-17','Kegiatan Penyelenggaraan SDN 01 Taman',658217000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-054','31-17','Kegiatan Penyelenggaraan SDN 02 Taman',141303000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-055','31-17','Kegiatan Penyelenggaraan SDN 03 Taman',232131000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-056','31-17','Kegiatan Penyelenggaraan SDN 01 Pandean',530143000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-057','31-17','Kegiatan Penyelenggaraan SDN 02 Pandean',527977000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-058','31-17','Kegiatan Penyelenggaraan SDN Banjarejo',657702000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-059','31-17','Kegiatan Penyelenggaraan SDN 01 Mojorejo',301846000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-060','31-17','Kegiatan Penyelenggaraan SDN 02 Mojorejo',798078000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-061','31-17','Kegiatan Penyelenggaraan SDN 01 Manisrejo',536593000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-062','31-17','Kegiatan Penyelenggaraan SDN 02 Manisrejo',486133000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-063','31-17','Kegiatan Penyelenggaraan SDN 03 Manisrejo',317695000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-064','31-17','Kegiatan Penyelenggaraan SDN 04 Manisrejo',446495000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-065','31-17','Kegiatan Penyelenggaraan SDN 01 Demangan',267498000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-066','31-17','Kegiatan Penyelenggaraan SDN 02 Demangan',289105000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-067','31-17','Kegiatan Penyelenggaraan SDN 01 Josenan',299741000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-068','31-17','Kegiatan Penyelenggaraan SDN 02 Josenan',298978000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-069','31-17','Kegiatan Penyelenggaraan SDN 03 Josenan',240785000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-070','31-17','Kegiatan Penyelenggaraan SDN Kejuron',189828000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-071','31-17','Kegiatan Penyelenggaraan SDN Kuncen',183014000,'jumlah lembaga yang beroperasional dengan baik',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-072','31-17','Kegiatan Dana BOS pada SMP Negeri 1',873939000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-073','31-17','Kegiatan Dana BOS pada SMP Negeri 2',800073000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-074','31-17','Kegiatan Dana BOS pada SMP Negeri 3',599835000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-075','31-17','Kegiatan Dana BOS pada SMP Negeri 4',1024135000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-076','31-17','Kegiatan Dana BOS pada SMP Negeri 5',531156000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-077','31-17','Kegiatan Dana BOS pada SMP Negeri 6',764211000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-078','31-17','Kegiatan Dana BOS pada SMP Negeri 7',958995000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-079','31-17','Kegiatan Dana BOS pada SMP Negeri 8',579513000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-080','31-17','Kegiatan Dana BOS pada SMP Negeri 9',659444000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-081','31-17','Kegiatan Dana BOS pada SMP Negeri 10',738899000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-082','31-17','Kegiatan Dana BOS pada SMP Negeri 11',697083000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-083','31-17','Kegiatan Dana BOS pada SMP Negeri 12',988205000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-084','31-17','Kegiatan Dana BOS pada SMP Negeri 13',915317000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-085','31-17','Kegiatan Dana BOS pada SMP Negeri 14',499220000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-086','31-17','Kegiatan Dana BOS pada SDN 01 Kartoharjo',320926000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-087','31-17','Kegiatan Dana BOS pada SDN 02 Kartoharjo',73536000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-088','31-17','Kegiatan Dana BOS pada SDN 03 Kartoharjo',71933000,'jumlah lembaga yang memenuhi standar pendidikan\r\n',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-089','31-17','Kegiatan Dana BOS pada SDN 01 Klegen',319645000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-090','31-17','Kegiatan Dana BOS pada SDN 02 Klegen',133726000,'jumlah  lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-091','31-17','Kegiatan Dana BOS pada SDN 03 Klegen',311283000,'jumlah lembaga yang memenuhi standar pendidikan\r\n',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-092','31-17','Kegiatan Dana BOS pada SDN 04 Klegen',101395000,'jumlah lembaga yang memenuhi standar pendidikan\r\n',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-093','31-17','Kegiatan Dana BOS pada SDN Oro Oro Ombo',262449000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-094','31-17','Kegiatan Dana BOS pada SDN 01 Rejomulyo',88981000,'jumlah lembaga yang memenuhi standar pendidikan\r\n',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-095','31-17','Kegiatan Dana BOS pada SDN 02 Rejomulyo',60282000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-096','31-17','Kegiatan Dana BOS pada SDN 01 Kanigoro',124730000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-097','31-17','Kegiatan Dana BOS pada SDN 02 Kanigoro',140700000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-098','31-17','Kegiatan Dana BOS pada SDN 03 Kanigoro',155219000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-099','31-17','Kegiatan Dana BOS pada SDN Sukosari',45845000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-100','31-17','Kegiatan Dana BOS pada SDN Pilangbango',213078000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-101','31-17','Kegiatan Dana BOS pada SDN 01 Tawangrejo',141427000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-102','31-17','Kegiatan Dana BOS pada SDN 02 Tawangrejo',93640000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-103','31-17','Kegiatan Dana BOS pada SDN Kelun',160652000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-104','31-17','Kegiatan Dana BOS pada SDN 01 Manguharjo',312775000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-105','31-17','Kegiatan Dana BOS pada SDN 01 Nambangan Lor',266739000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-106','31-17','Kegiatan Dana BOS pada SDN 02 Nambangan Lor',123256000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-107','31-17','Kegiatan Dana BOS pada SDN 01 Madiun Lor',115645000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-108','31-17','Kegiatan Dana BOS pada SDN 02 Madiun Lor',143626000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-109','31-17','Kegiatan Dana BOS pada SDN 03 Madiun Lor',435013000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-110','31-17','Kegiatan Dana BOS pada SDN 04 Madiun Lor',337500000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-111','31-17','Kegiatan Dana BOS pada SDN 05 Madiun Lor',382044000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-112','31-17','Kegiatan Dana BOS pada SDN 01 Nambangan Kidul',142596000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-113','31-17','Kegiatan Dana BOS pada SDN 02 Nambangan Kidul',99547000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-114','31-17','Kegiatan Dana BOS pada SDN 03 Nambangan Kidul',269766000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-115','31-17','Kegiatan Dana BOS pada SDN 04 Nambangan Kidul',253742000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-116','31-17','Kegiatan Dana BOS pada SDN 01 Winongo',451612000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-117','31-17','Kegiatan Dana BOS pada SDN 02 Winongo',81318000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-118','31-17','Kegiatan Dana BOS pada SDN Ngegong',120208000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-119','31-17','Kegiatan Dana BOS pada SDN Patihan',320119000,'jumlah lembaga yang memenuhi standar pendidikan',0,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-120','31-17','Kegiatan Dana BOS pada SDN 01 Pangongangan',97123000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-121','31-17','Kegiatan Dana BOS pada SDN 02 Pangongangan',276668000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-122','31-17','Kegiatan Dana BOS pada SDN Sogaten',157701000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-123','31-17','Kegiatan Dana BOS pada SDN 01 Taman',391001000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-124','31-17','Kegiatan Dana BOS pada SDN 02 Taman',58019000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-125','31-17','Kegiatan Dana BOS pada SDN 03 Taman',97397000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-126','31-17','Kegiatan Dana BOS pada SDN 01 Pandean',314294000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-127','31-17','Kegiatan Dana BOS pada SDN 02 Pandean',260329000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-128','31-17','Kegiatan Dana BOS pada SDN Banjarejo',398826000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-129','31-17','Kegiatan Dana BOS pada SDN 01 Mojorejo',123382000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-130','31-17','Kegiatan Dana BOS pada SDN 02 Mojorejo',470162000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-131','31-17','Kegiatan Dana BOS pada SDN 01 Manisrejo',312117000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-132','31-17','Kegiatan Dana BOS pada SDN 02 Manisrejo',275557000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-133','31-17','Kegiatan Dana BOS pada SDN 03 Manisrejo',154239000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-134','31-17','Kegiatan Dana BOS pada SDN 04 Manisrejo',229087000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-135','31-17','Kegiatan Dana BOS pada SDN 01 Demangan',134754000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-136','31-17','Kegiatan Dana BOS pada SDN 02 Demangan',152616000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-137','31-17','Kegiatan Dana BOS pada SDN 01 Josenan',161468000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-138','31-17','Kegiatan Dana BOS pada SDN 02 Josenan',159629000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-139','31-17','Kegiatan Dana BOS pada SDN 03 Josenan',94350000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-140','31-17','Kegiatan Dana BOS pada SDN Kejuron',63440000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-141','31-17','Kegiatan Dana BOS pada SDN Kuncen',73347000,'jumlah lembaga yang memenuhi standar pendidikan',1,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-142','31-17','Kegiatan Penerimaan Peserta Didik Baru',2147483647,'angka partisipasi murni sd smp, jumlah siswa yang memenuhi krite',71,0,NULL,'lembaga','prosentase sekolah yang mengikuti SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-143','31-17','Kegiatan Pelaksanaan Uji Coba USBN SD, SMP, Kegiatan USBN Pendidikan Agama SD dan SMP, Kegiatan USBN SD, SMP dan UN SMP',1051292000,'jumlah lembaga yang mengikuti ujicoba USBN dan UN SD dan SMP',93,0,NULL,'lembaga','prosentase sekolah yang mengikuti SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-144','31-17','Kegiatan OSN dan Cerdas Cermat SD, SMP',410527000,'jumlah siswa yang berprestasi',522,0,NULL,'siswa','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-145','31-17','Kegiatan Olimpiade Olah Raga Siswa Nasional dan Festival Lomba Seni Siswa Nasional SD dan SMP',562631000,'jumlah siswa yang berprestasi',309,0,NULL,'siswa','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-146','31-17','Kegiatan Penjaminan Mutu, Akreditasi Sekolah dan Best Practice',880380000,'jumlah lembaga yang terakreditasi',106,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-147','31-17','Kegiatan Pemberdayaan Tim Pengembang Kurikulum 2013 SD, SMP, Workshop Peningkatan Kualitas KKG dan MGMP, Komunitas Pembelajar',1035132000,'jumlah lembaga yang memahami materi pemberdayaan pengembang kuri',93,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-148','31-17','Kegiatan Pembinaan Pengembangan Gugus Sekolah TK, SD, Lomba Lingkungan Sekolah Sehat (LLSS), Gerakan Disiplin Siswa, Pengelolaan',615198000,'jumlah lembaga yang sesuai dengan SPM',106,0,NULL,'lembaga','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-151','31-17','Kegiatan Pembangunan/ Rehabilitasi Gedung Sekolah',2147483647,'jumlah gedung sekolah yang dibangun sesuai kebutuhan',7,0,NULL,'paket','prosentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-17-153','31-17','Kegiatan Pengadaan Sarana Pendidikan',2147483647,'jumlah paket',2,0,NULL,'paket','persentase sekolah yang memenuhi SNP',92,0,NULL,0,NULL,'%',NULL),('31-18-001','31-18','Kegiatan Penyelenggaraan TK Pembina',175000000,'jumlah lembaga yang beroperasional',1,0,NULL,'lembaga','lembaga PAUD yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-18-002','31-18','Kegiatan Workshop Kurikulum PAUD',410210000,'jumlah lembaga yang memahami kurikulum PAUD',169,0,NULL,'lembaga','lembaga PAUD yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-18-003','31-18','Kegiatan Pusat Kegiatan Gugus PAUD Terpadu Kota Madiun',468930000,'jumlah gugus yang berprestasi',22,0,NULL,'gugus','lembaga PAUD yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-18-004','31-18','Kegiatan Bantuan BOP PAUD',175140000,'jumlah lembaga yang mendapat BOP',169,0,NULL,'lembaga','lembaga PAUD yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-18-006','31-18','Kegiatan Rehabilitasi Bangunan PAUD',2147483647,'jumlah gedung PAUD yang direhab',1,0,NULL,'lembaga','lembaga PAUD yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-18-007','31-18','Kegiatan Pagelaran Hari Anak Nasional',595980000,'jumlah anak yang mengikuti HAN',2000,0,NULL,'anak','lembaga PAUD yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-19-001','31-19','Kegiatan Penyelenggaraan Pendidikan Kesetaraan',293790000,'jumlah peserta lulus ujian',200,0,NULL,'peserta','lembaga non formal yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-19-002','31-19','Kegiatan Pembinaan Lembaga PAUD dan PNF',390400000,'jumlah lembaga yang sesuai dengan aturan yang berlaku',230,0,NULL,'lembaga','lembaga non formal yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-19-003','31-19','Kegiatan Bimbingan Teknis Exstra Kurikuler Pembina Pramuka',609000000,'jumlah peserta yang mengikuti bimtek ekskul pembina pramuka',263,0,NULL,'peserta','lembaga non formal yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL),('31-19-004','31-19','Kegiatan Workshop Peningkatan Pengelolaan Perpustakaan Sekolah',393916000,'jumlah peserta yang memahami workshop pengelolaan perpustakaan',169,0,NULL,'peserta','lembaga non formal yang terakreditasi',5,0,NULL,0,NULL,'lembaga',NULL);
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_laporan`),
  KEY `fk_laporan_opd` (`id_opd`),
  KEY `fk_tipelaporan_dari_laporan` (`id_tipe`),
  CONSTRAINT `fk_laporan_opd` FOREIGN KEY (`id_opd`) REFERENCES `opd` (`id_opd`),
  CONSTRAINT `fk_tipelaporan_dari_laporan` FOREIGN KEY (`id_tipe`) REFERENCES `tipe_laporan` (`id_tipe`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laporan`
--

LOCK TABLES `laporan` WRITE;
/*!40000 ALTER TABLE `laporan` DISABLE KEYS */;
INSERT INTO `laporan` VALUES (20,8,5,'2019-08-03 13:49:57','2019-08-03 13:49:57'),(21,8,6,'2019-08-03 14:00:05','2019-08-03 14:00:05'),(22,8,4,'2019-08-04 00:20:33','2019-08-04 00:20:33'),(23,8,3,'2019-08-04 00:21:14','2019-08-04 00:21:14'),(24,8,9,'2019-08-04 03:10:31','2019-08-04 03:10:31'),(25,8,2,'2019-08-04 04:31:19','2019-08-04 04:31:19'),(26,8,8,'2019-08-05 01:47:20','2019-08-05 01:47:20'),(27,8,11,'2019-08-05 01:55:09','2019-08-05 01:55:09'),(28,8,10,'2019-08-05 02:01:22','2019-08-05 02:01:22'),(29,8,12,'2019-08-05 03:12:58','2019-08-05 03:12:58'),(31,8,1,'2019-08-05 06:08:01','2019-08-05 06:08:01'),(34,8,16,'2019-08-06 10:01:20','2019-08-06 10:01:20'),(35,8,13,'2019-08-06 10:02:59','2019-08-06 10:02:59'),(36,8,15,'2019-08-06 14:12:13','2019-08-06 14:12:13'),(37,8,14,'2019-08-06 14:16:51','2019-08-06 14:16:51'),(38,8,7,'2019-08-06 15:40:40','2019-08-06 15:40:40');
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `laporan_kinerja_triwulan` VALUES (22,8,4,'2019-08-04 00:20:33','2019-08-04 00:20:33','2019-08-15');
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `laporan_rb_area_perubahan` VALUES (38,8,7,'2019-08-06 15:40:40','2019-08-06 15:40:40','2019-08-06',NULL);
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `laporan_rb_fokus` VALUES (34,8,16,'2019-08-06 10:01:20','2019-08-06 10:01:20','2019-08-06',NULL);
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `laporan_rb_prioritas` VALUES (36,8,15,'2019-08-06 14:12:13','2019-08-06 14:12:13','2019-08-06',NULL);
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `laporan_rb_quick_wins` VALUES (35,8,13,'2019-08-06 10:02:59','2019-08-06 10:02:59','2019-08-06',NULL);
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `laporan_rb_zi_wbk` VALUES (37,8,14,'2019-08-06 14:16:51','2019-08-06 14:16:51','2019-08-06',NULL);
/*!40000 ALTER TABLE `laporan_rb_zi_wbk` ENABLE KEYS */;
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `monitoring_kelembagaan` VALUES (29,8,12,'2019-08-05 03:12:58','2019-08-05 03:12:58','2019-08-05');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
INSERT INTO `pelayanan_publik` VALUES (28,8,10,'2019-08-05 02:01:22','2019-08-05 02:01:22','2019-08-05');
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
  `ket` text DEFAULT NULL,
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
INSERT INTO `pelayanan_publik_opd` VALUES (7,28,5,NULL,NULL),(11,28,0.5,NULL,NULL);
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `pemantauan_tindak_lanjut` VALUES (20,8,5,'2019-08-04 04:24:30','2019-08-03 13:49:57','aaa','2019-08-14',NULL,NULL);
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
  `usulan` text DEFAULT NULL,
  `dasar_hukum` text DEFAULT NULL,
  `ket` text DEFAULT NULL,
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
  `ket` text DEFAULT NULL,
  PRIMARY KEY (`kode_program`),
  KEY `fk_relationship_34` (`id_laporan`),
  CONSTRAINT `fk_relationship_34` FOREIGN KEY (`id_laporan`) REFERENCES `realisasi_fisik` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES ('31-01',31,'Program Pelayanan Administrasi Perkantoran','Persentase terlaksananya administrasi perkantoran',100,NULL,0,NULL,12,NULL,'%',NULL),('31-02',31,'Program Pemeliharaan Barang Milik Daerah','Persentase Barang Milik Daerah dalam kondisi baik',100,NULL,0,NULL,33,NULL,'%',NULL),('31-03',31,'Program Peningkatan Sarana dan Prasarana Aparatur','Persentase pemenuhan kebutuhan sarana dan prasarana aparatur',100,NULL,0,NULL,0,NULL,'%',NULL),('31-04',31,'Program Peningkatan, Pengembangan Sistem Pelaporan Capaian Kinerja dan Keuangan','Persentase dokumen perencanaan/laporan yang disusun tepat waktu',100,NULL,0,NULL,0,NULL,'%',NULL),('31-15',31,'Program Manajemen Pelayanan Pendidikan','Pengolahan database informasi pendidikan dan evaluasi pelaporan ',100,NULL,0,NULL,0,NULL,'%',NULL),('31-16',31,'Program Peningkatan Mutu Pendidik dan Tenaga Kependidikan','Persentase Pendidik dan Tenaga Kependidikan yang Lulus Pelatihan',100,NULL,0,NULL,0,NULL,'%',NULL),('31-17',31,'Program Pendidikan Dasar','Angka Partisipasi Murni SD/SMP ',100,NULL,0,NULL,0,NULL,'%',NULL),('31-18',31,'Program Pendidikan Anak Usia Dini','Angka Partisipasi Kasar PAUD',100,NULL,0,NULL,0,NULL,'%',NULL),('31-19',31,'Program Pendidikan Non Formal','Jumlah Lembaga yang Terakreditasi',1,NULL,0,NULL,0,NULL,'lembaga',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_area_perubahan`
--

LOCK TABLES `rb_area_perubahan` WRITE;
/*!40000 ALTER TABLE `rb_area_perubahan` DISABLE KEYS */;
INSERT INTO `rb_area_perubahan` VALUES (2,38,'rincian 1'),(3,38,'rincian 2'),(4,38,'rincian 3');
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
  `ket` text DEFAULT NULL,
  KEY `fk_rbap_kegiatan_1_idx` (`id_rb_area_perubahan_program`),
  CONSTRAINT `fk_rbap_kegiatan_1` FOREIGN KEY (`id_rb_area_perubahan_program`) REFERENCES `rb_area_perubahan_program` (`id_rb_area_perubahan_program`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_area_perubahan_kegiatan`
--

LOCK TABLES `rb_area_perubahan_kegiatan` WRITE;
/*!40000 ALTER TABLE `rb_area_perubahan_kegiatan` DISABLE KEYS */;
INSERT INTO `rb_area_perubahan_kegiatan` VALUES (NULL,3,'','','',0,0,0,'a');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_area_perubahan_program`
--

LOCK TABLES `rb_area_perubahan_program` WRITE;
/*!40000 ALTER TABLE `rb_area_perubahan_program` DISABLE KEYS */;
INSERT INTO `rb_area_perubahan_program` VALUES (3,2,'Program 1.1'),(4,3,'program 2.1'),(5,3,'program 2.2'),(6,4,'program 3.1');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_fokus`
--

LOCK TABLES `rb_fokus` WRITE;
/*!40000 ALTER TABLE `rb_fokus` DISABLE KEYS */;
INSERT INTO `rb_fokus` VALUES (3,34,'ddd');
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
  `ket` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_fokus_kegiatan`
--

LOCK TABLES `rb_fokus_kegiatan` WRITE;
/*!40000 ALTER TABLE `rb_fokus_kegiatan` DISABLE KEYS */;
INSERT INTO `rb_fokus_kegiatan` VALUES (2,'','dd','','','','',NULL,0,0,''),(1,'qqq','','','','','',NULL,0,0,'ddd'),(3,'qqqq','','','','','',NULL,0,0,''),(4,'','','atta','','','',0,0,0,''),(4,'','','','','','',0,0,0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_fokus_sasaran`
--

LOCK TABLES `rb_fokus_sasaran` WRITE;
/*!40000 ALTER TABLE `rb_fokus_sasaran` DISABLE KEYS */;
INSERT INTO `rb_fokus_sasaran` VALUES (1,2,'sss','ccc'),(3,1,'fff','qqqqq'),(6,3,'sdsd','');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_prioritas`
--

LOCK TABLES `rb_prioritas` WRITE;
/*!40000 ALTER TABLE `rb_prioritas` DISABLE KEYS */;
INSERT INTO `rb_prioritas` VALUES (1,36,'');
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
  `ket` text DEFAULT NULL,
  KEY `fk_rb_prioritas_kegiatan_1_idx` (`id_rb_prioritas_sasaran`),
  CONSTRAINT `fk_rb_prioritas_kegiatan_1` FOREIGN KEY (`id_rb_prioritas_sasaran`) REFERENCES `rb_prioritas_sasaran` (`id_rb_prioritas_sasaran`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_prioritas_kegiatan`
--

LOCK TABLES `rb_prioritas_kegiatan` WRITE;
/*!40000 ALTER TABLE `rb_prioritas_kegiatan` DISABLE KEYS */;
INSERT INTO `rb_prioritas_kegiatan` VALUES (2,'','','','','','fff',0,0,0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_prioritas_sasaran`
--

LOCK TABLES `rb_prioritas_sasaran` WRITE;
/*!40000 ALTER TABLE `rb_prioritas_sasaran` DISABLE KEYS */;
INSERT INTO `rb_prioritas_sasaran` VALUES (2,1,'','');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_quick_wins`
--

LOCK TABLES `rb_quick_wins` WRITE;
/*!40000 ALTER TABLE `rb_quick_wins` DISABLE KEYS */;
INSERT INTO `rb_quick_wins` VALUES (5,35,'Menurunkan Lemak');
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
  `ket` text DEFAULT NULL,
  KEY `fk_rb_quick_wins_kegiatan_1_idx` (`id_rb_quick_wins_sasaran`),
  CONSTRAINT `fk_rb_quick_wins_kegiatan_1` FOREIGN KEY (`id_rb_quick_wins_sasaran`) REFERENCES `rb_quick_wins_sasaran` (`id_rb_quick_wins_sasaran`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_quick_wins_kegiatan`
--

LOCK TABLES `rb_quick_wins_kegiatan` WRITE;
/*!40000 ALTER TABLE `rb_quick_wins_kegiatan` DISABLE KEYS */;
INSERT INTO `rb_quick_wins_kegiatan` VALUES (13,'Mancing','','','','','',0,0,0,'aaaa'),(13,'Mukul','','','','','',0,0,0,''),(16,'Mangan','','','','','',0,0,0,''),(16,'Turu','','','','','',0,0,0,''),(16,'Nglamun','','','','','',0,0,0,''),(16,'nyambi','','','','','',0,0,0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_quick_wins_sasaran`
--

LOCK TABLES `rb_quick_wins_sasaran` WRITE;
/*!40000 ALTER TABLE `rb_quick_wins_sasaran` DISABLE KEYS */;
INSERT INTO `rb_quick_wins_sasaran` VALUES (13,5,'aaaa','sss'),(16,5,'haha','');
/*!40000 ALTER TABLE `rb_quick_wins_sasaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_zi_wbk`
--

DROP TABLE IF EXISTS `rb_zi_wbk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb_zi_wbk` (
  `id_rb_zi_wbk` int(11) NOT NULL AUTO_INCREMENT,
  `id_laporan` int(11) NOT NULL,
  `rincian` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_rb_zi_wbk`),
  KEY `fk_rb_zi_wbk_1_idx` (`id_laporan`),
  CONSTRAINT `fk_rb_zi_wbk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_rb_zi_wbk` (`id_laporan`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_zi_wbk`
--

LOCK TABLES `rb_zi_wbk` WRITE;
/*!40000 ALTER TABLE `rb_zi_wbk` DISABLE KEYS */;
INSERT INTO `rb_zi_wbk` VALUES (1,37,'dd'),(2,37,'');
/*!40000 ALTER TABLE `rb_zi_wbk` ENABLE KEYS */;
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
  `ket` text DEFAULT NULL,
  KEY `fk_rb_zi_wbk_kegiatan_1_idx` (`id_rb_zi_wbk_sasaran`),
  CONSTRAINT `fk_rb_zi_wbk_kegiatan_1` FOREIGN KEY (`id_rb_zi_wbk_sasaran`) REFERENCES `rb_zi_wbk_sasaran` (`id_rb_zi_wbk_sasaran`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_zi_wbk_kegiatan`
--

LOCK TABLES `rb_zi_wbk_kegiatan` WRITE;
/*!40000 ALTER TABLE `rb_zi_wbk_kegiatan` DISABLE KEYS */;
INSERT INTO `rb_zi_wbk_kegiatan` VALUES (1,'','','','','','',0,0,0,''),(1,'','','','','','',0,0,0,'');
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
  `id_rb_zi_wbk` int(11) NOT NULL,
  `sasaran` varchar(256) DEFAULT NULL,
  `nama_program` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_rb_zi_wbk_sasaran`),
  KEY `fk_rb_zi_wbk_sasaran_1_idx` (`id_rb_zi_wbk`),
  CONSTRAINT `fk_rb_zi_wbk_sasaran_1` FOREIGN KEY (`id_rb_zi_wbk`) REFERENCES `rb_zi_wbk` (`id_rb_zi_wbk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_zi_wbk_sasaran`
--

LOCK TABLES `rb_zi_wbk_sasaran` WRITE;
/*!40000 ALTER TABLE `rb_zi_wbk_sasaran` DISABLE KEYS */;
INSERT INTO `rb_zi_wbk_sasaran` VALUES (1,1,'zxcz','vxcv'),(2,2,'','sdasd');
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `realisasi_fisik` VALUES (31,8,1,'2019-08-05 06:08:01','2019-08-05 06:08:01',NULL,'2020-08-05');
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `rekap_pokja` VALUES (25,8,2,'2019-08-04 04:31:19','2019-08-04 04:31:19','2019-08-14');
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `rekap_tender` VALUES (23,8,3,'2019-08-04 01:09:31','2019-08-04 00:21:14','Judul Rekap Tenders','2019-08-14');
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `sotk` VALUES (26,8,8,'2019-08-05 01:47:20','2019-08-05 01:47:20','2019-08-05');
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `tatalaksana` VALUES (27,8,11,'2019-08-05 01:55:09','2019-08-05 01:55:09','2019-08-05');
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
  `ket` text DEFAULT NULL,
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
INSERT INTO `tatalaksana_opd` VALUES (144,27,0,0,0,0,0,NULL,''),(144,27,20.5,101,20.5,20,20,NULL,'haha');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temuan`
--

LOCK TABLES `temuan` WRITE;
/*!40000 ALTER TABLE `temuan` DISABLE KEYS */;
INSERT INTO `temuan` VALUES (7,20,'a'),(8,20,'b');
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
INSERT INTO `tipelaporan_per_opd` VALUES (8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10),(8,11),(8,12),(8,13),(8,14),(8,15),(8,16);
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
INSERT INTO `user` VALUES (1,1,'admin','$2y$10$xZ/LdOuXl/7Mid/amZFHPuN/AAeKXav/2YRmuFpJKpCT0R.TesCGq','2019-08-04 12:48:52','2019-08-04 12:48:52'),(2,18,'21001','$2y$10$/A7dJC5J5ZXZKLJjb9.qd.1noI4jPNZLIolkN/q5qGXgvXH0jQKrO','2019-07-30 13:00:45','2019-07-30 13:00:45'),(3,22,'10101','$2y$10$GUGvu1ZPzVlPRpfw8TzuDeLtzhQ9Ow/VlKU/szhARkTwNvoHswJE2','2019-07-30 13:01:13','2019-07-30 13:01:13'),(4,2,'40601','$2y$10$i6Te6ECW/CazF2dDJB8h5Ou8t6NbEIb9Mxy.u1QQXveGOxC6ty4R6','2019-07-30 13:01:31','2019-07-30 13:01:31'),(5,4,'10502','$2y$10$PLJtpDPY9obyeSOx/GIPge7lJhJx2GqxhjQo0HbM8GWg7GAWqbEAy','2019-07-30 12:41:20','2019-07-30 12:41:20'),(6,148,'40502','$2y$10$wovYyN0SwVcSFEsALhh.xebhg9a941NcnImvnAM6aytNeVvhRe.YO','2019-07-30 12:41:48','2019-07-30 12:41:48'),(7,23,'30601','$2y$10$dBtW66wfqZp7kuenrXEF/eygFuJ5Civqtj93SqNt1iOc.Q4vJW1wi','2019-07-30 13:06:17','2019-07-30 13:06:17'),(8,24,'20901','$2y$10$.BkMRm70SGuXGUOmYoOALeD1SDi0TN6UPdBN9iSyZ31420zVsE.eq','2019-07-30 12:45:39','2019-07-30 12:45:39'),(9,17,'10201','$2y$10$beFpPb4VkWwVC8pCd9.Kjuss19F5EQeTsXXHc.CWqW/BfmggMtYsS','2019-07-30 12:46:39','2019-07-30 12:46:39'),(10,29,'20101','$2y$10$Y1I47suJM4v7xdXgXNEfoODirpxJiCtWOEASldI2LIbw.CINthQJa','2019-07-30 13:02:15','2019-07-30 13:02:15'),(11,66,'10501','$2y$10$XbxzSWVqqP8OP1fFIqnoxegbob0uBh35tDpfQpACIiAkR/nWAKP1O','2019-07-30 12:47:14','2019-07-30 12:47:14'),(12,25,'21701','$2y$10$Xo/dS5MlFfXNKrJZc.q01.e.b8JePkQ3E34YpFXQUWJ.U/2J9U8W.','2019-07-30 12:47:38','2019-07-30 12:47:38'),(13,28,'10601','$2y$10$kS7bYUmh/Rbimoru5kstLOqY/BqHbEzGwkuAPWp1trCGbv/8fCtEq','2019-07-30 12:48:35','2019-07-30 12:48:35'),(14,19,'20501','$2y$10$Pr.zjMeGAuYLdtl1.zWw5.9/Jt55Gpw/JeeIjhgpAHQ7bn0/avgA.','2019-07-30 12:48:50','2019-07-30 12:48:50'),(15,36,'40903','$2y$10$FAv7fRRXGE4iVEAG5Cgoe.xtDHhDawj9GsjQywEESnacjbyuc/g2O','2019-07-30 12:51:57','2019-07-30 12:51:57'),(16,34,'40901','$2y$10$sqhBwNH95PCV9s1GXWJme.2BLyBrZgycLkcF7cWCVybNaGe4c5JUS','2019-07-30 12:52:17','2019-07-30 12:52:17'),(17,127,'40201','$2y$10$8CtdkCWmRQKtGjOhUxFkk.6Iye.gQ7.W.ONBKMXc4ncmJuNII5/zG','2019-07-30 12:53:03','2019-07-30 12:53:03'),(18,6,'40501','$2y$10$5O.VXWCDUKKHrvik04Lzg.Ezn7K5gvWT5tKxHKazOP7uryqXzL1LO','2019-07-30 12:53:39','2019-07-30 12:53:39'),(19,32,'40902','$2y$10$kTq90jWkv9YdeRny1tKtme2UMWBkr2Dfpb0ZFHT0FiHQl0ZzmOE6m','2019-07-30 12:54:02','2019-07-30 12:54:02'),(20,16,'20601','$2y$10$.pQdaLvnNxfn.2FrceEoX.vWR0QZuo9.iNKAwD4hf9.sja0Mf/hdm','2019-07-30 12:55:21','2019-07-30 12:55:21'),(21,143,'40701','$2y$10$LHQm4ZlXqOSiqMrUUP4n.OrTZ3x14I0SA7tuOMLF0YLsSAm/G18dC','2019-07-30 12:55:47','2019-07-30 12:55:47'),(22,27,'10401','$2y$10$P0zg54ep65QjiiPO3wQeyegX/Fh.pJoQgvR.ZSMK34Ql1eZcPVWw6','2019-07-30 12:57:43','2019-07-30 12:57:43'),(23,3,'40801','$2y$10$Mc6oBmMMoNMKUR9FJG.RYOv2agliQzNam724fbvJSh56ZtDVCnNlq','2019-07-30 13:03:57','2019-07-30 13:03:57'),(24,20,'10301','$2y$10$rUVQuJOxGrozvPIN7Lz1MuRO6gEzuQU3NOuv2/gAxwpISKxjmq3Uu','2019-07-30 13:05:05','2019-07-30 13:05:05'),(25,151,'30301','$2y$10$TPwLWu1G6X4JSwpA8Eys0uI69HJ8viTSQ8GkIgsC1v86jyee4Ip1S','2019-07-30 13:08:20','2019-07-30 13:08:20'),(26,8,'40101','$2y$10$IhCN7/VMLP3LfJ66TeASzO114.8iHdfqg6fmy5Tg38xX41GIx5y1y','2019-08-07 06:17:44','2019-08-07 06:17:44');
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

-- Dump completed on 2019-08-07 13:18:42
