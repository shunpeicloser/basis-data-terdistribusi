<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2><?= $data['title'] ?></h2>
                <div class="nav navbar-right panel_toolbox">
                    <a href="<?= base_url('admin/f/registrationform') ?>"><button class="btn btn-primary"><i class="fa fa-plus"></i> Tambah User</button></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <table id="db" class="table table-striped table-bordered dt-responsive nowrap">
                    <thead>
                        <tr>
                            <th>ID User</th>
                            <th>Username</th>
                            <th>OPD</th>
                            <th>Terakhir Login</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>


                    <tbody>
                        <?php
                        foreach ($data['rawdata'] as $row) {
                            ?>
                            <tr>
                                <td><?= $row['id'] ?></td>
                                <td><?= $row['username'] ?></td>
                                <td><?= $row['nama_opd'] ?></td>
                                <td><?= $row['last_login'] ?></td>
                                <td>
                                    <a href="<?= base_url('admin/reset_password/' . $row['id']) ?>" class="btn btn-warning btn-xs"><i class="fa fa-undo"></i> Reset Pass</a>
                                    <a href="<?= base_url('database/deluser/' . $row['id']) ?>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Hapus</a>
                                </td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>