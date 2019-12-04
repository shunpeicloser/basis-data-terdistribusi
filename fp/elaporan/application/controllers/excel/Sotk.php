<?php
defined('BASEPATH') or exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class sotk extends CI_Controller
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
            case 'font-red':
                $style = [
                    'font' => [
                        'color' => [
                            'argb' => \PhpOffice\PhpSpreadsheet\Style\Color::COLOR_RED
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
        $sheet->getColumnDimension('B')->setWidth(50);
        $sheet->getColumnDimension('C')->setWidth(20);

        // ini stylenya
        $sheet->getStyle('1:4')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('1:4')->getAlignment()->setVertical('center');
        $sheet->getStyle('A')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('C')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A:C')->getAlignment()->setVertical('center');
        $sheet->getStyle('A:C')->getAlignment()->setWrapText(true);
        $sheet->getStyle('A1:C4')->getFont()->setBold(true);

        // ini atur header
        $sheet->setCellValue('A1', 'JUMLAH LEMBAGA/SOTK ')
            ->mergeCells('A1:C1');
        $sheet->setCellValue('A2', $this->data['nama_opd'])
            ->mergeCells('A2:C2');

        // ini tablenya
        // th numrow 5
        $sheet->setCellValue('A4', 'No.');
        $sheet->setCellValue('B4', 'OPD');
        $sheet->setCellValue('C4', 'BESARAN');

        // td numrow 6
        $numrow = 5;
        $counter = 0;
        foreach ($this->data['fetch']['sotkopd'] as $sotkopd) {

            $counter += 1;
            $sheet->setCellValue('A' .$numrow, $counter);
            $sheet->setCellValue('B' .$numrow, ucwords($sotkopd['nama_opd']));
            $sheet->setCellValue('C' .$numrow, $sotkopd['besaran']);
            $numrow ++;
        }

        // ini style tablenya
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);
        $sheet->setShowGridlines(true);
        $sheet->getStyle('A4:C' . ($numrow - 1))->applyFromArray($this->style('allborder'));
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

/* End of file pelayanan_publik.php */
