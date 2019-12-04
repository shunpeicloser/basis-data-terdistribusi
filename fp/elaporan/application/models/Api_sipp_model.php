<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Api_sipp_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->library('xmlrpc');
        $this->load->library('xmlrpcs');
    }


    public function get_api($key, $value)
    {
        $key = 'b64149c3ea867959207e933bb686c9ab41d3370b';
        $url = "http://eplanning.madiunkota.go.id/api/ws/ppas/final?$key=$value";

        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 60,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => [
                "X-API-KEY: b64149c3ea867959207e933bb686c9ab41d3370b"
            ]
        ]);

        $response = curl_exec($curl);
        $err = curl_error($curl);

        if ($err) {
            // API GAGAL
            return NULL;
        } else {
            // API BERHASIL
            $arr = json_decode($response, true);
            return $arr;
        }
    }

    public function api_fetch_data($id_opd_param, $laporan_baru, $tahun)
    {
        if ($laporan_baru == NULL) {
            return NULL;
        }
        $this->load->model('opd_model', 'opd');
        $idebud = $this->opd->get_idebud($id_opd_param);

        $data = $this->get_api("kode_opd", $idebud);
        if (!isset($data['data'])) {
            // echo "TIMEOUT<br/>";
            return NULL;
        }
        $data = $data['data'];
        $this->load->model('laporan_model', 'lp');
        $this->load->model('tipelaporan_model', 'tl');

        $fet = array();
        foreach ($data as $row) {
            if ($row['tahun'] != $tahun)
                continue;
            if (!isset($fet[$row['nama_opd']]))
                $fet[$row['nama_opd']] = array();
            array_push($fet[$row['nama_opd']], $row);
        }
        unset($data);
        $data_prog;
        $data_kg;
        foreach ($fet as $dataperopd) {
            unset($data_prog, $data_kg);
            $data_kg = [];
            $data_prog = [];
            $id_opd = $this->opd->get_id_from_ebud($dataperopd[0]['kode_opd']);

            // unregistered/differ kode_ebud/ekin/emonev
            if ($id_opd == NULL) {
                return NULL;
            }

            // tabel program + kegiatan
            foreach ($dataperopd as $d) {
                if (!isset($data_prog[$laporan_baru['id_laporan'] . "-" . $d['kode_program']])) {
                    $data_prog[$laporan_baru['id_laporan'] . "-" . $d['kode_program']] =
                        array(
                            'id_laporan' => $laporan_baru['id_laporan'],
                            'kode_program' => $laporan_baru['id_laporan'] . "-" . $d['kode_program'],
                            'nama_program' => $d['nama_program'],
                            'capaian_indikator' => reset($d['capaian'])['indikator'],
                            // 'capaian_target' => reset($d['capaian'])['target'],
                            // 'capaian_target_rkpd' => reset($d['capaian'])['target_rkpd'],
                            // 'capaian_target_ppas_draft' => reset($d['capaian'])['target_ppas_draft'],
                            'capaian_target_ppas_final' => reset($d['capaian'])['target_ppas_final'],
                            'capaian_satuan' => reset($d['capaian'])['satuan'],
                        );
                }
                if (!isset($data_kg[$laporan_baru['id_laporan'] . "-" . $d['kode_program'] . "-" . $d['kode_kegiatan']])) {
                    $data_kg[$laporan_baru['id_laporan'] . "-" . $d['kode_program'] . "-" . $d['kode_kegiatan']] =
                        array(
                            'kode_kegiatan' => $laporan_baru['id_laporan'] . "-" . $d['kode_program'] . "-" . $d['kode_kegiatan'],
                            'kode_program' => $laporan_baru['id_laporan'] . "-" . $d['kode_program'],
                            'nama_kegiatan' => $d['nama_kegiatan'],
                            // 'pagu_renja' => $d['pagu_renja'],
                            // 'pagu_rkpd' => $d['pagu_rkpd'],
                            // 'pagu_ppas_draft' => $d['pagu_ppas_draft'],
                            'pagu_ppas_final' => $d['pagu_ppas_final'],

                            'keluaran_indikator' => reset($d['keluaran'])['indikator'],
                            // 'keluaran_target' => reset($d['keluaran'])['target'],
                            // 'keluaran_target_rkpd' => reset($d['keluaran'])['target_rkpd'],
                            // 'keluaran_target_ppas_draft' => reset($d['keluaran'])['target_ppas_draft'],
                            'keluaran_target_ppas_final' => reset($d['keluaran'])['target_ppas_final'],
                            'keluaran_satuan' => reset($d['keluaran'])['satuan'],

                            'hasil_indikator' => reset($d['hasil'])['indikator'],
                            // 'hasil_target' => reset($d['hasil'])['target'],
                            // 'hasil_target_rkpd' => reset($d['hasil'])['target_rkpd'],
                            // 'hasil_target_ppas_draft' => reset($d['hasil'])['target_ppas_draft'],
                            'hasil_target_ppas_final' => reset($d['hasil'])['target_ppas_final'],
                            'hasil_satuan' => reset($d['hasil'])['satuan'],
                        );
                }
            }
            return array('prog' => $data_prog, 'kg' => $data_kg);
        }
    }

    public function api_fetchall_realisasifisik($id_opd_param = NULL, $tahun = "2020")
    {
        $this->load->model('opd_model', 'opd');
        $idebud = NULL;
        if ($id_opd_param != NULL) {
            $idebud = $this->opd->get_idebud($id_opd_param);
        }
        $data = $this->get_api("tahun", $tahun);
        if (!isset($data['data'])) {
            echo "TIMEOUT<br/>";
            return;
        }
        $data = $data['data'];
        $this->load->model('tipelaporan/realisasifisik_model', 'rf');
        $this->load->model('laporan_model', 'lp');
        $this->load->model('tipelaporan_model', 'tl');

        $fet = array();
        foreach ($data as $row) {
            if ($id_opd == NULL) {
                if (!isset($fet[$row['nama_opd']]))
                    $fet[$row['nama_opd']] = array();
                array_push($fet[$row['nama_opd']], $row);
            } else {
                if ($row['kode_opd'] != $idebud) continue;
                $fet[$row['nama_opd']] = array();
                array_push($fet[$row['nama_opd']], $row);
            }
        }
        // printf("<pre>%s</pre>", json_encode($fet, JSON_PRETTY_PRINT));
        // die();
        unset($data);
        $data_lp;
        $data_rf;
        $data_prog;
        $data_kg;
        // asumsi 1 opd 1 laporan per tahun => butuh id dari API kalo mau multi laporan
        foreach ($fet as $dataperopd) {
            unset($data_lp, $data_rf, $data_prog, $data_kg);
            $data_kg = [];
            $data_prog = [];
            $id_opd = $this->opd->get_id_from_ebud($dataperopd[0]['kode_opd']);
            // unregistered/differ kode_ebud/ekin/emonev
            if ($id_opd == NULL) {
                // var_dump($dataperopd[0]['kode_opd'], $dataperopd[0]['nama_opd']);
                // echo "<br/><br/>";
                $data = array([
                    'nama_opd' => strtoupper($dataperopd[0]['nama_opd']),
                    'kode_ebud' => $dataperopd[0]['kode_opd']
                ]);
                $this->opd->insert($data);
                continue;
            }
            $id_tipe = $this->tl->get_idtipe_by_kodetipe('realisasi_fisik');
            $data_lp = array(
                'id_opd' => $id_opd,
                'id_tipe' => $id_tipe,
            );
            // add to laporan
            $laporan_baru = $this->lp->add_data($data_lp);

            //add to realisasi_fisik
            $data_rf = array(
                'id_laporan' => $laporan_baru['id_laporan'],
                'id_opd' => $laporan_baru['id_opd'],
                'id_tipe' => $laporan_baru['id_tipe'],
                'created_at' => $laporan_baru['created_at'],
                'updated_at' => $laporan_baru['updated_at'],
            );

            // $this->rf->insert_index($data_rf);

            // tabel program + kegiatan
            foreach ($dataperopd as $d) {
                if (!isset($data_prog[$laporan_baru['id_laporan'] . $d['kode_program']])) {
                    $data_prog[$laporan_baru['id_laporan'] . $d['kode_program']] =
                        array(
                            'id_laporan' => $laporan_baru['id_laporan'],
                            'kode_program' => $laporan_baru['id_laporan'] . $d['kode_program'],
                            'nama_program' => $d['nama_program'],
                            'capaian_indikator' => reset($d['capaian'])['indikator'],
                            'capaian_target' => reset($d['capaian'])['target'],
                            'capaian_target_rkpd' => reset($d['capaian'])['target_rkpd'],
                            'capaian_target_ppas_draft' => reset($d['capaian'])['target_ppas_draft'],
                            'capaian_target_ppas_final' => reset($d['capaian'])['target_ppas_final'],
                            'capaian_satuan' => reset($d['capaian'])['satuan'],
                        );
                }
                // $this->rf->insert_program($data_prog);

                if (!isset($data_kg[$laporan_baru['id_laporan'] . $d['kode_program'] . $d['kode_kegiatan']])) {
                    $data_kg[$laporan_baru['id_laporan'] . $d['kode_program'] . $d['kode_kegiatan']] =
                        array(
                            'kode_kegiatan' => $laporan_baru['id_laporan'] . $d['kode_program'] . $d['kode_kegiatan'],
                            'kode_program' => $laporan_baru['id_laporan'] . $d['kode_program'],
                            'nama_kegiatan' => $d['nama_kegiatan'],
                            'pagu_renja' => $d['pagu_renja'],
                            'pagu_rkpd' => $d['pagu_rkpd'],
                            'pagu_ppas_draft' => $d['pagu_ppas_draft'],
                            'pagu_ppas_final' => $d['pagu_ppas_final'],

                            'keluaran_indikator' => reset($d['keluaran'])['indikator'],
                            'keluaran_target' => reset($d['keluaran'])['target'],
                            'keluaran_target_rkpd' => reset($d['keluaran'])['target_rkpd'],
                            'keluaran_target_ppas_draft' => reset($d['keluaran'])['target_ppas_draft'],
                            'keluaran_target_ppas_final' => reset($d['keluaran'])['target_ppas_final'],
                            'keluaran_satuan' => reset($d['keluaran'])['satuan'],

                            'hasil_indikator' => reset($d['hasil'])['indikator'],
                            'hasil_target' => reset($d['hasil'])['target'],
                            'hasil_target_rkpd' => reset($d['hasil'])['target_rkpd'],
                            'hasil_target_ppas_draft' => reset($d['hasil'])['target_ppas_draft'],
                            'hasil_target_ppas_final' => reset($d['hasil'])['target_ppas_final'],
                            'hasil_satuan' => reset($d['hasil'])['satuan'],
                        );
                }
            }
            $this->rf->insert_fetch($data_rf, $data_prog, $data_kg);
        }
    }
}

/* End of file Api_sipp_model.php */
