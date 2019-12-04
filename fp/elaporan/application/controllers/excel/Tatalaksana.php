<?php
defined('BASEPATH') or exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class tatalaksana extends CI_Controller
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
        $sheet->getColumnDimension('H')->setWidth(20);
        $sheet->getColumnDimension('I')->setWidth(20);
        $sheet->getColumnDimension('J')->setWidth(20);
        $sheet->getColumnDimension('K')->setWidth(20);

        // ini stylenya
        $sheet->getStyle('1:4')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('1:4')->getAlignment()->setVertical('center');
        $sheet->getStyle('A')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('C:K')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A:K')->getAlignment()->setVertical('center');
        $sheet->getStyle('1:4')->getAlignment()->setWrapText(true);
        $sheet->getStyle('A1:K4')->getFont()->setBold(true);

        // ini atur header
        $sheet->setCellValue('A1', 'LAPORAN HASIL PENGAMATAN TATALAKSANA TAHUN ' . date('Y', strtotime($this->data['fetch']['t']['tgl'])))
            ->mergeCells('A1:K1');
        $sheet->setCellValue('A2', $this->data['nama_opd'])
            ->mergeCells('A2:K2');

        // ini tablenya
        // th numrow 5
        $sheet->setCellValue('A4', 'No.');
        $sheet->setCellValue('B4', 'Nama Perangkat Daerah');
        $sheet->setCellValue('C4', 'Nilai Peserta Uji Kompetensi Ketatalaksanaan');
        $sheet->setCellValue('D4', 'Nilai Hasil Uji Kompetensi x 40%');
        $sheet->setCellValue('E4', 'SOP');
        $sheet->setCellValue('F4', 'Tata Naskah Dinas');
        $sheet->setCellValue('G4', 'Pakaian Dinas');
        $sheet->setCellValue('H4', 'Hari dan Jam Kerja');
        $sheet->setCellValue('I4', 'Nilai Penilaian Lapangan x 60%');
        $sheet->setCellValue('J4', 'Jumlah Nilai');
        $sheet->setCellValue('K4', 'Keterangan');

        // td numrow 6
        $numrow = 5;
        $counter = 0;
        foreach ($this->data['fetch']['topd'] as $topd) {

            $counter += 1;
            $sheet->setCellValue('A' .$numrow, $counter);
            $sheet->setCellValue('B' .$numrow, ucwords($topd['nama_opd']));
            $sheet->setCellValue('C' .$numrow, $topd['uji_kompetensi']);
            $sheet->setCellValue('D' .$numrow, strval(floatval($topd['uji_kompetensi']) * 4.0 / 10.0));
            $sheet->setCellValue('E' .$numrow, $topd['sop']);
            $sheet->setCellValue('F' .$numrow, $topd['tata_naskah_dinas']);
            $sheet->setCellValue('G' .$numrow, $topd['pakaian_dinas']);
            $sheet->setCellValue('H' .$numrow, $topd['jam_kerja']);
            $sheet->setCellValue('I' .$numrow,  strval((floatval($topd['sop']) + floatval($topd['tata_naskah_dinas']) + floatval($topd['pakaian_dinas']) + floatval($topd['jam_kerja'])) * 6.0 / 10.0));
            $sheet->setCellValue('J' .$numrow, strval((floatval($topd['uji_kompetensi']) * 4.0 / 10.0) + ((floatval($topd['sop']) + floatval($topd['tata_naskah_dinas']) + floatval($topd['pakaian_dinas']) + floatval($topd['jam_kerja'])) * 6.0 / 10.0)));
            $sheet->setCellValue('K' .$numrow, $topd['ket']);
            $numrow ++;
        }

        // ini style tablenya
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);
        $sheet->setShowGridlines(true);
        $sheet->getStyle('A4:K' . ($numrow - 1))->applyFromArray($this->style('allborder'));
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
