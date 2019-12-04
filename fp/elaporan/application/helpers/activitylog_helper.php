<?php
function activity_log($act = NULL)
{
    $CI = &get_instance();

    $data['log_query'] = $CI->db->last_query();
    $data['log_user_id'] = $CI->session->tempdata('id');
    $data['log_username']  = $CI->session->tempdata('username');

    if ($act == 'i' || stripos($data['log_query'], 'insert') !== false) {
        $act = 'insert';
    } elseif ($act == 'u' || stripos($data['log_query'], 'update') !== false) {
        $act = 'update';
    } elseif ($act == 'd' || stripos($data['log_query'], 'delete') !== false) {
        $act = 'delete';
    }

    $data['log_act'] = $act;

    $CI->load->model('activitylog_model');

    $CI->activitylog_model->save_log($data);
}
