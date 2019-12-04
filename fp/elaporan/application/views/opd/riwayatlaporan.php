<div class="clearfix"></div>

<div class="col-md-12 col-sm-12 col-xs-12">
  <div class="x_panel">
    <div class="x_title">
      <h2>Riwayat Laporan <?php if (isset($data['nama_laporan'])) {
                            echo $data['nama_laporan'];
                          } ?></h2>
      <div class="clearfix"></div>
    </div>

    <div class="x_content">
      <?php if (isset($data['nama_laporan'])) { ?>
        <div id='search box' style='border: 1px solid; padding: 5px'>
          <form action="<?= base_url('opd/f/' . $data['kode_tipe']) ?>" method="post">
            <table>
              <tbody>
                <tr>
                  <td class="col-sm-1">
                    <center>
                      <strong> Waktu Awal </strong> <br />
                      <input type="date" name="from" value="<?php echo date('Y-m-d'); ?>">
                    </center>
                  </td>
                  <td class="col-sm-1">
                    <center>
                      <strong> Waktu Akhir </strong> <br />
                      <input type="date" name="to" value="<?php echo date('Y-m-d'); ?>">
                    </center>
                  </td>
                  <td class="col-sm-1">
                    <center>
                      <button type="submit">Cari</button>
                    </center>
                  </td>
                </tr>
              </tbody>
            </table>
          </form>
        </div>
      <?php } ?>
      <div class="clearfix"><br /></div>
      <?php if (isset($data['nama_laporan'])) { ?>
        <form action="<?php echo base_url("opd/c/$data[kode_tipe]"); ?>" method="post">
          Masukkan tanggal sesuai bulan dan tahun laporan yang dibuat<br />
          <input type="date" name="tgl" required="required" value="<?= date('Y-m-d') ?>">
          <button type="submit"><?php echo "Buat $data[nama_laporan]"; ?></button>
        </form>
        <!-- <a href="<?php echo base_url("opd/c/$data[kode_tipe]"); ?>"><button><?php echo "Buat $data[nama_laporan]"; ?></button></a> -->
      <?php } ?>
      <div class="clearfix"><br /></div>
      <div class="table-responsive">
        <table class="table table-striped jambo_table bulk_action">
          <thead>
            <tr class="headings">
              <th rowspan='2' class="column-title">ID laporan</th>
              <th rowspan='2' class="column-title">Nama laporan</th>
              <th rowspan='2' class="column-title">Tanggal Dibuat</th>
              <th colspan='2' rowspan='2'>
                <center>Aksi</center>
              </th>
            </tr>
            <tr></tr>
          </thead>

          <tbody>
            <?php
            if (!isset($data['list_laporan']) || sizeof($data['list_laporan']) <= 0) {
              echo "<tr class='even pointer'>
                                      <td>Tidak ada riwayat laporan</td>
                                    </tr>";
            } else {
              $counter = "even pointer";
              foreach ($data['list_laporan'] as $datalaporan) {
                echo "<tr class=$counter>
                                        <td>$datalaporan[id_laporan]</td>
                                        <td>$data[nama_laporan] " . date('M Y', strtotime($datalaporan['tgl'])) . "</td>
                                        <td>" . date('d-m-Y', strtotime($datalaporan['created_at'])) . "</td>
                                        <td><center>
                                        <a href=" . base_url("opd/e/$data[kode_tipe]/$datalaporan[id_laporan]") . "
                                        <button>Edit</button>
                                        </a></center>
                                        </td>
                                        <td><center>
                                        <a href=" . base_url("opd/d/$data[kode_tipe]/$datalaporan[id_laporan]") . "
                                        <button>Hapus</button>
                                        </a></center>
                                        </td>
                                        </a>
                                      </tr>";
                if ($counter == "even pointer") $counter = "odd pointer";
                else $counter = "even pointer";
              }
            }
            ?>

          </tbody>
        </table>
      </div>


    </div>
  </div>
</div>
</div>
</div>
</div>