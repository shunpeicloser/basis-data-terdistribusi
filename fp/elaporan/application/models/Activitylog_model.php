<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Activitylog_model extends CI_Model
{

    public function save_log($data)
    {
        $this->db->insert('log', $data);
        return $this->db->affected_rows();
    }
}

/* End of file Activitylog_model.php */
