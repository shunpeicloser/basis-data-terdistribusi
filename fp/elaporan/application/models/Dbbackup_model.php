<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dbbackup_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->dbutil();
    }

    public function backup_laporan($formname, $id_laporan)
    {
        $prefs;
        if ($formname == "realisasi_fisik") {
            $prefs = array(
                'tables' => array('realisasi_fisik', 'program', 'kegiatan'),
                'ignore' => array(),
                'format' => 'txt',
                // 'filename' => 'rf_' . strval(date('Y-m-d_H:i:s', time())),
                'add_drop' => FALSE,
                'add_insert' => TRUE,
                // 'newline' => '\n',
                'foreign_key_checks' => FALSE
            );
        }
        $backup = $this->dbutil->backup($prefs);
        $towrite = "SET foreign_key_checks = 0;";
        foreach (explode(';', $backup) as $query) {
            if (strpos($query, 'INSERT INTO') !== false) {
                $towrite = $towrite . str_replace('INSERT INTO', 'INSERT IGNORE INTO', $query) . ';';
            }
        }
        $towrite = $towrite . "SET foreign_key_checks = 1;";
        echo write_file('./migration/' . $formname . '/' . $id_laporan . '_' . strval(date('Y-m-d_H:i:s', time())) . '.sql', $towrite);
    }

    public function restore_laporan($formname, $id_laporan, $tm)
    {
        $query = file_get_contents(APPPATH . "../migration/$formname/$tm.sql");
        // $this->db->trans_start();
        $this->db->delete('realisasi_fisik', "id_laporan = $id_laporan");
        foreach (explode(';', $query) as $q) {
            if ($q == '' || $q == NULL) continue;
            // echo $q . "<br/>";
            echo $this->db->query($q);
        }

        // $this->db->trans_complete();
    }
}
