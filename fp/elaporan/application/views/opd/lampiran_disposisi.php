<div class="page-title">
    <div class="title_left">
        <h3>Lampiran Disposisi</h3>
    </div>
</div>
<div class="clearfix"></div>
<?php foreach ($data['rawdata'] as $row) {
    ?>
    <div class="row">
        <div class="col-md-12">
            <div class="x_panel collapsed">
                <div class="x_title">
                    <h2><?= ucwords($row['nama_opd']) . ' Nomor Surat ' . $row['no_surat'] ?></h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <a class="btn btn-success" data-toggle="modal" data-target=".bs-example-modal-lg<?= $row['id_disposisi'] ?>"><i class="fa fa-camera"></i> Tambah Lampiran</a>
                        <a href="#" class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="close-link"><i class="fa fa-close"></i></a>
                    </ul>
                    <div class="clearfix"></div>
                </div>

                <div class="x_content">
                    <div class="row">
                        <p> PDF Lampiran </p>
                        <ul>
                            <li>a</li>
                            <li>b</li>
                            <li>c</li>
                        </ul>
                    </div>
                    <hr>
                    <div class="row">
                        <p> Foto Lampiran </p>
                        <div class="col-md-55">
                            <div class="thumbnail">
                                <div class="image view view-first" style="height:100%;">
                                    <img style="width: 100%; display: block;" src="<?= base_url('assets/production/') ?>images/user.png" alt="image" onclick="window.open('<?= base_url('assets/production/') ?>images/user.png', ' _blank');" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-55">
                            <div class="thumbnail">
                                <div class="image view view-first" style="height:100%;">
                                    <img style="width: 100%; display: block;" src="<?= base_url('assets/production/') ?>images/user.png" alt="image" onclick="window.open('<?= base_url('assets/production/') ?>images/user.png', ' _blank');" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-55">
                            <div class="thumbnail">
                                <div class="image view view-first" style="height:100%;">
                                    <img style="width: 100%; display: block;" src="<?= base_url('assets/production/') ?>images/user.png" alt="image" onclick="window.open('<?= base_url('assets/production/') ?>images/user.png', ' _blank');" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-55">
                            <div class="thumbnail">
                                <div class="image view view-first" style="height:100%;">
                                    <img style="width: 100%; display: block;" src="<?= base_url('assets/production/') ?>images/user.png" alt="image" onclick="window.open('<?= base_url('assets/production/') ?>images/user.png', ' _blank');" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-55">
                            <div class="thumbnail">
                                <div class="image view view-first" style="height:100%;">
                                    <img style="width: 100%; display: block;" src="<?= base_url('assets/production/') ?>images/user.png" alt="image" onclick="window.open('<?= base_url('assets/production/') ?>images/user.png', ' _blank');" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-55">
                            <div class="thumbnail">
                                <div class="image view view-first" style="height:100%;">
                                    <img style="width: 100%; display: block;" src="<?= base_url('assets/production/') ?>images/user.png" alt="image" onclick="window.open('<?= base_url('assets/production/') ?>images/user.png', ' _blank');" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-55">
                            <div class="thumbnail">
                                <div class="image view view-first" style="height:100%;">
                                    <img style="width: 100%; display: block;" src="<?= base_url('assets/production/') ?>images/user.png" alt="image" onclick="window.open('<?= base_url('assets/production/') ?>images/user.png', ' _blank');" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-55">
                            <div class="thumbnail">
                                <div class="image view view-first" style="height:100%;">
                                    <img style="width: 100%; display: block;" src="<?= base_url('assets/production/') ?>images/user.png" alt="image" onclick="window.open('<?= base_url('assets/production/') ?>images/user.png', ' _blank');" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade bs-example-modal-lg<?= $row['id_disposisi'] ?>" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel"><?= ucwords($row['nama_opd']) . ' Nomor Surat ' . $row['no_surat'] ?></h4>
                </div>
                <div class="modal-body">
                    <p>Drag atau klik kotak dibawah ini untuk menambahkan lampiran. File yang diupload hanya image ( <strong>jpg / jpeg / png</strong> ) atau file <strong>PDF</strong>.</p>
                    <form action="<?= base_url('opd/upload_lampiran/') . $row['id_disposisi'] ?>" class="dropzone" id="uploadlamdis">
                        <br />
                    </form>
                </div>

            </div>
        </div>
    </div>
<?php } ?>