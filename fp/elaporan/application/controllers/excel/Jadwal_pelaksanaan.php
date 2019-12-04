<?php
defined('BASEPATH') or exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class jadwal_pelaksanaan extends CI_Controller
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
        $sheet->getColumnDimension('B')->setWidth(60);
        $sheet->getColumnDimension('C')->setWidth(20);
        $sheet->getColumnDimension('D')->setWidth(10);
        $sheet->getColumnDimension('E')->setWidth(10);
        $sheet->getColumnDimension('F')->setWidth(20);
        $sheet->getColumnDimension('G')->setWidth(15);
        $sheet->getColumnDimension('H')->setWidth(20);
        $sheet->getColumnDimension('I')->setWidth(20);

        // ini stylenya
        $sheet->getStyle('1:6')->getAlignment()->setHorizontal('center'); // STYLE HEADER
        $sheet->getStyle('A')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('C:I')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A:I')->getAlignment()->setVertical('center');
        $sheet->getStyle('A:I')->getAlignment()->setWrapText(true);
        $sheet->getStyle('A1:I6')->getFont()->setBold(true);

        // ini atur header
        $sheet->setCellValue('A1', 'JADWAL RENCANA PELAKSANAAN PROGRAM KERJA PENGAWASAN TAHUNAN KOTA MADIUN')
            ->mergeCells('A1:I1');
        $sheet->setCellValue('A2', 'TAHUN ' . date('Y', strtotime($this->data['fetch']['jp']['tgl'])))
            ->mergeCells('A2:I2');
        $sheet->setCellValue('A3', $this->data['nama_opd'])
            ->mergeCells('A3:I3');

        // ini tablenya
        // th numrow 5
        $sheet->setCellValue('A5', 'No.');
        $sheet->setCellValue('B5', 'Objek Pengawasan');
        $sheet->setCellValue('C5', 'Jenis Pengawasan');
        $sheet->setCellValue('D5', 'RMP');
        $sheet->setCellValue('E5', 'RPL');
        $sheet->setCellValue('F5', 'Nama Auditor');
        $sheet->setCellValue('G5', 'Jabatan');
        $sheet->setCellValue('H5', 'Output LHP');
        $sheet->setCellValue('I5', 'Hari Pengawasan');

        $sheet->setCellValue('A6', '1');
        $sheet->setCellValue('B6', '2');
        $sheet->setCellValue('C6', '3');
        $sheet->setCellValue('D6', '4');
        $sheet->setCellValue('E6', '5');
        $sheet->setCellValue('F6', '6');
        $sheet->setCellValue('G6', '7');
        $sheet->setCellValue('H6', '8');
        $sheet->setCellValue('I6', '9');

        // td numrow 7
        $numrow = 7;
        $counter = 0;
        foreach ($this->data['fetch']['jpopd'] as $jpopd) {
            $jpopd_rowspan = (sizeof($this->data['fetch']['adata'][$jpopd['id_jadwal_pelaksanaan_opd']]) - 1);
            $counter += 1;

            $sheet->setCellValue('A' . $numrow, $counter)
                ->mergeCells('A' . $numrow . ':A' . ($numrow + $jpopd_rowspan));
            $sheet->setCellValue('B' . $numrow, ucwords($jpopd['nama_opd']))
                ->mergeCells('B' . $numrow . ':B' . ($numrow + $jpopd_rowspan));
            $sheet->setCellValue('C' . $numrow, $jpopd['jenis_pengawasan'])
                ->mergeCells('C' . $numrow . ':C' . ($numrow + $jpopd_rowspan));
            $sheet->setCellValue('D' . $numrow, $jpopd['rmp'])
                ->mergeCells('D' . $numrow . ':D' . ($numrow + $jpopd_rowspan));
            $sheet->setCellValue('E' . $numrow, $jpopd['rpl'])
                ->mergeCells('E' . $numrow . ':E' . ($numrow + $jpopd_rowspan));
            $sheet->setCellValue('F' . $numrow, $this->data['fetch']['adata'][$jpopd['id_jadwal_pelaksanaan_opd']][0]['nama_auditor']);
            $sheet->setCellValue('G' . $numrow, $this->data['fetch']['adata'][$jpopd['id_jadwal_pelaksanaan_opd']][0]['jabatan']);
            $sheet->setCellValue('H' . $numrow, $jpopd['output_lhp'])
                ->mergeCells('H' . $numrow . ':H' . ($numrow + $jpopd_rowspan));
            $sheet->setCellValue('I' . $numrow, $jpopd['hari_pengawasan'])
                ->mergeCells('I' . $numrow . ':I' . ($numrow + $jpopd_rowspan));

            $numrow++;
            $flag = TRUE;
            foreach ($this->data['fetch']['adata'][$jpopd['id_jadwal_pelaksanaan_opd']] as $jpopd) {
                if ($flag) {
                    $flag = FALSE;
                    continue;
                }
                $sheet->setCellValue('F' . $numrow, $jpopd['nama_auditor']);
                $sheet->setCellValue('G' . $numrow, $jpopd['jabatan']);
                $numrow++;
            }
        }

        // ini style tablenya
        $sheet->getStyle('A5:I' . ($numrow - 1))->applyFromArray($this->style('allborder'));

        // ini style page setup
        $sheet->getPageSetup()->setOrientation('landscape');
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);
        $sheet->setShowGridlines(true);
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

/* End of file jadwal_pelaksanaan.php */
