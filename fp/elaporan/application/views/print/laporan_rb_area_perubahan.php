<?php include "header.php"; ?>

<body>
    <div id='header-laporan'>
        <center>
            <h2>
                <?php echo 'Laporan Rencana Aksi Reformasi Birokrasi Pemerintah Daerah Tahun ' . date('Y', strtotime($this->data['fetch']['rb']['tgl'])) . ' pada Delapan Area Perubahan (per 30 Desember ' . date('Y', strtotime($this->data['fetch']['rb']['tgl'])) . ' )' ?>
            </h2>
        </center>
    </div>
    <table style='width: 100%;'>
        <!-- Table header -->
        <tr>
            <th rowspan='2'>NO</th>
            <th rowspan='2'>AREA PERUBAHAN</th>
            <th rowspan='2'>PROGRAM</th>
            <th rowspan='2'>KEGIATAN</th>
            <th colspan='2'>PERIODE PELAKSANAAN</th>
            <th colspan='2'>ANGGARAN</th>
            <th colspan='2'>STATUS CAPAIAN (V)</th>
            <th rowspan='2'>ALASAN TIDAK TERCAPAI</th>
            
        </tr>
        <tr>
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
        </tr>
        <!-- End of Table Header -->
        <!-- Table Contents -->
        <?php
        $counter = 0;
        foreach ($data['fetch']['rbap'] as $rbap) {
            $rowspan_rincian = 0;
            
            foreach($data['fetch']['rbaps'][$rbap['id_rb_area_perubahan']] as $rbaps){
                $rowspan_rincian += sizeof($data['fetch']['rbapk'][$rbaps['id_rb_area_perubahan_program']]);
            }
            $counter += 1;
            $flag = FALSE;
            echo "
                 <tr>
                     <td rowspan='$rowspan_rincian'><center>$counter</center></td>
                     <td rowspan='$rowspan_rincian'><center>$rbap[rincian]</center></td>";
            foreach($data['fetch']['rbaps'][$rbap['id_rb_area_perubahan']] as $rbaps){
                $rowspan_program = sizeof($data['fetch']['rbapk'][$rbaps['id_rb_area_perubahan_program']]);
                if($flag){
                    echo "<tr>
                     <td rowspan='$rowspan_program'><center>$rbaps[nama_program]</center></td>";
                } else {
                    echo "
                     <td rowspan='$rowspan_program'><center>$rbaps[nama_program]</center></td>";
                }
                $flag2 = FALSE;
                     $rbapk = reset($data['fetch']['rbapk'][$rbaps['id_rb_area_perubahan_program']]);
                        echo "
                        <td><center>$rbapk[nama_kegiatan]</center></td>
                        <td><center>$rbapk[target_waktu]</center></td>
                        <td><center>$rbapk[realisasi_waktu]</center></td>
                        <td><center>$rbapk[target_anggaran]</center></td>
                        <td><center>$rbapk[realisasi_anggaran]</center></td>";
                        // var_dump($rbapk['capaian']); die();
                        if($rbapk['capaian'] == '0'){
                            echo "<td></td><td>V</td>";
                        } else {
                            echo "<td>V</td><td></td>";
                        }
                        
                        echo "<td><center>$rbapk[ket]</center></td>
                        ";
                        echo "</tr>";
                     foreach($data['fetch']['rbapk'][$rbaps['id_rb_area_perubahan_program']] as $rbapk){
                        if($flag2){
                            echo "<tr>
                                    <td><center>$rbapk[nama_kegiatan]</center></td>
                                    <td><center>$rbapk[target_waktu]</center></td>
                                    <td><center>$rbapk[realisasi_waktu]</center></td>
                                    <td><center>$rbapk[target_anggaran]</center></td>
                                    <td><center>$rbapk[realisasi_anggaran]</center></td>";
                                    if($rbapk['capaian'] == '0'){
                                        echo "<td></td><td>V</td>";
                                    } else {
                                        echo "<td>V</td><td></td>";
                                    }
                                    echo "<td><center>$rbapk[ket]</center></td>
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