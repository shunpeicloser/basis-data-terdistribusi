<?php include "header.php"; //var_dump($data['fetch']); die();?>

<body>
    <div id='header-laporan'>
        <center>
            <h2>
                DAFTAR PENUGASAN KELOMPOK KERJA<br />
                <?php echo $data['nama_opd']; ?><br />
            </h2>
        </center>
    </div>
    <table style='width: 100%;'>
        <!-- Table header -->
        <tr>
            <th>No.</th>
            <th>Nama</th>
            <th>Paket Pekerjaan</th>
            <th>Nilai Pagu</th>
            <th>Jabatan dalam Tim</th>
            <th>Ket</th>
        </tr>
        <tr>
            <th>1</th>
            <th>2</th>
            <th>3</th>
            <th>4</th>
            <th>5</th>
            <th>6</th>
        </tr>
        <!-- End of Table Header -->
        <!-- Table Contents -->
        <?php
        $counter = 0;
        foreach ($data['fetch']['p'] as $prog) {
            $prog_rowspan = sizeof($data['fetch']['drp'][$prog['id_pegawai']])+1;
            // var_dump($prog_rowspan);
            $counter += 1;
            echo "
                 <tr>
                     <td rowspan='$prog_rowspan'>$counter</td>
                     <td rowspan='$prog_rowspan'>" . ucwords($prog['nama']) . "</td>
                 </tr>
             ";
            foreach ($data['fetch']['drp'][$prog['id_pegawai']] as $kg) {
                // var_dump($kg);
                echo "
                     <tr>
                         <td>" . ucwords($kg['nama_paket_kerja']) . "</td>
                         <td>$kg[pagu]</td>
                         <td>". ucwords($kg['jabatan']) ."</td>
                         <td>". ucwords($kg['ket']) ."</td>
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