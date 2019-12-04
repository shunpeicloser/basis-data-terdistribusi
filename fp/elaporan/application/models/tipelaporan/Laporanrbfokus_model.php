<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Laporanrbfokus_model extends CI_Model
{

    public function get_data_by_id($id)
    {
        $rbdata = $this->db->get_where('laporan_rb_fokus', ['id_laporan' => $id])->result_array()[0];
        $rbf = $this->db->order_by('rincian', 'ASC')->get_where('rb_fokus', "id_laporan = $id")->result_array();
        $rbfs = array();
        if ($rbf != NULL) {
            foreach ($rbf as $d) {
                $rbfs[$d['id_rb_fokus']] = $this->db->get_where('rb_fokus_sasaran', "id_rb_fokus = $d[id_rb_fokus]")->result_array();
            }
        }
        $rbfk = array();
        if ($rbfs != NULL && sizeof($rbfs) > 0) {
            foreach ($rbfs as $d) {
                foreach ($d as $k) {
                    $rbfk[$k['id_rb_fokus_sasaran']] = $this->db->get_where('rb_fokus_kegiatan', "id_rb_fokus_sasaran = $k[id_rb_fokus_sasaran]")->result_array();
                }
            }
        }
        // printf("<pre>%s</pre>", json_encode($rbfs, JSON_PRETTY_PRINT)); die();
        return array('rb' => $rbdata, 'rbf' => $rbf, 'rbfs' => $rbfs, 'rbfk' => $rbfk);
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
        $this->db->insert('laporan_rb_fokus', $datalaporan);
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
        if ($table == 'laporan_rb_fokus') {
            if ($data != NULL) {
                $this->db->update('laporan_rb_fokus', $data, "id_laporan = $id_laporan");
                activity_log();
            }
        } elseif ($table == 'rb_fokus') {
            if ($data != NULL) {
                // new data
                for ($i = 0; $i < sizeof(reset($data['new'])); $i += 1) {
                    array_push($insdata, array(
                        'id_laporan' => $id_laporan,
                        'rincian' => $data['new']['rincian'][$i]
                    ));
                }
                if ($insdata != NULL) {
                    $this->db->insert_batch('rb_fokus', $insdata);
                    activity_log();
                }
                unset($data['new']);

                // updated data
                if (isset($data['id_rb_fokus'])) {
                    for ($i = 0; $i < sizeof($data['id_rb_fokus']); $i += 1) {
                        array_push($updata, array(
                            'id_laporan' => $id_laporan,
                            'id_rb_fokus' => $data['id_rb_fokus'][$i],
                            'rincian' => $data['rincian'][$i],
                        ));
                    }
                    $this->db->update_batch('rb_fokus', $updata, 'id_rb_fokus');
                    activity_log();
                }

                // unused data
                if (isset($data['to_del']))
                    $this->db->where_in('id_rb_fokus', $data['to_del'])
                        ->delete('rb_fokus');
                activity_log();
            } else {
                $this->db->delete('rb_fokus', "id_laporan = $id_laporan");
                activity_log();
            }
        } else if ($table == 'rb_fokus_sasaran') {
            // var_dump($data); die();
            if ($data != NULL) {
                // new data
                if (isset($data['new'])) {
                    for ($i = 0; $i < sizeof(reset($data['new'])); $i += 1) {
                        array_push($insdata, array(
                            'id_rb_fokus' => $data['new']['id_rb_fokus'][$i],
                            'sasaran' => $data['new']['sasaran'][$i],
                            'nama_program' => $data['new']['nama_program'][$i]
                        ));
                    }

                    if ($insdata != NULL) {
                        $this->db->insert_batch('rb_fokus_sasaran', $insdata);
                        activity_log();
                    }
                    unset($data['new']);
                }
                // updated data
                if (isset($data['id_rb_fokus_sasaran'])) {
                    for ($i = 0; $i < sizeof($data['id_rb_fokus_sasaran']); $i += 1) {
                        array_push($updata, array(
                            'id_rb_fokus_sasaran' => $data['id_rb_fokus_sasaran'][$i],
                            'id_rb_fokus' => $data['id_rb_fokus'][$i],
                            'sasaran' => $data['sasaran'][$i],
                            'nama_program' => $data['nama_program'][$i]
                        ));
                    }
                    $this->db->update_batch('rb_fokus_sasaran', $updata, 'id_rb_fokus_sasaran');
                    activity_log();
                }

                // unused data
                if (isset($data['to_del']))
                    $this->db->where_in('id_rb_fokus_sasaran', $data['to_del'])
                        ->delete('rb_fokus_sasaran');
                activity_log();
            } else {
                $del = $this->db->select('id_rb_fokus_sasaran')
                    ->from('rb_fokus_sasaran')
                    ->join('rb_fokus', 'rb_fokus.id_rb_fokus=rb_fokus_sasaran.id_rb_fokus')
                    ->join('laporan_rb_fokus', "laporan_rb_fokus.id_laporan = rb_fokus.id_laporan")
                    ->where('laporan_rb_fokus.id_laporan', $id_laporan)->get()->result_array();
                $dels = array();
                foreach ($del as $key => $values) {
                    array_push($dels, $values['id_rb_fokus_sasaran']);
                }
                $this->db->where_in('id_rb_fokus_sasaran', $dels)
                    ->delete('rb_fokus_sasaran');
                activity_log();
            }
        } else if ($table == 'rb_fokus_kegiatan') {
            // unset($data['id_rb_fokus_sasaran']);
            // var_dump($data); die();
            if ($data != NULL) {
                $tmp = $data['id_rb_fokus_sasaran'];
                for ($i = 0; $i < sizeof($tmp); $i += 1) {
                    array_push($insdata, array(
                        'id_rb_fokus_sasaran' => $data['id_rb_fokus_sasaran'][$i],
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

                $del = $this->db->select('id_rb_fokus_sasaran')
                    ->from('rb_fokus_sasaran')
                    ->join('rb_fokus', 'rb_fokus.id_rb_fokus=rb_fokus_sasaran.id_rb_fokus')
                    ->join('laporan_rb_fokus', "laporan_rb_fokus.id_laporan = rb_fokus.id_laporan")
                    ->where('laporan_rb_fokus.id_laporan', $id_laporan)->get()->result_array();
                $dels = array();
                foreach ($del as $key => $values) {
                    array_push($dels, $values['id_rb_fokus_sasaran']);
                }
                // var_dump($dels); die();
                $this->db->where_in('id_rb_fokus_sasaran', $dels)
                    ->delete('rb_fokus_kegiatan');
                activity_log();

                // printf("<pre>%s</pre>", json_encode($insdata, JSON_PRETTY_PRINT)); die();
                if ($insdata != NULL) {
                    $this->db->insert_batch('rb_fokus_kegiatan', $insdata);
                    activity_log();
                }
            } else {
                $del = $this->db->select('id_rb_fokus_sasaran')
                    ->from('rb_fokus_sasaran')
                    ->join('rb_fokus', 'rb_fokus.id_rb_fokus=rb_fokus_sasaran.id_rb_fokus')
                    ->join('laporan_rb_fokus', "laporan_rb_fokus.id_laporan = rb_fokus.id_laporan")
                    ->where('laporan_rb_fokus.id_laporan', $id_laporan)->get()->result_array();
                $dels = array();
                foreach ($del as $key => $values) {
                    array_push($dels, $values['id_rb_fokus_sasaran']);
                }
                // var_dump($dels); die();
                $this->db->where_in('id_rb_fokus_sasaran', $dels)
                    ->delete('rb_fokus_kegiatan');
                activity_log();
            }
        }
        $this->db->trans_complete();
    }

    public function delete_data($id_laporan)
    {
        $this->db->trans_begin();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan_rb_fokus');
        activity_log();

        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan');
        activity_log();

        $this->db->trans_complete();
    }
}
