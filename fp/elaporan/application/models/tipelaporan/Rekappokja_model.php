<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Rekappokja_model extends CI_Model
{
    public function get_data($id_laporan = NULL, $id_opd = NULL)
    {
        $this->db->from('rekap_pokja');
        if ($id_opd != NULL) {
            $this->db->where('rekap_pokja.id_opd', $id_opd);
        }
        if ($id_laporan != NULL) {
            $this->db->where('rekap_pokja.id_laporan', $id_laporan);
        }
        $this->db->join('paket_kerja', 'rekap_pokja.id_laporan = paket_kerja.id_laporan');

        return $this->db->get()->result();
    }

    public function get_paket_kerja()
    {
        return $this->db->from('paket_kerja')
            ->order_by('nama_paket_kerja')
            ->join('detail_rekap_pokja', 'detail_rekap_pokja.id_detail_rekap_pokja = paket_kerja.id_detail_rekap_pokja')
            ->get()->result_array();
    }

    public function get_data_by_id($id)
    {
        $rpdata = $this->db->get_where('rekap_pokja', ['id_laporan' => $id])->result_array();
        if ($rpdata != NULL) $rpdata = $rpdata[0];
        else return NULL;
        $pdata = $this->db->get_where('pegawai', "id_laporan = $id")->result_array();
        $drpdata = array();
        if ($pdata != NULL) {
            foreach ($pdata as $d) {
                $drpdata[$d['id_pegawai']] =
                    $this->db->select("id_pegawai, detail_rekap_tender.id_detail_rekap_tender,jabatan, detail_rekap_pokja.ket, nama_paket_kerja, pagu")
                    ->from("detail_rekap_pokja")->join("detail_rekap_tender", "detail_rekap_pokja.id_detail_rekap_tender = detail_rekap_tender.id_detail_rekap_tender")
                    ->where("detail_rekap_pokja.id_pegawai", $d['id_pegawai'])->get()->result_array();
            }
        }
        return array('rp' => $rpdata, 'p' => $pdata, 'drp' => $drpdata);
    }

    public function init_insert($id_opd, $datalaporan, $data)
    {
        $this->db->trans_start();
        $this->load->model('laporan_model', 'lp');
        $this->db->insert(
            'laporan',
            [
                'id_opd' => $datalaporan['id_opd'],
                'id_tipe' => $datalaporan['id_tipe'],
                'created_at' => date('Y-m-d H:i:s', time()),
                'updated_at' => date('Y-m-d H:i:s', time()),
            ]
        );
        activity_log();
        $this->db->order_by('updated_at', 'DESC');
        $datalaporan = $this->db->get_where('laporan', ['id_opd' => $datalaporan['id_opd'], 'id_tipe' => $datalaporan['id_tipe'],])->result_array()[0];
        $datalaporan['tgl'] = $data['tgl'];
        $this->db->insert('rekap_pokja', $datalaporan);
        activity_log();
        // insert second etc. table data here

        // end
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return NULL;
        }
        return $datalaporan['id_laporan'];
    }

    public function update_data($id_laporan, $data)
    {
        $table = $data['nama_tabel'];
        unset($data['nama_tabel']);
        $insdata = array();
        $updata = array();

        $this->db->trans_begin();
        if ($table == 'pegawai') {
            if ($data != NULL) {
                // new data
                for ($i = 0; $i < sizeof(reset($data['new'])); $i += 1) {
                    array_push($insdata, array(
                        'id_laporan' => $id_laporan,
                        'nama' => $data['new']['nama'][$i]
                    ));
                }
                // var_dump($insdata); die();
                if ($insdata != NULL) {
                    $this->db->insert_batch('pegawai', $insdata);
                    activity_log();
                }
                unset($data['new']);

                // updated data
                if (isset($data['id_pegawai'])) {
                    for ($i = 0; $i < sizeof($data['id_pegawai']); $i += 1) {
                        array_push($updata, array(
                            'id_laporan' => $id_laporan,
                            'id_pegawai' => $data['id_pegawai'][$i],
                            'nama' => $data['nama'][$i]
                        ));
                    }
                    $this->db->update_batch('pegawai', $updata, 'id_pegawai');
                    activity_log();
                }

                // unused data
                if (isset($data['to_del'])) {
                    $this->db->where_in('id_pegawai', $data['to_del'])
                        ->delete('pegawai');
                    activity_log();
                }
            } else {
                $this->db->delete('pegawai', "id_laporan = $id_laporan");
                activity_log();
            }
        } else if ($table == 'detail_rekap_pokja') {
            if ($data != NULL) {
                // new data
                // var_dump($data); die();
                for ($i = 0; $i < sizeof($data['jabatan']); $i += 1) {
                    array_push($insdata, array(
                        'id_detail_rekap_tender' => $data['id_detail_rekap_tender'][$i],
                        'id_pegawai' => $data['id_pegawai'][$i],
                        'jabatan' => $data['jabatan'][$i],
                        'ket' => $data['ket'][$i]
                    ));
                }
                $iddel = array_values($data['id_pegawai']);
                // var_dump($iddel); die();
                $this->db->where_in('id_pegawai', $iddel)->delete('detail_rekap_pokja');
                activity_log();
                if ($insdata != NULL) {
                    $this->db->insert_batch('detail_rekap_pokja', $insdata);
                    activity_log();
                }
            } else {
                $todel = $this->db->select('id_pegawai')->from('pegawai')->join('rekap_pokja', 'rekap_pokja.id_laporan = pegawai.id_laporan')
                    ->where('pegawai.id_laporan', $id_laporan)->get()->result_array();
                // var_dump($todel); die();
                $dels = array();
                foreach ($todel as $key => $values) {
                    array_push($dels, $values['id_pegawai']);
                }
                if ($dels != NULL) {
                    $this->db->where_in('id_pegawai', $dels)->delete('detail_rekap_pokja');
                    activity_log();
                }
            }
        }
        $this->db->trans_complete();
    }

    public function delete_data($id_laporan)
    {
        $this->db->trans_begin();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('rekap_pokja');
        activity_log();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan');
        activity_log();
        $this->db->trans_complete();
    }
}
