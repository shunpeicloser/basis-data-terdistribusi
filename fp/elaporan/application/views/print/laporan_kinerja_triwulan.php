<?php include "header.php"; ?>

<body>
    <div id='header-laporan'>
        <center>
            <h2>
                LAPORAN KINERJA<br />
                TRIWULAN<br/>
                <?php echo $data['nama_opd']; ?><br />
                TAHUN <?php echo date('Y', strtotime($data['fetch']['lkt']['tgl'])); ?>
            </h2>
        </center>
    </div>
    <table style='width: 100%;'>
        <!-- Table header -->
        <tr>
            <th rowspan='2'>No.</th>
            <th colspan='4'>Sasaran Kegiatan</th>
            <th rowspan='2'>Program</th>
            <th rowspan='2'>Anggaran</th>
            <th rowspan='2'>Realisasi</th>
        </tr>
        <tr>
            <th>Uraian</th>
            <th>Indikator Kinerja</th>
            <th>Target</th>
            <th>Realisasi</th>
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
        </tr>
        <!-- End of Table Header -->
        <!-- Table Contents -->
        <?php
        $counter = 0;
        foreach ($data['fetch']['lktdetail'] as $lktdetail) {

            $counter += 1;
            echo "
                 <tr>
                     <td ><center>$counter</center></td>
                     <td><center>$lktdetail[uraian]</center></td>
                     <td><center>$lktdetail[indikator_kinerja]</center></td>
                     <td><center>$lktdetail[target]</center></td>
                     <td><center>$lktdetail[realisasi_target]</center></td>
                     <td><center>$lktdetail[program]</center></td>
                     <td><center>$lktdetail[anggaran]</center></td>
                     <td><center>$lktdetail[capaian_realisasi_keuangan]</center></td>
                 </tr>
             ";
        }
        ?>
        <!-- End of Table Contents -->
    </table>
    <div id='footer-laporan'></div>
</body>

</html>