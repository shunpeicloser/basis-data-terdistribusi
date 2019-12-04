<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dbf_model extends CI_Model
{
    // USER
    public function get_user($id = NULL)
    {
        $this->db->from('user');
        $this->db->join('opd', 'opd.id_opd = user.id_opd', 'left');
        $this->db->where('user.id != 1');

        if ($id) {
            $this->db->where('id', $id);
            return $this->db->get()->row_array();
        }

        return $this->db->get()->result_array();
    }

    // OPD
    public function get_opd($id = NULL)
    {
        $this->db->from('opd');
        $this->db->where('opd.id_opd != 1');

        if ($id) {
            $this->db->where('opd.id_opd = ', $id);
            return $this->db->get()->row_array();
        }

        return $this->db->get()->result_array();
    }

    // TIPE LAPORAN
    public function get_tipe_laporan($id_tipe = NULL)
    {
        $this->db->from('tipe_laporan');

        if ($id_tipe) {
            $this->db->where('tipe_laporan.id_tipe = ', $id_tipe);
            return $this->db->get()->row_array();
        }

        return $this->db->get()->result_array();
    }

    // TIPELAPORAN PER OPD
    public function get_opd_tipe()
    {
        $data = $this->get_opd();

        $i = 0;
        foreach ($data as $row) {
            $tipe = $this->get_tipelaporan_per_opd($row['id_opd']);
            $data[$i]['tipe_laporan'] = array();

            foreach ($tipe as $push) {
                array_push($data[$i]['tipe_laporan'], $push);
            }

            $tipe = NULL;
            $i++;
        }

        return $data;
    }

    public function get_tipelaporan_per_opd($id = NULL)
    {
        $this->db->from('tipelaporan_per_opd');
        $this->db->join('opd', 'tipelaporan_per_opd.id_opd = opd.id_opd', 'left');
        $this->db->join('tipe_laporan', 'tipe_laporan.id_tipe = tipelaporan_per_opd.id_tipe', 'left');

        if ($id) {
            $this->db->where('tipelaporan_per_opd.id_opd', $id);
        }

        return $this->db->get()->result_array();
    }

    public function del_tipelaporan_per_opd($id)
    {
        foreach ($id as $id_tipe) {
            $this->db->or_where('tipelaporan_per_opd.id_tipe !=', $id_tipe);
        }
        $this->db->delete('tipelaporan_per_opd');
        activity_log();
    }

    public function get_log($day = NULL)
    {
        // SELECT * FROM `log` WHERE created_at >= '20190708' AND created_at < '20190808'
        $this->db->from('log');
        $this->db->join('user', 'log.log_user_id = user.id', 'left');
        $this->db->join('opd', 'opd.id_opd = user.id_opd', 'left');
        $this->db->select('user.username, opd.nama_opd, log.log_act, log.created_at, log.log_query');
        if ($day) {
            $this->db->where('DATE(log.created_at)', $day);
        }

        return $this->db->get()->result_array();
    }

    // LAPORAN
    public function get_laporan($id = NULL)
    {
        $this->db->from('laporan');
        $this->db->join('opd', 'laporan.id_opd = opd.id_opd', 'left');
        $this->db->join('tipe_laporan', 'laporan.id_tipe = tipe_laporan.id_tipe', 'left');

        if ($id) {
            $this->db->where('laporan.id_laporan = ', $id);
            return $this->db->get()->row_array();
        }

        return $this->db->get()->result_array();
    }
}

/* End of file Dbf_model.php */
