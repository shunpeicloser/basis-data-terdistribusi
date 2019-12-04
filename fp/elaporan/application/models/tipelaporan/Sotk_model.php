<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Sotk_model extends CI_Model
{
    public function get_data($id_laporan = NULL, $id_opd = NULL)
    {
        $this->db->from('sotk');
        if ($id_opd != NULL) {
            $this->db->where('sotk.id_opd', $id_opd);
        }
        if ($id_laporan != NULL) {
            $this->db->where('sotk.id_laporan', $id_laporan);
        }
        $this->db->join('sotk_opd', 'sotk.id_laporan = sotk_opd.id_laporan')
            ->join('opd', 'opd.id_opd = sotk_opd.id_opd')
            ->order_by('sotk.id_laporan', 'ASC');
        $res = $this->db->get()->result_array();
        $current_id = $res[0]['id_laporan'];
        $ret = [];
        foreach ($res as $row) {
            if ($current_id != $row['id_laporan']) {
                $current_id = $row['id_laporan'];
                $ret['id_laporan'] = $row['id_laporan'];
                $ret['id_opd'] = $row['id_opd'];
                $ret['id_tipe'] = $row['id_tipe'];
                $row['created_at'] = $row['created_at'];
                $row['updated_at'] = $row['updated_at'];
                $row['tahun'] = $row['tahun'];
                $row['sotk_opd'] = [];
            }
        }
    }

    public function get_data_by_id($id)
    {
        $sotkdata = $this->db->get_where('sotk', ['id_laporan' => $id])->result_array()[0];
        $sotkopddata = $this->db->select('sotk_opd.*, opd.nama_opd')
            ->from('sotk_opd')
            ->join('opd', 'sotk_opd.id_opd = opd.id_opd')
            ->order_by('nama_opd')
            ->where('id_laporan', $id)->get()->result_array();
        return array('sotk' => $sotkdata, 'sotkopd' => $sotkopddata);
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
        $this->db->insert('sotk', $datalaporan);
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
        if ($data != NULL) {
            for ($i = 0; $i < sizeof(reset($data)); $i += 1) {
                array_push($insdata, array(
                    'id_laporan' => $id_laporan,
                    'id_opd' => $data['id_opd'][$i],
                    'besaran' => $data['besaran'][$i]
                ));
            }
        }
        $this->db->trans_begin();
        if ($table == 'sotk_opd') {
            $this->db->delete('sotk_opd', "id_laporan = $id_laporan");
            if ($data != NULL) {
                $this->db->insert_batch('sotk_opd', $insdata);
                activity_log();
            }
        }
        $this->db->trans_complete();
    }

    public function delete_data($id_laporan)
    {
        $this->db->trans_begin();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('sotk');
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan');
        $this->db->trans_complete();
    }
}
