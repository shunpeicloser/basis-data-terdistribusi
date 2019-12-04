-- phpmyadmin sql dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- host: 127.0.0.1
-- waktu pembuatan: 22 jul 2019 pada 13.18
-- versi server: 10.1.37-mariadb
-- versi php: 7.1.26

set sql_mode = "no_auto_value_on_zero";
set autocommit = 0;
start transaction;
set time_zone = "+00:00";


/*!40101 set @old_character_set_client=@@character_set_client */;
/*!40101 set @old_character_set_results=@@character_set_results */;
/*!40101 set @old_collation_connection=@@collation_connection */;
/*!40101 set names utf8mb4 */;

--
-- database: `report_management`
--

-- --------------------------------------------------------

--
-- struktur dari tabel `berita_acara`
--

create table `berita_acara` (
  `id_surat` int(11) not null,
  `judul_surat` varchar(64) not null,
  `id_opd` int(11) default null,
  `id_tipe` int(11) default null,
  `created_at` timestamp not null default current_timestamp on update current_timestamp,
  `surat_dari` int(11) default null,
  `no_surat` text,
  `hari` varchar(10) default null,
  `tgl` date default null,
  `jam` time default null,
  `tempat` varchar(256) default null,
  `paket_kerja` text,
  `sumber_dana` varchar(64) default null,
  `pagu` int(11) default null,
  `thn_anggaran` int(11) default null,
  `skpd` varchar(64) default null,
  `jabatan_pa_atas` varchar(32) default null,
  `nama_pa` varchar(64) default null,
  `jabatan_pa_bawah` varchar(32) default null,
  `nip_pa` char(18) default null,
  `jabatan_pokja_atas` varchar(32) default null,
  `nama_pokja` varchar(64) default null,
  `jabatan_pokja_bawah` varchar(32) default null,
  `nip_pokja` char(18) default null
) engine=innodb default charset=latin1;

-- --------------------------------------------------------

--
-- struktur dari tabel `disposisi`
--

create table `disposisi` (
  `id_disposisi` int(11) not null,
  `id_opd` int(11) not null,
  `created_at` timestamp not null default current_timestamp on update current_timestamp,
  `surat_dari` int(11) default null,
  `tgl_surat` date default null,
  `no_surat` text,
  `tgl_masuk` date default null,
  `no_agenda` varchar(16) default null,
  `perihal` text,
  `diteruskan` text,
  `isi` text
) engine=innodb default charset=latin1;

-- --------------------------------------------------------

--
-- struktur dari tabel `hasil_tender`
--

create table `hasil_tender` (
  `id_surat` int(11) not null,
  `id_hasil_tender` int(11) not null,
  `id_opd` int(11) default null,
  `id_tipe` int(11) default null,
  `created_at` timestamp not null default current_timestamp on update current_timestamp,
  `surat_dari` int(11) default null,
  `pokja` int(11) default null,
  `no_surat` text,
  `sifat` varchar(64) default null,
  `lampiran` varchar(64) default null,
  `perihal` text,
  `tgl_surat` date default null,
  `penerima_surat` text,
  `tempat_penerima` text,
  `kode_tender` decimal(8,0) default null,
  `paket_kerja` text,
  `pagu` int(11) default null,
  `total_hps` int(11) default null,
  `perangkat_daerah` varchar(64) default null,
  `nama_penyedia_jasa` varchar(64) default null,
  `alamat_perusahaan` varchar(256) default null,
  `npwp` char(15) default null,
  `harga_tawar` int(11) default null,
  `ket_harga_tawar` varchar(32) default null,
  `harga_koreksi` int(11) default null,
  `ket_harga_koreksi` varchar(32) default null,
  `harga_kontrak` int(11) default null,
  `ket_harga_kontrak` varchar(32) default null,
  `tgl_tawar` date default null,
  `jabatan` varchar(32) default null,
  `jabatan_pokja_atas` varchar(32) default null,
  `nama_pembuat` varchar(64) default null,
  `nip` char(18) default null,
  `tembusan` varchar(256) default null
) engine=innodb default charset=latin1;

-- --------------------------------------------------------

--
-- struktur dari tabel `npknd`
--

create table `npknd` (
  `id_surat` int(11) not null,
  `id_npknd` int(11) not null,
  `id_opd` int(11) default null,
  `id_tipe` int(11) default null,
  `created_at` timestamp not null default current_timestamp on update current_timestamp,
  `surat_dari` int(11) default null,
  `no_surat` text,
  `tgl_surat` date default null,
  `penerima_surat` text,
  `kepentingan` varchar(64) default null,
  `tentang` varchar(256) default null,
  `catatan` varchar(64) default null,
  `lampiran` varchar(64) default null,
  `ket` text,
  `jabatan_atas` varchar(64) default null,
  `nama` varchar(64) default null,
  `jabatan_bawah` varchar(64) default null,
  `nip` char(18) default null
) engine=innodb default charset=latin1;

