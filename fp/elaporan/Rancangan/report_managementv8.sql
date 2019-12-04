/*==============================================================*/
/* dbms name:      mysql 5.0                                    */
/* created on:     8/1/2019 2:47:24 pm                          */
/*==============================================================*/


drop table if exists auditor;

drop table if exists detail_laporan_kinerja_triwulan;

drop table if exists detail_rekap_pokja;

drop table if exists detail_rekap_tender;

drop table if exists hasil_temuan;

drop table if exists ikm;

drop table if exists ikm_opd;

drop table if exists jadwal_pelaksanaan;

drop table if exists jadwal_pelaksanaan_opd;

drop table if exists jenis_rb;

drop table if exists kegiatan;

drop table if exists kegiatan_rb;

drop table if exists laporan;

drop table if exists laporan_kinerja_triwulan;

drop table if exists laporan_rb;

drop table if exists monitoring_kelembagaan;

drop table if exists opd;

drop table if exists paket_kerja;

drop table if exists pelayanan_publik;

drop table if exists pelayanan_publik_opd;

drop table if exists pemantauan_tindak_lanjut;

drop table if exists permasalahan_kelembagaan;

drop table if exists program;

drop table if exists program_rb;

drop table if exists realisasi_fisik;

drop table if exists rekap_pokja;

drop table if exists rekap_tender;

drop table if exists sotk;

drop table if exists sotk_opd;

drop table if exists tatalaksana;

drop table if exists tatalaksana_opd;

drop table if exists temuan;

drop table if exists tipelaporan_per_opd;

drop table if exists tipe_laporan;

drop table if exists user;

/*==============================================================*/
/* table: auditor                                               */
/*==============================================================*/
create table auditor
(
   id_jadwal_pelaksanaan_opd int,
   nama_auditor         varchar(64),
   jabatan              varchar(64)
);

/*==============================================================*/
/* table: detail_laporan_kinerja_triwulan                       */
/*==============================================================*/
create table detail_laporan_kinerja_triwulan
(
   id_laporan           int,
   uraian               varchar(128),
   indikator_kinerja    varchar(64),
   target               float,
   realisasi_target     int,
   program              varchar(128),
   anggaran             int,
   capaian_realisasi_keuangan int
);

/*==============================================================*/
/* table: detail_rekap_pokja                                    */
/*==============================================================*/
create table detail_rekap_pokja
(
   id_detail_rekap_pokja int not null auto_increment,
   id_laporan           int,
   nama                 varchar(64),
   jabatan              varchar(64),
   ket                  text,
   primary key (id_detail_rekap_pokja)
);

/*==============================================================*/
/* table: detail_rekap_tender                                   */
/*==============================================================*/
create table detail_rekap_tender
(
   id_opd               int,
   id_paket_kerja       int,
   id_laporan           int,
   nilai_hps            int,
   pemenang             varchar(256),
   harga_kontrak        int,
   presentase_kontrak_thd_hps float,
   ket                  text
);

/*==============================================================*/
/* table: hasil_temuan                                          */
/*==============================================================*/
create table hasil_temuan
(
   id_temuan            int,
   rekomendasi          text,
   status_rekomendasi   char(2),
   tindak_lanjut        text,
   status_tindak_lanjut char(2),
   catatan_bpk          text
);

/*==============================================================*/
/* table: ikm                                                   */
/*==============================================================*/
create table ikm
(
   id_laporan           int not null,
   id_opd               int,
   id_tipe              int,
   created_at           timestamp,
   updated_at           timestamp,
   tgl                  date,
   primary key (id_laporan)
);

/*==============================================================*/
/* table: ikm_opd                                               */
/*==============================================================*/
create table ikm_opd
(
   id_opd               int,
   id_laporan           int,
   nilai                float,
   predikat             varchar(16)
);

/*==============================================================*/
/* table: jadwal_pelaksanaan                                    */
/*==============================================================*/
create table jadwal_pelaksanaan
(
   id_laporan           int not null,
   id_opd               int,
   id_tipe              int,
   created_at           timestamp,
   updated_at           timestamp,
   tgl                  date,
   primary key (id_laporan)
);

