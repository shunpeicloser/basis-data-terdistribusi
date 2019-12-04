<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pelayananpublik_model extends CI_Model
{
    public function get_data($id_laporan = NULL, $id_opd = NULL)
    {
        $this->db->from('pelayanan_publik');
        if ($id_opd != NULL) {
            $this->db->where('pelayanan_publik.id_opd', $id_opd);
        }
        if ($id_laporan != NULL) {
            $this->db->where('pelayanan_publik.id_laporan', $id_laporan);
        }
        $this->db->join('pelayanan_publik_opd', 'pelayanan_publik.id_laporan = pelayanan_publik_opd.id_laporan')
            ->join('opd', 'opd.id_opd = pelayanan_publik_opd.id_opd');

        return $this->db->get()->result();
    }

    public function get_data_by_id($id)
    {
        $ppdata = $this->db->get_where('pelayanan_publik', ['id_laporan' => $id])->result_array()[0];
        $ppopddata = $this->db->select('pelayanan_publik_opd.*, opd.nama_opd')
            ->from('pelayanan_publik_opd')
            ->join('opd', 'pelayanan_publik_opd.id_opd = opd.id_opd')
            ->order_by('nama_opd')
            ->where('id_laporan', $id)->get()->result_array();
        return array('pp' => $ppdata, 'ppopd' => $ppopddata);
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
        $this->db->insert('pelayanan_publik', $datalaporan);
        activity_log();
        // insert second etc. table data here
        // api dashboard?
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
                    'indeks_pelayanan_publik' => $data['indeks_pelayanan_publik'][$i]
                ));
            }
        }
        $this->db->trans_begin();
        if ($table == 'pelayanan_publik_opd') {
            $this->db->delete('pelayanan_publik_opd', "id_laporan = $id_laporan");
            activity_log();
            if ($data != NULL) {
                $this->db->insert_batch('pelayanan_publik_opd', $insdata);
                activity_log();
            }
        }
        $this->db->trans_complete();
    }

    public function delete_data($id_laporan)
    {
        $this->db->trans_begin();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('pelayanan_publik');
        activity_log();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan');
        activity_log();
        $this->db->trans_complete();
    }
}
