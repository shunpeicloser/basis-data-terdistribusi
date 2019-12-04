-- --------------------------------------------------------
-- Host:                         10.11.15.59
-- Server version:               5.7.27-0ubuntu0.16.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping data for table testing.auditor: ~0 rows (approximately)
DELETE FROM `auditor`;
/*!40000 ALTER TABLE `auditor` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditor` ENABLE KEYS */;

-- Dumping data for table testing.detail_rekap_tender: ~0 rows (approximately)
DELETE FROM `detail_rekap_tender`;
/*!40000 ALTER TABLE `detail_rekap_tender` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_rekap_tender` ENABLE KEYS */;

-- Dumping data for table testing.hasil_temuan: ~0 rows (approximately)
DELETE FROM `hasil_temuan`;
/*!40000 ALTER TABLE `hasil_temuan` DISABLE KEYS */;
/*!40000 ALTER TABLE `hasil_temuan` ENABLE KEYS */;

-- Dumping data for table testing.ikm: ~0 rows (approximately)
DELETE FROM `ikm`;
/*!40000 ALTER TABLE `ikm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ikm` ENABLE KEYS */;

-- Dumping data for table testing.ikm_opd: ~0 rows (approximately)
DELETE FROM `ikm_opd`;
/*!40000 ALTER TABLE `ikm_opd` DISABLE KEYS */;
/*!40000 ALTER TABLE `ikm_opd` ENABLE KEYS */;

-- Dumping data for table testing.jadwal_pelaksanaan: ~0 rows (approximately)
DELETE FROM `jadwal_pelaksanaan`;
/*!40000 ALTER TABLE `jadwal_pelaksanaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `jadwal_pelaksanaan` ENABLE KEYS */;

-- Dumping data for table testing.jadwal_pelaksanaan_opd: ~0 rows (approximately)
DELETE FROM `jadwal_pelaksanaan_opd`;
/*!40000 ALTER TABLE `jadwal_pelaksanaan_opd` DISABLE KEYS */;
/*!40000 ALTER TABLE `jadwal_pelaksanaan_opd` ENABLE KEYS */;

-- Dumping data for table testing.jenis_rb: ~0 rows (approximately)
DELETE FROM `jenis_rb`;
/*!40000 ALTER TABLE `jenis_rb` DISABLE KEYS */;
/*!40000 ALTER TABLE `jenis_rb` ENABLE KEYS */;

