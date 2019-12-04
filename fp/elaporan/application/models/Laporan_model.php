<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Laporan_model extends CI_Model
{
    public function gets()
    {
        return $this->db->select('laporan')->result_array();
    }

    public function get_alllaporan($page_number, $id_opd = NULL, $limit = 20)
    {
        if ($id_opd == NULL || $id_opd == '1') {
            $this->db->select('id_laporan, nama_opd, nama_laporan, created_at')
                ->from('laporan')
                ->join('tipe_laporan', 'laporan.id_tipe = tipe_laporan.id_tipe')
                ->join('opd', 'laporan.id_opd = opd.id_opd')
                ->order_by('created_at', 'desc')
                ->limit($limit, ($page_number - 1) * $limit);
        } else {
            $this->db->select('id_laporan, nama_opd, nama_laporan, created_at')
                ->from('laporan')
                ->where('laporan.id_opd = ' . $id_opd)
                ->join('tipe_laporan', 'laporan.id_tipe = tipe_laporan.id_tipe')
                ->join('opd', 'laporan.id_opd = opd.id_opd')
                ->order_by('created_at', 'desc')
                ->limit($limit, ($page_number - 1) * $limit);
        }
        return $this->db->get()->result_array();
    }

    public function search($cond)
    {
        $this->db->from('laporan');
        foreach ($cond as $key => $value) {
            if ($key != "start_date" && $key != "end_date" && $value != NULL)
                $this->db->where("laporan.$key = $value");
        }
        // check date
        if (strtotime($cond['start_date']) > strtotime($cond['end_date'])) {
            $tmp = $cond['start_date'];
            $cond['start_date'] = $cond['end_date'];
            $cond['end_date'] = $tmp;
        }
        $this->db->where("created_at >= ", $cond['start_date'] . ' 00:00:00')
            ->where("created_at <= ", $cond['end_date'] . ' 23:59:59');
        $this->db->join('tipe_laporan', 'tipe_laporan.id_tipe = laporan.id_tipe');
        // var_dump($this->db->get()->result()); die();
        return $this->db->get()->result_array();
    }

    public function get_laporan_by_kodetipe($kode_tipe, $page_number = 10, $id_opd, $limit = 20, $from = NULL, $to = NULL)
    {

        $this->db->select("laporan.id_laporan,$kode_tipe.*")
            ->from('laporan')
            ->join($kode_tipe, "laporan.id_laporan = $kode_tipe.id_laporan")
            ->where("laporan.id_opd", $id_opd)
            ->limit($limit);

        if ($from && $to) {
            $this->db->where('DATE(laporan.created_at) >=', $from);
            $this->db->where('DATE(laporan.created_at) <=', $to);
        }
        // $res = $this->db->get_where($kode_tipe, ['id_opd' => $id_opd], $limit, ($page_number-1) * $limit);
        $res = $this->db->get();
        return $res->result_array();
    }

    public function get_idtipe_by_idlaporan($id)
    {
        $ret = $this->db->get_where('laporan', array('id_laporan' => $id))->result();
        if ($ret != NULL)
            return $ret[0]->id_tipe;
        return NULL;
    }

    public function get_laporan($id) // get laporan berdasarkan ID laporan
    {
        $table = $this->get_tipe_laporan($id);
        $temp = $this->db->get($table)->row_array();
        if ($temp == NULL) {
            return -1; // error code
        }
        return $temp;
    }

    public function get_by_id($id)
    {
        return $this->db->get_where('laporan', array('id_laporan' => $id))->result()[0]->id_tipe;
    }

    public function get_tipe_laporan($id)
    {
        $res = $this->get_by_id($id);
        return $this->_get_nama_laporan($res);
    }

    public function get_fielddata($name)
    {
        return $this->db->field_data($name);
    }

    public function get_laporan_data($id)
    {
        $tipe = $this->get_tipe_laporan($id);
        return $this->db->get_where($tipe, array('id_laporan' => $id))->result[0];
    }

    public function get_laporan_data_by_name_id($formname, $id)
    {
        $tipe = $this->load->model("tipelaporan/" . str_replace('_', '', strtolower($formname)) . "_model", 'tl');
        return $this->tl->get_data_by_id($id);
    }

    private function _get_nama_laporan($id)
    {
        $temp = $this->db->get_where('tipe_laporan', array('id_tipe' => $id))->result();
        return $temp[0]->kode_tipe;
    }

    public function add_data($data)
    {
        $this->db->insert(
            'laporan',
            [
                'id_opd' => $data['id_opd'],
                'id_tipe' => $data['id_tipe'],
                'created_at' => date('Y-m-d H:i:s', time()),
                'updated_at' => date('Y-m-d H:i:s', time()),
            ]
        );
        activity_log();
        $this->db->order_by('updated_at', 'DESC');
        return $this->db->get_where('laporan', ['id_opd' => $data['id_opd'], 'id_tipe' => $data['id_tipe'],])->result_array()[0];
    }

    public function update_data($id_laporan, $data)
    {
        $namalaporan = $this->_get_nama_laporan($id_laporan);
        $this->db->update($namalaporan, $data, array('id_laporan' => $id_laporan));
        activity_log();
        // redirect('opd', 'refresh');
    }
}

/* End of file laporan_model.php */
