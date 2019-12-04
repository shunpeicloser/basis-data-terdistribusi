<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Opd extends CI_Controller
{
    private $tipelaporan;
    public $data;

    public function __construct()
    {
        parent::__construct();
        $this->sess_ver();
        $this->get_tipelaporan($this->session->tempdata('id_opd'));
        $this->data['sidebar'] = $this->tipelaporan;
        $this->data['user'] = array(
            'id_opd' => $this->session->tempdata('id_opd'),
            'nama_opd' => $this->session->tempdata('nama_opd')
        );
        $this->data['title'] = "E-Laporan " . strtoupper($this->session->tempdata('nama_opd'));
    }

    public function get_tipelaporan($id_opd)
    {
        $this->load->model('tipelaporanopd_model', 'tso');
        $this->tipelaporan = $this->tso->get_tipelaporan_by_idopd($id_opd);
    }

    public function get_list_tipelaporan()
    {
        return $this->tipelaporan;
    }

    public function index($err = NULL)
    {
        if ($err != NULL) {
            $this->data['error'] = $err;
        }
        if ($this->tipelaporan == NULL) {
            $this->data['contents'] = APPPATH . "views/opd/riwayatlaporan.php";
            $this->load->view('template/index_opd', array('data' => $this->data));
        } else {
            redirect('opd/f/' . $this->tipelaporan[0]['kode_tipe'], 'refresh');
        }
    }

    public function f($formname, $page_number = 10) // display laporan by kode_tipe
    {
        $this->form_ver($formname);
        $this->load->model('tipelaporan_model', 'ts');
        $this->data['nama_laporan'] = ucwords(str_replace('_', ' ', $formname));
        $this->data['kode_tipe'] = $formname;
        $from = $this->input->post('from');
        $to = $this->input->post('to');
        $this->data['list_laporan'] = $this->get_datalaporan_by_kodetipe($formname, $page_number, $from, $to);
        $this->data['contents'] = APPPATH . "views/opd/riwayatlaporan.php";
        $this->load->view('template/index_opd', array('data' => $this->data));
    }

    public function get_datalaporan_by_kodetipe($kode_tipe, $page_number, $from, $to)
    {
        $this->load->model('laporan_model', 'laporan');
        return $this->laporan->get_laporan_by_kodetipe($kode_tipe, $page_number, $this->session->tempdata('id_opd'), 20, $from, $to);
    }

    public function c($formname) // create new laporan by kode_tipe
    {
        $this->form_ver($formname);
        $tgl = $this->input->post('tgl');
        // buat di tabel laporan
        $this->load->model('tipelaporan_model', 'tl');
        $id_tipe = $this->tl->get_idtipe_by_kodetipe($formname);
        // buat di table nama_surat
        $initdata = $this->input->post();
        $this->load->model("tipelaporan/" . str_replace('_', '', $formname) . "_model", 'p');
        $newid = $this->p->init_insert(
            $this->session->tempdata('id_opd'),
            array('id_opd' => $this->session->tempdata('id_opd'), 'id_tipe' => $id_tipe),
            $initdata
        );
        if ($newid == NULL) {
            redirect("opd/e/$formname", 'refresh');
        }
        $this->set_flash('Tambah', 'Berhasil menambah ' . ucwords(str_replace('_', ' ', $formname)), 'success');
        redirect("opd/e/$formname/$newid", "refresh");
    }

    public function e($formname, $id_laporan) // edit existing data
    {
        if ($this->input->post() != NULL) {   // update data
            $this->load->model("tipelaporan/" . str_replace('_', '', $formname) . "_model", 'lp');
            $this->lp->update_data($id_laporan, $this->input->post());
            // prevent re-post data
            // return true;
            redirect("opd/thanks/$formname/$id_laporan", 'refresh');
        }

        // INI KETIKA LOAD / GET
        $this->data['nama_laporan'] = ucwords(str_replace('_', ' ', $formname));
        $this->load->model('laporan_model', 'laporan');
        if (
            $formname == "ikm" || $formname == "sotk" || $formname == 'tatalaksana' ||
            $formname == "pelayanan_publik" || $formname == "monitoring_kelembagaan" ||
            $formname == "rekap_tender" || $formname == "jadwal_pelaksanaan"
        ) {
            $this->load->model('opd_model', 'opd');
            $this->data['opsi_opd'] = $this->opd->gets();
            unset($this->data['opsi_opd'][0]);
        }
        if ($formname == "rekap_tender") {
            $this->load->model('api_inaproc_rup_model', 'ina');
            $this->data['opsi_paket_kerja'] = $this->ina->get_rup();
        }
        if ($formname == "rekap_pokja") {
            $this->load->model('tipelaporan/rekaptender_model', 'rt');
            $this->data['opsi_paket_kerja'] = $this->rt->get_paket_kerja();
        }

        $this->data['fetch'] = $this->laporan->get_laporan_data_by_name_id($formname, $id_laporan);
        $this->data['formname'] = $formname;
        $this->data['contents'] = APPPATH . "views/formtemplate/$formname.php";
        $this->data['id_laporan'] = $id_laporan;
        $this->load->view('template/index_opd', array('data' => $this->data));
    }

    public function d($formname, $id_laporan)
    {
        $this->load->model("tipelaporan/" . str_replace('_', '', $formname) . "_model", 'd');
        $this->d->delete_data($id_laporan);
        $this->set_flash('Hapus', 'Berhasil menghapus ' . ucwords(str_replace('_', ' ', $formname)) . ' dengan id ' . $id_laporan, 'warning');
        redirect("opd/f/$formname", 'refresh');
    }

    public function thanks($formname, $id_laporan)
    {

        $this->set_flash('Update', 'Berhasil mengubah ' . ucwords(str_replace('_', ' ', $formname)) . ' dengan id ' . $id_laporan, 'info');
        redirect("opd/e/$formname/$id_laporan", 'refresh');
    }

    public function p($formname, $id_laporan) // print existing data
    {
        $this->load->model('laporan_model', 'laporan');

        $this->data['nama_laporan'] = ucwords(str_replace('_', ' ', $formname));
        $this->data['fetch'] = $this->laporan->get_laporan_data_by_name_id($formname, $id_laporan);
        $this->data['nama_opd'] = $this->session->tempdata('nama_opd');

        $this->load->view('print/' . $formname, array('data' => $this->data));
    }

    public function pdf($formname, $id_laporan)
    {
        $this->load->model('laporan_model', 'laporan');
        $this->load->library('pdf');

        $this->data['nama_laporan'] = ucwords(str_replace('_', ' ', $formname));
        $this->data['fetch'] = $this->laporan->get_laporan_data_by_name_id($formname, $id_laporan);
        $this->data['nama_opd'] = $this->session->tempdata('nama_opd');

        $this->pdf->setPaper('A3', 'landscape');
        $this->pdf->filename = $this->data['nama_laporan'];
        $this->pdf->load_view('print/' . $formname, array('data' => $this->data));
    }

    public function carilaporan($page_number)
    {
        $this->load->model('laporan_model', 'laporan');
        $this->data['list_laporan'] = $this->laporan->search($this->input->get());
        $this->data['contents'] = APPPATH . "views/opd/riwayatlaporan.php";
        $this->load->view('template/index_opd', array('data' => $this->data));
    }

    public function submit()
    {
        $id_laporan = NULL;
        if ($this->input->post('id_laporan') != NULL) {
            $id_laporan = $this->input->post('id_laporan');
        }
        $data = $this->input->post();
        if ($id_laporan == NULL) { // new data
            $this->laporan->add_data($data);
        } else { // editted data
            $this->laporan->update_data($id, $data);
        }
    }

    // INI BAGIAN DISPOSISI

    public function rekap_disposisi()
    {
        $this->load->model('disposisi_model');
        $this->data['rawdata'] = $this->disposisi_model->get('rekap');

        $this->data['title'] = 'Rekap Disposisi';
        $this->data['contents'] = APPPATH . "views/opd/rekap_disposisi.php";
        $this->load->view('template/index_opd', ['data' => $this->data]);
    }

    public function show_disposisi()
    {
        $this->data['title'] = 'Form Input Disposisi';
        $this->data['contents'] = APPPATH . "views/opd/form_disposisi.php";

        $this->load->model('Opd_model', 'opd');
        $this->data['raw_data'] = $this->opd->gets();

        $this->load->view('template/index_opd', ['data' => $this->data]);
    }

    public function show_lampiran_disposisi()
    {
        $this->data['title'] = 'Lampiran Disposisi';
        $this->data['contents'] = APPPATH . "views/opd/lampiran_disposisi.php";

        $this->load->model('disposisi_model');
        $this->data['rawdata'] = $this->disposisi_model->get('rekap');

        $this->load->view('template/index_opd', ['data' => $this->data]);
    }

    public function upload_lampiran($id)
    {
        if (!empty($_FILES)) {
            $config['upload_path'] = FCPATH . 'upload/disposisi';
            $config['allowed_types'] = 'jpg|jpeg|png|pdf';
            $config['max_size'] = '1000';
            $config['file_name'] = $this->session->tempdata('username') . '_' . date("mdHis") . mt_rand(0, 99);

            $this->load->library('upload', $config);

            if (!$this->upload->do_upload('file')) {
                $error = array('error' => $this->upload->display_errors());
                echo "gagal";
            } else {
                $data = array('upload_data' => $this->upload->data());

                $this->load->model('laporan_masuk_model');
                $this->laporan_masuk_model->insert(['id_disposisi' => $id, 'nama_file' => $this->upload->data('file_name')]);
            }
        }
    }

    public function input_disposisi()
    {
        $data = [
            'id_opd' => $this->session->tempdata('id_opd'),
            'laporan_dari' => htmlspecialchars($this->input->post('laporan_dari', TRUE)),
            'tgl_laporan' => date('Y-m-d', strtotime($this->input->post('tgl_laporan', TRUE))),
            'tgl_masuk' => date('Y-m-d', strtotime($this->input->post('tgl_masuk', TRUE))),
            'no_laporan' => htmlspecialchars($this->input->post('no_laporan', TRUE)),
            'no_agenda' => htmlspecialchars($this->input->post('no_agenda', TRUE)),
            'perihal' => htmlspecialchars($this->input->post('perihal', TRUE)),
            'diteruskan' => htmlspecialchars($this->input->post('diteruskan', TRUE)),
            'isi' => htmlspecialchars($this->input->post('isi', TRUE))
        ];

        $this->load->model('disposisi_model');
        $this->disposisi_model->insert($data);

        $this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert" style="margin">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"><strong>×</strong></span>
            </button>
            <center>
              Berhasil <strong>menambah</strong> disposisi (' . $data['no_laporan'] . ')
            </center>
          </div>');

        redirect('opd/rekap_disposisi', 'refresh');
    }

    public function deldis($id)
    {
        $this->load->model('disposisi_model');
        $this->disposisi_model->delete($id);

        $this->session->set_flashdata('pesan', '<div class="alert alert-danger" role="alert" style="margin">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"><strong>×</strong></span>
            </button>
            <center>
              Disposisi berhasil <strong>hapus!</strong>
            </center>
          </div>');

        redirect('opd/rekap_disposisi', 'refresh');
    }

    // DISPOSISI SELESAI

    private function sess_ver()
    {
        if ($this->session->tempdata() == NULL or $this->session->tempdata('id_opd') == '1') {
            redirect('auth');
        }
    }

    private function form_ver($formname)
    {
        $this->load->model('tipelaporanopd_model', 'a');
        $temp = $this->a->get_tipelaporan_by_idopd($this->session->tempdata('id_opd'));
        $flag = false;
        if ($temp != NULL) {
            foreach ($temp as $d) {
                if ($d['kode_tipe'] == $formname) {
                    $flag = true;
                    break;
                }
            }
        }
        if (!$flag) {
            return $this->index();
        }
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
}

/* End of file Opd.php */
