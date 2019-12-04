<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Surat_masuk_model extends CI_Model
{

    public function insert($data)
    {
        return $this->db->insert('surat_masuk', $data);
    }
}

/* End of file Surat_masuk_model.php */
