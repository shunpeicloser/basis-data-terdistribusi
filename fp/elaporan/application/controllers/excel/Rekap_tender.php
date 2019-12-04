<?php
defined('BASEPATH') or exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class rekap_tender extends CI_Controller
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
        $sheet->getColumnDimension('D')->setWidth(20);
        $sheet->getColumnDimension('E')->setWidth(20);
        $sheet->getColumnDimension('F')->setWidth(20);
        $sheet->getColumnDimension('G')->setWidth(20);
        $sheet->getColumnDimension('H')->setWidth(50);
        $sheet->getColumnDimension('I')->setWidth(20);

        // ini stylenya
        $sheet->getStyle('1:4')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('1:4')->getAlignment()->setVertical('center');
        $sheet->getStyle('A')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('C:G')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('I4')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('B5')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('G5:I5')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A:I')->getAlignment()->setVertical('center');
        $sheet->getStyle('A:I')->getAlignment()->setWrapText(true);
        $sheet->getStyle('G4')->getAlignment()->setWrapText(true);
        $sheet->getStyle('A1:I5')->getFont()->setBold(true);

        // ini atur header
        $sheet->setCellValue('A1', $this->data['fetch']['rt']['judul_rekap_tender'])
            ->mergeCells('A1:I1');
        $sheet->setCellValue('A2', $this->data['nama_opd'])
            ->mergeCells('A2:I2');

        // ini tablenya
        // th numrow 5
        $sheet->setCellValue('A4', 'No.');
        $sheet->setCellValue('B4', 'Paket Pekerjaan');
        $sheet->setCellValue('C4', 'Nilai Pagu');
        $sheet->setCellValue('D4', 'Nilai HPS');
        $sheet->setCellValue('E4', 'Pemenang');
        $sheet->setCellValue('F4', 'Harga Kontrak');
        $sheet->setCellValue('G4', 'Prosentase Harga Kontrak terhadao HPS');
        $sheet->setCellValue('H4', 'OPD');
        $sheet->setCellValue('I4', 'Ket');

         // th numrow 6
         $sheet->setCellValue('A5', '1');
         $sheet->setCellValue('B5', '2');
         $sheet->setCellValue('C5', '3');
         $sheet->setCellValue('D5', '4');
         $sheet->setCellValue('E5', '5');
         $sheet->setCellValue('F5', '6');
         $sheet->setCellValue('G5', '7');
         $sheet->setCellValue('H5', '8');
         $sheet->setCellValue('I5', '9');

        // // td numrow 7
        $numrow = 6;
        $counter = 0;
        foreach ($this->data['fetch']['drt'] as $drt) {
            $vl = 0;
            if(floatval($drt['nilai_hps'] != 0)) $vl = strval(floatval($drt['harga_kontrak'])/floatval($drt['nilai_hps'])*100.0);
            else $vl = "nilai HPS 0";

            $counter += 1;
            $sheet->setCellValue('A' .$numrow, $counter);
            $sheet->setCellValue('B' .$numrow, $drt['nama_paket_kerja']);
            $sheet->setCellValue('C' .$numrow, $drt['pagu']);
            $sheet->setCellValue('D' .$numrow, $drt['nilai_hps']);
            $sheet->setCellValue('E' .$numrow, $drt['pemenang']);
            $sheet->setCellValue('F' .$numrow, $drt['harga_kontrak']);
            $sheet->setCellValue('G' .$numrow, $vl);
            $sheet->setCellValue('H' .$numrow, ucwords($drt['nama_opd']));
            $sheet->setCellValue('I' .$numrow, $drt['ket']);
            $numrow ++;
        }

        // ini style tablenya
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);
        $sheet->setShowGridlines(true);
        $sheet->getStyle('A4:I' . ($numrow - 1))->applyFromArray($this->style('allborder'));
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