/*==============================================================*/
/* table: jadwal_pelaksanaan_opd                                */
/*==============================================================*/
create table jadwal_pelaksanaan_opd
(
   id_jadwal_pelaksanaan_opd int not null,
   id_opd               int,
   id_laporan           int,
   jenis_pengawasan     varchar(64),
   rmp                  varchar(32),
   rpl                  varchar(32),
   output_lhp           int,
   hari_pengawasan      int,
   keterangan           text,
   primary key (id_jadwal_pelaksanaan_opd)
);

/*==============================================================*/
/* table: jenis_rb                                              */
/*==============================================================*/
create table jenis_rb
(
   id_jenis_rb          int not null auto_increment,
   id_laporan           int,
   rincian              varchar(128),
   primary key (id_jenis_rb)
);

/*==============================================================*/
/* table: kegiatan                                              */
/*==============================================================*/
create table kegiatan
(
   kode_kegiatan        varchar(30) not null,
   kode_program       varchar(30),
   nama_kegiatan        varchar(128),
   pagu_ppas_final      int,
   keluaran_indikator   varchar(64),
   keluaran_target_ppas_final float,
   keluaran_realisasi_kinerja float,
   keluaran_realisasi_kinerja_persen float,
   keluaran_satuan      varchar(16),
   hasil_indikator      varchar(64),
   hasil_target_ppas_final float,
   hasil_realisasi_kinerja float,
   hasil_realisasi_kinerja_persen float,
   hasil_satuan         varchar(16),
   realisasi_keuangan   int,
   realisasi_keuangan_persen float,
   primary key (kode_kegiatan)
);

/*==============================================================*/
/* table: kegiatan_rb                                           */
/*==============================================================*/
create table kegiatan_rb
(
   id_program_rb        int,
   nama_kegiatan_rb     varchar(128),
   indikator_rb         varchar(128),
   target_output        varchar(64),
   realisasi_output     varchar(64),
   target_waktu         varchar(32),
   realisasi_waktu      varchar(32),
   target_anggaran      int,
   realisasi_anggaran   int,
   capaian              bool,
   ket                  text
);

/*==============================================================*/
/* table: laporan                                               */
/*==============================================================*/
create table laporan
(
   id_laporan           int not null auto_increment,
   id_opd               int not null,
   id_tipe              int not null,
   created_at           timestamp,
   updated_at           timestamp,
   primary key (id_laporan)
);

/*==============================================================*/
/* table: laporan_kinerja_triwulan                              */
/*==============================================================*/
create table laporan_kinerja_triwulan
(
   id_laporan           int not null,
   id_opd               int,
   id_tipe              int,
   created_at           timestamp,
   updated_at           timestamp,
   tgl                  date,
   primary key (id_laporan)
);

/*==============================================================*/
/* table: laporan_rb                                            */
/*==============================================================*/
create table laporan_rb
(
   id_laporan           int not null,
   id_opd               int,
   id_tipe              int,
   created_at           timestamp,
   updated_at           timestamp,
   tgl                  date,
   judul_rb             varchar(256),
   primary key (id_laporan)
);

/*==============================================================*/
/* table: monitoring_kelembagaan                                */
/*==============================================================*/
create table monitoring_kelembagaan
(
   id_laporan           int not null,
   id_opd               int,
   id_tipe              int,
   created_at           timestamp,
   updated_at           timestamp,
   tgl                  date,
   primary key (id_laporan)
);

/*==============================================================*/
/* table: opd                                                   */
/*==============================================================*/
create table opd
(
   id_opd               int not null auto_increment,
   nama_opd             varchar(64) not null,
   kode_ebud            varchar(16),
   kode_ekin            varchar(16),
   kode_emov            varchar(16),
   primary key (id_opd)
);

/*==============================================================*/
/* table: paket_kerja                                           */
/*==============================================================*/
create table paket_kerja
(
   id_paket_kerja       int not null auto_increment,
   id_detail_rekap_pokja int,
   nama_paket_kerja     varchar(64),
   pagu                 int,
   primary key (id_paket_kerja)
);

