<?php
defined('BASEPATH') or exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class pemantauan_tindak_lanjut extends CI_Controller
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
        $sheet->getStyle('A:K')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A:K')->getAlignment()->setVertical('center');
        $sheet->getStyle('A:K')->getAlignment()->setWrapText(true);
        $sheet->getStyle('A1:K7')->getFont()->setBold(true);

       
        // ini atur header
        $sheet->setCellValue('A1', $this->data['fetch']['ptl']['judul_laporan'])
            ->mergeCells('A1:K1');
        $sheet->setCellValue('A2', $this->data['nama_opd'])
            ->mergeCells('A2:K2');

        // ini tablenya
        // th numrow 5
        $sheet->setCellValue('A4', 'No.')
            ->mergeCells('A4:A6');
        $sheet->setCellValue('B4', 'Temuan')
            ->mergeCells('B4:B6');
        $sheet->setCellValue('C4', 'Rekomendasi')
            ->mergeCells('C4:C6');
        $sheet->setCellValue('D4', 'Status Tahun')
            ->mergeCells('D4:F4');
        $sheet->setCellValue('G4', 'Tindak Lanjut')
            ->mergeCells('G4:G6');
        $sheet->setCellValue('H4', 'Status Tahun')
            ->mergeCells('H4:J4');
        $sheet->setCellValue('K4', 'Catatan BPK')
            ->mergeCells('K4:K6');

        // th buat status tahun
        $tgl_status_rekomendasi = 'dd/mm/YYYY';
        $tgl_status_tindak_lanjut = 'dd/mm/YYYY';
        if (isset($this->data['fetch']['ptl']['tgl_status_rekomendasi']))
            $tgl_status_rekomendasi = date('d-m-Y', strtotime($this->data['fetch']['ptl']['tgl_status_rekomendasi']));
        if (isset($this->data['fetch']['ptl']['tgl_status_tindak_lanjut']))
            $tgl_status_tindak_lanjut = date('d-m-Y', strtotime($this->data['fetch']['ptl']['tgl_status_tindak_lanjut']));
        $sheet->setCellValue('D5', $tgl_status_rekomendasi)
            ->mergeCells('D5:F5');
        $sheet->setCellValue('H5', $tgl_status_tindak_lanjut)
            ->mergeCells('H5:J5');

        // th buat ts tb tt
        $sheet->setCellValue('D6', 'TS');
        $sheet->setCellValue('E6', 'TB');
        $sheet->setCellValue('F6', 'TT');
        $sheet->setCellValue('H6', 'TS');
        $sheet->setCellValue('I6', 'TB');
        $sheet->setCellValue('J6', 'TT');

        $sheet->setCellValue('A7', '1');
        $sheet->setCellValue('B7', '2');
        $sheet->setCellValue('C7', '3');
        $sheet->setCellValue('D7', '4');
        $sheet->setCellValue('E7', '5');
        $sheet->setCellValue('F7', '6');
        $sheet->setCellValue('G7', '7');
        $sheet->setCellValue('H7', '8');
        $sheet->setCellValue('I7', '9');
        $sheet->setCellValue('J7', '10');
        $sheet->setCellValue('K7', '11');

        // td numrow 6
        $numrow = 8;
        $counter = 0;
        foreach ($this->data['fetch']['temuan'] as $temuan) {
            $rowspan = (sizeof($this->data['fetch']['htemuan'][$temuan['id_temuan']]) - 1);
            $counter += 1;

            $sheet->setCellValue('A' . $numrow, $counter)->mergeCells('A' . $numrow . ':A' . ($numrow + $rowspan));
            $sheet->setCellValue('B' . $numrow, $temuan['nama_temuan'])->mergeCells('B' . $numrow . ':B' . ($numrow + $rowspan));

            foreach ($this->data['fetch']['htemuan'][$temuan['id_temuan']] as $kg) {

                $sheet->setCellValue('C' . $numrow, $kg['rekomendasi']);
                if ($kg['status_rekomendasi'] == 'TS') {
                    $sheet->setCellValue('D' . $numrow, 'TS');
                } elseif ($kg['status_rekomendasi'] == 'TB') {
                    $sheet->setCellValue('E' . $numrow, 'TB');
                } elseif ($kg['status_rekomendasi'] == 'TT') {
                    $sheet->setCellValue('F' . $numrow, 'TT');
                }

                $sheet->setCellValue('G' . $numrow, $kg['rekomendasi']);
                if ($kg['status_tindak_lanjut'] == 'TS') {
                    $sheet->setCellValue('H' . $numrow, 'TS');
                } elseif ($kg['status_tindak_lanjut'] == 'TB') {
                    $sheet->setCellValue('I' . $numrow, 'TB');
                } elseif ($kg['status_tindak_lanjut'] == 'TT') {
                    $sheet->setCellValue('J' . $numrow, 'TT');
                }

                $sheet->setCellValue('K' . $numrow, $kg['catatan_bpk']);
                $numrow++;
            }
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

/* End of file pemantauan_tindak_lanjut.php */
