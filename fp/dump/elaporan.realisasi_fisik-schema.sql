/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

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