/*==============================================================*/
/* table: pelayanan_publik                                      */
/*==============================================================*/
create table pelayanan_publik
(
   id_laporan           int not null,
   id_opd               int,
   id_tipe              int,
   created_at           timestamp,
   updated_at           timestamp,
   tgl                  date,
   primary key (id_laporan)
);

/*==============================================================*/
/* table: pelayanan_publik_opd                                  */
/*==============================================================*/
create table pelayanan_publik_opd
(
   id_opd               int,
   id_laporan           int,
   indeks_pelayanan_publik float,
   konversi_100         float,
   ket                  text
);

/*==============================================================*/
/* table: pemantauan_tindak_lanjut                              */
/*==============================================================*/
create table pemantauan_tindak_lanjut
(
   id_laporan           int not null,
   id_opd               int,
   id_tipe              int,
   created_at           timestamp,
   updated_at           timestamp,
   judul_laporan        varchar(64),
   primary key (id_laporan)
);

/*==============================================================*/
/* table: permasalahan_kelembagaan                              */
/*==============================================================*/
create table permasalahan_kelembagaan
(
   id_opd               int,
   id_laporan           int,
   permasalahan_kelembagaan varchar(256),
   usulan               text,
   dasar_hukum          text,
   ket                  text
);

/*==============================================================*/
/* table: program                                               */
/*==============================================================*/
create table program
(
   kode_program       varchar(30) not null,
   id_laporan           int,
   nama_program         varchar(128),
   capaian_indikator    varchar(64),
   capaian_target_ppas_final float,
   capaian_anggaran_keuangan int,
   capaian_realisasi_keuangan int,
   capaian_realisasi_keuangan_persen float,
   capaian_realisasi_kinerja float,
   capaian_realisasi_kinerja_persen float,
   capaian_satuan       varchar(16),
   ket                  text,
   primary key (kode_program)
);

/*==============================================================*/
/* table: program_rb                                            */
/*==============================================================*/
create table program_rb
(
   id_program_rb        int not null auto_increment,
   id_jenis_rb          int,
   nama_program_rb      varchar(128),
   sasaran              varchar(256),
   primary key (id_program_rb)
);

/*==============================================================*/
/* table: realisasi_fisik                                       */
/*==============================================================*/
create table realisasi_fisik
(
   id_laporan           int not null,
   id_opd               int,
   id_tipe              int,
   created_at           timestamp,
   updated_at           timestamp,
   judul_realisasi_fisik varchar(128),
   tgl                  date,
   primary key (id_laporan)
);

/*==============================================================*/
/* table: rekap_pokja                                           */
/*==============================================================*/
create table rekap_pokja
(
   id_laporan           int not null,
   id_opd               int,
   id_tipe              int,
   created_at           timestamp,
   updated_at           timestamp,
   tgl                  date,
   primary key (id_laporan)
);

/*==============================================================*/
/* table: rekap_tender                                          */
/*==============================================================*/
create table rekap_tender
(
   id_laporan           int not null,
   id_opd               int,
   id_tipe              int,
   created_at           timestamp,
   updated_at           timestamp,
   judul_rekap_tender   varchar(128),
   tgl                  date,
   primary key (id_laporan)
);

/*==============================================================*/
/* table: sotk                                                  */
/*==============================================================*/
create table sotk
(
   id_laporan           int not null,
   id_opd               int,
   id_tipe              int,
   created_at           timestamp,
   updated_at           timestamp,
   tgl                  date,
   primary key (id_laporan)
);

/*==============================================================*/
/* table: sotk_opd                                              */
/*==============================================================*/
create table sotk_opd
(
   id_opd               int,
   id_laporan           int,
   besaran              varchar(6)
);

/*==============================================================*/
/* table: tatalaksana                                           */
/*==============================================================*/
create table tatalaksana
(
   id_laporan           int not null,
   id_opd               int,
   id_tipe              int,
   created_at           timestamp,
   updated_at           timestamp,
   tgl                  date,
   primary key (id_laporan)
);

