<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Apicheck extends CI_Controller
{
    public function index()
    {
        echo '<a href="' . base_url('apicheck/sipp/tahun/2020') . '">SIPP</a><br>';
        echo '<a href="' . base_url('apicheck/sikd_serapan/2019/2') . '">SIKD SERAPAN</a><br>';
        echo '<a href="' . base_url('apicheck/sikd_lra/2019/1.18.01') . '">SIKD LRA</a><br>';
        echo '<a href="' . base_url('apicheck/ekin_pegawai') . '">MASTER AUDITOR</a><br>';
        echo '<a href="' . base_url('apicheck/ekin_pegawai/16') . '">AUDITOR BY ID</a><br>';
        echo '<a href="' . base_url('apicheck/cek_kode_opd_sipp') . '">CEK KODE EBUD OPD DARI SIPP</a><br>';
    }

    public function cek_kode_opd_sipp()
    {
        $key = 'tahun';
        $val = '2019';
        $this->load->model('api_sipp_model');
        $data = $this->api_sipp_model->get_api($key, $val);
        $data = $data['data'];

        print_r($data);
        // foreach ($data as $key => $row) {
        //     print_r($row['tahun']);
        //     print_r($row['kode_opd']);
        //     print_r($row['nama_opd']);
        // }
    }
    public function sipp($key = 'tahun', $val = '2020')
    {
        $this->load->model('api_sipp_model');
        $data = $this->api_sipp_model->get_api($key, $val);
        $json = json_encode($data, JSON_PRETTY_PRINT);

        printf('Data<pre>%s</pre>', $json);
    }

    public function sikd_serapan($tahun = '2019', $tw = '2')
    {
        $this->load->model('api_sikd_model');
        $data = $this->api_sikd_model->get_serapan($tahun, $tw);
        $json = json_encode($data['arr'], JSON_PRETTY_PRINT);

        printf('Data<pre>%s</pre>', $json);
    }

    public function sikd_lra($tahun, $kode_skpd)
    {
        $this->load->model('api_sikd_model');
        $data = $this->api_sikd_model->get_lra($tahun, $kode_skpd);
        $json = json_encode($data, JSON_PRETTY_PRINT);

        printf('Data<pre>%s</pre>', $json);
    }

    public function test($id_laporan, $tahun, $id_opd)
    {
        $this->load->model('opd_model', 'opd');
        $this->load->model('api_sikd_model', 'p');
        $kode_skpd = $this->opd->get_idemov($id_opd);
        // var_dump($kode_skpd); die();
        if ($kode_skpd == NULL) return NULL;
        $fet = $this->p->get_lra($tahun, $kode_skpd);
        printf("<pre>%s</pre>", json_encode($fet, JSON_PRETTY_PRINT));
        die();
        $ret = array();
        if ($fet != NULL) {
            foreach ($fet as $f) {

                array_push($ret, array(
                    'kode_kegiatan' => $id_laporan . '-' . $f['KODE_PROGRAM'] . '-' . $f['KODE_KEGIATAN'],
                    'realisasi' => $f['REALISASI']
                ));
            }
            return $ret;
        } else return NULL;
    }

    public function ekin_pegawai($kode_ekin)
    {
        if ($kode_ekin) {
            $this->load->model('api_ekin_model');
            $data = $this->api_ekin_model->get_peg($kode_ekin);
            $json = json_encode($data, JSON_PRETTY_PRINT);

            printf('Data<pre>%s</pre>', $json);
        } else {
            $this->load->model('api_ekin_model');
            $data = $this->api_ekin_model->get_api();
            $json = json_encode($data, JSON_PRETTY_PRINT);

            printf("Data<pre>%s</pre>", $json);
        }
    }
}

/* End of file Apicheck.php */
