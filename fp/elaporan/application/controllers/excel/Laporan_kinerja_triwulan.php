<?php
defined('BASEPATH') or exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class laporan_kinerja_triwulan extends CI_Controller
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
        $sheet->getColumnDimension('B')->setWidth(20);
        $sheet->getColumnDimension('C')->setWidth(20);
        $sheet->getColumnDimension('D')->setWidth(20);
        $sheet->getColumnDimension('E')->setWidth(20);
        $sheet->getColumnDimension('F')->setWidth(20);
        $sheet->getColumnDimension('G')->setWidth(20);
        $sheet->getColumnDimension('H')->setWidth(20);

        // ini stylenya
        $sheet->getStyle('A:H')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A:H')->getAlignment()->setVertical('center');
        $sheet->getStyle('A:H')->getAlignment()->setWrapText(true);
        $sheet->getStyle('A1:H8')->getFont()->setBold(true);

        // ini atur header
        $sheet->setCellValue('A1', 'LAPORAN KINERJA')
            ->mergeCells('A1:H1');
        $sheet->setCellValue('A2', 'TRIWULAN')
        ->mergeCells('A2:H2');
        $sheet->setCellValue('A3', $this->data['nama_opd'])
            ->mergeCells('A3:H3');
        $sheet->setCellValue('A4', 'TAHUN ' . date('Y', strtotime($this->data['fetch']['lkt']['tgl'])))
        ->mergeCells('A4:H4');

        // ini tablenya
        // th numrow 4
        $sheet->setCellValue('A6', 'No.')->mergeCells('A6:A7');
        $sheet->setCellValue('B6', 'Sasaran Kegiatan')->mergeCells('B6:E6');
        $sheet->setCellValue('F6', 'Program')->mergeCells('F6:F7');
        $sheet->setCellValue('G6', 'Anggaran')->mergeCells('G6:G7');
        $sheet->setCellValue('H6', 'Realisasi')->mergeCells('H6:H7');

        $sheet->setCellValue('B7', 'Uraian');
        $sheet->setCellValue('C7', 'Indikator Kinerja');
        $sheet->setCellValue('D7', 'Target');
        $sheet->setCellValue('E7', 'Realisasi');

        $sheet->setCellValue('A8', '1');
        $sheet->setCellValue('B8', '2');
        $sheet->setCellValue('C8', '3');
        $sheet->setCellValue('D8', '4');
        $sheet->setCellValue('E8', '5');
        $sheet->setCellValue('F8', '6');
        $sheet->setCellValue('G8', '7');
        $sheet->setCellValue('H8', '8');

        // td numrow 6
        $numrow = 9;

        // data
        $counter = 0;
        foreach ($this->data['fetch']['lktdetail'] as $lktdetail) {
            $counter += 1;

            $sheet->setCellValue('A' . $numrow, $counter);
            $sheet->setCellValue('B' . $numrow, $lktdetail['uraian']);
            $sheet->setCellValue('C' . $numrow, $lktdetail['indikator_kinerja']);
            $sheet->setCellValue('D' . $numrow, $lktdetail['target']);
            $sheet->setCellValue('E' . $numrow, $lktdetail['realisasi_target']);
            $sheet->setCellValue('F' . $numrow, $lktdetail['program']);
            $sheet->setCellValue('G' . $numrow, $lktdetail['anggaran']);
            $sheet->setCellValue('H' . $numrow, $lktdetail['capaian_realisasi_keuangan']);

            $numrow++;
        }

        // ini style tablenya
        $sheet->getPageSetup()->setOrientation('landscape');
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);
        $sheet->setShowGridlines(true);
        $sheet->getStyle('A6:H' . ($numrow - 1))->applyFromArray($this->style('allborder'));
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

/* End of file laporan_kinerja_triwulan.php */