/*==============================================================*/
/* table: tatalaksana_opd                                       */
/*==============================================================*/
create table tatalaksana_opd
(
   id_opd               int,
   id_laporan           int,
   uji_kompetensi       float,
   sop                  float,
   tata_naskah_dinas    float,
   pakaian_dinas        float,
   jam_kerja            float,
   jml_nilai            float,
   ket                  text
);

/*==============================================================*/
/* table: temuan                                                */
/*==============================================================*/
create table temuan
(
   id_temuan            int not null auto_increment,
   id_laporan           int,
   nama_temuan          varchar(256),
   primary key (id_temuan)
);

/*==============================================================*/
/* table: tipelaporan_per_opd                                   */
/*==============================================================*/
create table tipelaporan_per_opd
(
   id_opd               int not null,
   id_tipe              int not null,
   primary key (id_opd, id_tipe)
);

/*==============================================================*/
/* table: tipe_laporan                                          */
/*==============================================================*/
create table tipe_laporan
(
   id_tipe              int not null auto_increment,
   nama_laporan         varchar(64),
   kode_tipe            varchar(64),
   primary key (id_tipe)
);

/*==============================================================*/
/* table: user                                                  */
/*==============================================================*/
create table user
(
   id                   int not null auto_increment,
   id_opd               int not null,
   username             varchar(32) not null,
   password             char(60),
   created_at           timestamp,
   last_login           timestamp,
   primary key (id)
);

alter table auditor add constraint fk_relationship_30 foreign key (id_jadwal_pelaksanaan_opd)
      references jadwal_pelaksanaan_opd (id_jadwal_pelaksanaan_opd) on delete restrict on update restrict;

alter table detail_laporan_kinerja_triwulan add constraint fk_relationship_38 foreign key (id_laporan)
      references laporan_kinerja_triwulan (id_laporan) on delete restrict on update restrict;

alter table detail_rekap_pokja add constraint fk_relationship_37 foreign key (id_laporan)
      references rekap_pokja (id_laporan) on delete restrict on update restrict;

alter table detail_rekap_tender add constraint fk_relationship_14 foreign key (id_laporan)
      references rekap_tender (id_laporan) on delete restrict on update restrict;

alter table detail_rekap_tender add constraint fk_relationship_17 foreign key (id_paket_kerja)
      references paket_kerja (id_paket_kerja) on delete restrict on update restrict;

alter table detail_rekap_tender add constraint fk_relationship_41 foreign key (id_opd)
      references opd (id_opd) on delete restrict on update restrict;

alter table hasil_temuan add constraint fk_relationship_25 foreign key (id_temuan)
      references temuan (id_temuan) on delete restrict on update restrict;

alter table ikm add constraint fk_inheritance_4 foreign key (id_laporan)
      references laporan (id_laporan) on delete restrict on update restrict;

alter table ikm_opd add constraint fk_relationship_28 foreign key (id_laporan)
      references ikm (id_laporan) on delete restrict on update restrict;

alter table ikm_opd add constraint fk_relationship_29 foreign key (id_opd)
      references opd (id_opd) on delete restrict on update restrict;

alter table jadwal_pelaksanaan add constraint fk_inheritance_8 foreign key (id_laporan)
      references laporan (id_laporan) on delete restrict on update restrict;

alter table jadwal_pelaksanaan_opd add constraint fk_relationship_32 foreign key (id_laporan)
      references jadwal_pelaksanaan (id_laporan) on delete restrict on update restrict;

alter table jadwal_pelaksanaan_opd add constraint fk_relationship_33 foreign key (id_opd)
      references opd (id_opd) on delete restrict on update restrict;

alter table jenis_rb add constraint fk_relationship_31 foreign key (id_laporan)
      references laporan_rb (id_laporan) on delete restrict on update restrict;

alter table kegiatan add constraint fk_relationship_35 foreign key (kode_program)
      references program (kode_program) on delete restrict on update restrict;

alter table kegiatan_rb add constraint fk_relationship_40 foreign key (id_program_rb)
      references program_rb (id_program_rb) on delete restrict on update restrict;

alter table laporan add constraint fk_laporan_opd foreign key (id_opd)
      references opd (id_opd) on delete restrict on update restrict;

