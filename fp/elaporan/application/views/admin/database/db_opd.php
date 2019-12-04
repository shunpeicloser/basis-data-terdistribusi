<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2><?= $data['title'] ?></h2>
                <div class="clearfix">
                </div>
            </div>
            <div class="x_content">
                <table id="db" class="table table-striped table-bordered dt-responsive nowrap">
                    <thead>
                        <tr>
                            <th>ID OPD</th>
                            <th>Nama OPD</th>
                            <th>User E-Budgeting</th>
                            <th>User E-Kinerja</th>
                            <th>User E-Monev</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($data['rawdata'] as $row) {
                            ?>
                            <tr>
                                <td><?= $row['id_opd'] ?></td>
                                <td><?= $row['nama_opd'] ?></td>
                                <td><?= $row['kode_ebud'] ?></td>
                                <td><?= $row['kode_ekin'] ?></td>
                                <td><?= $row['kode_emov'] ?></td>
                                <td>
                                    <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit Nama OPD</a>
                                </td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>