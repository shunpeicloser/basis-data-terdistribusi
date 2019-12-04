<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Api_inaproc_rup_model extends CI_Model
{
    public function get_api()
    {
        $url = "https://inaproc.lkpp.go.id/isb/api/9e80f42a-7850-403f-b619-e33105f1e1a7/json/17864547/pengumumanruptahunan2018/tipe/4:12/parameter/2019:D179";

        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 120,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_HTTPHEADER => array(
                "cache-control: no-cache"
            ),
        ]);

        $response = curl_exec($curl);
        $err = curl_error($curl);

        if ($err) {
            // API GAGAL
            return NULL;
        } else {
            // API BERHASIL
            $arr = json_decode($response, true);
            // $arr = $response;
            return $arr;
        }
    }

    public function get_rup()
    {
        $data = $this->get_api();
        $this->load->model('opd_model', 'opd');
        $ret = array();
        // var_dump($data); die();
        foreach($data as $rup){
            $id_opd = $this->opd->get_idopd_by_namaopd($rup['nama_satker']);
            if($id_opd != NULL){
                array_push($ret, array(
                    'id_opd' => $id_opd,
                    'nama_opd' => $rup['nama_satker'],
                    'nama_paket_kerja' => $rup['nama_paket'],
                    'pagu' => $rup['pagu_rup']
                ));
            }   
        }
        return $ret;
        // printf("<pre>%s</pre>", json_encode($ret, JSON_PRETTY_PRINT)); die();
    }
}

/* End of file Api_ekin_model.php */
