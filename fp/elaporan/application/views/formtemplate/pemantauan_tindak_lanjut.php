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
          <h2>Pemantauan Tindak Lanjut</h2>
       
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
                        <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Pemantauan Tindak Lanjut</a>
                        </li>
                        <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Temuan</a>
                        </li>
                        <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Hasil Temuan</a>
                        </li>
                      </ul>
                      <div id="myTabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                        <form id="demo-form1" data-parsley-validate class="form-horizontal form-label-left" action='<?php echo base_url("opd/e/$data[formname]/$data[id_laporan]"); ?>' method="post">
                        <input value="pemantauan_tindak_lanjut" type="hidden" name="nama_tabel">
                            <div class="form-group">
                            <label for="tgl" class="control-label col-md-3 col-sm-3 col-xs-12">Bulan dan Tahun</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <h3><?php echo date('M, Y', strtotime($data['fetch']['ptl']['tgl'])); ?></h3>
                            </div>
                            </div>
                            <div class="form-group">
                            <label for="tgl1" class="control-label col-md-3 col-sm-3 col-xs-12">Tanggal Rekomendasi</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input value='<?php if(isset($data['fetch']['ptl']['tgl_status_rekomendasi'])) echo $data['fetch']['ptl']['tgl_status_rekomendasi']; ?>' class="form-control col-md-7 col-xs-12" type="date" name="tgl_status_rekomendasi"  >
                            </div>
                            </div>
                            <div class="form-group">
                            <label for="tgl2" class="control-label col-md-3 col-sm-3 col-xs-12">Tanggal Tindak Lanjut</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input value='<?php if(isset($data['fetch']['ptl']['tgl_status_tindak_lanjut'])) echo $data['fetch']['ptl']['tgl_status_tindak_lanjut']; ?>' class="form-control col-md-7 col-xs-12" type="date" name="tgl_status_tindak_lanjut"  >
                            </div>
                            </div>
                            <div class="form-group">
                            <label for="judul_laporan" class="control-label col-md-3 col-sm-3 col-xs-12">Judul Laporan</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input value='<?php echo $data['fetch']['ptl']['judul_laporan']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="judul_laporan"  >
                            </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <button style="position: fixed; bottom: 28px; right: 48px;font-size:20px;  width: 100px;" type="submit" class="btn btn-success" >Submit</button>
                            </div>
                            </div>
                        </form>

                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action='<?php echo base_url("opd/e/$data[formname]/$data[id_laporan]"); ?>' method="post">
                            <input value="temuan" type="hidden" name="nama_tabel">
                            <button type='button' onclick='add_field()'>Tambah</button>
                            <div id="container-opsi">
                            
                            <?php if($data['fetch']['temuan'] != NULL){ 
                                    foreach($data['fetch']['temuan'] as $temuan){  
                            ?>
                            <div>  <!-- PENTING -->
                            <div class="col-md-12 col-sm-12 col-xs-12" style='border: 2px solid black; padding:10px;'>
                            <input value='<?php echo $temuan['id_temuan']; ?>' type='hidden' name='id_temuan[]'>
                            
                            <div class="form-group">
                            <label for="nama_temuan" class="control-label col-md-3 col-sm-3 col-xs-12">Nama Temuan</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input value='<?php echo $temuan['nama_temuan']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="nama_temuan[]"  >
                            </div>
                            </div>

                            <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                              <button type='button' onclick='delete_node(this)'>Hapus</button>
                            </div>
                            </div>

                            </div>
                            </div>
                            <?php }} ?>
                            </div>
                            
                            <div id='deleted'></div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <button style="position: fixed; bottom: 28px; right: 48px;font-size:20px;  width: 100px;" type="submit" class="btn btn-success" >Submit</button>
                            </div>
                            </div>
                        </form>

                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                            <div id="container-opsi">
                            
                            <?php if($data['fetch']['temuan'] != NULL){ 
                              $modal = 0;
                                    foreach($data['fetch']['temuan'] as $temuan){  
                           $modal++; ?>

                           <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action='<?php echo base_url("opd/e/$data[formname]/$data[id_laporan]"); ?>' method="post">
                            <input value="hasil_temuan" type="hidden" name="nama_tabel">
                            <div class="col-md-12 col-sm-12 col-xs-12" style='border: 2px solid black; padding:10px;'>
                            <input disabled value='<?php echo $temuan['id_temuan']; ?>' type='hidden' name='id_temuan[]'>
                            <h2><?php echo $temuan['nama_temuan']; ?></h2>
                            <!-- <button type='button' onclick='add_hasil_temuan(this)'>Tambah Hasil Temuan</button> -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg<?= $modal ?>">Tambah Hasil Temuan</button>

                            <?php
                                foreach($data['fetch']['htemuan'][$temuan['id_temuan']] as $htemuan){
                            ?>
                            <div>
                            <div>
                            
                            <input value='<?php echo $temuan['id_temuan']; ?>' type='hidden' name='id_temuan[]'>
                            <div class="form-group">
                            <label for="rekomendasi" class="control-label col-md-3 col-sm-3 col-xs-12">rekomendasi</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea id="editor" name="rekomendasi[]"><?= $htemuan['rekomendasi'] ?></textarea>
                                <!-- <input value='<?php echo $htemuan['rekomendasi']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="rekomendasi[]"  > -->
                            </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="status_rekomendasi" class="control-label col-md-3 col-sm-3 col-xs-12">Status Rekomendasi</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name='status_rekomendasi[]'>
                                <?php
                                  $sel1 = ''; $sel2 = ''; $sel3 = '';
                                  if($htemuan['status_rekomendasi'] == "TS") $sel1 = "selected='selected'";
                                  if($htemuan['status_rekomendasi'] == "TB") $sel2 = "selected='selected'";
                                  if($htemuan['status_rekomendasi'] == "TT") $sel3 = "selected='selected'";
                                  echo "<option value='TS' $sel1>TS</option>";
                                  echo "<option value='TB' $sel2>TB</option>";
                                  echo "<option value='TT' $sel3>TT</option>";
                                ?>
                              </select>
                            </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="tindak_lanjut" class="control-label col-md-3 col-sm-3 col-xs-12">Tindak Lanjut</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea id="editor" name="tindak_lanjut[]"><?= $htemuan['tindak_lanjut'] ?></textarea>
                                <!-- <input value='<?php echo $htemuan['tindak_lanjut']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="tindak_lanjut[]"  > -->
                            </div>
                            </div>
                            
                            
                            <div class="form-group">
                            <label for="status_tindak_lanjut" class="control-label col-md-3 col-sm-3 col-xs-12">Status Tindak Lanjut</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <select class="form-control" name='status_tindak_lanjut[]'>
                                <?php
                                  $sel1 = ''; $sel2 = ''; $sel3 = '';
                                  if($htemuan['status_tindak_lanjut'] == "TS") $sel1 = "selected='selected'";
                                  if($htemuan['status_tindak_lanjut'] == "TB") $sel2 = "selected='selected'";
                                  if($htemuan['status_tindak_lanjut'] == "TT") $sel3 = "selected='selected'";
                                  echo "<option value='TS' $sel1>TS</option>";
                                  echo "<option value='TB' $sel2>TB</option>";
                                  echo "<option value='TT' $sel3>TT</option>";
                                ?>
                              </select>
                            </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="catatan_bpk" class="control-label col-md-3 col-sm-3 col-xs-12">Catatan BPK</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea id="editor" name="catatan_bpk[]"><?= $htemuan['catatan_bpk'] ?></textarea>
                                <!-- <input value='<?php echo $htemuan['catatan_bpk']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="catatan_bpk[]"  > -->
                            </div>
                            </div>
                            <br/>
                            <div class="form-group">
                              <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button type='button' onclick='delete_hasil_temuan(this)'>Hapus</button>
                              </div>
                            </div>

                            <br/>
                            </div>
                            </div>
                            <?php } ?>
                            </div>
                            <?php }} ?>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <button style="position: fixed; bottom: 28px; right: 48px;font-size:20px;  width: 100px;" type="submit" class="btn btn-success" >Submit</button>
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
    </div>
  </div>
  <?php if($data['fetch']['temuan'] != NULL){ 
                              $modal = 0;
                                    foreach($data['fetch']['temuan'] as $temuan){  
                           $modal++; ?>
                           <div class="modal fade bs-example-modal-lg<?= $modal ?>" tabindex="-1" role="dialog" aria-hidden="true">
                               <div class="modal-dialog modal-lg">
                                 <form action='<?php echo base_url("opd/e/$data[formname]/$data[id_laporan]"); ?>' method="post" data-parsley-validate class="form-horizontal form-label-left">
                                   <div class="modal-content">
                                     <input value="tambah_hasil_temuan" type="hidden" name="nama_tabel">
                                     <input value='<?php echo $temuan['id_temuan']; ?>' type='hidden' name='id_temuan'>
                                     <div class="modal-header">
                                       <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                       </button>
                                       <h4 class="modal-title" id="myModalLabel">Tambah Hasil Temuan</h4>
                                     </div>
                                     <div class="modal-body">
                                       <div class="form-group">
                            <label for="rekomendasi" class="control-label col-md-3 col-sm-3 col-xs-12">rekomendasi</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea id="editor" name="rekomendasi"></textarea>
                            </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="status_rekomendasi" class="control-label col-md-3 col-sm-3 col-xs-12">Status Rekomendasi</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control" name='status_rekomendasi'>
                              <option value="" disabled selected>Pilih Rekom</option>
                                <?php
                                  echo "<option value=''>Kosong</option>";
                                  echo "<option value='TS'>TS</option>";
                                  echo "<option value='TB'>TB</option>";
                                  echo "<option value='TT'>TT</option>";
                                ?>
                              </select>
                            </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="tindak_lanjut" class="control-label col-md-3 col-sm-3 col-xs-12">Tindak Lanjut</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea id="editor" name="tindak_lanjut"></textarea>
                            </div>
                            </div>
                            
                            
                            <div class="form-group">
                            <label for="status_tindak_lanjut" class="control-label col-md-3 col-sm-3 col-xs-12">Status Tindak Lanjut</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <select class="form-control" name='status_tindak_lanjut'>
                                <option value="" disabled selected>Pilih Rekom</option>
                                <?php
                                  echo "<option value=''>Kosong</option>";
                                  echo "<option value='TS'>TS</option>";
                                  echo "<option value='TB'>TB</option>";
                                  echo "<option value='TT'>TT</option>";
                                ?>
                              </select>
                            </div>
                            </div>
                            
                            <div class="form-group">
                            <label for="catatan_bpk" class="control-label col-md-3 col-sm-3 col-xs-12">Catatan BPK</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea id="editor" name="catatan_bpk"></textarea>
                            </div>
                            </div>

                                     </div>
                                     <div class="modal-footer">
                                       <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                       <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Tambah Hasil Temuan</button>
                                     </div>
                                     </div>
                                 </form>
                               </div>
                             </div>
                         <?php }} ?>

