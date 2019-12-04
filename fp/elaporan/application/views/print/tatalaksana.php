<?php include "header.php"; ?>

<body>
    <div id='header-laporan'>
        <center>
            <h2>
                LAPORAN HASIL PENGAMATAN TATALAKSANA TAHUN <?php echo date('Y', strtotime($data['fetch']['t']['tgl'])); ?><br />
                <?php echo $data['nama_opd']; ?><br />
            </h2>
        </center>
    </div>
    <table style='width: 100%;'>
        <!-- Table header -->
        <tr>
            <th>No.</th>
            <th>Nama Perangkat Daerah</th>
            <th>Nilai Peserta Uji Kompetensi Ketatalaksanaan</th>
            <th>Nilai Hasil Uji Kompetensi x 40%</th>
            <th>SOP</th>
            <th>Tata Naskah Dinas</th>
            <th>Pakaian Dinas</th>
            <th>Hari dan Jam Kerja</th>
            <th>Nilai Penilaian Lapangan x 60%</th>
            <th>Jumlah Nilai</th>
            <th>Keterangan</th>
        </tr>
        <!-- End of Table Header -->
        <!-- Table Contents -->
        <?php
        $counter = 0;
        foreach ($data['fetch']['topd'] as $topd) {
            $counter += 1;
            echo "
                    <tr>
                        <td><center>$counter</center></td>
                        <td>" . ucwords($topd['nama_opd']) . "</td>
                        <td><center>$topd[uji_kompetensi]</center></td>
                        <td><center>" . strval(floatval($topd['uji_kompetensi']) * 4.0 / 10.0) . "</center></td>
                        <td><center>$topd[sop]</center></td>
                        <td><center>$topd[tata_naskah_dinas]</center></td>
                        <td><center>$topd[pakaian_dinas]</center></td>
                        <td><center>$topd[jam_kerja]</center></td>
                        <td><center>" .
                strval(
                    (floatval($topd['sop']) + floatval($topd['tata_naskah_dinas']) +
                        floatval($topd['pakaian_dinas']) + floatval($topd['jam_kerja'])) * 6.0 / 10.0
                ) . "</center></td>
                        <td><center>" .
                strval(
                    (floatval($topd['uji_kompetensi']) * 4.0 / 10.0) + ((floatval($topd['sop']) + floatval($topd['tata_naskah_dinas']) +
                            floatval($topd['pakaian_dinas']) + floatval($topd['jam_kerja'])) * 6.0 / 10.0)
                ) . "</center></td>
                        <td><center>$topd[ket]</center></td>
 
                    </tr>
                ";
        }
        ?>
        <!-- End of Table Contents -->
    </table>
    <div id='footer-laporan'></div>
</body>

</html>