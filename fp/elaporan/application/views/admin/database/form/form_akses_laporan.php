<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <form action="<?php echo base_url('admin/submit'); ?>" method="post">
            <input type="hidden" name="tipe_opsi" value="tipelaporan">
            <input type="hidden" name="id_opd" value="<?= $data['id_opd'] ?>">
            <div class="x_panel">
                <div class="x_title">
                    <h2><?= $data['title'] ?></h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><button type="submit" class="btn btn-success">Simpan</button></li>
                    </ul>
                    <div class="clearfix">
                    </div>
                </div>
                <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                        <strong>Silahkan pilih akses dengan mencentang pilihan pada kolom akses!!!</strong>
                    </p>
                    <table class="table table-striped bulk_action">
                        <thead>
                            <tr>
                                <th>Akses</th>
                                <th>Laporan</th>
                            </tr>
                        </thead>


                        <tbody>
                            <?php foreach ($data['rawdata'] as $row) {
                                ?>
                                <tr>
                                    <td style="width:5%"><input type="checkbox" name="id_tipe[]" value="<?= $row['id_tipe'] ?>" id="check-all" class="flat" <?php foreach ($data['selected'] as $select) {
                                                                                                                                                                if ($select['id_tipe'] == $row['id_tipe']) {
                                                                                                                                                                    echo 'checked="true"';
                                                                                                                                                                    break;
                                                                                                                                                                }
                                                                                                                                                            } ?>></td>
                                    <td><?= $row['nama_laporan'] ?></td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>
    </div>
</div>