<script>
function add_field(){
    var cont = document.getElementById('container-opsi');
    console.log(cont);
    cont.innerHTML = "<div>\
                            <div class='col-md-12 col-sm-12 col-xs-12' style='border: 2px solid black; padding:10px;'>\
                            <div class='form-group'>\
                            <label for='nama_temuan' class='control-label col-md-3 col-sm-3 col-xs-12'>Nama Temuan</label>\
                            <div class='col-md-6 col-sm-6 col-xs-12'>\
                                <input class='form-control col-md-7 col-xs-12' type='text' name='new[nama_temuan][]'  >\
                            </div>\
                            </div>\
                            <div class='form-group'>\
                            <div class='col-md-6 col-sm-6 col-xs-12 col-md-offset-3'>\
                              <button type='button' onclick='delete_node(this)'>Hapus</button>\
                            </div>\
                            </div>\
                            </div></div>\
                      "
                   + cont.innerHTML;
  }
function add_hasil_temuan(node){
  var id = node.parentNode.childNodes[1].value;
    console.log(id);
    node.parentNode.innerHTML = node.parentNode.innerHTML+"<div><div>\
    <input type='hidden' name='id_temuan[]' value='"+id+"'>\
    <div class='form-group'>\
      <label for='rekomendasi' class='control-label col-md-3 col-sm-3 col-xs-12'>Rekomendasi</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
          <input class='form-control col-md-7 col-xs-12' type='text' name='rekomendasi[]'  >\
      </div>\
      </div>\
      \
      <div class='form-group'>\
      <label for='status_rekomendasi' class='control-label col-md-3 col-sm-3 col-xs-12'>Status Rekomendasi</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
        <select class='col-md-6 col-sm-6 col-xs-12' name='status_rekomendasi[]'>\
          <?php
            echo "<option value='TS' >TS</option>";
            echo "<option value='TB' >TB</option>";
            echo "<option value='TT' >TT</option>";
          ?>
        </select>\
      </div>\
      </div>\
      \
      <div class='form-group'>\
      <label for='tindak_lanjut' class='control-label col-md-3 col-sm-3 col-xs-12'>Tindak Lanjut</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
          <input  class='form-control col-md-7 col-xs-12' type='text' name='tindak_lanjut[]'  >\
      </div>\
      </div>\
      \
      <div class='form-group'>\
      <label for='status_tindak_lanjut' class='control-label col-md-3 col-sm-3 col-xs-12'>Status Tindak Lanjut</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
        <select class='col-md-6 col-sm-6 col-xs-12' name='status_tindak_lanjut[]'>\
        <?php
          echo "<option value='TS'>TS</option>";
          echo "<option value='TB'>TB</option>";
          echo "<option value='TT'>TT</option>";
        ?>
        </select>\
      </div>\
      </div>\
      \
      <div class='form-group'>\
      <label for='catatan_bpk' class='control-label col-md-3 col-sm-3 col-xs-12'>Catatan BPK</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
          <input  class='form-control col-md-7 col-xs-12' type='text' name='catatan_bpk[]'  >\
      </div><br/><br/>\
      <div class='form-group'>\
              <div class='col-md-6 col-sm-6 col-xs-12 col-md-offset-3'>\
                <button type='button' onclick='delete_hasil_temuan(this)'>Hapus</button>\
              </div>\
          </div>\
      </div></div></div>";
}

function delete_node(node){
    var cont = document.getElementById('deleted');
    // console.log(node.parentNode.childNodes[1].nodeName);
    var id = node.parentNode.parentNode.parentNode.childNodes[1];
    console.log(node.parentNode.parentNode);
    if(id.nodeName == "INPUT"){
      id = id.value;
      console.log(id);
      cont.innerHTML += "<input type='hidden' value='"+id+"' name='to_del[]'>";
    }
    
    node.parentNode.parentNode.parentNode.parentNode.removeChild(node.parentNode.parentNode.parentNode);
  }

  function delete_hasil_temuan(node){
    node.parentNode.parentNode.parentNode.parentNode.parentNode.removeChild(node.parentNode.parentNode.parentNode.parentNode);
  }

</script>

  <!-- /page content -->