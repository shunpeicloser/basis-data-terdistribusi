<?php include "header.php"; ?>

<body>
    <div id='header-laporan'>
        <center>
            <h2>
                JADWAL RENCANA PELAKSANAAN PROGRAM KERJA PENGAWASAN TAHUNAN KOTA MADIUN<br />
                TAHUN <?php echo date('Y', strtotime($data['fetch']['jp']['tgl'])); ?> <br/>
                <?php echo $data['nama_opd']; ?><br />
            </h2>
        </center>
    </div>
    <table style='width: 100%;'>
        <!-- Table header -->
        <tr>
            <th>No.</th>
            <th>Objek Pengawasan</th>
            <th>Jenis Pengawasan</th>
            <th>RMP</th>
            <th>RPL</th>
            <th>Nama Auditor</th>
            <th>Jabatan</th>
            <th>Output LHP</th>
            <th>Hari Pengawasan</th>
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
        </tr>
        <!-- End of Table Header -->
        <!-- Table Contents -->
        <?php
        $counter = 0;
        foreach ($data['fetch']['jpopd'] as $jpopd) {
            $jpopd_rowspan = sizeof($data['fetch']['adata'][$jpopd['id_jadwal_pelaksanaan_opd']]);
            $counter += 1;
            echo "
                 <tr>
                     <td rowspan='$jpopd_rowspan'><center>$counter</center></td>
                     <td rowspan='$jpopd_rowspan'>" . ucwords($jpopd['nama_opd']) . "</td>
                     <td rowspan='$jpopd_rowspan'><center>$jpopd[jenis_pengawasan]</center></td>
                     <td rowspan='$jpopd_rowspan'><center>$jpopd[rmp]</center></td>
                     <td rowspan='$jpopd_rowspan'><center>$jpopd[rpl]</center></td>
                     <td><center>".$data['fetch']['adata'][$jpopd['id_jadwal_pelaksanaan_opd']][0]['nama_auditor']."</centre></td>
                     <td><center>".$data['fetch']['adata'][$jpopd['id_jadwal_pelaksanaan_opd']][0]['jabatan']."</centre></td>
                     <td rowspan='$jpopd_rowspan'><center>$jpopd[output_lhp]</center></td>
                     <td rowspan='$jpopd_rowspan'><center>$jpopd[hari_pengawasan]</center></td>
                 </tr>
             ";
             $flag = TRUE;
            foreach ($data['fetch']['adata'][$jpopd['id_jadwal_pelaksanaan_opd']] as $jpopd) {
            if ($flag){
                $flag=FALSE;
                continue;
            }
                echo "
                     <tr>
                         <td><center>$jpopd[nama_auditor]</center></td>
                         <td><center>$jpopd[jabatan]</center></td>
                     </tr>
                 ";
            }
        }
        ?>
        <!-- End of Table Contents -->
    </table>
    <div id='footer-laporan'></div>
</body>

</html>