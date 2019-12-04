<div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
        <div class="x_title">
            <h2><?= $data['title'] ?></h2>
            <ul class="nav navbar-right panel_toolbox">
                <a href="<?= base_url('opd/show_disposisi') ?>" class="btn btn-success"><i class="fa fa-plus"></i> Tambah Disposisi</a>
            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <table id="rekapdisposisitable" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>No. Surat</th>
                        <th>Dari</th>
                        <th>Tgl. Masuk</th>
                        <th>No. Agenda</th>
                        <th>Perihal</th>
                        <th>Kepada</th>
                        <th>Isi</th>
                        <th></th>
                    </tr>
                </thead>


                <tbody>
                    <?php
                    $no = 0;
                    foreach ($data['rawdata'] as $row) {
                        $no++;
                        ?>
                        <tr>
                            <td><?= $no ?></td>
                            <td><?= $row['no_surat'] ?></td>
                            <td><?= ucwords($row['nama_opd']) ?></td>
                            <td><?= $row['tgl_masuk'] ?></td>
                            <td><?= $row['no_agenda'] ?></td>
                            <td><?= $row['perihal'] ?></td>
                            <td><?= $row['diteruskan'] ?></td>
                            <td><?= $row['isi'] ?></td>
                            <td>
                                <a href="#" class="btn btn-info btn-xs"><i class="fa fa-image"></i> Lampiran</a>
                                <a href="<?= base_url('opd/deldis/') . $row['id_disposisi']; ?>" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Hapus</a>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>