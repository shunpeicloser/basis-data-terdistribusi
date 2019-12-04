<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Apicheck extends CI_Controller
{
    public function index()
    {
        
    }

    public function get_data_laporan($cond)
    {
        $this->load->model('tipelaporan_model', 'tipe');
        if($cond == NULL){ // all laporan
            // $tipe = $this->tipe->gets();
        }
    }
    
}

/* End of file Apicheck.php */