-- Dumping data for table testing.kegiatan: ~90 rows (approximately)
DELETE FROM `kegiatan`;
/*!40000 ALTER TABLE `kegiatan` DISABLE KEYS */;
INSERT INTO `kegiatan` (`kode_kegiatan`, `kode_program`, `pagu_renja`, `pagu_rkpd`, `pagu_ppas_draft`, `pagu_ppas_final`, `keluaran_indikator`, `keluaran_target`, `keluaran_target_rkpd`, `keluaran_target_ppas_draft`, `keluaran_target_ppas_final`, `keluaran_realisasi_anggaran`, `keluaran_realisasi_kinerja`, `keluaran_realisasi_fisik`, `keluaran_satuan`, `hasil_indikator`, `hasil_target`, `hasil_target_rkpd`, `hasil_target_ppas_draft`, `hasil_target_ppas_final`, `hasil_realisasi_anggaran`, `hasil_realisasi_kinerja`, `hasil_realisasi_fisik`, `hasil_satuan`, `ket`, `nama_kegiatan`) VALUES
	('38901001', '38901', 668041608, 668041608, 668041608, 794357750, 'jumlah peralatan, barang dan jasa', 11, 11, 11, 11, NULL, NULL, NULL, 'paket', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan penyediaan jasa, peralatan dan perlengkapan kantor'),
	('38901002', '38901', 351305840, 351305840, 351305840, 351305840, 'jumlah perjalanan dinas ke luar daerah', 9, 9, 9, 9, NULL, NULL, NULL, 'kali', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan koordinasi dan konsultasi keluar daerah'),
	('38902001', '38902', 13000000, 13000000, 13000000, 13000000, 'jumlah gedung', 1, 1, 1, 1, NULL, NULL, NULL, 'gedung', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan pemeliharaan rutin/ berkala gedung dan bangunan'),
	('38902002', '38902', 28000000, 28000000, 28000000, 31035600, 'jumlah kendaraan dinas', 28, 28, 28, 28, NULL, NULL, NULL, 'unit', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan pemeliharaan rutin/ berkala kendaraan dinas'),
	('38902003', '38902', 60000000, 60000000, 60000000, 31540000, 'jumlah sarpras kantor yang layak pakai', 1, 1, 1, 1, NULL, NULL, NULL, 'paket', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan pemeliharaan rutin/ berkala sarana prasarana kantor'),
	('38904001', '38904', 125836416, 125836416, 125836416, 96096800, 'jumlah dokumen', 12, 12, 12, 12, NULL, NULL, NULL, 'dokumen', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan penyusunan laporan capaian kinerja dan ikhtisar realisasi kinerja perangkat daerah'),
	('38915001', '38915', 265716980, 265716980, 265716980, 265716980, 'Jumlah Kegiatan', 2, 2, 2, 2, NULL, NULL, NULL, 'kali', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyelenggaraan Forum PD dan Musrenbang'),
	('38915002', '38915', 305105720, 305105720, 305105720, 305105720, 'Jumlah Dokumen yang disusun', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyusunan Rencana Kerja Pemerintah Daerah (RKPD)'),
	('38915003', '38915', 180890480, 180890480, 180890480, 180890480, 'Jumlah Dokumen yang disusun', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyusunan KUA dan PPAS'),
	('38915004', '38915', 171263240, 171263240, 171263240, 171263240, 'Jumlah Dokumen yang disusun', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyusunan KUA-P dan PPAS-P'),
	('38915005', '38915', 420669848, 420669848, 420669848, 309919848, 'jumlah dokumen', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi APBD terhadap RKPD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan penelitian dan pengembangan bidang ekonomi, sosial, budaya dan pemerintahan umum'),
	('38915006', '38915', 420669848, 420669848, 420669848, 345669848, 'jumlah dokumen', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi APBD terhadap RKPD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan penelitian dan pengembangan bidang fisik dan prasarana'),
	('38915007', '38915', 157962840, 157962840, 157962840, 157962840, 'Jumlah Pelaksanaan', 8, 8, 8, 8, NULL, NULL, NULL, 'kali kegiatan', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Bimtek/Workshop Fasilitasi Perencanaan dan Evaluasi Pembangunan Daerah.'),
	('38915008', '38915', 150450000, 150450000, 150450000, 150450000, 'Jumlah Kegiatan', 12, 12, 12, 12, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Pengembangan Sistem Informasi Perencanaan Penganggaran (SIPP).'),
	('38915009', '38915', 1048083402, 1048083402, 1048083402, 936555400, 'jumlah dokumen', 7, 7, 7, 7, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan pemerintahan umum'),
	('38915010', '38915', 698083402, 698083402, 698083402, 119094000, 'jumlah dokumen', 5, 5, 5, 5, NULL, NULL, NULL, 'dokumen', 'Persentase Pelaksanaan Program Pembangunan yang sesuai dengan Pe', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan pengendalian, monitoring dan evaluasi pembangunan'),
	('38916001', '38916', 50768640, 50768640, 50768640, 50768640, 'Jumlah Koordinasi yang dilaksankan', 5, 5, 5, 5, NULL, NULL, NULL, 'kali kegiatan', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Koordinasi Perencanaan Pembangunan Bidang Fisik dan Prasarana'),
	('38916002', '38916', 79537280, 79537280, 79537280, 79537280, 'Jumlah Dokumen yang disusun', 4, 4, 4, 4, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Monitoring dan Evaluasi Pelaksanaan Dana Alokasi Khusus (DAK)'),
	('38916003', '38916', 35768640, 35768640, 35768640, 35768640, 'Jumlah Dokumen yang disusun', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 14, 14, 14, 14, NULL, NULL, NULL, '%', NULL, 'Kegiatan Monitoring Evaluasi dan Pelaporan Rencana Tata Ruang'),
	('38916004', '38916', 35768640, 35768640, 35768640, 35768640, 'Jumlah Dokumen yang disusun', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Percepatan Pembangunan Sanitasi Pemukiman'),
	('38916005', '38916', 35768640, 35768640, 35768640, 35768640, 'JUmlah Dokumen yang disusun', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Survey Pengumpulan Data/Informasi Kebutuhan Penyusunan Dokumen Perencanaan Bidang Infrastru'),
	('38916006', '38916', 97344736, 97344736, 97344736, 220109600, 'jumlah dokumen', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi Renstra OPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan umum tata ruang dan lingkungan hidup'),
	('38916007', '38916', 97344736, 97344736, 97344736, 118422000, 'jumlah dokumen', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi Renstra OPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan sarana prasarana perkotaan'),
	('38917001', '38917', 43188480, 43188480, 43188480, 43188480, 'Jumlah Peserta Rakor', 4, 4, 4, 4, NULL, NULL, NULL, 'kali', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Fasilitasi Pengembangan Corporate Sosial Responsibility'),
	('38917002', '38917', 44532720, 44532720, 44532720, 44532720, 'Jumlah Dokumen yang disusun', 3, 3, 3, 3, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Monitoring dan Evaluasi SDGs (Sustainable Development Goals)'),
	('38917003', '38917', 14844240, 14844240, 14844240, 14844240, 'Jumlah Dokumen yang disusun', 3, 3, 3, 3, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyusunan Ekonomi Dalam Angka'),
	('38917004', '38917', 84752352, 84752352, 84752352, 135718000, 'jumlah dokumen', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi Renstra OPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan bidang ekonomi'),
	('38918001', '38918', 81476960, 81476960, 81476960, 81476960, 'Jumlah Koordinasi TKPK', 3, 3, 3, 3, NULL, NULL, NULL, 'kali', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Operasional Tim Koordinasi Penanggulangan Kemiskinan (TKPK)'),
	('38918002', '38918', 37688480, 37688480, 37688480, 37688480, 'Jumlah Dokumen PPRG yang disusun', 3, 3, 3, 3, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Pengembangan Perencanaan Penganggaran Responsif Gender (PPRG)'),
	('38918003', '38918', 101352352, 101352352, 101352352, 120276000, 'jumlah dokumen', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi Renstra OPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan bidang sosial budaya'),
	('39001001', '39001', 668041608, 668041608, 668041608, 794357750, 'jumlah peralatan, barang dan jasa', 11, 11, 11, 11, NULL, NULL, NULL, 'paket', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan penyediaan jasa, peralatan dan perlengkapan kantor'),
	('39001002', '39001', 351305840, 351305840, 351305840, 351305840, 'jumlah perjalanan dinas ke luar daerah', 9, 9, 9, 9, NULL, NULL, NULL, 'kali', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan koordinasi dan konsultasi keluar daerah'),
	('39002001', '39002', 13000000, 13000000, 13000000, 13000000, 'jumlah gedung', 1, 1, 1, 1, NULL, NULL, NULL, 'gedung', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan pemeliharaan rutin/ berkala gedung dan bangunan'),
	('39002002', '39002', 28000000, 28000000, 28000000, 31035600, 'jumlah kendaraan dinas', 28, 28, 28, 28, NULL, NULL, NULL, 'unit', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan pemeliharaan rutin/ berkala kendaraan dinas'),
	('39002003', '39002', 60000000, 60000000, 60000000, 31540000, 'jumlah sarpras kantor yang layak pakai', 1, 1, 1, 1, NULL, NULL, NULL, 'paket', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan pemeliharaan rutin/ berkala sarana prasarana kantor'),
	('39004001', '39004', 125836416, 125836416, 125836416, 96096800, 'jumlah dokumen', 12, 12, 12, 12, NULL, NULL, NULL, 'dokumen', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan penyusunan laporan capaian kinerja dan ikhtisar realisasi kinerja perangkat daerah'),
	('39015001', '39015', 265716980, 265716980, 265716980, 265716980, 'Jumlah Kegiatan', 2, 2, 2, 2, NULL, NULL, NULL, 'kali', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyelenggaraan Forum PD dan Musrenbang'),
	('39015002', '39015', 305105720, 305105720, 305105720, 305105720, 'Jumlah Dokumen yang disusun', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyusunan Rencana Kerja Pemerintah Daerah (RKPD)'),
	('39015003', '39015', 180890480, 180890480, 180890480, 180890480, 'Jumlah Dokumen yang disusun', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyusunan KUA dan PPAS'),
	('39015004', '39015', 171263240, 171263240, 171263240, 171263240, 'Jumlah Dokumen yang disusun', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyusunan KUA-P dan PPAS-P'),
	('39015005', '39015', 420669848, 420669848, 420669848, 309919848, 'jumlah dokumen', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi APBD terhadap RKPD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan penelitian dan pengembangan bidang ekonomi, sosial, budaya dan pemerintahan umum'),
	('39015006', '39015', 420669848, 420669848, 420669848, 345669848, 'jumlah dokumen', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi APBD terhadap RKPD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan penelitian dan pengembangan bidang fisik dan prasarana'),
	('39015007', '39015', 157962840, 157962840, 157962840, 157962840, 'Jumlah Pelaksanaan', 8, 8, 8, 8, NULL, NULL, NULL, 'kali kegiatan', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Bimtek/Workshop Fasilitasi Perencanaan dan Evaluasi Pembangunan Daerah.'),
	('39015008', '39015', 150450000, 150450000, 150450000, 150450000, 'Jumlah Kegiatan', 12, 12, 12, 12, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Pengembangan Sistem Informasi Perencanaan Penganggaran (SIPP).'),
	('39015009', '39015', 1048083402, 1048083402, 1048083402, 936555400, 'jumlah dokumen', 7, 7, 7, 7, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan pemerintahan umum'),
	('39015010', '39015', 698083402, 698083402, 698083402, 119094000, 'jumlah dokumen', 5, 5, 5, 5, NULL, NULL, NULL, 'dokumen', 'Persentase Pelaksanaan Program Pembangunan yang sesuai dengan Pe', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan pengendalian, monitoring dan evaluasi pembangunan'),
	('39016001', '39016', 50768640, 50768640, 50768640, 50768640, 'Jumlah Koordinasi yang dilaksankan', 5, 5, 5, 5, NULL, NULL, NULL, 'kali kegiatan', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Koordinasi Perencanaan Pembangunan Bidang Fisik dan Prasarana'),
	('39016002', '39016', 79537280, 79537280, 79537280, 79537280, 'Jumlah Dokumen yang disusun', 4, 4, 4, 4, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Monitoring dan Evaluasi Pelaksanaan Dana Alokasi Khusus (DAK)'),
	('39016003', '39016', 35768640, 35768640, 35768640, 35768640, 'Jumlah Dokumen yang disusun', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 14, 14, 14, 14, NULL, NULL, NULL, '%', NULL, 'Kegiatan Monitoring Evaluasi dan Pelaporan Rencana Tata Ruang'),
	('39016004', '39016', 35768640, 35768640, 35768640, 35768640, 'Jumlah Dokumen yang disusun', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Percepatan Pembangunan Sanitasi Pemukiman'),
	('39016005', '39016', 35768640, 35768640, 35768640, 35768640, 'JUmlah Dokumen yang disusun', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Survey Pengumpulan Data/Informasi Kebutuhan Penyusunan Dokumen Perencanaan Bidang Infrastru'),
	('39016006', '39016', 97344736, 97344736, 97344736, 220109600, 'jumlah dokumen', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi Renstra OPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan umum tata ruang dan lingkungan hidup'),
	('39016007', '39016', 97344736, 97344736, 97344736, 118422000, 'jumlah dokumen', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi Renstra OPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan sarana prasarana perkotaan'),
	('39017001', '39017', 43188480, 43188480, 43188480, 43188480, 'Jumlah Peserta Rakor', 4, 4, 4, 4, NULL, NULL, NULL, 'kali', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Fasilitasi Pengembangan Corporate Sosial Responsibility'),
	('39017002', '39017', 44532720, 44532720, 44532720, 44532720, 'Jumlah Dokumen yang disusun', 3, 3, 3, 3, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Monitoring dan Evaluasi SDGs (Sustainable Development Goals)'),
	('39017003', '39017', 14844240, 14844240, 14844240, 14844240, 'Jumlah Dokumen yang disusun', 3, 3, 3, 3, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyusunan Ekonomi Dalam Angka'),
	('39017004', '39017', 84752352, 84752352, 84752352, 135718000, 'jumlah dokumen', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi Renstra OPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan bidang ekonomi'),
	('39018001', '39018', 81476960, 81476960, 81476960, 81476960, 'Jumlah Koordinasi TKPK', 3, 3, 3, 3, NULL, NULL, NULL, 'kali', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Operasional Tim Koordinasi Penanggulangan Kemiskinan (TKPK)'),
	('39018002', '39018', 37688480, 37688480, 37688480, 37688480, 'Jumlah Dokumen PPRG yang disusun', 3, 3, 3, 3, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Pengembangan Perencanaan Penganggaran Responsif Gender (PPRG)'),
	('39018003', '39018', 101352352, 101352352, 101352352, 120276000, 'jumlah dokumen', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi Renstra OPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan bidang sosial budaya'),
	('39101001', '39101', 668041608, 668041608, 668041608, 794357750, 'jumlah peralatan, barang dan jasa', 11, 11, 11, 11, NULL, NULL, NULL, 'paket', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan penyediaan jasa, peralatan dan perlengkapan kantor'),
	('39101002', '39101', 351305840, 351305840, 351305840, 351305840, 'jumlah perjalanan dinas ke luar daerah', 9, 9, 9, 9, NULL, NULL, NULL, 'kali', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan koordinasi dan konsultasi keluar daerah'),
	('39102001', '39102', 13000000, 13000000, 13000000, 13000000, 'jumlah gedung', 1, 1, 1, 1, NULL, NULL, NULL, 'gedung', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan pemeliharaan rutin/ berkala gedung dan bangunan'),
	('39102002', '39102', 28000000, 28000000, 28000000, 31035600, 'jumlah kendaraan dinas', 28, 28, 28, 28, NULL, NULL, NULL, 'unit', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan pemeliharaan rutin/ berkala kendaraan dinas'),
	('39102003', '39102', 60000000, 60000000, 60000000, 31540000, 'jumlah sarpras kantor yang layak pakai', 1, 1, 1, 1, NULL, NULL, NULL, 'paket', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan pemeliharaan rutin/ berkala sarana prasarana kantor'),
	('39104001', '39104', 125836416, 125836416, 125836416, 96096800, 'jumlah dokumen', 12, 12, 12, 12, NULL, NULL, NULL, 'dokumen', 'nilai akuntabilitas kinerja pada bappeda', 0, 0, 0, 0, NULL, NULL, NULL, 'BB', NULL, 'kegiatan penyusunan laporan capaian kinerja dan ikhtisar realisasi kinerja perangkat daerah'),
	('39115001', '39115', 265716980, 265716980, 265716980, 265716980, 'Jumlah Kegiatan', 2, 2, 2, 2, NULL, NULL, NULL, 'kali', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyelenggaraan Forum PD dan Musrenbang'),
	('39115002', '39115', 305105720, 305105720, 305105720, 305105720, 'Jumlah Dokumen yang disusun', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyusunan Rencana Kerja Pemerintah Daerah (RKPD)'),
	('39115003', '39115', 180890480, 180890480, 180890480, 180890480, 'Jumlah Dokumen yang disusun', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyusunan KUA dan PPAS'),
	('39115004', '39115', 171263240, 171263240, 171263240, 171263240, 'Jumlah Dokumen yang disusun', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyusunan KUA-P dan PPAS-P'),
	('39115005', '39115', 420669848, 420669848, 420669848, 309919848, 'jumlah dokumen', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi APBD terhadap RKPD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan penelitian dan pengembangan bidang ekonomi, sosial, budaya dan pemerintahan umum'),
	('39115006', '39115', 420669848, 420669848, 420669848, 345669848, 'jumlah dokumen', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi APBD terhadap RKPD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan penelitian dan pengembangan bidang fisik dan prasarana'),
	('39115007', '39115', 157962840, 157962840, 157962840, 157962840, 'Jumlah Pelaksanaan', 8, 8, 8, 8, NULL, NULL, NULL, 'kali kegiatan', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Bimtek/Workshop Fasilitasi Perencanaan dan Evaluasi Pembangunan Daerah.'),
	('39115008', '39115', 150450000, 150450000, 150450000, 150450000, 'Jumlah Kegiatan', 12, 12, 12, 12, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Pengembangan Sistem Informasi Perencanaan Penganggaran (SIPP).'),
	('39115009', '39115', 1048083402, 1048083402, 1048083402, 936555400, 'jumlah dokumen', 7, 7, 7, 7, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan pemerintahan umum'),
	('39115010', '39115', 698083402, 698083402, 698083402, 119094000, 'jumlah dokumen', 5, 5, 5, 5, NULL, NULL, NULL, 'dokumen', 'Persentase Pelaksanaan Program Pembangunan yang sesuai dengan Pe', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan pengendalian, monitoring dan evaluasi pembangunan'),
	('39116001', '39116', 50768640, 50768640, 50768640, 50768640, 'Jumlah Koordinasi yang dilaksankan', 5, 5, 5, 5, NULL, NULL, NULL, 'kali kegiatan', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Koordinasi Perencanaan Pembangunan Bidang Fisik dan Prasarana'),
	('39116002', '39116', 79537280, 79537280, 79537280, 79537280, 'Jumlah Dokumen yang disusun', 4, 4, 4, 4, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Monitoring dan Evaluasi Pelaksanaan Dana Alokasi Khusus (DAK)'),
	('39116003', '39116', 35768640, 35768640, 35768640, 35768640, 'Jumlah Dokumen yang disusun', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 14, 14, 14, 14, NULL, NULL, NULL, '%', NULL, 'Kegiatan Monitoring Evaluasi dan Pelaporan Rencana Tata Ruang'),
	('39116004', '39116', 35768640, 35768640, 35768640, 35768640, 'Jumlah Dokumen yang disusun', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Percepatan Pembangunan Sanitasi Pemukiman'),
	('39116005', '39116', 35768640, 35768640, 35768640, 35768640, 'JUmlah Dokumen yang disusun', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Survey Pengumpulan Data/Informasi Kebutuhan Penyusunan Dokumen Perencanaan Bidang Infrastru'),
	('39116006', '39116', 97344736, 97344736, 97344736, 220109600, 'jumlah dokumen', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi Renstra OPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan umum tata ruang dan lingkungan hidup'),
	('39116007', '39116', 97344736, 97344736, 97344736, 118422000, 'jumlah dokumen', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi Renstra OPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan sarana prasarana perkotaan'),
	('39117001', '39117', 43188480, 43188480, 43188480, 43188480, 'Jumlah Peserta Rakor', 4, 4, 4, 4, NULL, NULL, NULL, 'kali', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Fasilitasi Pengembangan Corporate Sosial Responsibility'),
	('39117002', '39117', 44532720, 44532720, 44532720, 44532720, 'Jumlah Dokumen yang disusun', 3, 3, 3, 3, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Monitoring dan Evaluasi SDGs (Sustainable Development Goals)'),
	('39117003', '39117', 14844240, 14844240, 14844240, 14844240, 'Jumlah Dokumen yang disusun', 3, 3, 3, 3, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Penyusunan Ekonomi Dalam Angka'),
	('39117004', '39117', 84752352, 84752352, 84752352, 135718000, 'jumlah dokumen', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi Renstra OPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan bidang ekonomi'),
	('39118001', '39118', 81476960, 81476960, 81476960, 81476960, 'Jumlah Koordinasi TKPK', 3, 3, 3, 3, NULL, NULL, NULL, 'kali', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Operasional Tim Koordinasi Penanggulangan Kemiskinan (TKPK)'),
	('39118002', '39118', 37688480, 37688480, 37688480, 37688480, 'Jumlah Dokumen PPRG yang disusun', 3, 3, 3, 3, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi RKPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'Kegiatan Pengembangan Perencanaan Penganggaran Responsif Gender (PPRG)'),
	('39118003', '39118', 101352352, 101352352, 101352352, 120276000, 'jumlah dokumen', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', 'Tingkat kontribusi Renstra OPD terhadap RPJMD', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, 'kegiatan perencanaan bidang sosial budaya');
/*!40000 ALTER TABLE `kegiatan` ENABLE KEYS */;

-- Dumping data for table testing.kegiatan_rb: ~0 rows (approximately)
DELETE FROM `kegiatan_rb`;
/*!40000 ALTER TABLE `kegiatan_rb` DISABLE KEYS */;
/*!40000 ALTER TABLE `kegiatan_rb` ENABLE KEYS */;

-- Dumping data for table testing.laporan: ~3 rows (approximately)
DELETE FROM `laporan`;
/*!40000 ALTER TABLE `laporan` DISABLE KEYS */;
INSERT INTO `laporan` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`) VALUES
	(389, 290, 1, '2019-07-31 06:29:46', '2019-07-31 06:29:46'),
	(390, 290, 1, '2019-07-31 08:37:24', '2019-07-31 08:37:24'),
	(391, 290, 1, '2019-07-31 09:15:19', '2019-07-31 09:15:19');
/*!40000 ALTER TABLE `laporan` ENABLE KEYS */;

-- Dumping data for table testing.laporan_kinerja_triwulan: ~0 rows (approximately)
DELETE FROM `laporan_kinerja_triwulan`;
/*!40000 ALTER TABLE `laporan_kinerja_triwulan` DISABLE KEYS */;
/*!40000 ALTER TABLE `laporan_kinerja_triwulan` ENABLE KEYS */;

-- Dumping data for table testing.laporan_rb: ~0 rows (approximately)
DELETE FROM `laporan_rb`;
/*!40000 ALTER TABLE `laporan_rb` DISABLE KEYS */;
/*!40000 ALTER TABLE `laporan_rb` ENABLE KEYS */;

-- Dumping data for table testing.monitoring_kelembagaan: ~0 rows (approximately)
DELETE FROM `monitoring_kelembagaan`;
/*!40000 ALTER TABLE `monitoring_kelembagaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitoring_kelembagaan` ENABLE KEYS */;

-- Dumping data for table testing.opd: ~158 rows (approximately)
DELETE FROM `opd`;
/*!40000 ALTER TABLE `opd` DISABLE KEYS */;
INSERT INTO `opd` (`id_opd`, `nama_opd`, `kode_emonev`, `kode_ebud`, `kode_ekin`) VALUES
	(1, 'ADMIN', NULL, NULL, NULL),
	(284, 'BADAN KEPEGAWAIAN DAERAH', '1.18.01', '40601', '14'),
	(285, 'BADAN KESATUAN BANGSA DAN POLITIK', '1.23.01', '40801', '37'),
	(286, 'BADAN PENANGGULANGAN BENCANA DAERAH', '01.05.02', '10502', '36'),
	(287, 'BADAN PENDAPATAN DAERAH', '1.19.03', '40202', '35'),
	(288, 'BADAN PENGELOLAAN KEUANGAN DAN ASET DAERAH', '1.19.01', '40501', '13'),
	(289, 'BADAN PENGELOLAAN KEUANGAN DAN ASET DAERAH (SKPKD)', '1.19.02', NULL, NULL),
	(290, 'BADAN PERENCANAAN PEMBANGUNAN DAERAH', '1.21.01', '40101', '15'),
	(291, 'BAGIAN ADMINISTRASI PEMBANGUNAN', '1.16.01.06', NULL, '103'),
	(292, 'BAGIAN ADMINISTRASI PEMERINTAHAN UMUM', '1.16.01.01', NULL, '102'),
	(293, 'BAGIAN ADMINISTRASI PEREKONOMIAN DAN KESEJAHTERAAN RAKYAT', '1.16.01.05', NULL, '106'),
	(294, 'BAGIAN HUKUM', '1.16.01.04', NULL, '104'),
	(295, 'BAGIAN ORGANISASI', '1.16.01.02', NULL, '105'),
	(296, 'BAGIAN UMUM', '1.16.01.03', NULL, '101'),
	(297, 'DINAS KEBUDAYAAN, PARIWISATA, KEPEMUDAAN DAN OLAH RAGA', '1.13.01', '21301', '31'),
	(298, 'DINAS KEPENDUDUKAN DAN PENCATATAN SIPIL', '01.09.01', '20601', '33'),
	(299, 'DINAS KESEHATAN DAN KELUARGA BERENCANA', '01.02.01', '10201', '28'),
	(300, 'DINAS KOMUNIKASI DAN INFORMATIKA', '1.11.01', '21001', '27'),
	(301, 'DINAS LINGKUNGAN HIDUP', '01.08.01', '20501', '23'),
	(302, 'DINAS PEKERJAAN UMUM DAN TATA RUANG', '01.03.01', '10301', '26'),
	(303, 'DINAS PENANAMAN MODAL, PELAYANAN TERPADU SATU PINTU, KOPERASI DAN USAHA MIKRO', '1.12.01', '21101', '32'),
	(304, 'DINAS PENDIDIKAN', '1.01.01.02', '10101', '22'),
	(305, 'DINAS PERDAGANGAN', '02.02.01', '30601', '29'),
	(306, 'DINAS PERHUBUNGAN', '1.10.01', '20901', '24'),
	(307, 'DINAS PERPUSTAKAAN DAN KEARSIPAN', '1.14.01', '21701', '21'),
	(308, 'DINAS PERTANIAN DAN KETAHANAN PANGAN', '02.01.01', '20301', '20'),
	(309, 'DINAS PERUMAHAN DAN KAWASAN PERMUKIMAN', '01.04.01', '10401', '25'),
	(310, 'DINAS SOSIAL, PEMBERDAYAAN PEREMPUAN DAN PERLINDUNGAN ANAK', '01.06.01', '10601', '30'),
	(311, 'DINAS TENAGA KERJA', '01.07.01', '20101', '34'),
	(312, 'DPRD', '1.15.02', NULL, NULL),
	(313, 'INSPEKTORAT DAERAH', '1.20.01', '40301', '12'),
	(314, 'KECAMATAN KARTOHARJO', '1.22.01', '40902', '51'),
	(315, 'KECAMATAN KARTOHARJO', '1.22.01.01', NULL, NULL),
	(316, 'KECAMATAN MANGUHARJO', '1.22.02', '40901', '52'),
	(317, 'KECAMATAN MANGUHARJO', '1.22.02.01', NULL, NULL),
	(318, 'KECAMATAN TAMAN', '1.22.03', '40903', '53'),
	(319, 'KECAMATAN TAMAN', '1.22.03.01', NULL, NULL),
	(320, 'KELURAHAN BANJAREJO', '1.22.03.04', NULL, NULL),
	(321, 'KELURAHAN DEMANGAN', '1.22.03.09', NULL, NULL),
	(322, 'KELURAHAN JOSENAN', '1.22.03.08', NULL, NULL),
	(323, 'KELURAHAN KANIGORO', '1.22.01.10', NULL, NULL),
	(324, 'KELURAHAN KARTOHARJO', '1.22.01.03', NULL, NULL),
	(325, 'KELURAHAN KEJURON', '1.22.03.07', NULL, NULL),
	(326, 'KELURAHAN KELUN', '1.22.01.09', NULL, NULL),
	(327, 'KELURAHAN KLEGEN', '1.22.01.04', NULL, NULL),
	(328, 'KELURAHAN KUNCEN', '1.22.03.05', NULL, NULL),
	(329, 'KELURAHAN MADIUN LOR', '1.22.02.07', NULL, NULL),
	(330, 'KELURAHAN MANGUHARJO', '1.22.02.02', NULL, NULL),
	(331, 'KELURAHAN MANISREJO', '1.22.03.06', NULL, NULL),
	(332, 'KELURAHAN MOJOREJO', '1.22.03.02', NULL, NULL),
	(333, 'KELURAHAN NAMBANGAN KIDUL', '1.22.02.10', NULL, NULL),
	(334, 'KELURAHAN NAMBANGAN LOR', '1.22.02.09', NULL, NULL),
	(335, 'KELURAHAN NGEGONG', '1.22.02.05', NULL, NULL),
	(336, 'KELURAHAN ORO - ORO OMBO', '1.22.01.02', NULL, NULL),
	(337, 'KELURAHAN PANDEAN', '1.22.03.03', NULL, NULL),
	(338, 'KELURAHAN PANGONGANGAN', '1.22.02.08', NULL, NULL),
	(339, 'KELURAHAN PATIHAN', '1.22.02.04', NULL, NULL),
	(340, 'KELURAHAN PILANG BANGO', '1.22.01.07', NULL, NULL),
	(341, 'KELURAHAN REJOMULYO', '1.22.01.05', NULL, NULL),
	(342, 'KELURAHAN SOGATEN', '1.22.02.03', NULL, NULL),
	(343, 'KELURAHAN SUKOSARI', '1.22.01.06', NULL, NULL),
	(344, 'KELURAHAN TAMAN', '1.22.03.10', NULL, NULL),
	(345, 'KELURAHAN TAWANG REJO', '1.22.01.08', NULL, NULL),
	(346, 'KELURAHAN WINONGO', '1.22.02.06', NULL, NULL),
	(347, 'RUMAH SAKIT UMUM DAERAH', '01.02.02', '10202', '17'),
	(348, 'SATUAN POLISI PAMONG PRAJA', '01.05.01', '10501', '16'),
	(349, 'SD CABANG DINAS KECAMATAN KARTOHARJO', '1.01.01.03', NULL, NULL),
	(350, 'SD CABANG DINAS KECAMATAN MANGUHARJO', '1.01.01.04', NULL, NULL),
	(351, 'SD CABANG DINAS KECAMATAN TAMAN', '1.01.01.05', NULL, NULL),
	(352, 'SDN 01 DEMANGAN', '1.01.01.69', NULL, NULL),
	(353, 'SDN 01 JOSENAN', '1.01.01.71', NULL, NULL),
	(354, 'SDN 01 KANIGORO', '1.01.01.30', NULL, NULL),
	(355, 'SDN 01 KARTOHARJO', '1.01.01.20', NULL, NULL),
	(356, 'SDN 01 KLEGEN', '1.01.01.23', NULL, NULL),
	(357, 'SDN 01 MADIUN LOR', '1.01.01.41', NULL, NULL),
	(358, 'SDN 01 MANGUHARJO', '1.01.01.38', NULL, NULL),
	(359, 'SDN 01 MANISREJO', '1.01.01.65', NULL, NULL),
	(360, 'SDN 01 MOJOREJO', '1.01.01.63', NULL, NULL),
	(361, 'SDN 01 NAMBANGAN KIDUL', '1.01.01.46', NULL, NULL),
	(362, 'SDN 01 NAMBANGAN LOR', '1.01.01.39', NULL, NULL),
	(363, 'SDN 01 PANDEAN', '1.01.01.60', NULL, NULL),
	(364, 'SDN 01 PANGONGANGAN', '1.01.01.54', NULL, NULL),
	(365, 'SDN 01 REJOMULYO', '1.01.01.28', NULL, NULL),
	(366, 'SDN 01 TAMAN', '1.01.01.57', NULL, NULL),
	(367, 'SDN 01 TAWANGREJO', '1.01.01.35', NULL, NULL),
	(368, 'SDN 01 WINONGO', '1.01.01.50', NULL, NULL),
	(369, 'SDN 02 DEMANGAN', '1.01.01.70', NULL, NULL),
	(370, 'SDN 02 JOSENAN', '1.01.01.72', NULL, NULL),
	(371, 'SDN 02 KANIGORO', '1.01.01.31', NULL, NULL),
	(372, 'SDN 02 KARTOHARJO', '1.01.01.21', NULL, NULL),
	(373, 'SDN 02 KLEGEN', '1.01.01.24', NULL, NULL),
	(374, 'SDN 02 MADIUN LOR', '1.01.01.42', NULL, NULL),
	(375, 'SDN 02 MANISREJO', '1.01.01.66', NULL, NULL),
	(376, 'SDN 02 MOJOREJO', '1.01.01.64', NULL, NULL),
	(377, 'SDN 02 NAMBANGAN KIDUL', '1.01.01.47', NULL, NULL),
	(378, 'SDN 02 NAMBANGAN LOR', '1.01.01.40', NULL, NULL),
	(379, 'SDN 02 PANDEAN', '1.01.01.61', NULL, NULL),
	(380, 'SDN 02 PANGONGANGAN', '1.01.01.55', NULL, NULL),
	(381, 'SDN 02 REJOMULYO', '1.01.01.29', NULL, NULL),
	(382, 'SDN 02 TAMAN', '1.01.01.58', NULL, NULL),
	(383, 'SDN 02 TAWANGREJO', '1.01.01.36', NULL, NULL),
	(384, 'SDN 02 WINONGO', '1.01.01.51', NULL, NULL),
	(385, 'SDN 03 JOSENAN', '1.01.01.73', NULL, NULL),
	(386, 'SDN 03 KANIGORO', '1.01.01.32', NULL, NULL),
	(387, 'SDN 03 KARTOHARJO', '1.01.01.22', NULL, NULL),
	(388, 'SDN 03 KLEGEN', '1.01.01.25', NULL, NULL),
	(389, 'SDN 03 MADIUN LOR', '1.01.01.43', NULL, NULL),
	(390, 'SDN 03 MANISREJO', '1.01.01.67', NULL, NULL),
	(391, 'SDN 03 NAMBANGAN KIDUL', '1.01.01.48', NULL, NULL),
	(392, 'SDN 03 TAMAN', '1.01.01.59', NULL, NULL),
	(393, 'SDN 04 KLEGEN', '1.01.01.26', NULL, NULL),
	(394, 'SDN 04 MADIUN LOR', '1.01.01.44', NULL, NULL),
	(395, 'SDN 04 MANISREJO', '1.01.01.68', NULL, NULL),
	(396, 'SDN 04 NAMBANGAN KIDUL', '1.01.01.49', NULL, NULL),
	(397, 'SDN 05 MADIUN LOR', '1.01.01.45', NULL, NULL),
	(398, 'SDN BANJAREJO', '1.01.01.62', NULL, NULL),
	(399, 'SDN KEJURON', '1.01.01.74', NULL, NULL),
	(400, 'SDN KELUN', '1.01.01.37', NULL, NULL),
	(401, 'SDN KUNCEN', '1.01.01.75', NULL, NULL),
	(402, 'SDN NGEGONG', '1.01.01.52', NULL, NULL),
	(403, 'SDN ORO ORO OMBO', '1.01.01.27', NULL, NULL),
	(404, 'SDN PATIHAN', '1.01.01.53', NULL, NULL),
	(405, 'SDN PILANGBANGO', '1.01.01.34', NULL, NULL),
	(406, 'SDN SOGATEN', '1.01.01.56', NULL, NULL),
	(407, 'SDN SUKOSARI', '1.01.01.33', NULL, NULL),
	(408, 'SEKRETARIAT DAERAH', '1.16.01', 'sakjane 40101', '10'),
	(409, 'SEKRETARIAT DPRD', '1.17.01', '40201', '11'),
	(410, 'SMP NEGERI 01', '1.01.01.06', NULL, NULL),
	(411, 'SMP NEGERI 02', '1.01.01.07', NULL, NULL),
	(412, 'SMP NEGERI 03', '1.01.01.08', NULL, NULL),
	(413, 'SMP NEGERI 04', '1.01.01.09', NULL, NULL),
	(414, 'SMP NEGERI 05', '1.01.01.10', NULL, NULL),
	(415, 'SMP NEGERI 06', '1.01.01.11', NULL, NULL),
	(416, 'SMP NEGERI 07', '1.01.01.12', NULL, NULL),
	(417, 'SMP NEGERI 08', '1.01.01.13', NULL, NULL),
	(418, 'SMP NEGERI 09', '1.01.01.14', NULL, NULL),
	(419, 'SMP NEGERI 10', '1.01.01.15', NULL, NULL),
	(420, 'SMP NEGERI 11', '1.01.01.16', NULL, NULL),
	(421, 'SMP NEGERI 12', '1.01.01.17', NULL, NULL),
	(422, 'SMP NEGERI 13', '1.01.01.18', NULL, NULL),
	(423, 'SMP NEGERI 14', '1.01.01.19', NULL, NULL),
	(424, 'WALIKOTA DAN WAKIL WALIKOTA', '1.15.01', NULL, NULL),
	(425, 'INSPEKTORAT', NULL, '40701', NULL),
	(426, 'BADAN ADMINISTRASI PEMERINTAH UMUM', NULL, '4010104', NULL),
	(427, 'BAGIAN UMUM SEKRETARIAT DAERAH', NULL, '40503', NULL),
	(428, 'BAGIAN HUKUM SEKRETARIAT DAERAH', NULL, '40504', NULL),
	(429, 'BAGIAN ADMINISTRASI PEREKONOMIAN DAN KESEJAHTERAAN RAKYAT SEKRETARIAT DAERAH', NULL, '40505', NULL),
	(430, 'BAGIAN ORGANISASI SEKRETARIAT DAERAH', NULL, '40502', NULL),
	(431, 'BAGIAN ADMINISTRASI PEMBANGUNAN SEKRETARIAT DAERAH', NULL, '40506', NULL),
	(432, 'BADAN PERENCANAAN PEMBANGUNAN DAERAH KOTA MADIUN', NULL, '40401', NULL),
	(433, 'DINAS PERTANIAN DAN KETAHANAN PANGAN KOTA MADIUN', NULL, '30301', NULL),
	(434, 'DINAS PENANAMAN MODAL, PELAYANAN TERPADU SATU PINTU, KOPERASI DAN USAHA MIKRO KOTA MADIUN', NULL, '21201', NULL),
	(435, 'DINAS KEBUDAYAAN, PARIWISATA, KEPEMUDAAN DAN OLAH RAGA KOTA MADIUN', NULL, '21601', NULL),
	(436, 'BAGIAN ADMINISTRASI PEMBANGUNAN SEKRETARIAT DAERAH', NULL, '4010101', NULL),
	(437, 'BAGIAN UMUM SEKRETARIAT DAERAH', NULL, '4010102', NULL),
	(438, 'BAGIAN ADMINISTRASI PEREKONOMIAN DAN KESEJAHTERAAN RAKYAT SEKRETARIAT DAERAH', NULL, '4010103', NULL),
	(439, 'BAGIAN HUKUM SEKRETARIAT DAERAH', NULL, '4010105', NULL),
	(440, 'BAGIAN ORGANISASI SEKRETARIAT DAERAH', NULL, '4010106', NULL);
/*!40000 ALTER TABLE `opd` ENABLE KEYS */;

-- Dumping data for table testing.paket_kerja: ~0 rows (approximately)
DELETE FROM `paket_kerja`;
/*!40000 ALTER TABLE `paket_kerja` DISABLE KEYS */;
/*!40000 ALTER TABLE `paket_kerja` ENABLE KEYS */;

-- Dumping data for table testing.pelayanan_publik: ~0 rows (approximately)
DELETE FROM `pelayanan_publik`;
/*!40000 ALTER TABLE `pelayanan_publik` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelayanan_publik` ENABLE KEYS */;

-- Dumping data for table testing.pelayanan_publik_opd: ~0 rows (approximately)
DELETE FROM `pelayanan_publik_opd`;
/*!40000 ALTER TABLE `pelayanan_publik_opd` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelayanan_publik_opd` ENABLE KEYS */;

-- Dumping data for table testing.pemantauan_tindak_lanjut: ~0 rows (approximately)
DELETE FROM `pemantauan_tindak_lanjut`;
/*!40000 ALTER TABLE `pemantauan_tindak_lanjut` DISABLE KEYS */;
/*!40000 ALTER TABLE `pemantauan_tindak_lanjut` ENABLE KEYS */;

-- Dumping data for table testing.permasalahan_kelembagaan: ~0 rows (approximately)
DELETE FROM `permasalahan_kelembagaan`;
/*!40000 ALTER TABLE `permasalahan_kelembagaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `permasalahan_kelembagaan` ENABLE KEYS */;

-- Dumping data for table testing.program: ~21 rows (approximately)
DELETE FROM `program`;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` (`kode_program`, `id_laporan`, `nama_program`, `capaian_indikator`, `capaian_target`, `capaian_target_rkpd`, `capaian_target_ppas_draft`, `capaian_target_ppas_final`, `capaian_realisasi_anggaran`, `capaian_realisasi_kinerja`, `capaian_realisasi_fisik`, `capaian_satuan`, `pagu_rkpd`, `pagu_renja`) VALUES
	('38901', 389, 'program pelayanan administrasi perkantoran', 'Persentase Terlaksananya Administrasi Perkantoran', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, NULL),
	('38902', 389, 'program pemeliharaan barang milik daerah', 'Persentase Barang Inventaris Kantor dalam Kondisi Baik', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, NULL),
	('38904', 389, 'program peningkatan pengembangan sistem pelaporan capaian kinerja dan keuangan', 'Persentase Dokumen Perencanaan/ Laporan yang disusun tepat waktu', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, NULL),
	('38915', 389, 'program perencanaan pembangunan daerah', 'Jumlah dokumen perencanaan pembangunan yang mengakomodir kepenti', 12, 12, 12, 12, NULL, NULL, NULL, 'dokumen', NULL, NULL),
	('38916', 389, 'program perencanaan pembangunan prasarana wilayah', 'Jumlah dokumen perencanaan pembangunan prasarana wilayah', 3, 3, 3, 3, NULL, NULL, NULL, 'dokumen', NULL, NULL),
	('38917', 389, 'program perencanaan pembangunan ekonomi', 'Jumlah dokumen perencanaan pembangunan bidang ekonomi', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', NULL, NULL),
	('38918', 389, 'program perencanaan pembangunan bidang sosial budaya', 'Jumlah dokumen perencanaan pembangunan bidang sosial budaya', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', NULL, NULL),
	('39001', 390, 'program pelayanan administrasi perkantoran', 'Persentase Terlaksananya Administrasi Perkantoran', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, NULL),
	('39002', 390, 'program pemeliharaan barang milik daerah', 'Persentase Barang Inventaris Kantor dalam Kondisi Baik', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, NULL),
	('39004', 390, 'program peningkatan pengembangan sistem pelaporan capaian kinerja dan keuangan', 'Persentase Dokumen Perencanaan/ Laporan yang disusun tepat waktu', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, NULL),
	('39015', 390, 'program perencanaan pembangunan daerah', 'Jumlah dokumen perencanaan pembangunan yang mengakomodir kepenti', 12, 12, 12, 12, NULL, NULL, NULL, 'dokumen', NULL, NULL),
	('39016', 390, 'program perencanaan pembangunan prasarana wilayah', 'Jumlah dokumen perencanaan pembangunan prasarana wilayah', 3, 3, 3, 3, NULL, NULL, NULL, 'dokumen', NULL, NULL),
	('39017', 390, 'program perencanaan pembangunan ekonomi', 'Jumlah dokumen perencanaan pembangunan bidang ekonomi', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', NULL, NULL),
	('39018', 390, 'program perencanaan pembangunan bidang sosial budaya', 'Jumlah dokumen perencanaan pembangunan bidang sosial budaya', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', NULL, NULL),
	('39101', 391, 'program pelayanan administrasi perkantoran', 'Persentase Terlaksananya Administrasi Perkantoran', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, NULL),
	('39102', 391, 'program pemeliharaan barang milik daerah', 'Persentase Barang Inventaris Kantor dalam Kondisi Baik', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, NULL),
	('39104', 391, 'program peningkatan pengembangan sistem pelaporan capaian kinerja dan keuangan', 'Persentase Dokumen Perencanaan/ Laporan yang disusun tepat waktu', 100, 100, 100, 100, NULL, NULL, NULL, '%', NULL, NULL),
	('39115', 391, 'program perencanaan pembangunan daerah', 'Jumlah dokumen perencanaan pembangunan yang mengakomodir kepenti', 12, 12, 12, 12, NULL, NULL, NULL, 'dokumen', NULL, NULL),
	('39116', 391, 'program perencanaan pembangunan prasarana wilayah', 'Jumlah dokumen perencanaan pembangunan prasarana wilayah', 3, 3, 3, 3, NULL, NULL, NULL, 'dokumen', NULL, NULL),
	('39117', 391, 'program perencanaan pembangunan ekonomi', 'Jumlah dokumen perencanaan pembangunan bidang ekonomi', 1, 1, 1, 1, NULL, NULL, NULL, 'dokumen', NULL, NULL),
	('39118', 391, 'program perencanaan pembangunan bidang sosial budaya', 'Jumlah dokumen perencanaan pembangunan bidang sosial budaya', 2, 2, 2, 2, NULL, NULL, NULL, 'dokumen', NULL, NULL);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;

-- Dumping data for table testing.program_rb: ~0 rows (approximately)
DELETE FROM `program_rb`;
/*!40000 ALTER TABLE `program_rb` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_rb` ENABLE KEYS */;

-- Dumping data for table testing.realisasi_fisik: ~3 rows (approximately)
DELETE FROM `realisasi_fisik`;
/*!40000 ALTER TABLE `realisasi_fisik` DISABLE KEYS */;
INSERT INTO `realisasi_fisik` (`id_laporan`, `id_opd`, `id_tipe`, `created_at`, `updated_at`, `tgl`) VALUES
	(389, 290, 1, '2019-07-31 06:29:46', '2019-07-31 06:29:46', '2020-08-05'),
	(390, 290, 1, '2019-07-31 08:37:24', '2019-07-31 08:37:24', '0000-00-00'),
	(391, 290, 1, '2019-07-31 09:15:19', '2019-07-31 09:15:19', '2020-07-07');
/*!40000 ALTER TABLE `realisasi_fisik` ENABLE KEYS */;

-- Dumping data for table testing.rekap_pokja: ~0 rows (approximately)
DELETE FROM `rekap_pokja`;
/*!40000 ALTER TABLE `rekap_pokja` DISABLE KEYS */;
/*!40000 ALTER TABLE `rekap_pokja` ENABLE KEYS */;

-- Dumping data for table testing.rekap_tender: ~0 rows (approximately)
DELETE FROM `rekap_tender`;
/*!40000 ALTER TABLE `rekap_tender` DISABLE KEYS */;
/*!40000 ALTER TABLE `rekap_tender` ENABLE KEYS */;

-- Dumping data for table testing.sotk: ~0 rows (approximately)
DELETE FROM `sotk`;
/*!40000 ALTER TABLE `sotk` DISABLE KEYS */;
/*!40000 ALTER TABLE `sotk` ENABLE KEYS */;

-- Dumping data for table testing.sotk_opd: ~0 rows (approximately)
DELETE FROM `sotk_opd`;
/*!40000 ALTER TABLE `sotk_opd` DISABLE KEYS */;
/*!40000 ALTER TABLE `sotk_opd` ENABLE KEYS */;

-- Dumping data for table testing.tatalaksana: ~0 rows (approximately)
DELETE FROM `tatalaksana`;
/*!40000 ALTER TABLE `tatalaksana` DISABLE KEYS */;
/*!40000 ALTER TABLE `tatalaksana` ENABLE KEYS */;

-- Dumping data for table testing.tatalaksana_opd: ~0 rows (approximately)
DELETE FROM `tatalaksana_opd`;
/*!40000 ALTER TABLE `tatalaksana_opd` DISABLE KEYS */;
/*!40000 ALTER TABLE `tatalaksana_opd` ENABLE KEYS */;

-- Dumping data for table testing.temuan: ~0 rows (approximately)
DELETE FROM `temuan`;
/*!40000 ALTER TABLE `temuan` DISABLE KEYS */;
/*!40000 ALTER TABLE `temuan` ENABLE KEYS */;

-- Dumping data for table testing.tipelaporan_per_opd: ~2 rows (approximately)
DELETE FROM `tipelaporan_per_opd`;
/*!40000 ALTER TABLE `tipelaporan_per_opd` DISABLE KEYS */;
INSERT INTO `tipelaporan_per_opd` (`id_opd`, `id_tipe`) VALUES
	(287, 1),
	(290, 1);
/*!40000 ALTER TABLE `tipelaporan_per_opd` ENABLE KEYS */;

-- Dumping data for table testing.tipe_laporan: ~0 rows (approximately)
DELETE FROM `tipe_laporan`;
/*!40000 ALTER TABLE `tipe_laporan` DISABLE KEYS */;
INSERT INTO `tipe_laporan` (`id_tipe`, `nama_laporan`, `kode_tipe`) VALUES
	(1, 'Realisasi Fisik', 'realisasi_fisik');
/*!40000 ALTER TABLE `tipe_laporan` ENABLE KEYS */;

-- Dumping data for table testing.user: ~28 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `id_opd`, `username`, `password`, `created_at`, `last_login`) VALUES
	(1, 1, 'admin', '$2y$10$xZ/LdOuXl/7Mid/amZFHPuN/AAeKXav/2YRmuFpJKpCT0R.TesCGq', '2019-07-30 20:17:35', '2019-07-30 20:17:35'),
	(2, 287, 'bpd', '$2y$10$0v8M4fj49cPYs68IL/c9/O2IG8dsj/DZc9nvnJiVGh10iUG5RW2N6', '2019-07-30 14:49:47', '2019-07-30 14:49:47'),
	(3, 290, 'bappeda', '$2y$10$5A1Q2/fNV27TSC6HnZoKFeVy.FnOKv8lLOmd6BLMKeNDWFw8ZeevW', '2019-07-30 13:24:48', '2019-07-30 13:24:48'),
	(4, 300, '21001', '$2y$10$/A7dJC5J5ZXZKLJjb9.qd.1noI4jPNZLIolkN/q5qGXgvXH0jQKrO', '2019-07-30 20:00:45', '2019-07-30 20:00:45'),
	(5, 304, '10101', '$2y$10$GUGvu1ZPzVlPRpfw8TzuDeLtzhQ9Ow/VlKU/szhARkTwNvoHswJE2', '2019-07-30 20:01:13', '2019-07-30 20:01:13'),
	(6, 284, '40601', '$2y$10$i6Te6ECW/CazF2dDJB8h5Ou8t6NbEIb9Mxy.u1QQXveGOxC6ty4R6', '2019-07-30 20:01:31', '2019-07-30 20:01:31'),
	(7, 286, '10502', '$2y$10$PLJtpDPY9obyeSOx/GIPge7lJhJx2GqxhjQo0HbM8GWg7GAWqbEAy', '2019-07-30 19:41:20', '2019-07-30 19:41:20'),
	(8, 287, '40502', '$2y$10$wovYyN0SwVcSFEsALhh.xebhg9a941NcnImvnAM6aytNeVvhRe.YO', '2019-07-30 19:41:48', '2019-07-30 19:41:48'),
	(9, 305, '30601', '$2y$10$dBtW66wfqZp7kuenrXEF/eygFuJ5Civqtj93SqNt1iOc.Q4vJW1wi', '2019-07-30 20:06:17', '2019-07-30 20:06:17'),
	(10, 306, '20901', '$2y$10$.BkMRm70SGuXGUOmYoOALeD1SDi0TN6UPdBN9iSyZ31420zVsE.eq', '2019-07-30 19:45:39', '2019-07-30 19:45:39'),
	(11, 299, '10201', '$2y$10$beFpPb4VkWwVC8pCd9.Kjuss19F5EQeTsXXHc.CWqW/BfmggMtYsS', '2019-07-30 19:46:39', '2019-07-30 19:46:39'),
	(12, 311, '20101', '$2y$10$Y1I47suJM4v7xdXgXNEfoODirpxJiCtWOEASldI2LIbw.CINthQJa', '2019-07-30 20:02:15', '2019-07-30 20:02:15'),
	(13, 348, '10501', '$2y$10$XbxzSWVqqP8OP1fFIqnoxegbob0uBh35tDpfQpACIiAkR/nWAKP1O', '2019-07-30 19:47:14', '2019-07-30 19:47:14'),
	(14, 307, '21701', '$2y$10$Xo/dS5MlFfXNKrJZc.q01.e.b8JePkQ3E34YpFXQUWJ.U/2J9U8W.', '2019-07-30 19:47:38', '2019-07-30 19:47:38'),
	(15, 310, '10601', '$2y$10$kS7bYUmh/Rbimoru5kstLOqY/BqHbEzGwkuAPWp1trCGbv/8fCtEq', '2019-07-30 19:48:35', '2019-07-30 19:48:35'),
	(16, 301, '20501', '$2y$10$Pr.zjMeGAuYLdtl1.zWw5.9/Jt55Gpw/JeeIjhgpAHQ7bn0/avgA.', '2019-07-30 19:48:50', '2019-07-30 19:48:50'),
	(17, 318, '40903', '$2y$10$FAv7fRRXGE4iVEAG5Cgoe.xtDHhDawj9GsjQywEESnacjbyuc/g2O', '2019-07-30 19:51:57', '2019-07-30 19:51:57'),
	(18, 316, '40901', '$2y$10$sqhBwNH95PCV9s1GXWJme.2BLyBrZgycLkcF7cWCVybNaGe4c5JUS', '2019-07-30 19:52:17', '2019-07-30 19:52:17'),
	(19, 409, '40201', '$2y$10$8CtdkCWmRQKtGjOhUxFkk.6Iye.gQ7.W.ONBKMXc4ncmJuNII5/zG', '2019-07-30 19:53:03', '2019-07-30 19:53:03'),
	(20, 288, '40501', '$2y$10$5O.VXWCDUKKHrvik04Lzg.Ezn7K5gvWT5tKxHKazOP7uryqXzL1LO', '2019-07-30 19:53:39', '2019-07-30 19:53:39'),
	(21, 314, '40902', '$2y$10$kTq90jWkv9YdeRny1tKtme2UMWBkr2Dfpb0ZFHT0FiHQl0ZzmOE6m', '2019-07-30 19:54:02', '2019-07-30 19:54:02'),
	(22, 298, '20601', '$2y$10$.pQdaLvnNxfn.2FrceEoX.vWR0QZuo9.iNKAwD4hf9.sja0Mf/hdm', '2019-07-30 19:55:21', '2019-07-30 19:55:21'),
	(23, 425, '40301', '$2y$10$LHQm4ZlXqOSiqMrUUP4n.OrTZ3x14I0SA7tuOMLF0YLsSAm/G18dC', '2019-07-30 19:55:47', '2019-07-30 19:55:47'),
	(24, 309, '10401', '$2y$10$P0zg54ep65QjiiPO3wQeyegX/Fh.pJoQgvR.ZSMK34Ql1eZcPVWw6', '2019-07-30 19:57:43', '2019-07-30 19:57:43'),
	(25, 285, '40801', '$2y$10$Mc6oBmMMoNMKUR9FJG.RYOv2agliQzNam724fbvJSh56ZtDVCnNlq', '2019-07-30 20:03:57', '2019-07-30 20:03:57'),
	(26, 302, '10301', '$2y$10$rUVQuJOxGrozvPIN7Lz1MuRO6gEzuQU3NOuv2/gAxwpISKxjmq3Uu', '2019-07-30 20:05:05', '2019-07-30 20:05:05'),
	(27, 433, '30301', '$2y$10$TPwLWu1G6X4JSwpA8Eys0uI69HJ8viTSQ8GkIgsC1v86jyee4Ip1S', '2019-07-30 20:08:20', '2019-07-30 20:08:20'),
	(28, 290, '40101', '$2y$10$IhCN7/VMLP3LfJ66TeASzO114.8iHdfqg6fmy5Tg38xX41GIx5y1y', '2019-07-31 09:14:48', '2019-07-31 09:14:48');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
