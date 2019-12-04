<?php
defined('BASEPATH') or exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class laporan_rb_area_perubahan extends CI_Controller
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
        $sheet->getColumnDimension('B')->setWidth(20);
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
        $sheet->getStyle('1')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('1')->getAlignment()->setVertical('center');
        $sheet->getStyle('A3:A5')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A3:A5')->getAlignment()->setVertical('center');
        $sheet->getStyle('A6:D6')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('C3:C5')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('C3:C5')->getAlignment()->setVertical('center');
        $sheet->getStyle('D3:D5')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('D3:D5')->getAlignment()->setVertical('center');
        $sheet->getStyle('E:K')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('B3:B5')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('B3:B5')->getAlignment()->setVertical('center');
        $sheet->getStyle('E:K')->getAlignment()->setVertical('center');
        $sheet->getStyle('A:L')->getAlignment()->setWrapText(true);
        $sheet->getStyle('A1')->getFont()->setBold(true);
        $sheet->getStyle('A3:K6')->getFont()->setBold(true);

        // ini atur header
        $sheet->setCellValue('A1', 'Laporan Rencana Aksi Reformasi Birokrasi Pemerintah Daerah Tahun ' . date('Y', strtotime($this->data['fetch']['rb']['tgl'])) . ' pada Delapan Area Perubahan (per 30 Desember ' . date('Y', strtotime($this->data['fetch']['rb']['tgl'])) . ' )')
            ->mergeCells('A1:L1');


        // ini tablenya
        // th numrow 5
        $sheet->setCellValue('A3', 'NO')
            ->mergeCells('A3:A5');
        $sheet->setCellValue('B3', 'AREA PERUBAHAN')
            ->mergeCells('B3:B5');
        $sheet->setCellValue('C3', 'PROGRAM')
            ->mergeCells('C3:C5');
        $sheet->setCellValue('D3', 'KEGIATAN')
            ->mergeCells('D3:D5');
        $sheet->setCellValue('E3', 'PERIODE PELAKSANA')
            ->mergeCells('E3:F3');
        $sheet->setCellValue('G3', 'ANGGARAN (Rp.000.000)')
            ->mergeCells('G3:H3');
        $sheet->setCellValue('I3', 'STATUS CAPAIAN (V)')
            ->mergeCells('I3:J3');
        $sheet->setCellValue('K3', 'ALASAN TIDAK TERCAPAI')
            ->mergeCells('K3:K5');

        // th numrow 6
        $sheet->setCellValue('E4', 'TARGET')
            ->mergeCells('E4:E5');
        $sheet->setCellValue('F4', 'REALISASI')
            ->mergeCells('F4:F5');
        $sheet->setCellValue('G4', 'TARGET')
            ->mergeCells('G4:G5');
        $sheet->setCellValue('H4', 'REALISASI')
            ->mergeCells('H4:H5');
        $sheet->setCellValue('I4', 'TERCAPAI')
            ->mergeCells('I4:I5');
        $sheet->setCellValue('J4', 'TIDAK TERCAPAI')
            ->mergeCells('J4:J5');


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


        // // td numrow 7
        $numrow = 7;

        //for buat data
        $counter = 0;
        foreach ($this->data['fetch']['rbap'] as $rbap) {
            $rowspan_rincian = 0;

            foreach ($this->data['fetch']['rbaps'][$rbap['id_rb_area_perubahan']] as $rbaps) {
                $rowspan_rincian += sizeof($this->data['fetch']['rbapk'][$rbaps['id_rb_area_perubahan_program']]);
            }
            $rowspan_rincian -= 1;
            if ($rowspan_rincian < 0) {
                $rowspan_rincian = 0;
            }
            $counter += 1;
            $flag = FALSE;

            $sheet->setCellValue('A' . $numrow, $counter)->mergeCells('A' . $numrow . ':A' . ($numrow + $rowspan_rincian));
            $sheet->setCellValue('B' . $numrow, $rbap['rincian'])->mergeCells('B' . $numrow . ':B' . ($numrow + $rowspan_rincian));
            foreach ($this->data['fetch']['rbaps'][$rbap['id_rb_area_perubahan']] as $rbaps) {
                $rowspan_program = sizeof($this->data['fetch']['rbapk'][$rbaps['id_rb_area_perubahan_program']]) - 1;
                if ($rowspan_program < 0) {
                    $rowspan_program = 0;
                }
                $sheet->setCellValue('C' . $numrow, $rbaps['nama_program'])->mergeCells('C' . $numrow . ':C' . ($numrow + $rowspan_program));

                $flag2 = FALSE;
                $rbapk = reset($this->data['fetch']['rbapk'][$rbaps['id_rb_area_perubahan_program']]);
                $sheet->setCellValue('D' . $numrow, $rbapk['nama_kegiatan']);
                $sheet->setCellValue('E' . $numrow, $rbapk['target_waktu']);
                $sheet->setCellValue('F' . $numrow, $rbapk['realisasi_waktu']);
                $sheet->setCellValue('G' . $numrow, $rbapk['target_anggaran']);
                $sheet->setCellValue('H' . $numrow, $rbapk['realisasi_anggaran']);
                if ($rbapk['capaian'] == '0') {
                    $sheet->setCellValue('J' . $numrow, 'V');
                } else {
                    $sheet->setCellValue('I' . $numrow, 'V');
                }
                $sheet->setCellValue('K' . $numrow, $rbapk['ket']);

                foreach ($this->data['fetch']['rbapk'][$rbaps['id_rb_area_perubahan_program']] as $rbapk) {
                    if ($flag2) {
                        $sheet->setCellValue('D' . $numrow, $rbapk['nama_kegiatan']);
                        $sheet->setCellValue('E' . $numrow, $rbapk['target_waktu']);
                        $sheet->setCellValue('F' . $numrow, $rbapk['realisasi_waktu']);
                        $sheet->setCellValue('G' . $numrow, $rbapk['target_anggaran']);
                        $sheet->setCellValue('H' . $numrow, $rbapk['realisasi_anggaran']);
                        if ($rbapk['capaian'] == '0') {
                            $sheet->setCellValue('J' . $numrow, 'V');
                        } else {
                            $sheet->setCellValue('I' . $numrow, 'V');
                        }
                        $sheet->setCellValue('K' . $numrow, $rbapk['ket']);
                    } else {
                        $flag2 = TRUE;
                    }
                    $numrow++;
                }
            }
        }
        // end ambil data

        // ini style tablenya
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);
        $sheet->setShowGridlines(true);
        $sheet->getStyle('A3:K' . ($numrow - 1))->applyFromArray($this->style('allborder'));
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
