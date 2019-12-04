<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Tipelaporan_model extends CI_Model
{
    public function gets()
    {
        return $this->db->order_by('nama_laporan','ASC')->get('tipe_laporan')->result_array();
    }

    public function get_namalaporan($id_tipe)
    {
        if ($id_tipe == NULL)
            return NULL;
        $ret = $this->db->get_where('tipe_laporan', array('id_tipe' => $id_tipe))->result_array();
        return $ret;
    }

    public function get_idtipe_by_kodetipe($namalaporan)
    {
        $ret = $this->db->get_where('tipe_laporan', array('kode_tipe' => strtolower($namalaporan)))->result();
        if($ret != NULL)
            return $ret[0]->id_tipe;
        return NULL;
    }

    public function get_idtipe_by_idlaporan($id_laporan)
    {
        $ret = $this->db->select('id_tipe')
                        ->from('tipe_laporan')
                        ->join('laporan', 'laporan.id_tipe = tipe_laporan.id_tipe')
                        ->where('id_laporan', $id_laporan)->get()->result_array();
        if($ret != NULL)
            return $ret['id_laporan'][0];
        else return NULL;
    }

}
