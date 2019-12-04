<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Laporankinerjatriwulan_model extends CI_Model
{
    public function get_data($id_laporan = NULL, $id_opd = NULL)
    {
        $this->db->select()->from('laporan_kinerja_triwulan');
        if ($id_opd != NULL) {
            $this->db->where('laporan_kinerja_triwulan.id_opd', $id_opd);
        }
        if ($id_laporan != NULL) {
            $this->db->where('laporan_kinerja_triwulan.id_laporan', $id_laporan);
        }
        return $this->db->get()->result();
    }

    public function get_data_by_id($id)
    {
        $lktdata = $this->db->get_where('laporan_kinerja_triwulan', ['id_laporan' => $id])->result_array()[0];
        $lktdetaildata = $this->db->from('detail_laporan_kinerja_triwulan')
            ->where('id_laporan', $id)->get()->result_array();
        return array('lkt' => $lktdata, 'lktdetail' => $lktdetaildata);
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
        $this->db->insert('laporan_kinerja_triwulan', $datalaporan);
        activity_log();
        // insert second etc. table data here
        // ada api?
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
        // printf("<pre>%s</pre>", json_encode($data, JSON_PRETTY_PRINT)); die();
        $table = $data['nama_tabel'];
        unset($data['nama_tabel']);
        $insdata = array();
        if ($data != NULL) {
            for ($i = 0; $i < sizeof(reset($data)); $i += 1) {
                array_push($insdata, array(
                    'id_laporan' => $id_laporan,
                    'uraian' => $data['uraian'][$i],
                    'indikator_kinerja' => $data['indikator_kinerja'][$i],
                    'target' => $data['target'][$i],
                    'realisasi_target' => $data['realisasi_target'][$i],
                    'program' => $data['program'][$i],
                    'anggaran' => $data['anggaran'][$i],
                    'capaian_realisasi_keuangan' => $data['capaian_realisasi_keuangan'][$i],
                ));
            }
        }
        $this->db->trans_begin();
        if ($table == 'detail_laporan_kinerja_triwulan') {
            $this->db->delete('detail_laporan_kinerja_triwulan', "id_laporan = $id_laporan");
            activity_log();
            if ($insdata != NULL) {
                $this->db->insert_batch('detail_laporan_kinerja_triwulan', $insdata);
                activity_log();
            }
        }
        $this->db->trans_complete();
    }

    public function delete_data($id_laporan)
    {
        $this->db->trans_begin();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan_kinerja_triwulan');
        activity_log();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan');
        activity_log();
        $this->db->trans_complete();
    }
}
