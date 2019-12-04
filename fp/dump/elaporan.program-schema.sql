/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

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
  CONSTRAINT `fk_relationship_34` FOREIGN KEY (`id_laporan`) REFERENCES `realisasi_fisik` (`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
