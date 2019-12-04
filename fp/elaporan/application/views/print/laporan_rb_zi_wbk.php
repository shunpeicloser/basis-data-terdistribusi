<?php include "header.php"; ?>

<body>
    <div id='header-laporan'>
        <center>
            <h2>
                <?php echo 'Laporan Capaian Rencana Aksi Reformasi Birokrasi Pemerintah Daerah Kota Madiun per 30 Desember ' . date('Y', strtotime($this->data['fetch']['rb']['tgl'])) . ' pada Prioritas Zona Integrasi Menuju Wilayah Bebas Korupsi (WBK)' ?>
            </h2>
        </center>
    </div>
    <table style='width: 100%;'>
        <!-- Table header -->
        <tr>
            <th rowspan='2'>NO</th>
            <th rowspan='2'>SASARAN</th>
            <th rowspan='2'>PROGRAM</th>
            <th rowspan='2'>KEGIATAN</th>
            <th rowspan='2'>INDIKATOR</th>
            <th colspan='2'>OUTPUT</th>
            <th colspan='2'>BULAN KE-</th>
            <th colspan='2'>ANGGARAN</th>
            <th colspan='2'>STATUS CAPAIAN (V)</th>
            <th rowspan='2'>ALASAN TIDAK TERCAPAI</th>
            
        </tr>
        <tr>
            <th>TARGET</th>
            <th>REALISASI</th>
            <th>TARGET</th>
            <th>REALISASI</th>
            <th>TARGET</th>
            <th>REALISASI</th>
            <th>TERCAPAI</th>
            <th>TIDAK TERCAPAI</th>
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
            <th>13</th>
            <th>14</th>
        </tr>
        <!-- End of Table Header -->
        <!-- Table Contents -->
        <?php
        $counter = 0;
        foreach($data['fetch']['rbziwbks'] as $rbziwbks){
            $counter += 1;
            $rowspan_sasaran = sizeof($data['fetch']['rbziwbkk'][$rbziwbks['id_rb_zi_wbk_sasaran']]);
            echo "<tr>
                    <td rowspan='$rowspan_sasaran'><center>$counter</center></td>
                    <td rowspan='$rowspan_sasaran'><center>$rbziwbks[sasaran]</center></td>
                    <td rowspan='$rowspan_sasaran'><center>$rbziwbks[nama_program]</center></td>";
            
            $flag2 = FALSE;
            
            foreach($data['fetch']['rbziwbkk'][$rbziwbks['id_rb_zi_wbk_sasaran']] as $rbziwbkk){
            if($flag2){
                echo "<tr>
                        <td><center>$rbziwbkk[nama_kegiatan]</center></td>
                        <td><center>$rbziwbkk[indikator]</center></td>
                        <td><center>$rbziwbkk[target_output]</center></td>
                        <td><center>$rbziwbkk[realisasi_output]</center></td>
                        <td><center>$rbziwbkk[target_waktu]</center></td>
                        <td><center>$rbziwbkk[realisasi_waktu]</center></td>
                        <td><center>$rbziwbkk[target_anggaran]</center></td>
                        <td><center>$rbziwbkk[realisasi_anggaran]</center></td>";
                        if($rbziwbkk['capaian'] == '0'){
                            echo "<td></td><td>V</td>";
                        } else {
                            echo "<td>V</td><td></td>";
                        }
                        echo "<td><center>$rbziwbkk[ket]</center></td>
                    </tr>";
            } else {
                $flag2 = TRUE;
                echo "<td><center>$rbziwbkk[nama_kegiatan]</center></td>
                        <td><center>$rbziwbkk[indikator]</center></td>
                        <td><center>$rbziwbkk[target_output]</center></td>
                        <td><center>$rbziwbkk[realisasi_output]</center></td>
                        <td><center>$rbziwbkk[target_waktu]</center></td>
                        <td><center>$rbziwbkk[realisasi_waktu]</center></td>
                        <td><center>$rbziwbkk[target_anggaran]</center></td>
                        <td><center>$rbziwbkk[realisasi_anggaran]</center></td>";
                        if($rbziwbkk['capaian'] == '0'){
                            echo "<td></td><td>V</td>";
                        } else {
                            echo "<td>V</td><td></td>";
                        }
                    echo "<td><center>$rbziwbkk[ket]</center></td>
                    </tr>";
            }
        }        
                
    }
            
        ?>
        <!-- End of Table Contents -->
    </table>
    <div id='footer-laporan'></div>
</body>

</html>