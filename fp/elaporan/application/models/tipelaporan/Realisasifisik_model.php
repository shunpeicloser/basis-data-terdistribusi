<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Realisasifisik_model extends CI_Model
{
    public function get_data($id_laporan = NULL, $id_opd = NULL)
    {
        $this->db->from('realisasi_fisik');
        if ($id_opd != NULL) {
            $this->db->where('realisasi_fisik.id_opd', $id_opd);
        }
        if ($id_laporan != NULL) {
            $this->db->where('realisasi_fisik.id_laporan', $id_laporan);
        }
        $this->db->join('program', 'realisasi_fisik.id_laporan = program.id_laporan')
            ->join('capaian', 'program.kode_program = capaian.kode_program')
            ->join('kegiatan', 'program.kode_program = kegiatan.kode_program')
            ->join('keluaran', 'kegiatan.kode_kegiatan = keluaran.kode_kegiatan')
            ->join('hasil', 'kegiatan.kode_kegiatan = hasil.kode_kegiatan');

        return $this->db->get()->result_array();
    }

    public function get_data_by_id($id)
    {
        $rfdata = $this->db->get_where('realisasi_fisik', ['id_laporan' => $id])->result_array();
        if ($rfdata != NULL) $rfdata = $rfdata[0];
        $progdata = $this->db->from('program')->like('kode_program', $id, 'after')->get()->result_array();
        $kgdata = array();
        foreach ($progdata as $d) {
            $kgdata[$d['kode_program']] = $this->db->from('kegiatan')->select('program.nama_program,kegiatan.*')
                ->join('program', 'program.kode_program = kegiatan.kode_program')
                ->like('kode_kegiatan', $d['kode_program'], 'after')->get()->result_array();
        }
        return array('rf' => $rfdata, 'prog' => $progdata, 'kg' => $kgdata);
        // printf("<pre>%s</pre>", json_encode($ret, JSON_PRETTY_PRINT)); die();
    }

    public function insert_fetch($data_rf, $data_prog, $data_kg)
    {
        $this->db->trans_begin();
        $this->db->insert('realisasi_fisik', $data_rf);
        activity_log();
        $this->db->insert_batch('program', $data_prog);
        activity_log();
        $this->db->insert_batch('kegiatan', $data_kg);
        activity_log();
        $this->db->trans_complete();
    }

    public function init_insert($id_opd, $datalaporan, $data)
    {
        $this->load->model('laporan_model', 'lp');
        $this->load->model('api_sipp_model', 'sipp');
        $this->load->model('api_sikd_model', 'sikd');
        
        $this->db->trans_start();
        $this->db->insert(
            'laporan',
            [
                'id_opd' => $datalaporan['id_opd'],
                'id_tipe' => $datalaporan['id_tipe'],
                'created_at' => date('Y-m-d H:i:s', time()),
                'updated_at' => date('Y-m-d H:i:s', time()),
            ]
        );
        activity_log();
        $this->db->order_by('updated_at', 'DESC');
        $datalaporan = $this->db->get_where('laporan', ['id_opd' => $datalaporan['id_opd'], 'id_tipe' => $datalaporan['id_tipe'],])->result_array()[0];
        $datalaporan['tgl'] = $data['tgl'];
        $this->db->insert('realisasi_fisik', $datalaporan);
        activity_log();
        $fet = $this->sipp->api_fetch_data($id_opd, $datalaporan, date('Y', strtotime($data['tgl'])));
        if ($fet != NULL && $fet != false && sizeof($fet) > 0) {
            $this->db->insert_batch('program', $fet['prog']);
            activity_log();
            $this->db->insert_batch('kegiatan', $fet['kg']);
            activity_log();
        }

        // $fet = $this->sikd->get_api($datalaporan['id_laporan'], date('Y', strtotime($data['tgl'])), $id_opd);
        // if ($fet != NULL && $fet != false && sizeof($fet) > 0) {
        //     // $this->db->insert_batch('program', $fet['prog']);
        //     // activity_log();
        //     $this->db->update_batch('kegiatan', $fet, 'kode_kegiatan');
        //     activity_log();
        // }

        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return NULL;
        }
        return $datalaporan['id_laporan'];
    }

    public function update_data($id_laporan, $data)
    {
        $this->load->model('api_sipp_model', 'sipp');
        $tmp = -1;
        $table = $data['nama_tabel'];
        unset($data['nama_tabel']);

        $this->db->trans_begin();
        if ($table == 'program') {
            $kode = $data['kode_program'];
            $rkinerja = $data['capaian_realisasi_kinerja'];
            $rkeuangan = $data['capaian_realisasi_keuangan'];
            for ($i = 0; $i < sizeof($kode); $i += 1) {
                $this->db->update(
                    $table,
                    [
                        'capaian_realisasi_kinerja' => "$rkinerja[$i]",
                        'capaian_realisasi_keuangan' => "$rkeuangan[$i]"
                    ],
                    "kode_program = '$kode[$i]'"
                );
                activity_log();
            }
            // $this->db->update($table, $data, "kode_program like '$id_laporan-'");
        } else if ($table == 'kegiatan') {
            $kode = $data['kode_kegiatan'];
            $rkkinerja = $data['keluaran_realisasi_kinerja'];
            $rhkinerja = $data['hasil_realisasi_kinerja'];
            $rkeuangan = $data['realisasi_keuangan'];
            for ($i = 0; $i < sizeof($kode); $i += 1) {
                $this->db->update(
                    $table,
                    [
                        'keluaran_realisasi_kinerja' => "$rkkinerja[$i]",
                        'hasil_realisasi_kinerja' => "$rhkinerja[$i]",
                        'realisasi_keuangan' => "$rkeuangan[$i]"
                    ],
                    "kode_kegiatan = '$kode[$i]'"
                );
                activity_log();
            }
            // $this->db->update($table, $data, "kode_kegiatan like '$id_laporan-'");
        } elseif ($table == 'updateapi') {
            $id_opd = $this->session->tempdata('id_opd');

            $datalaporan = $this->db->get_where('laporan', ['id_laporan' => $id_laporan])->result_array();
            if ($datalaporan != NULL) {
                $datalaporan = $datalaporan[0];
            }

            // BACKUP PREVIOUS STATE
            
            // END

            $fet = $this->sipp->api_fetch_data($id_opd, $datalaporan, date('Y', strtotime($data['tgl'])));

            if ($fet != NULL && sizeof($fet) > 0) {
                $this->db->update_batch('program', $fet['prog'], 'kode_program');
                activity_log();
                $this->db->update_batch('kegiatan', $fet['kg'], 'kode_kegiatan');
                activity_log();
            }

            // $fet = $this->sikd->get_api($datalaporan['id_laporan'], date('Y', strtotime($data['tgl'])), $id_opd);
            // if ($fet != NULL && $fet != false && sizeof($fet) > 0) {
            //     // $this->db->insert_batch('program', $fet['prog']);
            //     // activity_log();
            //     $this->db->update_batch('kegiatan', $fet, 'kode_kegiatan');
            //     activity_log();
            // }
        }
        if ($this->db->trans_status() === FALSE) {
            echo "GAGAL";
            $this->db->trans_rollback();
            return NULL;
        } else {
            echo "SUKSES";
            $this->db->trans_commit();
        }
    }

    public function delete_data($id_laporan)
    {
        $this->db->trans_begin();
        $this->db->like('kode_kegiatan', $id_laporan . '-', 'after');
        $this->db->delete('kegiatan');
        activity_log();
        $this->db->like('kode_program', $id_laporan . '-', 'after');
        $this->db->delete('program');
        activity_log();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('realisasi_fisik');
        activity_log();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan');
        activity_log();
        $this->db->trans_complete();
    }
}
