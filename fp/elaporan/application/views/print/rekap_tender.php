<?php include "header.php"; ?>

<body>
    <div id='header-laporan'>
        <center>
            <h2>
                
                <?php echo $data['fetch']['rt']['judul_rekap_tender'] ?><br />
                <?php echo $data['nama_opd']; ?><br />
            </h2>
        </center>
    </div>
    <table style='width: 100%;'>
        <!-- Table header -->
        <tr>
            <th>No.</th>
            <th>Paket Pekerjaan</th>
            <th>Nilai Pagu</th>
            <th>Nilai HPS</th>
            <th>Pemenang</th>
            <th>Harga Kontrak</th>
            <th>Prosentase Harga Kontrak terhadap HPS</th>
            <th>OPD</th>
            <th>Ket</th>
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
            <th>10</th>
        </tr>
        <!-- End of Table Header -->
        <!-- Table Contents -->
        <?php
        $counter = 0;

        foreach ($data['fetch']['drt'] as $drt) {
            $counter += 1;
            $vl = 0;
            if(floatval($drt['nilai_hps'] != 0)) $vl = strval(floatval($drt['harga_kontrak'])/floatval($drt['nilai_hps'])*100.0);
            else $vl = "nilai HPS 0";
            echo "
                <tr>
                    <td><center>$counter</center></td>
                    <td><center>$drt[nama_paket_kerja]</center></td>
                    <td><center>$drt[pagu]</center></td>
                    <td><center>$drt[nilai_hps]</center></td>
                    <td><center>$drt[pemenang]</center></td>
                    <td><center>$drt[harga_kontrak]</center></td>
                    <td><center>".$vl."</center></td>
                    <td >" . ucwords($drt['nama_opd']) . "</center></td>
                    <td><center>$drt[ket]</center></td>

                </tr>
            ";
        }
        ?>
        <!-- End of Table Contents -->
    </table>
    <div id='footer-laporan'></div>
</body>

</html>