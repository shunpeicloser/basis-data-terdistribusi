<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Jadwalpelaksanaan_model extends CI_Model
{
    public function get_data($id_laporan = NULL, $id_opd = NULL)
    {
        $this->db->select("*")->from('jadwal_pelaksanaan');
        if ($id_opd != NULL) {
            $this->db->where('jadwal_pelaksanaan.id_opd', $id_opd);
        }
        if ($id_laporan != NULL) {
            $this->db->where('jadwal_pelaksanaan.id_laporan', $id_laporan);
        }
        $this->db->join('jadwal_pelaksanaan_opd', 'jadwal_pelaksanaan.id_laporan = jadwal_pelaksanaan_opd.id_laporan')
            ->join('opd', 'opd.id_opd = jadwal_pelaksanaan_opd.id_opd')
            ->join('auditor', 'jadwal_pelaksanaan_opd.id_jadwal_pelaksanaan_opd = auditor.id_jadwal_pelaksanaan_opd');
        return $this->db->get()->result();
    }

    public function get_data_by_id($id)
    {
        $jpdata = $this->db->get_where('jadwal_pelaksanaan', ['id_laporan' => $id])->result_array()[0];
        $jpopddata = $this->db->select('jadwal_pelaksanaan_opd.*, opd.nama_opd')
            ->from('jadwal_pelaksanaan_opd')
            ->join('opd', 'jadwal_pelaksanaan_opd.id_opd = opd.id_opd')
            ->order_by('nama_opd', 'ASC')
            ->where('id_laporan', $id)->get()->result_array();
        $adata = array();
        if ($jpopddata != NULL) {
            foreach ($jpopddata as $d) {
                $adata[$d['id_jadwal_pelaksanaan_opd']] =
                    $this->db->select('auditor.*, opd.nama_opd')->from('auditor')
                    ->join('jadwal_pelaksanaan_opd', 'auditor.id_jadwal_pelaksanaan_opd = jadwal_pelaksanaan_opd.id_jadwal_pelaksanaan_opd')
                    ->join('opd', 'jadwal_pelaksanaan_opd.id_opd = opd.id_opd')
                    ->where('jadwal_pelaksanaan_opd.id_laporan', $id)
                    ->where("auditor.id_jadwal_pelaksanaan_opd", $d['id_jadwal_pelaksanaan_opd'])
                    ->order_by('nama_opd', 'ASC')->get()->result_array();
                // $this->db->get_where('auditor', "auditor.id_jadwal_pelaksanaan_opd = $d[id_jadwal_pelaksanaan_opd]");
            }
        }

        // GET AUDITOR DARI EKIN
        $this->load->model('api_ekin_model');
        $this->load->model('opd_model');
        $id_opd = $this->session->tempdata('id_opd');

        $kode_ekin = $this->opd_model->get_ekin_by_id($id_opd);
        $auditor = $this->api_ekin_model->get_peg($kode_ekin);
        $auditor['kode_ekin'] = $kode_ekin;

        return array('jp' => $jpdata, 'jpopd' => $jpopddata, 'adata' => $adata, 'auditor' => $auditor);
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
        $this->db->insert('jadwal_pelaksanaan', $datalaporan);
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
        if ($table == 'jadwal_pelaksanaan_opd') {
            if ($data != NULL) {
                // new data
                if (isset($data['new'])) {
                    for ($i = 0; $i < sizeof(reset($data['new'])); $i += 1) {
                        array_push($insdata, array(
                            'id_laporan' => $id_laporan,
                            'id_opd' => $data['new']['id_opd'][$i],
                            'jenis_pengawasan' => $data['new']['jenis_pengawasan'][$i],
                            'rmp' => $data['new']['rmp'][$i],
                            'rpl' => $data['new']['rpl'][$i],
                            'output_lhp' => $data['new']['output_lhp'][$i],
                            'hari_pengawasan' => $data['new']['hari_pengawasan'][$i],
                            'keterangan' => $data['new']['keterangan'][$i]
                        ));
                    }
                }
                if ($insdata != NULL) {
                    $this->db->insert_batch('jadwal_pelaksanaan_opd', $insdata);
                    activity_log();
                }
                unset($data['new']);

                // updated data
                if (isset($data['id_jadwal_pelaksanaan_opd'])) {
                    for ($i = 0; $i < sizeof($data['id_jadwal_pelaksanaan_opd']); $i += 1) {
                        array_push($updata, array(
                            'id_laporan' => $id_laporan,
                            'id_jadwal_pelaksanaan_opd' => $data['id_jadwal_pelaksanaan_opd'][$i],
                            'id_opd' => $data['id_opd'][$i],
                            'jenis_pengawasan' => $data['jenis_pengawasan'][$i],
                            'rmp' => $data['rmp'][$i],
                            'rpl' => $data['rpl'][$i],
                            'output_lhp' => $data['output_lhp'][$i],
                            'hari_pengawasan' => $data['hari_pengawasan'][$i],
                            'keterangan' => $data['keterangan'][$i],
                        ));
                    }
                    $this->db->update_batch('jadwal_pelaksanaan_opd', $updata, 'id_jadwal_pelaksanaan_opd');
                    activity_log();
                }

                // unused data
                if (isset($data['to_del']))
                    $this->db->where_in('id_jadwal_pelaksanaan_opd', $data['to_del'])
                        ->delete('jadwal_pelaksanaan_opd');
                activity_log();
            } else {
                $this->db->delete('jadwal_pelaksanaan_opd', "id_laporan = $id_laporan");
                activity_log();
            }
        } else if ($table == 'auditor') {

            $tmp = $data['id_jadwal_pelaksanaan_opd'];
            unset($data['id_jadwal_pelaksanaan_opd']);
            if ($data != NULL) {
                foreach ($tmp as $idx) {

                    if (isset($data['nama_auditor'][$idx])) {

                        for ($i = 0; $i < sizeof($data['nama_auditor'][$idx]); $i += 1) {
                            if ($data['nama_auditor'][$idx][$i] == "" && $data['jabatan'][$idx][$i] == "")
                                continue;
                            array_push($insdata, array(
                                'id_jadwal_pelaksanaan_opd' => $idx,
                                'nama_auditor' => $data['nama_auditor'][$idx][$i],
                                'jabatan' => $data['jabatan'][$idx][$i],
                                'editable' => $data['editable'][$idx][$i]
                            ));
                        }
                    }
                }
                // var_dump($insdata); die();
                $this->db->where_in('id_jadwal_pelaksanaan_opd', $tmp)
                    ->delete('auditor');
                activity_log();
                // printf("<pre>%s</pre>", json_encode($insdata, JSON_PRETTY_PRINT)); die();
                if ($insdata != NULL)
                    $this->db->insert_batch('auditor', $insdata);
                activity_log();
            }
        } elseif ($table == 'tambah_auditor') {
            $idx = $data['id_jadwal_pelaksanaan_opd'][0];
            $data_insert = [
                'id_jadwal_pelaksanaan_opd' => $idx,
                'nama_auditor' => $data['nama_auditor'][$idx],
                'jabatan' => $data['jabatan'][$idx],
                'editable' => 0
            ];
            if ($data['select_auditor'] == '' || $data['select_auditor'] == null) {
                $data_insert['editable'] = 1;
            }
            $this->db->insert('auditor', $data_insert);
            activity_log();
            // print_r($data_insert);
        }
        $this->db->trans_complete();
    }

    public function delete_data($id_laporan)
    {
        $this->db->trans_begin();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('jadwal_pelaksanaan');
        activity_log();
        $this->db->where('id_laporan', $id_laporan);
        $this->db->delete('laporan');
        activity_log();
        $this->db->trans_complete();
    }
}
