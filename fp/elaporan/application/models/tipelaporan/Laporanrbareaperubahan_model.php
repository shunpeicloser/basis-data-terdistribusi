<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Laporanrbareaperubahan_model extends CI_Model
{

    public function get_data_by_id($id)
    {
        $rbdata = $this->db->get_where('laporan_rb_area_perubahan', ['id_laporan' => $id])->result_array()[0];
        $rbap = $this->db->order_by('rincian', 'ASC')->get_where('rb_area_perubahan', "id_laporan = $id")->result_array();
        $rbaps = array();
        if ($rbap != NULL) {
            foreach ($rbap as $d) {
                $rbaps[$d['id_rb_area_perubahan']] = $this->db->get_where('rb_area_perubahan_program', "id_rb_area_perubahan = $d[id_rb_area_perubahan]")->result_array();
            }
        }
        $rbapk = array();
        if ($rbaps != NULL && sizeof($rbaps) > 0) {
            foreach ($rbaps as $d) {
                foreach ($d as $k) {
                    $rbapk[$k['id_rb_area_perubahan_program']] = $this->db->get_where('rb_area_perubahan_kegiatan', "id_rb_area_perubahan_program = $k[id_rb_area_perubahan_program]")->result_array();
                }
            }
        }
        // printf("<pre>%s</pre>", json_encode($rbaps, JSON_PRETTY_PRINT)); die();
        return array('rb' => $rbdata, 'rbap' => $rbap, 'rbaps' => $rbaps, 'rbapk' => $rbapk);
    }

    public function init_insert($id_opd, $datalaporan, $data)
    {
        $this->db->trans_start();
        $this->load->model('laporan_model', 'lp');
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
        $this->db->insert('laporan_rb_area_perubahan', $datalaporan);
        activity_log();
        // insert second etc. table data here
        // no api
        // end
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return NULL;
        }
        return $datalaporan['id_laporan'];
    }

    public function update_data($id_laporan, $data)
    {
        $table = $data['nama_tabel'];
        unset($data['nama_tabel']);
        $insdata = array();
        $updata = array();

        $this->db->trans_begin();
        if ($table == 'laporan_rb_area_perubahan') {
            if ($data != NULL) {
                $this->db->update('laporan_rb_area_perubahan', $data, "id_laporan = $id_laporan");
                activity_log();
            }
        } elseif ($table == 'rb_area_perubahan') {
            if ($data != NULL) {
                // new data
                for ($i = 0; $i < sizeof(reset($data['new'])); $i += 1) {
                    array_push($insdata, array(
                        'id_laporan' => $id_laporan,
                        'rincian' => $data['new']['rincian'][$i]
                    ));
                }
                if ($insdata != NULL) {
                    $this->db->insert_batch('rb_area_perubahan', $insdata);
                    activity_log();
                }
                unset($data['new']);

                // updated data
                if (isset($data['id_rb_area_perubahan'])) {
                    for ($i = 0; $i < sizeof($data['id_rb_area_perubahan']); $i += 1) {
                        array_push($updata, array(
                            'id_laporan' => $id_laporan,
                            'id_rb_area_perubahan' => $data['id_rb_area_perubahan'][$i],
                            'rincian' => $data['rincian'][$i],
                        ));
                    }
                    $this->db->update_batch('rb_area_perubahan', $updata, 'id_rb_area_perubahan');
                    activity_log();
                }

                // unused data
                if (isset($data['to_del']))
                    $this->db->where_in('id_rb_area_perubahan', $data['to_del'])
                        ->delete('rb_area_perubahan');
                activity_log();
            } else {
                $this->db->delete('rb_area_perubahan', "id_laporan = $id_laporan");
                activity_log();
            }
        } else if ($table == 'rb_area_perubahan_program') {
            // var_dump($data); die();
            if ($data != NULL) {
                // new data
                if (isset($data['new'])) {
                    for ($i = 0; $i < sizeof(reset($data['new'])); $i += 1) {
                        array_push($insdata, array(
                            'id_rb_area_perubahan' => $data['new']['id_rb_area_perubahan'][$i],
                            'nama_program' => $data['new']['nama_program'][$i]
                        ));
                    }

                    if ($insdata != NULL) {
                        $this->db->insert_batch('rb_area_perubahan_program', $insdata);
                        activity_log();
                    }
                    unset($data['new']);
                }
                // updated data
                if (isset($data['id_rb_area_perubahan_program'])) {
                    for ($i = 0; $i < sizeof($data['id_rb_area_perubahan_program']); $i += 1) {
                        array_push($updata, array(
                            'id_rb_area_perubahan_program' => $data['id_rb_area_perubahan_program'][$i],
                            'id_rb_area_perubahan' => $data['id_rb_area_perubahan'][$i],
                            'nama_program' => $data['nama_program'][$i]
                        ));
                    }
                    $this->db->update_batch('rb_area_perubahan_program', $updata, 'id_rb_area_perubahan_program');
                    activity_log();
                }

                // unused data
                if (isset($data['to_del']))
                    $this->db->where_in('id_rb_area_perubahan_program', $data['to_del'])
                        ->delete('rb_area_perubahan_program');
                activity_log();
            } else {
                $del = $this->db->select('id_rb_area_perubahan_program')
                    ->from('rb_area_perubahan_program')
                    ->join('rb_area_perubahan', 'rb_area_perubahan.id_rb_area_perubahan=rb_area_perubahan_program.id_rb_area_perubahan')
                    ->join('laporan_rb_area_perubahan', "laporan_rb_area_perubahan.id_laporan = rb_area_perubahan.id_laporan")
                    ->where('laporan_rb_area_perubahan.id_laporan', $id_laporan)->get()->result_array();
                $dels = array();
                foreach ($del as $key => $values) {
                    array_push($dels, $values['id_rb_area_perubahan_program']);
                }
                $this->db->where_in('id_rb_area_perubahan_program', $dels)
                    ->delete('rb_area_perubahan_program');
                activity_log();
            }
        } else if ($table == 'rb_area_perubahan_kegiatan') {
            // unset($data['id_rb_area_perubahan_program']);
            // var_dump($data); die();
            if ($data != NULL) {
                $tmp = $data['id_rb_area_perubahan_program'];
                for ($i = 0; $i < sizeof($tmp); $i += 1) {
                    array_push($insdata, array(
                        'id_rb_area_perubahan_program' => $data['id_rb_area_perubahan_program'][$i],
                        'nama_kegiatan' => $data['nama_kegiatan'][$i],
                        'target_waktu' => $data['target_waktu'][$i],
                        'realisasi_waktu' => $data['realisasi_waktu'][$i],
                        'target_anggaran' => $data['target_anggaran'][$i],
                        'realisasi_anggaran' => $data['realisasi_anggaran'][$i],
                        'capaian' => $data['capaian'][$i],
                        'ket' => $data['ket'][$i]
                    ));
                }

                $del = $this->db->select('id_rb_area_perubahan_program')
                    ->from('rb_area_perubahan_program')
                    ->join('rb_area_perubahan', 'rb_area_perubahan.id_rb_area_perubahan=rb_area_perubahan_program.id_rb_area_perubahan')
                    ->join('laporan_rb_area_perubahan', "laporan_rb_area_perubahan.id_laporan = rb_area_perubahan.id_laporan")
                    ->where('laporan_rb_area_perubahan.id_laporan', $id_laporan)->get()->result_array();
                $dels = array();
                foreach ($del as $key => $values) {
                    array_push($dels, $values['id_rb_area_perubahan_program']);
                }
                // var_dump($dels); die();
                $this->db->where_in('id_rb_area_perubahan_program', $dels)
                    ->delete('rb_area_perubahan_kegiatan');
                activity_log();
                // printf("<pre>%s</pre>", json_encode($insdata, JSON_PRETTY_PRINT)); die();
                if ($insdata != NULL) {
                    $this->db->insert_batch('rb_area_perubahan_kegiatan', $insdata);
                    activity_log();
                }
            } else {
                $del = $this->db->select('id_rb_area_perubahan_program')
                    ->from('rb_area_perubahan_program')
                    ->join('rb_area_perubahan', 'rb_area_perubahan.id_rb_area_perubahan=rb_area_perubahan_program.id_rb_area_perubahan')
                    ->join('laporan_rb_area_perubahan', "laporan_rb_area_perubahan.id_laporan = rb_area_perubahan.id_laporan")
                    ->where('laporan_rb_area_perubahan.id_laporan', $id_laporan)->get()->result_array();
                $dels = array();
                foreach ($del as $key => $values) {
                    array_push($dels, $values['id_rb_area_perubahan_program']);
                }
                // var_dump($dels); die();
                $this->db->where_in('id_rb_area_perubahan_program', $dels)
                    ->delete('rb_area_perubahan_kegiatan');
                activity_log();
            }
        }
        $this->db->trans_complete();
    }

    public function delete_data($id_laporan)
    {
        $this->db->trans_begin();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan_rb_area_perubahan');
        activity_log();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan');
        activity_log();
        $this->db->trans_complete();
    }
}
