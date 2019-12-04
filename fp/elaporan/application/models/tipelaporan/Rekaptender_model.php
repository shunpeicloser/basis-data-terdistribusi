<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Rekaptender_model extends CI_Model
{
    public function get_data($id_laporan = NULL, $id_opd = NULL)
    {
        $this->db->from('rekap_tender');
        if ($id_opd != NULL) {
            $this->db->where('rekap_tender.id_opd', $id_opd);
        }
        if ($id_laporan != NULL) {
            $this->db->where('rekap_tender.id_laporan', $id_laporan);
        }
        $this->db->join('detail_rekap_tender', 'rekap_tender.id_laporan = detail_rekap_tender.id_laporan')
            ->join('paket_kerja', 'detail_rekap_tender.id_paket_kerja = paket_kerja.id_paket_kerja');

        return $this->db->get()->result();
    }

    public function get_data_by_id($id)
    {
        $rtdata = $this->db->get_where('rekap_tender', ['id_laporan' => $id])->result_array()[0];
        $drtdata = $this->db->select('detail_rekap_tender.*, opd.id_opd, opd.nama_opd')
            ->from('detail_rekap_tender')
            ->join('opd', 'detail_rekap_tender.id_opd = opd.id_opd')
            ->where('id_laporan', $id)->get()->result_array();
        // var_dump($drtdata); die();
        return array('rt' => $rtdata, 'drt' => $drtdata);
    }

    public function get_paket_kerja()
    {
        return $this->db->select("id_detail_rekap_tender, nama_paket_kerja, pagu")
            ->from('detail_rekap_tender')->get()->result_array();
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
        $this->db->insert('rekap_tender', $datalaporan);
        activity_log();
        // insert second etc. table data here
        // no api
        // end
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return NULL;
        }
        return $datalaporan['id_laporan'];
    }

    //     array_push($insdata, array(
    //         'id_laporan' => $id_laporan,
    //         'id_opd' => $data['id_opd'][$i],
    //         'id_paket_kerja' => $data['id_paket_kerja'][$i],
    //         'nilai_hps' => $data['nilai_hps'][$i],
    //         'pemenang' => $data['pemenang'][$i],
    //         'harga_kontrak' => $data['harga_kontrak'][$i],
    //         'presentase_kontrak_thd_hps' => $data['presentase_kontrak_thd_hps'][$i],
    //         'ket' => $data['ket'][$i]
    // ));

    public function update_data($id_laporan, $data)
    {
        $table = $data['nama_tabel'];
        unset($data['nama_tabel']);
        $insdata = array();
        $updata = array();

        $this->db->trans_begin();
        if($table == 'rekap_tender'){
            $this->db->update('rekap_tender', $data, "id_laporan = $id_laporan");
        }
        elseif ($table == 'detail_rekap_tender') {
            if ($data != NULL) {
                // new data
                if (isset($data['new'])) {
                    for ($i = 0; $i < sizeof(reset($data['new'])); $i += 1) {

                        array_push($insdata, array(
                            'id_laporan' => $id_laporan,
                            'id_opd' => $data['new']['id_opd'][$i],
                            'nama_paket_kerja' => $data['new']['nama_paket_kerja'][$i],
                            'pagu' => $data['new']['pagu'][$i],
                            'nilai_hps' => $data['new']['nilai_hps'][$i],
                            'pemenang' => $data['new']['pemenang'][$i],
                            'harga_kontrak' => $data['new']['harga_kontrak'][$i],
                            'ket' => $data['new']['ket'][$i]
                        ));
                    }
                }
                if ($insdata != NULL) {
                    $this->db->insert_batch('detail_rekap_tender', $insdata);
                    activity_log();
                }
                unset($data['new']);
                // updated data
                if ($data['id_detail_rekap_tender'] != NULL) {
                    // var_dump($data['id_detail_rekap_tender']); die();
                    for ($idx = 0; $idx < sizeof($data['id_detail_rekap_tender']); $idx += 1) {
                        array_push($updata, array(
                            'id_laporan' => $id_laporan,
                            'id_detail_rekap_tender' => $data['id_detail_rekap_tender'][$idx],
                            'id_opd' => $data['id_opd'][$idx],
                            'nama_paket_kerja' => $data['nama_paket_kerja'][$idx],
                            'pagu' => $data['pagu'][$idx],
                            'nilai_hps' => $data['nilai_hps'][$idx],
                            'pemenang' => $data['pemenang'][$idx],
                            'harga_kontrak' => $data['harga_kontrak'][$idx],
                            'ket' => $data['ket'][$idx]
                        ));
                    }
                    $this->db->update_batch('detail_rekap_tender', $updata, 'id_detail_rekap_tender');
                    activity_log();
                }

                // unused data
                if (isset($data['to_del'])) {
                    $this->db->where_in('id_detail_rekap_tender', $data['to_del'])->delete('detail_rekap_tender');
                    activity_log();
                }
            } else {
                $this->db->delete('detail_rekap_tender', "id_laporan = $id_laporan");
                activity_log();
            }
        }
        $this->db->trans_complete();
    }

    public function delete_data($id_laporan)
    {
        $this->db->trans_begin();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('rekap_tender');
        activity_log();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan');
        activity_log();
        $this->db->trans_complete();
    }
}
