<!-- page content -->

<div class="">
  <div class="page-title">
    <div class="title_left">
      <!-- <h3>Reset Password</h3> -->
    </div>

  </div>
  <div class="clearfix"></div>
  <div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="x_panel">
        <div class="x_title">
          <h2>Laporan Kinerja Triwulan</h2>

          <div class="clearfix"></div>
        </div>
        <div class="x_content">
          <br />
          <div class="clearfix"></div>

          <div class="">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_content">
                  <a href='<?php if (isset($data['id_laporan'])) echo base_url("export/$data[formname]/$data[id_laporan]"); ?>' target='_blank'><button class="btn btn-success"><i class="fa fa-print"></i> Excel</button></a>
                  <a href='<?php if (isset($data['id_laporan'])) echo base_url("opd/p/$data[formname]/$data[id_laporan]"); ?>' target='_blank'><button class="btn btn-primary"><i class="fa fa-print"></i> PRINT</button></a>
                  <div class="" role="tabpanel" data-example-id="togglable-tabs">
                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                      <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Laporan Kinerja Triwulan</a>
                      </li>
                      <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Detail Laporan Kinerja Triwulan</a>
                      </li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                      <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action='<?php echo base_url("opd/e/$data[formname]/$data[id_laporan]"); ?>' method="post">
                          <input value="laporan_kinerja_triwulan" type="hidden" name="nama_tabel">
                          <div class="form-group">
                            <label for="tahun" class="control-label col-md-3 col-sm-3 col-xs-12">Tahun</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <h2><?php echo date('Y', strtotime($data['fetch']['lkt']['tgl'])); ?></h2>
                              <!-- <input disabled class="form-control col-md-7 col-xs-12" type="text" name="tahun"  > -->
                            </div>
                          </div>
                        </form>

                      </div>
                      <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action='<?php echo base_url("opd/e/$data[formname]/$data[id_laporan]"); ?>' method="post">
                          <input value="detail_laporan_kinerja_triwulan" type="hidden" name="nama_tabel">
                          <button type='button' onclick='add_field()'>Tambah</button>
                          <div id='container-opsi'>

                            <?php if ($data['fetch']['lktdetail'] != NULL) {
                              foreach ($data['fetch']['lktdetail'] as $lktdetail) {
                                ?>
                                <div>

                                  <div class="col-md-12 col-sm-12 col-xs-12" style='border: 2px solid black; padding:10px;'>
                                    <!-- <input value='<?php echo $lktdetail['id_temuan']; ?>' type='hidden' name='id_temuan[]'> -->


                                    <div class="form-group">
                                      <label for="uraian" class="control-label col-md-3 col-sm-3 col-xs-12">Uraian</label>
                                      <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input value='<?php echo $lktdetail['uraian']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="uraian[]">
                                      </div>
                                    </div>

                                    <div class="form-group">
                                      <label for="indikator_kinerja" class="control-label col-md-3 col-sm-3 col-xs-12">Indikator Kinerja</label>
                                      <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input value='<?php echo $lktdetail['indikator_kinerja']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="indikator_kinerja[]">
                                      </div>
                                    </div>

                                    <div class="form-group">
                                      <label for="target" class="control-label col-md-3 col-sm-3 col-xs-12">Target</label>
                                      <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input value='<?php echo $lktdetail['target']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="target[]">
                                      </div>
                                    </div>

                                    <div class="form-group">
                                      <label for="realisasi_target" class="control-label col-md-3 col-sm-3 col-xs-12">Realisasi Target</label>
                                      <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input value='<?php echo $lktdetail['realisasi_target']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="realisasi_target[]">
                                      </div>
                                    </div>

                                    <div class="form-group">
                                      <label for="program" class="control-label col-md-3 col-sm-3 col-xs-12">Program</label>
                                      <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input value='<?php echo $lktdetail['program']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="program[]">
                                      </div>
                                    </div>

                                    <div class="form-group">
                                      <label for="anggaran" class="control-label col-md-3 col-sm-3 col-xs-12">Anggaran</label>
                                      <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input value='<?php echo $lktdetail['anggaran']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="anggaran[]">
                                      </div>
                                    </div>

                                    <div class="form-group">
                                      <label for="capaian_realisasi_keuangan" class="control-label col-md-3 col-sm-3 col-xs-12">Capaian Realisasi Keuangan</label>
                                      <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input value='<?php echo $lktdetail['capaian_realisasi_keuangan']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="capaian_realisasi_keuangan[]">
                                      </div>
                                    </div>

                                    <div class="form-group">
                                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <button type='button' onclick='delete_node(this)'>Hapus</button>
                                      </div>
                                    </div>

                                  </div>
                                </div>
                              <?php }
                            } ?>

                          </div> <!-- div container -->

                          <div class="ln_solid"></div>
                          <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                              <button style="position: fixed; bottom: 28px; right: 48px;font-size:20px;  width: 100px;" type="submit" class="btn btn-success">Submit</button>
                            </div>
                          </div>
                      </div>
                      </form>
                    </div>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>



      <script>
        var opd = "<div>\
    <div class='col-md-12 col-sm-12 col-xs-12' style='border: 2px solid black; padding:10px;'>\
    <div class='form-group'>\
      <label for='uraian' class='control-label col-md-3 col-sm-3 col-xs-12'>Uraian</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
        <input class='form-control col-md-7 col-xs-12' type='text' name='uraian[]'  >\
      </div>\
    </div>\
    \
    <div class='form-group'>\
      <label for='indikator_kinerja' class='control-label col-md-3 col-sm-3 col-xs-12'>Indikator Kinerja</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
        <input class='form-control col-md-7 col-xs-12' type='text' name='indikator_kinerja[]'  >\
      </div>\
    </div>\
    \
    <div class='form-group'>\
      <label for='target' class='control-label col-md-3 col-sm-3 col-xs-12'>Target</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
        <input class='form-control col-md-7 col-xs-12' type='text' name='target[]'  >\
      </div>\
    </div>\
    \
    <div class='form-group'>\
      <label for='realisasi_target' class='control-label col-md-3 col-sm-3 col-xs-12'>Realisasi Target</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
        <input  class='form-control col-md-7 col-xs-12' type='text' name='realisasi_target[]'  >\
      </div>\
    </div>\
    \
    <div class='form-group'>\
      <label for='program' class='control-label col-md-3 col-sm-3 col-xs-12'>Program</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
        <input class='form-control col-md-7 col-xs-12' type='text' name='program[]'  >\
      </div>\
    </div>\
    \
    <div class='form-group'>\
      <label for='anggaran' class='control-label col-md-3 col-sm-3 col-xs-12'>Anggaran</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
        <input class='form-control col-md-7 col-xs-12' type='int' name='anggaran[]'  >\
      </div>\
    </div>\
    \
    <div class='form-group'>\
      <label for='capaian_realisasi_keuangan' class='control-label col-md-3 col-sm-3 col-xs-12'>Capaian Realisasi Keuangan</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
        <input class='form-control col-md-7 col-xs-12' type='text' name='capaian_realisasi_keuangan[]'  >\
      </div>\
    </div>\
    \
    <div class='form-group'>\
      <div class='col-md-6 col-sm-6 col-xs-12 col-md-offset-3'>\
        <button type='button' onclick='delete_node(this)'>Hapus</button>\
      </div>\
    </div>\
  \
  </div>\
  </div>";

        function add_field() {
          var cont = document.getElementById('container-opsi');
          console.log(cont);
          cont.innerHTML = opd + cont.innerHTML;
        }

        function delete_node(node) {
          node.parentNode.parentNode.parentNode.parentNode.removeChild(node.parentNode.parentNode.parentNode);
        }
      </script>


      <!-- /page content -->