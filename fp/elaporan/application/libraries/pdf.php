<?php
defined('BASEPATH') or exit('No direct script access allowed');

require_once "assets/vendors/dompdf/autoload.inc.php";

use Dompdf\Dompdf;

class Pdf extends Dompdf
{
    protected $ci;
    public $filename;

    public function __construct()
    {
        parent::__construct();
        $this->ci = &get_instance();
        $this->filename = "laporan.pdf";
    }

    public function load_view($view, $data = array())
    {
        $html = $this->ci->load->view($view, $data, TRUE);
        $this->load_html($html);
        // Render the PDF
        $this->render();
        // Output the generated PDF to Browser
        $this->stream($this->filename, array("Attachment" => false));
    }
}

/* End of file Pdf.php */
