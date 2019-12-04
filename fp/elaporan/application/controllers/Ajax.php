<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Ajax extends CI_Controller
{
    public function get_sub_auditor($kode_ekin)
    {
        $this->load->model('api_ekin_model');
        $nip = $this->input->post('select_auditor', true);
        $data = $this->api_ekin_model->get_peg($kode_ekin, $nip);
        echo json_encode($data);
    }
}

/* End of file Ajax.php */
