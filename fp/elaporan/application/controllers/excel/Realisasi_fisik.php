<?php
defined('BASEPATH') or exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class realisasi_fisik extends CI_Controller
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
        $sheet->getColumnDimension('C')->setWidth(50);
        $sheet->getColumnDimension('D')->setWidth(50);
        $sheet->getColumnDimension('E')->setWidth(20);
        $sheet->getColumnDimension('F')->setWidth(20);
        $sheet->getColumnDimension('G')->setWidth(20);
        $sheet->getColumnDimension('H')->setWidth(20);
        $sheet->getColumnDimension('I')->setWidth(20);
        $sheet->getColumnDimension('J')->setWidth(20);
        $sheet->getColumnDimension('K')->setWidth(20);
        $sheet->getColumnDimension('L')->setWidth(20);

        // ini stylenya
        $sheet->getStyle('1')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('1')->getAlignment()->setVertical('center');
        $sheet->getStyle('E:L')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A:L')->getAlignment()->setVertical('center');
        $sheet->getStyle('A7:L9')->getAlignment()->setHorizontal('center');
        $sheet->getStyle('A7:L9')->getAlignment()->setVertical('center');
        $sheet->getStyle('A7:L9')->getFont()->setBold(true);
        $sheet->getStyle('A:L')->getAlignment()->setWrapText(true);
        $sheet->getStyle('A1')->getFont()->setBold(true);

        // ini atur header
        $sheet->setCellValue('A1', 'LAPORAN REALISASI FISIK DAN KEUANGAN SERTA CAPAIAN KINERJA TAHUN ' . date('Y', strtotime($this->data['fetch']['rf']['tgl'])))
            ->mergeCells('A1:L1');
        $sheet->setCellValue('A3', 'UNIT ORGANISASI')->mergeCells('A3:B3');
        $sheet->setCellValue('C3', ': ' . $this->data['nama_opd']);
        $sheet->setCellValue('A4', 'BULAN')->mergeCells('A4:B4');
        $sheet->setCellValue('C4', ': ' . date('M', strtotime($this->data['fetch']['rf']['tgl'])));
        $sheet->setCellValue('A5', 'TAHUN ANGGARAN')->mergeCells('A5:B5');
        $sheet->setCellValue('C5', ': '  . date('Y', strtotime($this->data['fetch']['rf']['tgl'])));


        // ini tablenya
        // th numrow 5
        $sheet->setCellValue('A7', 'NO.')
            ->mergeCells('A7:A8');
        $sheet->setCellValue('B7', 'PROGRAM')
            ->mergeCells('B7:B8');
        $sheet->setCellValue('C7', 'URAIAN KEGIATAN')
            ->mergeCells('C7:C8');
        $sheet->setCellValue('D7', 'INDIKATOR')
            ->mergeCells('D7:D8');
        $sheet->setCellValue('E7', 'SATUAN')
            ->mergeCells('E7:E8');
        $sheet->setCellValue('F7', 'KINERJA')
            ->mergeCells('F7:H7');
        $sheet->setCellValue('I7', 'KEUANGAN')
            ->mergeCells('I7:K7');
        $sheet->setCellValue('L7', 'KET')
            ->mergeCells('L7:L8');


        // th numrow 6
        $sheet->setCellValue('F8', 'TARGET');
        $sheet->setCellValue('G8', 'REALISASI');
        $sheet->setCellValue('H8', '%');
        $sheet->setCellValue('I8', 'ANGGARAN');
        $sheet->setCellValue('J8', 'REALISASI');
        $sheet->setCellValue('K8', '%');

        $sheet->setCellValue('A9', '1');
        $sheet->setCellValue('B9', '2');
        $sheet->setCellValue('C9', '3');
        $sheet->setCellValue('D9', '4');
        $sheet->setCellValue('E9', '6');
        $sheet->setCellValue('F9', '7');
        $sheet->setCellValue('G9', '8');
        $sheet->setCellValue('H9', '9');
        $sheet->setCellValue('I9', '10');
        $sheet->setCellValue('J9', '11');
        $sheet->setCellValue('K9', '12');
        $sheet->setCellValue('L9', '13');

        // // td numrow 7
        $numrow = 10;

        $counter = 0;
        foreach ($this->data['fetch']['prog'] as $prog) {
            $prog_rowspan = (2 * sizeof($this->data['fetch']['kg'][$prog['kode_program']]));
            $counter += 1;
            $capaian_realisasi_kinerja = "";
            $capaian_realisasi_keuangan = 0;
            $persen_capaian = 0;
            $capaian_realisasi_kinerja = 0;
            $capaian_anggaran_keuangan = 0;

            $t_kinerja = 0;
            $r_kinerja = 0;
            $r_keuangan = 0;
            foreach ($this->data['fetch']['kg'][$prog['kode_program']] as $sum) {
                $t_kinerja += (floatval($sum['hasil_target_ppas_final']) + floatval($sum['keluaran_target_ppas_final']));
                $r_kinerja += (floatval($sum['hasil_realisasi_kinerja']) + floatval($sum['keluaran_realisasi_kinerja']));
                $r_keuangan += intval($sum['realisasi_keuangan']);
                $capaian_anggaran_keuangan += intval($sum['pagu_ppas_final']);
            }
            $capaian_realisasi_kinerja = floatval($r_kinerja / $t_kinerja) * 100.0;
            $capaian_realisasi_keuangan = $r_keuangan;

            if ($prog['capaian_target_ppas_final'] != '0') {
                $persen_capaian = round(floatval($capaian_realisasi_kinerja) / floatval($prog['capaian_target_ppas_final']) * 100.0, 2);
            }

            $persen_capaian_keuangan = 0;
            if ($capaian_anggaran_keuangan != 0) {
                $persen_capaian_keuangan = floatval($capaian_realisasi_keuangan) / floatval($capaian_anggaran_keuangan) * 100.0;
            }
            $sheet->setCellValue('A' . $numrow, $counter)->mergeCells('A' . $numrow . ':A' . ($numrow + $prog_rowspan));
            $sheet->setCellValue('B' . $numrow, ucwords($prog['nama_program']))->mergeCells('B' . $numrow . ':B' . ($numrow + $prog_rowspan));
            $sheet->setCellValue('C' . $numrow, '');
            $sheet->setCellValue('D' . $numrow, $prog['capaian_indikator']);
            $sheet->setCellValue('E' . $numrow, $prog['capaian_satuan']);
            $sheet->setCellValue('F' . $numrow, $prog['capaian_target_ppas_final']);
            $sheet->setCellValue('G' . $numrow, round($capaian_realisasi_kinerja, 2));
            $sheet->setCellValue('H' . $numrow, round($persen_capaian, 2));
            $sheet->setCellValue('I' . $numrow, $capaian_anggaran_keuangan);
            $sheet->setCellValue('J' . $numrow, $capaian_realisasi_keuangan);
            $sheet->setCellValue('K' . $numrow, round($persen_capaian_keuangan, 2));
            $sheet->setCellValue('L' . $numrow, '')->mergeCells('L' . $numrow . ':L' . ($numrow + $prog_rowspan));

            $numrow++;
            $persen_keluaran = "0";
            $persen_hasil = "0";
            foreach ($this->data['fetch']['kg'][$prog['kode_program']] as $kg) {
                $keluaran_realisasi_kinerja = "0";
                $realisasi_keuangan = "0";
                $hasil_realisasi_kinerja = "0";
                $persen_keluaran = "0";
                $persen_hasil = "0";

                // $hasil_realisasi_keuangan = "";
                if (isset($kg['keluaran_realisasi_kinerja'])) $keluaran_realisasi_kinerja = $kg['keluaran_realisasi_kinerja'];
                if (isset($kg['realisasi_keuangan'])) $realisasi_keuangan = $kg['realisasi_keuangan'];
                if (isset($kg['hasil_realisasi_kinerja'])) $hasil_realisasi_kinerja = $kg['hasil_realisasi_kinerja'];
                // if(isset($kg['hasil_realisasi_keuangan'])) $hasil_realisasi_keuangan = $kg['hasil_realisasi_keuangan'];
                if ($kg['keluaran_target_ppas_final'] != '0') {
                    $persen_keluaran = round(floatval($keluaran_realisasi_kinerja) / floatval($kg['keluaran_target_ppas_final']) * 100.0, 2);
                }
                if ($kg['hasil_target_ppas_final'] != '0') {
                    $persen_hasil = round(floatval($hasil_realisasi_kinerja) / floatval($kg['hasil_target_ppas_final']) * 100.0, 2);
                }
                $persen_keuangan = 0;
                if (floatval($kg['pagu_ppas_final']) != 0) {
                    $persen_keuangan = floatval($realisasi_keuangan) / floatval($kg['pagu_ppas_final']) * 100.0;
                }

                $sheet->setCellValue('C' . $numrow, ucwords($kg['nama_kegiatan']))->mergeCells('C' . $numrow . ':C' . ($numrow + 1));

                $wizard = new PhpOffice\PhpSpreadsheet\Helper\Html;

                $richText = $wizard->toRichTextObject('<strong><u>Output:</u></strong>' . ucwords($kg['keluaran_indikator']));
                $sheet->setCellValue('D' . $numrow, $richText);
                $richText = $wizard->toRichTextObject('<strong><u>Output:</u></strong>' . ucwords($kg['hasil_indikator']));
                $sheet->setCellValue('D' . ($numrow + 1),  $richText);
                $sheet->setCellValue('E' . $numrow, $kg['keluaran_satuan']);
                $sheet->setCellValue('F' . $numrow, $kg['keluaran_target_ppas_final']);
                $sheet->setCellValue('G' . $numrow, $keluaran_realisasi_kinerja);
                $sheet->setCellValue('H' . $numrow, round($persen_keluaran));
                $sheet->setCellValue('I' . $numrow, $kg['pagu_ppas_final'])->mergeCells('I' . $numrow . ':I' . ($numrow + 1));
                $sheet->setCellValue('J' . $numrow, $realisasi_keuangan)->mergeCells('J' . $numrow . ':J' . ($numrow + 1));
                $sheet->setCellValue('K' . $numrow, round($persen_keuangan))->mergeCells('K' . $numrow . ':K' . ($numrow + 1));

                $numrow++;

                $sheet->setCellValue('E' . $numrow, $kg['hasil_satuan']);
                $sheet->setCellValue('F' . $numrow, $kg['hasil_target_ppas_final']);
                $sheet->setCellValue('G' . $numrow, $kg['hasil_realisasi_kinerja']);
                $sheet->setCellValue('H' . $numrow, round($persen_hasil, 2));
                $numrow++;
            }
        }

        // ini style tablenya
        $sheet->getPageSetup()->setFitToWidth(1);
        $sheet->getPageSetup()->setFitToHeight(0);
        $sheet->setShowGridlines(true);
        $sheet->getStyle('A7:L' . ($numrow - 1))->applyFromArray($this->style('allborder'));
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
