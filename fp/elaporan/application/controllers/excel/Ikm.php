<?php
defined('BASEPATH') or exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Ikm extends CI_Controller
{
    public $data;
    public $spreadsheet;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('laporan_model', 'laporan');
        $this->spreadsheet = new Spreadsheet();
    }

    public function index($formname, $id_laporan)
    {
        $this->data['nama_laporan'] = ucwords(str_replace('_', ' ', $formname));
        $this->data['fetch'] = $this->laporan->get_laporan_data_by_name_id($formname, $id_laporan);
        $this->data['nama_opd'] = $this->session->tempdata('nama_opd');
        $this->export($formname, $id_laporan);
        $this->download();
        var_dump("test"); die();
    }

    public function style($stylereq)
    {
        switch ($stylereq) {
            case 'foo_css':
                $style = [];
                break;
            case 'allborder':
                $style = [
                    'borders' => [
                        'allBorders' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN
                        ]
                    ]
                ];
                break;
            default:
                # code...
                break;
        }

        return $style;
    }

    public function export($formname, $id_laporan)
    {
        // ini bikin sheetnya
        $this->spreadsheet->setActiveSheetIndex(0)->setTitle($this->data['nama_laporan']);

        // ---- INI SHEET PERTAMA ----
        // ini atur sheet
        $sheet = $this->spreadsheet->getActiveSheet();

        // ini atur width
        $sheet->getDefaultRowDimension()->setRowHeight(-1);
        $sheet->getColumnDimension('A')->setAutoSize(true);
        $sheet->getColumnDimension('B')->setWidth(60);
        $sheet->getColumnDimension('C')->setWidth(20);
        $sheet->getColumnDimension('D')->setWidth(20);

        // ini stylenya
        $sheet->getStyle('1:3')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('5')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('C:D')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A:D')->getAlignment()->setVertical('center');
        $sheet->getStyle('A:D')->getAlignment()->setWrapText(true);
        $sheet->getStyle('A1:D5')->getFont()->setBold(true);

        // ini atur header
        $sheet->setCellValue('A1', 'NILAI INDEKS KEPUASAAN MASYARAKAT (IKM)')
            ->mergeCells('A1:D1');
        $sheet->setCellValue('A2', 'TAHUN ' . date('Y', strtotime($this->data['fetch']['ikm']['tgl'])) . ' DI LINGKUNGAN PEMERINTAH KOTA MADIUN')
            ->mergeCells('A2:D2');
        $sheet->setCellValue('A3', $this->data['nama_opd'])
            ->mergeCells('A3:D3');

        // ini tablenya
        // th numrow 5
        $sheet->setCellValue('A5', 'No.');
        $sheet->setCellValue('B5', 'PERANGKAT DAERAH');
        $sheet->setCellValue('C5', 'NILAI TAHUN ' . date('Y', strtotime($this->data['fetch']['ikm']['tgl'])));
        $sheet->setCellValue('D5', 'PREDIKAT');

        // td numrow 6
        $numrow = 6;
        $nomor = 0;
        foreach ($this->data['fetch']['ikmopd'] as $ikm) {
            $nomor++;
            $sheet->setCellValue('A' . $numrow, $nomor);
            $sheet->setCellValue('B' . $numrow, ucwords($ikm['nama_opd']));
            $sheet->setCellValue('C' . $numrow, $ikm['nilai']);
            $sheet->setCellValue('D' . $numrow, $ikm['predikat']);
            $numrow++;
        }

        // ini style tablenya
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);
        $sheet->setShowGridlines(true);
        $sheet->getStyle('A5:D' . ($numrow - 1))->applyFromArray($this->style('allborder'));
    }

    public function download()
    {
        $file = new Xlsx($this->spreadsheet);

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="' . $this->data['nama_laporan'] . '.xlsx"');
        header('Cache-Control: max-age=0');

        $file->save('php://output'); // download file 
    }
}

/* End of file Ikm.php */
