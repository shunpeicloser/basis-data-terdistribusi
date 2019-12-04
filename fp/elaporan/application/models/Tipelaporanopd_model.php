<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Tipelaporanopd_model extends CI_Model
{
    public function gets()
    {
        return $this->db->select('tipelaporan_per_opd')->result_array();
    }

    public function get_opd_namatipelaporan($id_opd = NULL)
    {
        if ($id_opd != NULL) {
            $this->db->select('id_opd, tipe_laporan.*')
                ->from('tipelaporan_per_opd')
                ->where('id_opd', $id_opd)
                ->join('tipe_laporan', 'tipelaporan_per_opd.id_tipe = tipe_laporan.id_tipe');
        } else {
            $this->db->select('id_opd, tipe_laporan.*')
                ->from('tipelaporan_per_opd')
                ->join('tipe_laporan', 'tipelaporan_per_opd.id_tipe = tipe_laporan.id_tipe');
        }
        return $this->db->get()->result_array();
    }

    public function get_tipelaporan_by_idopd($id_opd)
    {
        $this->db->select('tipe_laporan.id_tipe, tipe_laporan.nama_laporan, tipe_laporan.kode_tipe')
            ->from('tipelaporan_per_opd')
            ->where('tipelaporan_per_opd.id_opd = ' . $id_opd)
            ->join('tipe_laporan', 'tipelaporan_per_opd.id_tipe = tipe_laporan.id_tipe')
            ->order_by('tipe_laporan.nama_laporan', 'asc');

        return $this->db->get()->result_array();
    }

    // public function get_idtipe_per_opd($id_opd)
    // {
    //     $temp = $this->db->get_where('tipelaporan_per_opd', array('id_opd' => $id_opd))->result();
    //     $idtipe = array();
    //     foreach ($temp as $row) {
    //         array_push($idtipe, $row->id_tipe);
    //     }
    //     if (sizeof($idtipe) > 0)
    //         return $idtipe;
    //     else return NULL;
    // }

    public function update_tipelaporan_per_opd($id_opd, $data)
    {
        $this->db->trans_start();
        // delete saved data first
        $this->db->delete('tipelaporan_per_opd', array('id_opd' => $id_opd));
        activity_log();
        $to_insert = array();
        if ($data == NULL || sizeof($data) <= 0) {
            $this->db->trans_complete();
            return;
        }
        foreach ($data as $value) {
            if ($value == NULL) continue;
            array_push($to_insert, ['id_opd' => $id_opd, 'id_tipe' => $value]);
        }
        $this->db->insert_batch('tipelaporan_per_opd', $to_insert);
        activity_log();
        $this->db->trans_complete();
    }
}
