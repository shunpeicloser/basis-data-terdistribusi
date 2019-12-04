<?php include "header.php"; ?>

<body>
    <div id='header-laporan'>
        <center>
            <h2>
            
                <?php echo 'LAPORAN REALISASI FISIK DAN KEUANGAN SERTA CAPAIAN KINERJA TAHUN ' . date('Y', strtotime($this->data['fetch']['rf']['tgl'])); ?> <br/><br/>
            </h2>
        </center>
        <h3>
            <?php
                echo 'UNIT ORGANISASI' . "\t :" . $data['nama_opd'];
            ?><br/>
            <?php
                echo 'BULAN' . "\t :" . date('M', strtotime($data['fetch']['rf']['tgl']));
            ?><br/>
            <?php
                echo 'TAHUN ANGGARAM' . "\t :" . date('Y', strtotime($data['fetch']['rf']['tgl']));
            ?><br/>
        </h3>
    </div>
    <table style='width: 100%;'>
        <!-- Table header -->
        <tr>
            <th rowspan='2'>No.</th>
            <th rowspan='2'>Program</th>
            <th rowspan='2'>Uraian Kegiatan</th>
            <th rowspan='2'>Indikator</th>
            <th rowspan='2'>Satuan</th>
            <th colspan='3'>Kinerja</th>
            <th colspan='3'>Keuangan</th>
            <th rowspan='2'>Keterangan</th>
        </tr>
        <tr>
            <th>Target</th>
            <th>Realisasi</th>
            <th>%</th>
            <th>Anggaran</th>
            <th>Realisasi</th>
            <th>%</th>
        </tr>
        <tr>
            <th>1</th>
            <th>2</th>
            <th>3</th>
            <th>4</th>
            <th>5</th>
            <th>6</th>
            <th>7</th>
            <th>8</th>
            <th>9</th>
            <th>10</th>
            <th>11</th>
            <th>12</th>
        </tr>
        <!-- End of Table Header -->
        <!-- Table Contents -->
        <?php
        $counter = 0;
        foreach ($data['fetch']['prog'] as $prog) {
            $prog_rowspan = 2 * sizeof($data['fetch']['kg'][$prog['kode_program']]) + 1;
            $counter += 1;
            $capaian_realisasi_kinerja = "";
            $capaian_realisasi_keuangan = 0;
            $persen_capaian = 0;
            $capaian_realisasi_kinerja = 0;
            $capaian_anggaran_keuangan = 0;
            
            $t_kinerja = 0; $r_kinerja = 0; $r_keuangan = 0;
            foreach($data['fetch']['kg'][$prog['kode_program']] as $sum){
                $t_kinerja += (floatval($sum['hasil_target_ppas_final'])+floatval($sum['keluaran_target_ppas_final']));
                $r_kinerja += (floatval($sum['hasil_realisasi_kinerja'])+floatval($sum['keluaran_realisasi_kinerja']));
                $r_keuangan += intval($sum['realisasi_keuangan']);
                $capaian_anggaran_keuangan += intval($sum['pagu_ppas_final']);
            }
            $capaian_realisasi_kinerja = floatval($r_kinerja / $t_kinerja) * 100.0;
            $capaian_realisasi_keuangan = $r_keuangan;
            // if (isset($prog['capaian_realisasi_kinerja'])) $capaian_realisasi_kinerja = $prog['capaian_realisasi_kinerja'];
            // if (isset($prog['capaian_realisasi_keuangan'])) $capaian_realisasi_keuangan = $prog['capaian_realisasi_keuangan'];
            
            if($prog['capaian_target_ppas_final'] != '0'){
                
                $persen_capaian = round(floatval($capaian_realisasi_kinerja)/floatval($prog['capaian_target_ppas_final'])*100.0, 2);
            }

            $persen_capaian_keuangan = 0;
            if($capaian_anggaran_keuangan != 0){
                $persen_capaian_keuangan = floatval($capaian_realisasi_keuangan)/floatval($capaian_anggaran_keuangan)*100.0;
            }

            echo "
                    <tr>
                        <td rowspan='$prog_rowspan'>$counter</td>
                        <td rowspan='$prog_rowspan'>" . ucwords($prog['nama_program']) . "</td>
                        <td></td>
                        <td>" . $prog['capaian_indikator'] . "</td>
                        <td>$prog[capaian_satuan]</td>
                        <td>$prog[capaian_target_ppas_final]</td>
                        <td>".round($capaian_realisasi_kinerja,2)."</td>
                        <td>".round($persen_capaian,2)."</td>
                        <td>$capaian_anggaran_keuangan</td>
                        <td>$capaian_realisasi_keuangan</td>
                        <td>".round($persen_capaian_keuangan,2)."</td>
                        <td rowspan='$prog_rowspan'></td>
                    </tr>
                ";
                $persen_keluaran = "0";
                $persen_hasil = "0";
            foreach ($data['fetch']['kg'][$prog['kode_program']] as $kg) {
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
                if($kg['keluaran_target_ppas_final'] != '0'){
                    $persen_keluaran = round(floatval($keluaran_realisasi_kinerja)/floatval($kg['keluaran_target_ppas_final'])*100.0,2);
                }
                if($kg['hasil_target_ppas_final'] != '0'){
                    $persen_hasil = round(floatval($hasil_realisasi_kinerja)/floatval($kg['hasil_target_ppas_final'])*100.0,2);
                }
                $persen_keuangan = 0;
                if(floatval($kg['pagu_ppas_final']) != 0){
                    $persen_keuangan = floatval($realisasi_keuangan)/floatval($kg['pagu_ppas_final'])*100.0;
                }
                echo "
                        <tr>
                            <td rowspan='2'>" . ucwords($kg['nama_kegiatan']) . "</td>
                            <td rowspan='2'><strong><u>Output:</u></strong> " . ucwords($kg['keluaran_indikator']) . "
                                <br/><br/>
                                <strong><u>Outcome:</u></strong> " . ucwords($kg['hasil_indikator']) . "</td>
                            <td>$kg[keluaran_satuan]</td>
                            <td>$kg[keluaran_target_ppas_final]</td>
                            <td>$keluaran_realisasi_kinerja</td>
                            <td>".round($persen_keluaran)."</td>
                            <td rowspan='2'>$kg[pagu_ppas_final]</td>
                            <td rowspan='2'>$realisasi_keuangan</td>
                            <td rowspan='2'>".round($persen_keuangan)."</td>
                        </tr>
                        <tr>
                            <td>$kg[hasil_satuan]</td>
                            <td>$kg[hasil_target_ppas_final]</td>
                            <td>$hasil_realisasi_kinerja</td>
                            <td>".round($persen_hasil,2)."</td>
                        </tr>
                    ";
            }
            // echo "<tr>
            //         <td colspan='7'><center>Rata-rata Capaian Kegiatan</center></td>
            //         <td>".(floatval($persen_keluaran)+floatval($persen_hasil))/2.0."</td>
            //         <td colspan='2'></td>
            //         <td>"."???"."</td>
            //         <td></td>
            //     </tr>
            // ";
        }
        ?>
        <!-- End of Table Contents -->
    </table>
    <div id='footer-laporan'></div>
</body>

</html>