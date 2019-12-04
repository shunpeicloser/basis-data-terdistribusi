<?php include "header.php"; ?>

<body>
    <div id='header-laporan'>
        <center>
            <h2>
                <?php echo 'Laporan Capaian Rencana Aksi Reformasi Birokrasi Pemerintah Daerah Kota Madiun ' . date('Y', strtotime($this->data['fetch']['rb']['tgl'])) . ' pada Prioritas yang Terkait dengan Peningkatan Kualitas Pelayanan Fokus Pelayanan Sektor Tertentu (per 30 Desember ' . date('Y', strtotime($this->data['fetch']['rb']['tgl'])) . ' )' ?>
            </h2>
        </center>
    </div>
    <table style='width: 100%;'>
        <!-- Table header -->
        <tr>
            <th rowspan='2'>NO</th>
            <th rowspan='2'>SEKTOR PELAYANAN</th>
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
            <th>15</th>
        </tr>
        <!-- End of Table Header -->
        <!-- Table Contents -->
        <?php
        $counter = 0;
        foreach ($data['fetch']['rbf'] as $rbf) {
            $rowspan_rincian = 0;
            
            foreach($data['fetch']['rbfs'][$rbf['id_rb_fokus']] as $rbfs){
                $rowspan_rincian += sizeof($data['fetch']['rbfk'][$rbfs['id_rb_fokus_sasaran']]);
            }
            $counter += 1;
            $flag = FALSE;
            echo "
                 <tr>
                     <td rowspan='$rowspan_rincian'><center>$counter</center></td>
                     <td rowspan='$rowspan_rincian'><center>$rbf[rincian]</center></td>";
            foreach($data['fetch']['rbfs'][$rbf['id_rb_fokus']] as $rbfs){
                $rowspan_sasaran = sizeof($data['fetch']['rbfk'][$rbfs['id_rb_fokus_sasaran']]);
                if($flag){
                    echo "<tr>
                     <td rowspan='$rowspan_sasaran'><center>$rbfs[sasaran]</center></td>
                     <td rowspan='$rowspan_sasaran'><center>$rbfs[nama_program]</center></td>";
                } else {
                    echo "
                     <td rowspan='$rowspan_sasaran'><center>$rbfs[sasaran]</center></td>
                     <td rowspan='$rowspan_sasaran'><center>$rbfs[nama_program]</center></td>";
                }
                $flag2 = FALSE;
                     $rbfk = reset($data['fetch']['rbfk'][$rbfs['id_rb_fokus_sasaran']]);
                        echo "
                        <td><center>$rbfk[nama_kegiatan]</center></td>
                        <td><center>$rbfk[indikator]</center></td>
                        <td><center>$rbfk[target_output]</center></td>
                        <td><center>$rbfk[realisasi_output]</center></td>
                        <td><center>$rbfk[target_waktu]</center></td>
                        <td><center>$rbfk[realisasi_waktu]</center></td>
                        <td><center>$rbfk[target_anggaran]</center></td>
                        <td><center>$rbfk[realisasi_anggaran]</center></td>";
                        // var_dump($rbfk['capaian']); die();
                        if($rbfk['capaian'] == '0'){
                            echo "<td></td><td>V</td>";
                        } else {
                            echo "<td>V</td><td></td>";
                        }
                        
                        echo "<td><center>$rbfk[ket]</center></td>
                        ";
                        echo "</tr>";
                     foreach($data['fetch']['rbfk'][$rbfs['id_rb_fokus_sasaran']] as $rbfk){
                        if($flag2){
                            echo "<tr>
                                    <td><center>$rbfk[nama_kegiatan]</center></td>
                                    <td><center>$rbfk[indikator]</center></td>
                                    <td><center>$rbfk[target_output]</center></td>
                                    <td><center>$rbfk[realisasi_output]</center></td>
                                    <td><center>$rbfk[target_waktu]</center></td>
                                    <td><center>$rbfk[realisasi_waktu]</center></td>
                                    <td><center>$rbfk[target_anggaran]</center></td>
                                    <td><center>$rbfk[realisasi_anggaran]</center></td>";
                                    if($rbfk['capaian'] == '0'){
                                        echo "<td></td><td>V</td>";
                                    } else {
                                        echo "<td>V</td><td></td>";
                                    }
                                    echo "<td><center>$rbfk[ket]</center></td>
                                </tr>";
                        } else {
                            $flag2 = TRUE;
                        }
                    }        
                    
            }
            
        }
        ?>
        <!-- End of Table Contents -->
    </table>
    <div id='footer-laporan'></div>
</body>

</html>