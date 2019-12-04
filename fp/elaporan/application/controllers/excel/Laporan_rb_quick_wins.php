<?php
defined('BASEPATH') or exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class laporan_rb_quick_wins extends CI_Controller
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
        $sheet->getColumnDimension('O')->setWidth(20);


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
        $sheet->getStyle('E:O')->getAlignment()->setVertical('center');
        $sheet->getStyle('A:O')->getAlignment()->setWrapText(true);
        $sheet->getStyle('A1')->getFont()->setBold(true);
        $sheet->getStyle('A3:O6')->getFont()->setBold(true);

        // ini atur header
        $sheet->setCellValue('A1', 'Laporan Capaian Rencana Aksi Reformasi Birokrasi Pemerintah Daerah Kota Madiun per 30 Desember ' . date('Y', strtotime($this->data['fetch']['rb']['tgl'])) . ' pada Prioritas yang Terkait dengan Peningkatan Kualitas Pelayanan Fokus Pelayanan Quick Wins')
            ->mergeCells('A1:O1');


        // ini tablenya
        // th numrow 5
        $sheet->setCellValue('A3', 'NO')
            ->mergeCells('A3:A5');
        $sheet->setCellValue('B3', 'QUICK WINS')
            ->mergeCells('B3:B5');
        $sheet->setCellValue('C3', 'SASARAN')
            ->mergeCells('C3:C5');
        $sheet->setCellValue('D3', 'PROGRAM')
            ->mergeCells('D3:D5');
        $sheet->setCellValue('E3', 'KEGIATAN')
            ->mergeCells('E3:E5');
        $sheet->setCellValue('F3', 'INDIKATOR')
            ->mergeCells('F3:F5');
        $sheet->setCellValue('G3', 'OUTPUT')
            ->mergeCells('G3:H3');
        $sheet->setCellValue('I3', 'BULAN KE-')
            ->mergeCells('I3:J3');
        $sheet->setCellValue('K3', 'ANGGARAN')
            ->mergeCells('K3:L3');
        $sheet->setCellValue('M3', 'STATUS CAPAIAN (V)')
            ->mergeCells('M3:N3');
        $sheet->setCellValue('O3', 'KETERANGAN')
            ->mergeCells('O3:O5');

        // th numrow 6
        $sheet->setCellValue('G4', 'TARGET')
            ->mergeCells('G4:G5');
        $sheet->setCellValue('H4', 'REALISASI')
            ->mergeCells('H4:H5');
        $sheet->setCellValue('I4', 'TARGET')
            ->mergeCells('I4:I5');
        $sheet->setCellValue('J4', 'REALISASI')
            ->mergeCells('J4:J5');
        $sheet->setCellValue('K4', 'TARGET')
            ->mergeCells('K4:K5');
        $sheet->setCellValue('L4', 'REALISASI')
            ->mergeCells('L4:L5');
        $sheet->setCellValue('M4', 'TERCAPAI')
            ->mergeCells('M4:M5');
        $sheet->setCellValue('N4', 'TIDAK TERCAPAI')
            ->mergeCells('N4:N5');


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
        $sheet->setCellValue('O6', '15');


        // // td numrow 7
        $numrow = 7;

        //for buat data
        $counter = 0;
        foreach ($this->data['fetch']['rbqw'] as $rbqw) {
            $rowspan_rincian = 0;

            foreach ($this->data['fetch']['rbqws'][$rbqw['id_rb_quick_wins']] as $rbqws) {
                $rowspan_rincian += sizeof($this->data['fetch']['rbqwk'][$rbqws['id_rb_quick_wins_sasaran']]);
            }
            $rowspan_rincian -= 1;
            if ($rowspan_rincian < 0) {
                $rowspan_rincian = 0;
            }
            $counter += 1;
            $flag = FALSE;

            $sheet->setCellValue('A' . $numrow, $counter)->mergeCells('A' . $numrow . ':A' . ($numrow + $rowspan_rincian));
            $sheet->setCellValue('B' . $numrow, $rbqw['rincian'])->mergeCells('B' . $numrow . ':B' . ($numrow + $rowspan_rincian));
            foreach ($this->data['fetch']['rbqws'][$rbqw['id_rb_quick_wins']] as $rbqws) {
                $rowspan_program = sizeof($this->data['fetch']['rbqwk'][$rbqws['id_rb_quick_wins_sasaran']]) - 1;
                if ($rowspan_program < 0) {
                    $rowspan_program = 0;
                }

                $sheet->setCellValue('C' . $numrow, $rbqws['sasaran'])->mergeCells('C' . $numrow . ':C' . ($numrow + $rowspan_program));
                $sheet->setCellValue('D' . $numrow, $rbqws['nama_program'])->mergeCells('D' . $numrow . ':D' . ($numrow + $rowspan_program));

                $flag2 = FALSE;
                $rbqwk = reset($this->data['fetch']['rbqwk'][$rbqws['id_rb_quick_wins_sasaran']]);
                $sheet->setCellValue('E' . $numrow, $rbqwk['nama_kegiatan']);
                $sheet->setCellValue('F' . $numrow, $rbqwk['indikator']);
                $sheet->setCellValue('G' . $numrow, $rbqwk['target_output']);
                $sheet->setCellValue('H' . $numrow, $rbqwk['realisasi_output']);
                $sheet->setCellValue('I' . $numrow, $rbqwk['target_waktu']);
                $sheet->setCellValue('J' . $numrow, $rbqwk['realisasi_waktu']);
                $sheet->setCellValue('K' . $numrow, $rbqwk['target_anggaran']);
                $sheet->setCellValue('L' . $numrow, $rbqwk['realisasi_anggaran']);
                if ($rbqwk['capaian'] == '0') {
                    $sheet->setCellValue('N' . $numrow, 'V');
                } else {
                    $sheet->setCellValue('M' . $numrow, 'V');
                }
                $sheet->setCellValue('O' . $numrow, $rbqwk['ket']);

                foreach ($this->data['fetch']['rbqwk'][$rbqws['id_rb_quick_wins_sasaran']] as $rbqwk) {
                    if ($flag2) {
                        $sheet->setCellValue('E' . $numrow, $rbqwk['nama_kegiatan']);
                        $sheet->setCellValue('F' . $numrow, $rbqwk['indikator']);
                        $sheet->setCellValue('G' . $numrow, $rbqwk['target_output']);
                        $sheet->setCellValue('H' . $numrow, $rbqwk['realisasi_output']);
                        $sheet->setCellValue('I' . $numrow, $rbqwk['target_waktu']);
                        $sheet->setCellValue('J' . $numrow, $rbqwk['realisasi_waktu']);
                        $sheet->setCellValue('K' . $numrow, $rbqwk['target_anggaran']);
                        $sheet->setCellValue('L' . $numrow, $rbqwk['realisasi_anggaran']);
                        if ($rbqwk['capaian'] == '0') {
                            $sheet->setCellValue('N' . $numrow, 'V');
                        } else {
                            $sheet->setCellValue('M' . $numrow, 'V');
                        }
                        $sheet->setCellValue('O' . $numrow, $rbqwk['ket']);
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
        $sheet->getStyle('A3:O' . ($numrow - 1))->applyFromArray($this->style('allborder'));
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
