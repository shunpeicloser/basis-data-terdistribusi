<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Disposisi_model extends CI_Model
{
    public function get($act = null)
    {
        if ($act == null) {
            var_dump('null');
        } elseif ($act == 'rekap') {
            $this->db->select('*');
            $this->db->from('disposisi');
            $this->db->join('opd', 'opd.id_opd = disposisi.surat_dari');
            return $this->db->get()->result_array();
        }
    }

    public function insert($data)
    {
        return $this->db->insert('disposisi', $data);
    }

    public function delete($id)
    {
        return $this->db->delete('disposisi', ['id_disposisi' => $id]);
    }
}

/* End of file Disposisi_model.php */
