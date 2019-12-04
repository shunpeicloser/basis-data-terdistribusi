<?php
class Db_log
{

    function __construct()
    { }


    function logQueries()
    {
        $CI = &get_instance();

        $filepath = APPPATH . 'logs/Query-log-' . date('Y-m-d') . '.php';
        $handle = fopen($filepath, "a+");

        $user = $CI->session->userdata('username') . $CI->session->userdata('id');
        $times = $CI->db->query_times;
        foreach ($CI->db->queries as $key => $query) {
            if (strpos(strtolower($query), 'select') === FALSE) {
                $sql = $user . "~~" . date('H:i:s') . "<br>\n" . $query . " <br>\n Execution Time:" . $times[$key];

                fwrite($handle, $sql . "<br>\n<br>\n");
            }
        }

        fclose($handle);
    }
}
