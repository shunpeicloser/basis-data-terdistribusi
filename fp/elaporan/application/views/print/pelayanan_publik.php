<?php include "header.php"; ?>

<body>
    <div id='header-laporan'>
        <center>
            <h2>
                LAPORAN HASIL PENGAMATAN PELAYANAN PUBLIK TAHUN <?php echo date('Y', strtotime($data['fetch']['pp']['tgl'])); ?><br />
                <?php echo $data['nama_opd']; ?><br />
            </h2>
        </center>
    </div>
    <table style='width: 100%;'>
        <!-- Table header -->
        <tr>
            <th>No.</th>
            <th>Nama Perangkat Daerah</th>
            <th>Indeks Pelayanan Publik</th>
            <th>Konversi 100</th>
            <th>Ket</th>
        </tr>
        <!-- End of Table Header -->
        <!-- Table Contents -->
        <?php
         $counter = 0;
         foreach($data['fetch']['ppopd'] as $ppopd){ 
             $counter += 1;
             $ket = floatval($ppopd['indeks_pelayanan_publik']);
             if($ket > 4.50) $ket = "Pelayanan Prima";
             elseif($ket > 4.00) $ket = "Sangat Baik";
             elseif($ket > 3.50) $ket = "Baik";
             elseif($ket > 3.00) $ket = "Baik (DC)";
             elseif($ket > 2.50) $ket = "Cukup";
             elseif($ket > 2.00) $ket = "Cukup (DC)";
             elseif($ket > 1.50) $ket = "Buruk";
             elseif($ket > 1.00) $ket = "Sangat Buruk";
             else $ket = "<font color='red'>Gagal</font>";
             echo "
                 <tr>

                    <td ><center>$counter</center></td>
                    <td >" . ucwords($ppopd['nama_opd']) . "</center></td>
                    <td><center>$ppopd[indeks_pelayanan_publik]</center></td>
                    <td><center>".strval(floatval($ppopd['indeks_pelayanan_publik'])*20.0)."</center></td>
                    <td><center>$ket</center></td>

                 </tr>
             ";
        }
        ?>
        <!-- End of Table Contents -->
    </table>
    <div id='footer-laporan'></div>
</body>

</html>