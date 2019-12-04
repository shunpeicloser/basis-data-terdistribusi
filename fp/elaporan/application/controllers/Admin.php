<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Admin extends CI_Controller
{
    public $data;

    public function __construct()
    {
        parent::__construct();
        $this->sess_ver();

        $this->data['user'] = array(
            'id_opd' => $this->session->tempdata('id_opd'),
            'nama_opd' => $this->session->tempdata('nama_opd')
        );
        $this->data['title'] = "E-Laporan " . strtoupper($this->session->tempdata('nama_opd'));
    }

    public function index()
    {
        redirect('database/opdtipe', 'refresh');
    }

    public function f($formfilename = NULL, $id_opd = NULL)
    {
        if ($formfilename == NULL || !file_exists(APPPATH . "views/formtemplate/$formfilename.php")) {
            redirect('admin', 'refresh');
            return;
        }

        $this->data['contents'] = APPPATH . "views/formtemplate/$formfilename.php";

        // data to send to view for option
        if ($formfilename == 'registrationform') {
            $this->load->model('opd_model', 'opd');
            $data = $this->opd->gets();
            $this->data['opsi_opd'] = array();
            // var_dump($data); die();
            foreach ($data as $row) {
                if ($row['id_opd'] == '1') // id_opd admin
                    continue;
                array_push($this->data['opsi_opd'],  $row);
            }
            $this->data['tipe_opsi'] = 'register';
        } elseif ($formfilename == 'resetpasswordform') {
            $this->load->model('user_model', 'user');
            $data = $this->user->gets();
            $this->data['opsi_user'] = array();
            foreach ($data as $row) {
                array_push($this->data['opsi_user'],  $row);
            }
            $this->data['tipe_opsi'] = 'reset';
        } elseif ($formfilename == 'tipelaporanopdform') {
            // load list OPD
            $this->load->model('opd_model', 'opd');
            $data = $this->opd->gets();
            $this->data['opsi_opd'] = array();
            foreach ($data as $row) {
                if ($row['id_opd'] == '1') continue;
                array_push($this->data['opsi_opd'],  $row);
            }
            // load tipe laporan yang nyala
            if ($id_opd == NULL) {
                $id_opd = $data[0]['id_opd'];
            }
            $this->data['selected'] = $id_opd;
            $this->load->model('tipelaporanopd_model', 'tlo');
            $data = $this->tlo->get_tipelaporan_by_idopd($id_opd);
            $this->data['tipelaporan_on'] = array();
            foreach ($data as $d) {
                $this->data['tipelaporan_on'][$d['id_tipe']] = "on";
            }

            // load seluruh tipelaporan
            $this->load->model('tipelaporan_model', 'tipelaporan');
            $data = $this->tipelaporan->gets();
            // var_dump($data); die();
            $this->data['opsi_tipelaporan'] = array();
            foreach ($data as $row) {
                array_push($this->data['opsi_tipelaporan'],  $row);
            }
            // var_dump($this->data['opsi_tipelaporan']); die();
            $this->data['tipe_opsi'] = 'tipelaporan';
        } else {
            redirect('admin', 'refresh');
            return;
        }

        $this->load->view('template/index_admin', array('data' => $this->data));
    }

    public function riwayatlaporan($page_number = 1)
    {
        if ($this->input->get() != NULL) {
            return $this->carilaporan();
        }
        $this->load->model('laporan_model', 'laporan');
        $datalaporan = $this->laporan->get_alllaporan($page_number);
        $this->data['list_laporan'] = $datalaporan;
        $this->load->model('opd_model', 'opd');
        $this->data['opsi_opd'] = $this->opd->gets();
        unset($this->data['opsi_opd'][0]);
        $this->load->model('tipelaporanopd_model', 'tso');
        $this->data['opsi_laporan'] = $this->tso->get_opd_namatipelaporan();
        $this->data['contents'] = APPPATH . "views/admin/riwayatlaporan.php";
        $this->load->view('template/index_admin', array('data' => $this->data));
    }
    // belum selesai
    public function carilaporan()
    {
        $getdata = $this->input->get();
    }

    public function add_user()
    {
        $data = [
            'username' => htmlspecialchars($this->input->post('username', true)),
            'password' => password_hash($this->input->post('password', true), PASSWORD_BCRYPT),
            'id_opd' => $this->input->post('id_opd', true)
        ];

        $this->load->model('user_model');
        $this->user_model->insert($data);
    }

    public function update_tipelaporan_per_opd()
    {
        if ($this->session->tempdata('id_opd') != '1') {
            redirect('auth', 'refresh');
        }
        $this->load->model('tipelaporanopd_model', 'tipelaporanopd');
        $this->tipelaporanopd->update_tipelaporan_per_opd($this->input->post('id_opd'), $this->input->post('id_tipe'));
    }

    public function reset_password($id = NULL)
    {
        $this->load->model('user_model');

        // INI KALAU RESET PASSWORD, BUKAN GANTI PASSWORD
        if ($id) {
            $this->set_flash('RESET PASSWORD', 'Reset password berhasil', 'notice');
            $this->user_model->reset_password($id, '123456');

            redirect('database/user', 'refresh');
        }

        $this->user_model->reset_password($this->input->post('id'), $this->input->post('password'));
    }

    public function submit()
    {
        $flag_option = $this->input->post('tipe_opsi'); // tipe_opsi from form hidden attribute
        if ($flag_option == 'register') {
            $this->add_user();
            $this->set_flash('Tambah User', 'BERHASIL', 'success');
            redirect('database/user', 'refresh');
        } elseif ($flag_option == 'reset') {
            $this->reset_password();
            redirect('admin/f/resetpasswordform', 'refresh');
        } elseif ($flag_option == 'tipelaporan') {
            $this->update_tipelaporan_per_opd();
            $this->set_flash('Update Akses OPD', 'Update Akses OPD BERHASIL', 'success');
            redirect('database/opdtipe', 'refresh');
        }
    }

    public function querylog($filename = NULL)
    {
        $this->data['title'] = 'Query Logger';

        if ($filename) {
            $this->data['contents'] = APPPATH . "logs/" . $filename;
        } else {
            $this->data['contents'] = APPPATH . "views/admin/querylogger.php";
        }

        $this->load->view('template/index_admin', ['data' => $this->data]);
    }

    public function set_flash($title, $string, $type)
    {
        $this->session->set_flashdata('message', '<body onload="new PNotify({
                                  title: \'' . $title . '\',
                                  text: \'' . $string . '\',
                                  type: \'' . $type . '\',
                                  styling: \'bootstrap3\'
                              });">
    
  </body>');
    }

    private function sess_ver()
    {
        if ($this->session->tempdata() == NULL or $this->session->tempdata('id_opd') != '1') {
            redirect('auth');
        }
    }
}

/* End of file Admin.php */
