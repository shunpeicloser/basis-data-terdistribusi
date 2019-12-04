<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Coba extends CI_Controller
{

    public function index()
    {
        $this->load->model('api_sikd_model');
        $data = $this->api_sikd_model->get_api();
        $json = json_encode($data, JSON_PRETTY_PRINT);

        printf("<pre>%s</pre>", $json);
        // die();
    }

    public function re(){
        
    }

    public function testbackup($formname, $id_laporan)
    {
        $this->load->model('dbbackup_model', 'dbb');
        $this->dbb->backup_laporan($formname, $id_laporan);
    }

    public function testrestore($formname, $id_laporan, $tm)
    {
        $this->load->model('dbbackup_model', 'dbb');
        $this->dbb->restore_laporan($formname, $id_laporan, $tm);
    }

    public function inaproc()
    {
        $this->load->model('api_inaproc_rup_model', 'a');
        $this->a->get_rup();
        
    }

    public function get_tw()
    {
        $this->load->model('api_sikd_model');
        $data = $this->api_sikd_model->get_tahunan();

        var_dump($data);
    }

    public function updatekodeskpd()
    {
        $this->load->model('opd_model');
        $data = $this->opd_model->gets();
        foreach ($data as $row) {
            $kode = $row['kode_emov'];
            if ($kode[0] == '0') {
                $kode = substr($kode, 1);
            }
            $this->db->where('id_opd', $row['id_opd']);
            $this->db->update('opd', ['kode_skpd' => $kode]);

            $kode = NULL;
        }
    }

    public function test()
    {
        $laporan_baru = array('id_laporan' => '318', 'id_opd' => '290', 'id_tipe' => '1');
        $id_opd = '290';
        $tahun = '2020';
        $this->load->model("tipelaporan/realisasifisik_model", 'tt');
        $this->tt->init_insert($id_opd, $laporan_baru, array('tgl' => '2020-09-09'));
        // $this->load->model('api_sipp_model', 'sipp');
        // $this->sipp->api_fetch_data($id_opd, $laporan_baru, $tahun);

    }

    public function lap($formname, $id)
    {
        $this->load->model('laporan_model', 'lp');
        $this->lp->get_laporan_data_by_name_id($formname, $id);
    }

    public function loaddata()
    {
        $this->load->model('api_sipp_model', 'sipp');
        $this->sipp->api_fetchall_realisasifisik();
    }
}

/* End of file Coba.php */
