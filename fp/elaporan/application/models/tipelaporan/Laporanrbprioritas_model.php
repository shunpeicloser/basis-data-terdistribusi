<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Laporanrbprioritas_model extends CI_Model
{

    public function get_data_by_id($id)
    {
        $rbdata = $this->db->get_where('laporan_rb_prioritas', ['id_laporan' => $id])->result_array()[0];
        $rbp = $this->db->order_by('rincian', 'ASC')->get_where('rb_prioritas', "id_laporan = $id")->result_array();
        $rbps = array();
        if ($rbp != NULL) {
            foreach ($rbp as $d) {
                $rbps[$d['id_rb_prioritas']] = $this->db->get_where('rb_prioritas_sasaran', "id_rb_prioritas = $d[id_rb_prioritas]")->result_array();
            }
        }
        $rbpk = array();
        if ($rbps != NULL && sizeof($rbps) > 0) {
            foreach ($rbps as $d) {
                foreach ($d as $k) {
                    $rbpk[$k['id_rb_prioritas_sasaran']] = $this->db->get_where('rb_prioritas_kegiatan', "id_rb_prioritas_sasaran = $k[id_rb_prioritas_sasaran]")->result_array();
                }
            }
        }
        // printf("<pre>%s</pre>", json_encode($rbps, JSON_PRETTY_PRINT)); die();
        return array('rb' => $rbdata, 'rbp' => $rbp, 'rbps' => $rbps, 'rbpk' => $rbpk);
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
        $this->db->insert('laporan_rb_prioritas', $datalaporan);
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
        if ($table == 'laporan_rb_prioritas') {
            if ($data != NULL) {
                $this->db->update('laporan_rb_prioritas', $data, "id_laporan = $id_laporan");
                activity_log();
            }
        } elseif ($table == 'rb_prioritas') {
            if ($data != NULL) {
                // new data
                for ($i = 0; $i < sizeof(reset($data['new'])); $i += 1) {
                    array_push($insdata, array(
                        'id_laporan' => $id_laporan,
                        'rincian' => $data['new']['rincian'][$i]
                    ));
                }
                if ($insdata != NULL) {
                    $this->db->insert_batch('rb_prioritas', $insdata);
                    activity_log();
                }
                unset($data['new']);

                // updated data
                if (isset($data['id_rb_prioritas'])) {
                    for ($i = 0; $i < sizeof($data['id_rb_prioritas']); $i += 1) {
                        array_push($updata, array(
                            'id_laporan' => $id_laporan,
                            'id_rb_prioritas' => $data['id_rb_prioritas'][$i],
                            'rincian' => $data['rincian'][$i],
                        ));
                    }
                    $this->db->update_batch('rb_prioritas', $updata, 'id_rb_prioritas');
                    activity_log();
                }

                // unused data
                if (isset($data['to_del']))
                    $this->db->where_in('id_rb_prioritas', $data['to_del'])
                        ->delete('rb_prioritas');
                activity_log();
            } else {
                $this->db->delete('rb_prioritas', "id_laporan = $id_laporan");
                activity_log();
            }
        } else if ($table == 'rb_prioritas_sasaran') {
            // var_dump($data); die();
            if ($data != NULL) {
                // new data
                if (isset($data['new'])) {
                    for ($i = 0; $i < sizeof(reset($data['new'])); $i += 1) {
                        array_push($insdata, array(
                            'id_rb_prioritas' => $data['new']['id_rb_prioritas'][$i],
                            'sasaran' => $data['new']['sasaran'][$i],
                            'nama_program' => $data['new']['nama_program'][$i]
                        ));
                    }

                    if ($insdata != NULL) {
                        $this->db->insert_batch('rb_prioritas_sasaran', $insdata);
                        activity_log();
                    }
                    unset($data['new']);
                }
                // updated data
                if (isset($data['id_rb_prioritas_sasaran'])) {
                    for ($i = 0; $i < sizeof($data['id_rb_prioritas_sasaran']); $i += 1) {
                        array_push($updata, array(
                            'id_rb_prioritas_sasaran' => $data['id_rb_prioritas_sasaran'][$i],
                            'id_rb_prioritas' => $data['id_rb_prioritas'][$i],
                            'sasaran' => $data['sasaran'][$i],
                            'nama_program' => $data['nama_program'][$i]
                        ));
                    }
                    $this->db->update_batch('rb_prioritas_sasaran', $updata, 'id_rb_prioritas_sasaran');
                    activity_log();
                }

                // unused data
                if (isset($data['to_del']))
                    $this->db->where_in('id_rb_prioritas_sasaran', $data['to_del'])
                        ->delete('rb_prioritas_sasaran');
                activity_log();
            } else {
                $del = $this->db->select('id_rb_prioritas_sasaran')
                    ->from('rb_prioritas_sasaran')
                    ->join('rb_prioritas', 'rb_prioritas.id_rb_prioritas=rb_prioritas_sasaran.id_rb_prioritas')
                    ->join('laporan_rb_prioritas', "laporan_rb_prioritas.id_laporan = rb_prioritas.id_laporan")
                    ->where('laporan_rb_prioritas.id_laporan', $id_laporan)->get()->result_array();
                $dels = array();
                foreach ($del as $key => $values) {
                    array_push($dels, $values['id_rb_prioritas_sasaran']);
                }
                $this->db->where_in('id_rb_prioritas_sasaran', $dels)
                    ->delete('rb_prioritas_sasaran');
                activity_log();
            }
        } else if ($table == 'rb_prioritas_kegiatan') {
            // unset($data['id_rb_prioritas_sasaran']);
            // var_dump($data); die();
            if ($data != NULL) {
                $tmp = $data['id_rb_prioritas_sasaran'];
                for ($i = 0; $i < sizeof($tmp); $i += 1) {
                    array_push($insdata, array(
                        'id_rb_prioritas_sasaran' => $data['id_rb_prioritas_sasaran'][$i],
                        'nama_kegiatan' => $data['nama_kegiatan'][$i],
                        'indikator' => $data['indikator'][$i],
                        'target_output' => $data['target_output'][$i],
                        'realisasi_output' => $data['realisasi_output'][$i],
                        'target_waktu' => $data['target_waktu'][$i],
                        'realisasi_waktu' => $data['realisasi_waktu'][$i],
                        'target_anggaran' => $data['target_anggaran'][$i],
                        'realisasi_anggaran' => $data['realisasi_anggaran'][$i],
                        'capaian' => $data['capaian'][$i],
                        'ket' => $data['ket'][$i]
                    ));
                }

                $del = $this->db->select('id_rb_prioritas_sasaran')
                    ->from('rb_prioritas_sasaran')
                    ->join('rb_prioritas', 'rb_prioritas.id_rb_prioritas=rb_prioritas_sasaran.id_rb_prioritas')
                    ->join('laporan_rb_prioritas', "laporan_rb_prioritas.id_laporan = rb_prioritas.id_laporan")
                    ->where('laporan_rb_prioritas.id_laporan', $id_laporan)->get()->result_array();
                $dels = array();
                foreach ($del as $key => $values) {
                    array_push($dels, $values['id_rb_prioritas_sasaran']);
                }
                // var_dump($dels); die();
                $this->db->where_in('id_rb_prioritas_sasaran', $dels)
                    ->delete('rb_prioritas_kegiatan');
                activity_log();
                // printf("<pre>%s</pre>", json_encode($insdata, JSON_PRETTY_PRINT)); die();
                if ($insdata != NULL) {
                    $this->db->insert_batch('rb_prioritas_kegiatan', $insdata);
                    activity_log();
                }
            } else {
                $del = $this->db->select('id_rb_prioritas_sasaran')
                    ->from('rb_prioritas_sasaran')
                    ->join('rb_prioritas', 'rb_prioritas.id_rb_prioritas=rb_prioritas_sasaran.id_rb_prioritas')
                    ->join('laporan_rb_prioritas', "laporan_rb_prioritas.id_laporan = rb_prioritas.id_laporan")
                    ->where('laporan_rb_prioritas.id_laporan', $id_laporan)->get()->result_array();
                $dels = array();
                foreach ($del as $key => $values) {
                    array_push($dels, $values['id_rb_prioritas_sasaran']);
                }
                // var_dump($dels); die();
                $this->db->where_in('id_rb_prioritas_sasaran', $dels)
                    ->delete('rb_prioritas_kegiatan');
                activity_log();
            }
        }
        $this->db->trans_complete();
    }

    public function delete_data($id_laporan)
    {
        $this->db->trans_begin();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan_rb_prioritas');
        activity_log();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan');
        activity_log();
        $this->db->trans_complete();
    }
}
