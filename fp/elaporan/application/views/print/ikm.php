<?php include "header.php"; ?>

<body>
    <div id='header-laporan'>
        <center>
            <h2>
                NILAI INDEKS KEPUASAAN MASYARAKAT (IKM)<br />
                TAHUN <?php echo date('Y', strtotime($data['fetch']['ikm']['tgl'])); ?> DI LINGKUNGAN PEMERINTAH KOTA MADIUN<br />
                <?php echo $data['nama_opd']; ?><br />
            </h2>
        </center>
    </div>
    <table style='width: 100%;'>
        <!-- Table header -->
        <tr>
            <th>No.</th>
            <th>PERANGKAT DAERAH</th>
            <th>NILAI TAHUN <?php echo date('Y', strtotime($data['fetch']['ikm']['tgl'])); ?> </th>
            <th>PREDIKAT</th>
        </tr>
        <!-- End of Table Header -->
        <!-- Table Contents -->
        <?php
        $counter = 0;
        foreach ($data['fetch']['ikmopd'] as $ikm) {

            $counter += 1;
            echo "
                 <tr>
                     <td ><center>$counter</center></td>
                     <td >" . ucwords($ikm['nama_opd']) . "</center></td>
                     <td><center>$ikm[nilai]</center></td>
                     <td><center>$ikm[predikat]</center></td>
                 </tr>
             ";
        }
        ?>
        <!-- End of Table Contents -->
    </table>
    <div id='footer-laporan'></div>
</body>

</html>