-- --------------------------------------------------------

--
-- struktur dari tabel `opd`
--

create table `opd` (
  `id_opd` int(11) not null,
  `nama_opd` varchar(64) not null
) engine=innodb default charset=latin1;

-- --------------------------------------------------------

--
-- struktur dari tabel `rekap_pokja`
--

create table `rekap_pokja` (
  `id_surat` int(11) not null,
  `id_pokja` int(11) not null,
  `id_opd` int(11) default null,
  `id_tipe` int(11) default null,
  `created_at` timestamp not null default current_timestamp on update current_timestamp,
  `surat_dari` int(11) default null,
  `nama` varchar(64) default null,
  `pagu` int(11) default null,
  `jabatan_bawah` varchar(64) default null,
  `ket` text,
  `paket_kerja` text
) engine=innodb default charset=latin1;

-- --------------------------------------------------------

--
-- struktur dari tabel `rekap_tender`
--

create table `rekap_tender` (
  `id_surat` int(11) not null,
  `id_rekap_tender` int(11) not null,
  `id_opd` int(11) default null,
  `id_tipe` int(11) default null,
  `created_at` timestamp not null default current_timestamp on update current_timestamp,
  `surat_dari` int(11) default null,
  `paket_kerja` text,
  `pagu` int(11) default null,
  `nilai_hps` int(11) default null,
  `pemenang` varchar(256) default null,
  `harga_kontrak` int(11) default null,
  `presentase_thd_hps` float default null,
  `ket` text
) engine=innodb default charset=latin1;

-- --------------------------------------------------------

--
-- struktur dari tabel `surat`
--

create table `surat` (
  `id_surat` int(11) not null,
  `id_opd` int(11) not null,
  `id_tipe` int(11) not null,
  `created_at` timestamp not null default current_timestamp on update current_timestamp,
  `surat_dari` int(11) default null
) engine=innodb default charset=latin1;

-- --------------------------------------------------------

--
-- struktur dari tabel `surat_masuk`
--

create table `surat_masuk` (
  `id_surat_masuk` int(11) not null,
  `id_disposisi` int(11) not null,
  `nama_file` varchar(32) default null
) engine=innodb default charset=latin1;

-- --------------------------------------------------------

--
-- struktur dari tabel `surat_pengantar`
--

create table `surat_pengantar` (
  `id_surat` int(11) not null,
  `id_pengantar` int(11) not null,
  `id_opd` int(11) default null,
  `id_tipe` int(11) default null,
  `created_at` timestamp not null default current_timestamp on update current_timestamp,
  `surat_dari` int(11) default null,
  `tgl_surat` date default null,
  `penerima_surat` text,
  `tempat_penerima` text,
  `no_surat` text,
  `perihal` text,
  `jumlah` int(11) default null,
  `ket` text
) engine=innodb default charset=latin1;

-- --------------------------------------------------------

--
-- struktur dari tabel `tipesurat_per_opd`
--

create table `tipesurat_per_opd` (
  `id_opd` int(11) not null,
  `id_tipe` int(11) not null
) engine=innodb default charset=latin1;

-- --------------------------------------------------------

--
-- struktur dari tabel `tipe_surat`
--

create table `tipe_surat` (
  `id_tipe` int(11) not null,
  `nama_surat` varchar(32) not null
) engine=innodb default charset=latin1;

-- --------------------------------------------------------

--
-- struktur dari tabel `user`
--

create table `user` (
  `id` int(11) not null,
  `id_opd` int(11) not null,
  `username` varchar(32) default null,
  `password` char(60) default null,
  `created_at` timestamp not null default current_timestamp on update current_timestamp,
  `last_login` timestamp not null default '0000-00-00 00:00:00'
) engine=innodb default charset=latin1;

--
-- indexes for dumped tables
--

--
-- indeks untuk tabel `berita_acara`
--
alter table `berita_acara`
  add primary key (`id_surat`,`judul_surat`);

--
-- indeks untuk tabel `disposisi`
--
alter table `disposisi`
  add primary key (`id_disposisi`),
  add key `fk_disposisi` (`id_opd`);

--
-- indeks untuk tabel `hasil_tender`
--
alter table `hasil_tender`
  add primary key (`id_surat`,`id_hasil_tender`);

--
-- indeks untuk tabel `npknd`
--
alter table `npknd`
  add primary key (`id_surat`,`id_npknd`);

--
-- indeks untuk tabel `opd`
--
alter table `opd`
  add primary key (`id_opd`);

--
-- indeks untuk tabel `rekap_pokja`
--
alter table `rekap_pokja`
  add primary key (`id_surat`,`id_pokja`);

--
-- indeks untuk tabel `rekap_tender`
--
alter table `rekap_tender`
  add primary key (`id_surat`,`id_rekap_tender`);

