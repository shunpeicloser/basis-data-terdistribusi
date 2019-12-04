<?php
defined('BASEPATH') or exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class laporan_rb_zi_wbk extends CI_Controller
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
        $sheet->getColumnDimension('B')->setWidth(25);
        $sheet->getColumnDimension('C')->setWidth(20);
        $sheet->getColumnDimension('D')->setWidth(20);
        $sheet->getColumnDimension('E')->setWidth(20);
        $sheet->getColumnDimension('F')->setWidth(20);
        $sheet->getColumnDimension('G')->setWidth(20);
        $sheet->getColumnDimension('H')->setWidth(20);
        $sheet->getColumnDimension('I')->setWidth(20);
        $sheet->getColumnDimension('J')->setWidth(20);
        $sheet->getColumnDimension('K')->setWidth(20);
        $sheet->getColumnDimension('L')->setWidth(20);
        $sheet->getColumnDimension('M')->setWidth(20);
        $sheet->getColumnDimension('N')->setWidth(20);



        // ini stylenya
        $sheet->getStyle('1')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('1')->getAlignment()->setVertical('center');
        $sheet->getStyle('A3:A5')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A3:A5')->getAlignment()->setVertical('center');
        $sheet->getStyle('A6:D6')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('C3:C5')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('C3:C5')->getAlignment()->setVertical('center');
        $sheet->getStyle('D3:D5')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('D3:D5')->getAlignment()->setVertical('center');
        $sheet->getStyle('E:O')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('B3:B5')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('B3:B5')->getAlignment()->setVertical('center');
        $sheet->getStyle('E:N')->getAlignment()->setVertical('center');
        $sheet->getStyle('A:N')->getAlignment()->setWrapText(true);
        $sheet->getStyle('A1')->getFont()->setBold(true);
        $sheet->getStyle('A3:N6')->getFont()->setBold(true);

        // ini atur header
        $sheet->setCellValue('A1', 'Laporan Capaian Rencana Aksi Reformasi Birokrasi Pemerintah Daerah Kota Madiun per 30 Desember ' . date('Y', strtotime($this->data['fetch']['rb']['tgl'])) . ' pada Prioritas Zona Integrasi Menuju Wilayah Bebas Korupsi (WBK)')
            ->mergeCells('A1:O1');


        // ini tablenya
        // th numrow 5
        $sheet->setCellValue('A3', 'NO')
            ->mergeCells('A3:A5');
        $sheet->setCellValue('B3', 'SASARAN')
            ->mergeCells('B3:B5');
        $sheet->setCellValue('C3', 'PROGRAM')
            ->mergeCells('C3:C5');
        $sheet->setCellValue('D3', 'KEGIATAN')
            ->mergeCells('D3:D5');
        $sheet->setCellValue('E3', 'INDIKATOR')
            ->mergeCells('E3:E5');
        $sheet->setCellValue('F3', 'OUTPUT')
            ->mergeCells('F3:G3');
        $sheet->setCellValue('H3', 'BULAN KE-')
            ->mergeCells('H3:I3');
        $sheet->setCellValue('J3', 'ANGGARAN')
            ->mergeCells('J3:K3');
        $sheet->setCellValue('L3', 'STATUS CAPAIAN (V)')
            ->mergeCells('L3:M3');
        $sheet->setCellValue('N3', 'KETERANGAN')
            ->mergeCells('N3:N5');


        // th numrow 6
        $sheet->setCellValue('F4', 'TARGET')
            ->mergeCells('F4:F5');
        $sheet->setCellValue('G4', 'REALISASI')
            ->mergeCells('G4:G5');
        $sheet->setCellValue('H4', 'TARGET')
            ->mergeCells('H4:H5');
        $sheet->setCellValue('I4', 'REALISASI')
            ->mergeCells('I4:I5');
        $sheet->setCellValue('J4', 'TARGET')
            ->mergeCells('J4:J5');
        $sheet->setCellValue('K4', 'REALISASI')
            ->mergeCells('K4:K5');
        $sheet->setCellValue('L4', 'TERCAPAI')
            ->mergeCells('L4:L5');
        $sheet->setCellValue('M4', 'TIDAK TERCAPAI')
            ->mergeCells('M4:M5');


        $sheet->setCellValue('A6', '1');
        $sheet->setCellValue('B6', '2');
        $sheet->setCellValue('C6', '3');
        $sheet->setCellValue('D6', '4');
        $sheet->setCellValue('E6', '5');
        $sheet->setCellValue('F6', '6');
        $sheet->setCellValue('G6', '7');
        $sheet->setCellValue('H6', '8');
        $sheet->setCellValue('I6', '9');
        $sheet->setCellValue('J6', '10');
        $sheet->setCellValue('K6', '11');
        $sheet->setCellValue('L6', '12');
        $sheet->setCellValue('M6', '13');
        $sheet->setCellValue('N6', '14');



        // // td numrow 7
        $numrow = 7;

        //for buat data
        $counter = 0;
        foreach ($this->data['fetch']['rbziwbks'] as $rbziwbks) {
            $counter += 1;

            $rowspan_rincian = sizeof($this->data['fetch']['rbziwbkk'][$rbziwbks['id_rb_zi_wbk_sasaran']]);
            $rowspan_rincian -= 1;
            if ($rowspan_rincian < 0) {
                $rowspan_rincian = 0;
            }

            $sheet->setCellValue('A' . $numrow, $counter)->mergeCells('A' . $numrow . ':A' . ($numrow + $rowspan_rincian));
            $sheet->setCellValue('B' . $numrow, $rbziwbks['sasaran'])->mergeCells('B' . $numrow . ':B' . ($numrow + $rowspan_rincian));
            $sheet->setCellValue('C' . $numrow, $rbziwbks['nama_program'])->mergeCells('C' . $numrow . ':C' . ($numrow + $rowspan_rincian));

            $flag2 = FALSE;
            foreach ($this->data['fetch']['rbziwbkk'][$rbziwbks['id_rb_zi_wbk_sasaran']] as $rbziwbkk) {
                if ($flag2) {
                    $sheet->setCellValue('D' . $numrow, $rbziwbkk['nama_kegiatan']);
                    $sheet->setCellValue('E' . $numrow, $rbziwbkk['indikator']);
                    $sheet->setCellValue('F' . $numrow, $rbziwbkk['target_output']);
                    $sheet->setCellValue('G' . $numrow, $rbziwbkk['realisasi_output']);
                    $sheet->setCellValue('H' . $numrow, $rbziwbkk['target_waktu']);
                    $sheet->setCellValue('I' . $numrow, $rbziwbkk['realisasi_waktu']);
                    $sheet->setCellValue('J' . $numrow, $rbziwbkk['target_anggaran']);
                    $sheet->setCellValue('K' . $numrow, $rbziwbkk['realisasi_anggaran']);
                    if ($rbziwbkk['capaian'] == '0') {
                        $sheet->setCellValue('M' . $numrow, 'V');
                    } else {
                        $sheet->setCellValue('L' . $numrow, 'V');
                    }
                    $sheet->setCellValue('N' . $numrow, $rbziwbkk['ket']);
                } else {
                    $flag2 = TRUE;
                    $sheet->setCellValue('D' . $numrow, $rbziwbkk['nama_kegiatan']);
                    $sheet->setCellValue('E' . $numrow, $rbziwbkk['indikator']);
                    $sheet->setCellValue('F' . $numrow, $rbziwbkk['target_output']);
                    $sheet->setCellValue('G' . $numrow, $rbziwbkk['realisasi_output']);
                    $sheet->setCellValue('H' . $numrow, $rbziwbkk['target_waktu']);
                    $sheet->setCellValue('I' . $numrow, $rbziwbkk['realisasi_waktu']);
                    $sheet->setCellValue('J' . $numrow, $rbziwbkk['target_anggaran']);
                    $sheet->setCellValue('K' . $numrow, $rbziwbkk['realisasi_anggaran']);
                    if ($rbziwbkk['capaian'] == '0') {
                        $sheet->setCellValue('M' . $numrow, 'V');
                    } else {
                        $sheet->setCellValue('L' . $numrow, 'V');
                    }
                    $sheet->setCellValue('N' . $numrow, $rbziwbkk['ket']);
                }
                $numrow++;
            }
        }
        // end ambil data

        // ini style tablenya
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);
        $sheet->setShowGridlines(true);
        $sheet->getStyle('A3:N' . ($numrow - 1))->applyFromArray($this->style('allborder'));
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
