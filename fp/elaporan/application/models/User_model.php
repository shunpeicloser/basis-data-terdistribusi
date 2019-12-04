<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User_model extends CI_Model
{

    // public function getUser($username, $pass)
    // {
    //     $res = $this->db->get_where(
    //         'user',
    //         array('user_name' => $username, 'user_password' => $pass),
    //         1
    //     );
    //     return $res->result();
    // }

    // public function getOpd($username)
    // {
    //     $this->db->select('user_opd');
    //     $res = $this->db->get_where(
    //         'user',
    //         array('user_name' => $username),
    //         1
    //     );
    //     return $res->result();
    // }

    public function gets()
    {
        $this->db->from('user')->order_by('username', 'ASC');
        return $this->db->get()->result_array();
    }

    public function get_login($username)
    {
        return $this->db->get_where('user', ['username' => $username])->result_array()[0];
    }

    public function insert($data)
    {
        $tmp = new DateTime();
        $data['created_at'] = $tmp->format('Y-m-d H:i:s');
        $data['last_login'] = $tmp->format('Y-m-d H:i:s');
        $this->db->insert('user', $data);
        activity_log();
    }

    public function last_login($id)
    {
        $this->db->update('user', ['last_login' => date('Y-m-d H:i:s', now())], ['id' => $id]);
        activity_log();
    }

    public function reset_password($id, $newpassword)
    {
        $this->db->update('user', ['password' => password_hash($newpassword, PASSWORD_BCRYPT)], ['id' => $id]);
        activity_log();
    }

    public function delete($id)
    {
        $this->db->delete('user', ['id' => $id]);
        activity_log();
    }
}
