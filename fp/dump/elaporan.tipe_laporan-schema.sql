/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE `tipe_laporan` (
  `id_tipe` int(11) NOT NULL AUTO_INCREMENT,
  `nama_laporan` varchar(64) DEFAULT NULL,
  `kode_tipe` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_tipe`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