alter table laporan add constraint fk_tipelaporan_dari_laporan foreign key (id_tipe)
      references tipe_laporan (id_tipe) on delete restrict on update restrict;

alter table laporan_kinerja_triwulan add constraint fk_inheritance_12 foreign key (id_laporan)
      references laporan (id_laporan) on delete restrict on update restrict;

alter table laporan_rb add constraint fk_inheritance_10 foreign key (id_laporan)
      references laporan (id_laporan) on delete restrict on update restrict;

alter table monitoring_kelembagaan add constraint fk_inheritance_6 foreign key (id_laporan)
      references laporan (id_laporan) on delete restrict on update restrict;

alter table paket_kerja add constraint fk_relationship_42 foreign key (id_detail_rekap_pokja)
      references detail_rekap_pokja (id_detail_rekap_pokja) on delete restrict on update restrict;

alter table pelayanan_publik add constraint fk_inheritance_2 foreign key (id_laporan)
      references laporan (id_laporan) on delete restrict on update restrict;

alter table pelayanan_publik_opd add constraint fk_relationship_18 foreign key (id_laporan)
      references pelayanan_publik (id_laporan) on delete restrict on update restrict;

alter table pelayanan_publik_opd add constraint fk_relationship_19 foreign key (id_opd)
      references opd (id_opd) on delete restrict on update restrict;

alter table pemantauan_tindak_lanjut add constraint fk_inheritance_7 foreign key (id_laporan)
      references laporan (id_laporan) on delete restrict on update restrict;

alter table permasalahan_kelembagaan add constraint fk_relationship_22 foreign key (id_laporan)
      references monitoring_kelembagaan (id_laporan) on delete restrict on update restrict;

alter table permasalahan_kelembagaan add constraint fk_relationship_23 foreign key (id_opd)
      references opd (id_opd) on delete restrict on update restrict;

alter table program add constraint fk_relationship_34 foreign key (id_laporan)
      references realisasi_fisik (id_laporan) on delete restrict on update restrict;

alter table program_rb add constraint fk_relationship_39 foreign key (id_jenis_rb)
      references jenis_rb (id_jenis_rb) on delete restrict on update restrict;

alter table realisasi_fisik add constraint fk_inheritance_9 foreign key (id_laporan)
      references laporan (id_laporan) on delete restrict on update restrict;

alter table rekap_pokja add constraint fk_inheritance_11 foreign key (id_laporan)
      references laporan (id_laporan) on delete restrict on update restrict;

alter table rekap_tender add constraint fk_inheritance_1 foreign key (id_laporan)
      references laporan (id_laporan) on delete restrict on update restrict;

alter table sotk add constraint fk_inheritance_3 foreign key (id_laporan)
      references laporan (id_laporan) on delete restrict on update restrict;

alter table sotk_opd add constraint fk_relationship_26 foreign key (id_opd)
      references opd (id_opd) on delete restrict on update restrict;

alter table sotk_opd add constraint fk_relationship_27 foreign key (id_laporan)
      references sotk (id_laporan) on delete restrict on update restrict;

alter table tatalaksana add constraint fk_inheritance_5 foreign key (id_laporan)
      references laporan (id_laporan) on delete restrict on update restrict;

alter table tatalaksana_opd add constraint fk_relationship_20 foreign key (id_laporan)
      references tatalaksana (id_laporan) on delete restrict on update restrict;

alter table tatalaksana_opd add constraint fk_relationship_21 foreign key (id_opd)
      references opd (id_opd) on delete restrict on update restrict;

alter table temuan add constraint fk_relationship_24 foreign key (id_laporan)
      references pemantauan_tindak_lanjut (id_laporan) on delete restrict on update restrict;

alter table tipelaporan_per_opd add constraint fk_tipelaporan_per_opd foreign key (id_opd)
      references opd (id_opd) on delete restrict on update restrict;

alter table tipelaporan_per_opd add constraint fk_tipelaporan_per_opd2 foreign key (id_tipe)
      references tipe_laporan (id_tipe) on delete restrict on update restrict;

alter table user add constraint fk_user_opd foreign key (id_opd)
      references opd (id_opd) on delete restrict on update restrict;

