<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2><?= $data['title'] ?></h2>
                <div class="clearfix">
                </div>
            </div>
            <div class="x_content">
                <form action="cudlog" method="post">
                    <input type="date" name="day" id="day" value="<?php echo date('Y-m-d'); ?>">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> Cari</button>
                </form>
                <table id="db" class="table table-striped table-bordered dt-responsive nowrap">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Nama OPD</th>
                            <th>Aksi</th>
                            <th>Waktu</th>
                            <th>Query</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($data['rawdata'] as $row) {
                            ?>
                            <tr>
                                <td><?= $row['username'] ?></td>
                                <td><?= $row['nama_opd'] ?></td>
                                <td><?= $row['log_act'] ?></td>
                                <td><?= $row['created_at'] ?></td>
                                <td><?= $row['log_query'] ?></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>