--
-- indeks untuk tabel `surat`
--
alter table `surat`
  add primary key (`id_surat`),
  add key `fk_surat_opd` (`id_opd`),
  add key `fk_tipesurat_dari_surat` (`id_tipe`);

--
-- indeks untuk tabel `surat_masuk`
--
alter table `surat_masuk`
  add primary key (`id_surat_masuk`),
  add key `fk_surat_masuk` (`id_disposisi`);

--
-- indeks untuk tabel `surat_pengantar`
--
alter table `surat_pengantar`
  add primary key (`id_surat`,`id_pengantar`);

--
-- indeks untuk tabel `tipesurat_per_opd`
--
alter table `tipesurat_per_opd`
  add primary key (`id_opd`,`id_tipe`),
  add key `fk_tipesurat_per_opd2` (`id_tipe`);

--
-- indeks untuk tabel `tipe_surat`
--
alter table `tipe_surat`
  add primary key (`id_tipe`);

--
-- indeks untuk tabel `user`
--
alter table `user`
  add primary key (`id`),
  add key `fk_user_opd` (`id_opd`);

--
-- auto_increment untuk tabel yang dibuang
--

--
-- auto_increment untuk tabel `disposisi`
--
alter table `disposisi`
  modify `id_disposisi` int(11) not null auto_increment;

--
-- auto_increment untuk tabel `opd`
--
alter table `opd`
  modify `id_opd` int(11) not null auto_increment;

--
-- auto_increment untuk tabel `surat`
--
alter table `surat`
  modify `id_surat` int(11) not null auto_increment;

--
-- auto_increment untuk tabel `surat_masuk`
--
alter table `surat_masuk`
  modify `id_surat_masuk` int(11) not null auto_increment;

--
-- auto_increment untuk tabel `tipe_surat`
--
alter table `tipe_surat`
  modify `id_tipe` int(11) not null auto_increment;

--
-- auto_increment untuk tabel `user`
--
alter table `user`
  modify `id` int(11) not null auto_increment;

--
-- ketidakleluasaan untuk tabel pelimpahan (dumped tables)
--

--
-- ketidakleluasaan untuk tabel `berita_acara`
--
alter table `berita_acara`
  add constraint `fk_inheritance_3` foreign key (`id_surat`) references `surat` (`id_surat`);

--
-- ketidakleluasaan untuk tabel `disposisi`
--
alter table `disposisi`
  add constraint `fk_disposisi` foreign key (`id_opd`) references `opd` (`id_opd`);

--
-- ketidakleluasaan untuk tabel `hasil_tender`
--
alter table `hasil_tender`
  add constraint `fk_inheritance_5` foreign key (`id_surat`) references `surat` (`id_surat`);

--
-- ketidakleluasaan untuk tabel `npknd`
--
alter table `npknd`
  add constraint `fk_inheritance_1` foreign key (`id_surat`) references `surat` (`id_surat`);

--
-- ketidakleluasaan untuk tabel `rekap_pokja`
--
alter table `rekap_pokja`
  add constraint `fk_inheritance_6` foreign key (`id_surat`) references `surat` (`id_surat`);

--
-- ketidakleluasaan untuk tabel `rekap_tender`
--
alter table `rekap_tender`
  add constraint `fk_inheritance_2` foreign key (`id_surat`) references `surat` (`id_surat`);

--
-- ketidakleluasaan untuk tabel `surat`
--
alter table `surat`
  add constraint `fk_surat_opd` foreign key (`id_opd`) references `opd` (`id_opd`),
  add constraint `fk_tipesurat_dari_surat` foreign key (`id_tipe`) references `tipe_surat` (`id_tipe`);

--
-- ketidakleluasaan untuk tabel `surat_masuk`
--
alter table `surat_masuk`
  add constraint `fk_surat_masuk` foreign key (`id_disposisi`) references `disposisi` (`id_disposisi`);

--
-- ketidakleluasaan untuk tabel `surat_pengantar`
--
alter table `surat_pengantar`
  add constraint `fk_inheritance_4` foreign key (`id_surat`) references `surat` (`id_surat`);

--
-- ketidakleluasaan untuk tabel `tipesurat_per_opd`
--
alter table `tipesurat_per_opd`
  add constraint `fk_tipesurat_per_opd` foreign key (`id_opd`) references `opd` (`id_opd`),
  add constraint `fk_tipesurat_per_opd2` foreign key (`id_tipe`) references `tipe_surat` (`id_tipe`);

--
-- ketidakleluasaan untuk tabel `user`
--
alter table `user`
  add constraint `fk_user_opd` foreign key (`id_opd`) references `opd` (`id_opd`);
commit;

/*!40101 set character_set_client=@old_character_set_client */;
/*!40101 set character_set_results=@old_character_set_results */;
/*!40101 set collation_connection=@old_collation_connection */;
