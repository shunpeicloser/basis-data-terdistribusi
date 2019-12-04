<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pemantauantindaklanjut_model extends CI_Model
{
    public function get_data($id_laporan = NULL, $id_opd = NULL)
    {
        $this->db->from('pemantauan_tindak_lanjut');
        if ($id_opd != NULL) {
            $this->db->where('pemantauan_tindak_lanjut.id_opd', $id_opd);
        }
        if ($id_laporan != NULL) {
            $this->db->where('pemantauan_tindak_lanjut.id_laporan', $id_laporan);
        }
        $this->db->join('temuan', 'temuan.id_laporan = pemantauan_tindak_lanjut.id_laporan')
            ->join('hasil_temuan', 'hasil_temuan.id_temuan = temuan.id_temuan');

        return $this->db->get()->result();
    }

    public function get_data_by_id($id)
    {
        $ptldata = $this->db->get_where('pemantauan_tindak_lanjut', ['id_laporan' => $id])->result_array()[0];
        $temuandata = $this->db->order_by('nama_temuan')->get_where('temuan', "id_laporan = $id")->result_array();
        $htemuan = array();
        if ($temuandata != NULL) {
            foreach ($temuandata as $d) {
                $htemuan[$d['id_temuan']] = $this->db->get_where('hasil_temuan', "id_temuan = $d[id_temuan]")->result_array();
            }
        }
        return array('ptl' => $ptldata, 'temuan' => $temuandata, 'htemuan' => $htemuan);
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
        $this->db->insert('pemantauan_tindak_lanjut', $datalaporan);
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

    public function update_data($id_laporan, $data)
    {
        $table = $data['nama_tabel'];
        unset($data['nama_tabel']);
        $insdata = array();
        $updata = array();

        $this->db->trans_begin();
        if ($table == 'pemantauan_tindak_lanjut') {
            if ($data != NULL) {
                $this->db->update('pemantauan_tindak_lanjut', $data, "id_laporan = $id_laporan");
                activity_log();
            }
        } elseif ($table == 'temuan') {
            if ($data != NULL) {
                // new data
                if (isset($data['new'])) {
                    for ($i = 0; $i < sizeof(reset($data['new'])); $i += 1) {
                        array_push($insdata, array(
                            'id_laporan' => $id_laporan,
                            'nama_temuan' => $data['new']['nama_temuan'][$i]
                        ));
                    }
                }
                if ($insdata != NULL) {
                    $this->db->insert_batch('temuan', $insdata);
                    activity_log();
                }
                unset($data['new']);
                // updated data
                if ($data['id_temuan'] != NULL) {
                    for ($i = 0; $i < sizeof($data['id_temuan']); $i += 1) {
                        array_push($updata, array(
                            'id_temuan' => $data['id_temuan'][$i],
                            'nama_temuan' => $data['nama_temuan'][$i]
                        ));
                    }
                    $this->db->update_batch('temuan', $updata, 'id_temuan');
                    activity_log();
                }

                // unused data
                if (isset($data['to_del'])) {
                    $this->db->where_in('id_temuan', $data['to_del'])->delete('temuan');
                    activity_log();
                }
            } else {
                $this->db->delete('temuan', "id_laporan = $id_laporan");
                activity_log();
            }
        } else if ($table == 'hasil_temuan') {
            if ($data != NULL) {
                $tmp = $data['id_temuan'];
                for ($i = 0; $i < sizeof($tmp); $i += 1) {
                    array_push($insdata, array(
                        'id_temuan' => $data['id_temuan'][$i],
                        'rekomendasi' => $data['rekomendasi'][$i],
                        'status_rekomendasi' => $data['status_rekomendasi'][$i],
                        'tindak_lanjut' => $data['tindak_lanjut'][$i],
                        'status_tindak_lanjut' => $data['status_tindak_lanjut'][$i],
                        'catatan_bpk' => $data['catatan_bpk'][$i]
                    ));
                }
                //  var_dump($data['id_temuan']); die();
                $this->db->where_in('id_temuan', $tmp)
                    ->delete('hasil_temuan');
                activity_log();

                if ($insdata != NULL) {
                    $this->db->insert_batch('hasil_temuan', $insdata);
                    activity_log();
                }
            } else {
                $todel = $this->db->select('id_temuan')->from('temuan')
                    ->where('temuan.id_laporan', $id_laporan)->get()->result_array();
                activity_log();
                $del = array();
                foreach ($todel as $key => $d) {
                    array_push($del, $d['id_temuan']);
                }
                $this->db->where_in('id_temuan', $del)->delete('hasil_temuan');
                activity_log();
            }
        } elseif ($table == 'tambah_hasil_temuan') {
            $data_insert = [
                'id_temuan' => $data['id_temuan'],
                'rekomendasi' => $data['rekomendasi'],
                'status_rekomendasi' => $data['status_rekomendasi'],
                'tindak_lanjut' => $data['tindak_lanjut'],
                'status_tindak_lanjut' => $data['status_tindak_lanjut'],
                'catatan_bpk' => $data['catatan_bpk']
            ];
            if ($data_insert != NULL) {
                $this->db->insert('hasil_temuan', $data_insert);
                activity_log();
            }
        }
        $this->db->trans_complete();
    }

    public function delete_data($id_laporan)
    {
        $this->db->trans_begin();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('pemantauan_tindak_lanjut');
        activity_log();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan');
        activity_log();
        $this->db->trans_complete();
    }
}
