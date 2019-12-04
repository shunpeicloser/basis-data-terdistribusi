<?php include "header.php"; ?>

<body>
    <div id='header-laporan'>
        <center>
            <h2>
                <?php echo $data['fetch']['ptl']['judul_laporan'] ?><br />
                <?php echo $data['nama_opd']; ?><br />
            </h2>
        </center>
    </div>
    <table style='width: 100%;'>
        <!-- Table header -->
        <tr>
            <th rowspan='3'>NO.</th>
            <th rowspan='3'>TEMUAN</th>
            <th rowspan='3'>REKOMENDASI</th>
            <th colspan='3'>STATUS TAHUN</th>
            <th rowspan='3'>TINDAK LANJUT</th>
            <th colspan='3'>STATUS TAHUN</th>
            <th rowspan='3'>CATATAN BPK</th>
        </tr>
        <tr>
            <td colspan='3'>
                <center>
                    <?php if (isset($data['fetch']['ptl']['tgl_status_rekomendasi'])) echo date('d-m-Y', strtotime($data['fetch']['ptl']['tgl_status_rekomendasi'])); ?>
                </center>
            </td>

            <td colspan='3'>
                <center>
                    <?php if (isset($data['fetch']['ptl']['tgl_status_tindak_lanjut'])) echo date('d-m-Y', strtotime($data['fetch']['ptl']['tgl_status_tindak_lanjut'])); ?>
                </center>
            </td>
        </tr>
        <tr>
            <th>TS</th>
            <th>TB </th>
            <th>TT</th>
            <th>TS</th>
            <th>TB </th>
            <th>TT</th>
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
        foreach ($data['fetch']['temuan'] as $temuan) {
            $rowspan = sizeof($data['fetch']['htemuan'][$temuan['id_temuan']]);
            $counter += 1;
            $flag = FALSE;
            echo "
                 <tr>
                     <td rowspan='$rowspan' style='vertical-align: top;'><center>$counter</center></td>
                     <td rowspan='$rowspan' style='vertical-align: top;text-align: left;'>$temuan[nama_temuan]</td>
             ";
            foreach ($data['fetch']['htemuan'][$temuan['id_temuan']] as $kg) {
                if ($flag) echo "<tr>";
                echo "<td style='vertical-align: top;text-align: left;'>$kg[rekomendasi]</td>";
                if ($kg['status_rekomendasi'] == 'TS') {
                    echo "  <td style='vertical-align: top;'><center>TS</center></td>
                                    <td><center></center></td>
                                    <td><center></center></td>";
                } elseif ($kg['status_rekomendasi'] == 'TB') {
                    echo "  <td><center></center></td>
                                    <td style='vertical-align: top;'><center>TB</center></td>
                                    <td><center></center></td>";
                } elseif ($kg['status_rekomendasi'] == 'TT') {
                    echo "  <td><center></center></td>
                                    <td><center></center></td>
                                    <td style='vertical-align: top;'><center>TT</center></td>";
                } else {
                    echo "  <td><center></center></td>
                                    <td><center></center></td>
                                    <td><center></center></td>";
                }
                echo "<td style='vertical-align: top;text-align: left;'>$kg[tindak_lanjut]</td>";
                if ($kg['status_tindak_lanjut'] == 'TS') {
                    echo "  <td><center style='vertical-align: top;'>TS</center></td>
                                    <td><center></center></td>
                                    <td><center></center></td>";
                } elseif ($kg['status_tindak_lanjut'] == 'TB') {
                    echo "  <td><center></center></td>
                                    <td><center style='vertical-align: top;'>TB</center></td>
                                    <td><center></center></td>";
                } elseif ($kg['status_tindak_lanjut'] == 'TT') {
                    echo "  <td><center></center></td>
                                    <td><center></center></td>
                                    <td><center style='vertical-align: top;'>TT</center></td>";
                } else {
                    echo "  <td><center></center></td>
                                    <td><center></center></td>
                                    <td><center></center></td>";
                }
                echo "
                        <td style='vertical-align: top;text-align: left;'>$kg[catatan_bpk]</td>
                    </tr>";
                $flag = TRUE;
            }
        }
        ?>
        <!-- End of Table Contents -->
    </table>
    <div id='footer-laporan'></div>
</body>

</html>