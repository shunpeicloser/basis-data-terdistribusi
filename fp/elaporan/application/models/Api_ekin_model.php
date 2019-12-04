<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Api_ekin_model extends CI_Model
{
    public function get_api()
    {
        $url = "https://ekinerja.madiunkota.go.id/sync/sync_pegawai.php?user=sync_ekin&pass=sync_ekin_hamdiramadhan";
        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_HTTPHEADER => array(
                "cache-control: no-cache",
                "pass: sync_ekin_hamdiramadhan",
                "postman-token: a35767f8-489f-2c32-e382-5b76496a0821",
                "user: sync_ekin"
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

    public function get_peg($kode_ekin, $nip = NULL)
    {
        $data = $this->get_api();
        if ($nip) {
            foreach ($data as $key => $row) {
                if ($row['nip18'] == $nip && $row['kolok'] == $kode_ekin && ($row['jabatan'] != '' || $row['jabatan'] != NULL) && $row['unit_kerja']) {
                    return $row;
                }
            }
        } else {
            $response = array();
            foreach ($data as $key => $row) {
                if ($row['kolok'] == $kode_ekin && ($row['jabatan'] != '' || $row['jabatan'] != NULL) && $row['unit_kerja']) {
                    array_push($response, $row);
                }
            }

            return $response;
        }
    }
}

/* End of file Api_ekin_model.php */
