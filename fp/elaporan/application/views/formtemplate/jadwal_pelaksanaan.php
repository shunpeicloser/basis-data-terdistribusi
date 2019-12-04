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
           <h2>Jadwal Pelaksanaan</h2>

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
                       <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Jadwal Pelaksanaan</a>
                       </li>
                       <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Jadwal Pelaksanaan OPD</a>
                       </li>
                       <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Auditor</a>
                       </li>
                     </ul>
                     <div id="myTabContent" class="tab-content">
                       <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                         <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action='<?php echo base_url("opd/e/$data[formname]/$data[id_laporan]"); ?>' method="post">
                           <input value="jadwal_pelaksanaan" type="hidden" name="nama_tabel">
                           <div class="form-group">
                             <label for="tahun" class="control-label col-md-3 col-sm-3 col-xs-12">Tahun</label>
                             <div class="col-md-6 col-sm-6 col-xs-12">
                               <h2><?php echo date('Y', strtotime($data['fetch']['jp']['tgl'])); ?></h2>
                             </div>
                           </div>
                         </form>

                       </div>
                       <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                         <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action='<?php echo base_url("opd/e/$data[formname]/$data[id_laporan]"); ?>' method="post">
                           <input value="jadwal_pelaksanaan_opd" type="hidden" name="nama_tabel">
                           <button type='button' onclick='add_field()'>Tambah</button>

                           <div id='container-opsi'>

                             <?php if ($data['fetch']['jpopd'] != NULL) {
                                foreach ($data['fetch']['jpopd'] as $jpopddata) {
                                  ?>

                                 <div>
                                   <div class="col-md-12 col-sm-12 col-xs-12" style='border: 2px solid black; padding:10px;'>
                                     <input value='<?php echo $jpopddata['id_jadwal_pelaksanaan_opd']; ?>' type='hidden' name='id_jadwal_pelaksanaan_opd[]'>
                                     <div class="form-group">
                                       <label for='opd' class='control-label col-md-3 col-sm-3 col-xs-12'>Nama OPD</label>
                                       <div class="col-md-6 col-sm-6 col-xs-12">
                                         <select class="form-control" name='id_opd[]'>
                                           <?php
                                            foreach ($data['opsi_opd'] as $opd) {
                                              $sel = '';
                                              if ($jpopddata['id_opd'] == $opd['id_opd']) $sel = "selected='selected'";
                                              echo "<option value='$opd[id_opd]' $sel>$opd[nama_opd]</option>";
                                            }
                                            ?>
                                         </select>
                                       </div>
                                       <br />
                                     </div>

                                     <div class="form-group">
                                       <label for="jenis_pengawasan" class="control-label col-md-3 col-sm-3 col-xs-12">Jenis Pengawasan</label>
                                       <div class="col-md-6 col-sm-6 col-xs-12">
                                         <input value='<?php echo $jpopddata['jenis_pengawasan']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="jenis_pengawasan[]">
                                       </div>
                                     </div>

                                     <div class="form-group">
                                       <label for="rmp" class="control-label col-md-3 col-sm-3 col-xs-12">RMP</label>
                                       <div class="col-md-6 col-sm-6 col-xs-12">
                                         <input value='<?php echo $jpopddata['rmp']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="rmp[]">
                                       </div>
                                     </div>

                                     <div class="form-group">
                                       <label for="rpl" class="control-label col-md-3 col-sm-3 col-xs-12">RPL</label>
                                       <div class="col-md-6 col-sm-6 col-xs-12">
                                         <input value='<?php echo $jpopddata['rpl']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="rpl[]">
                                       </div>
                                     </div>

                                     <div class="form-group">
                                       <label for="output_lhp" class="control-label col-md-3 col-sm-3 col-xs-12">Output LHP</label>
                                       <div class="col-md-6 col-sm-6 col-xs-12">
                                         <input value='<?php echo $jpopddata['output_lhp']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="output_lhp[]">
                                       </div>
                                     </div>

                                     <div class="form-group">
                                       <label for="hari_pengawasan" class="control-label col-md-3 col-sm-3 col-xs-12">Hari Pengawasan</label>
                                       <div class="col-md-6 col-sm-6 col-xs-12">
                                         <input value='<?php echo $jpopddata['hari_pengawasan']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="hari_pengawasan[]">
                                       </div>
                                     </div>

                                     <div class="form-group">
                                       <label for="keterangan" class="control-label col-md-3 col-sm-3 col-xs-12">Keterangan</label>
                                       <div class="col-md-6 col-sm-6 col-xs-12">
                                         <input value='<?php echo $jpopddata['keterangan']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="keterangan[]">
                                       </div>
                                     </div>

                                     <div class="form-group">
                                       <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                         <button type='button' onclick='delete_node(this)'>Hapus</button>
                                       </div>
                                     </div>

                                   </div>
                                   <br /><br />
                                 </div>
                               <?php }
                              } ?>
                           </div>

                           <div id='deleted'></div>
                           <div class="ln_solid"></div>
                           <div class="form-group">
                             <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                               <button style="position: fixed; bottom: 28px; right: 48px;font-size:20px;  width: 100px;" type="submit" class="btn btn-success">Submit</button>
                             </div>
                           </div>
                         </form>

                       </div>
                       <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                         <form id="demo-form3" data-parsley-validate class="form-horizontal form-label-left" action='<?php echo base_url("opd/e/$data[formname]/$data[id_laporan]"); ?>' method="post">

                           <input value="auditor" type="hidden" name="nama_tabel">

                           <?php if ($data['fetch']['adata'] != NULL) {
                              $modal = 0;
                              foreach ($data['fetch']['jpopd'] as $auditors) {
                                $modal++; ?>
                               <div class="col-md-12 col-sm-12 col-xs-12" style='border: 2px solid black; padding:10px;'>
                                 <input value='<?php echo $auditors['id_jadwal_pelaksanaan_opd']; ?>' type='hidden' name='id_jadwal_pelaksanaan_opd[]'>
                                 <h2><?php echo $auditors['nama_opd']; ?></h2>
                                 <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg<?= $modal ?>">Tambah Auditor</button>

                                 <?php
                                  $nomor = 0;
                                  foreach ($data['fetch']['adata'][$auditors['id_jadwal_pelaksanaan_opd']] as $auditor) {
                                    ?>
                                   <input value='<?= $auditor['editable'] ?>' type="hidden" name="editable[<?php echo $auditors['id_jadwal_pelaksanaan_opd']; ?>][]">
                                   <div>
                                     <div>
                                       <div class="form-group">
                                         <label for="nama_auditor" class="control-label col-md-3 col-sm-3 col-xs-12">Nama Auditor</label>
                                         <div class="col-md-6 col-sm-6 col-xs-12">
                                           <input value='<?php echo $auditor['nama_auditor']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="nama_auditor[<?php echo $auditors['id_jadwal_pelaksanaan_opd']; ?>][]" <?php if ($auditor['editable'] == '0') echo "readonly='readonly'" ?>>
                                         </div>
                                       </div>
                                       <div class="form-group">
                                         <label for="jabatan" class="control-label col-md-3 col-sm-3 col-xs-12">Jabatan</label>
                                         <div class="col-md-6 col-sm-6 col-xs-12">
                                           <input value='<?php echo $auditor['jabatan']; ?>' class="form-control col-md-7 col-xs-12" type="text" name="jabatan[<?php echo $auditors['id_jadwal_pelaksanaan_opd']; ?>][]" <?php if ($auditor['editable'] == '0') echo "readonly='readonly'" ?>>
                                         </div>
                                       </div>

                                       <div class="form-group">
                                         <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                           <button type='button' onclick='delete_auditor(this)'>Hapus</button>
                                         </div>
                                       </div>



                                     </div>
                                   </div>

                                   <?php $nomor++;
                                  } ?>
                               </div>
                             <?php }
                            } ?>

                           <!-- </div> -->
                           <div class="ln_solid"></div>
                           <div class="form-group">
                             <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                               <button style="position: fixed; bottom: 28px; right: 48px;font-size:20px;  width: 100px;" type="submit" class="btn btn-success">Submit</button>
                             </div>
                           </div>
                         </form>

                         <!-- ini modal form -->
                         <?php if ($data['fetch']['adata'] != NULL) {
                            $modal = 0;
                            foreach ($data['fetch']['jpopd'] as $auditors) {
                              $modal++; ?>
                             <div class="modal fade bs-example-modal-lg<?= $modal ?>" tabindex="-1" role="dialog" aria-hidden="true">
                               <div class="modal-dialog modal-lg">
                                 <form action='<?php echo base_url("opd/e/$data[formname]/$data[id_laporan]"); ?>' method="post" data-parsley-validate class="form-horizontal form-label-left">
                                   <div class="modal-content">
                                     <input value="tambah_auditor" type="hidden" name="nama_tabel">
                                     <input value='<?php echo $auditors['id_jadwal_pelaksanaan_opd']; ?>' type='hidden' name='id_jadwal_pelaksanaan_opd[]'>
                                     <div class="modal-header">
                                       <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                       </button>
                                       <h4 class="modal-title" id="myModalLabel">Tambah Auditor</h4>
                                     </div>
                                     <div class="modal-body">
                                       <div class="form-group">
                                         <label for="select" class="control-label col-md-3 col-sm-3 col-xs-12">Pilih Auditor</label>
                                         <div class="col-md-6 col-sm-6 col-xs-12">
                                           <select name="select_auditor" id="select_auditor" class="form-control col-md-7 col-xs-12" onchange="auditorSelect<?= $modal ?>(event)">
                                             <option value="">Tambah Manual</option>
                                             <?php foreach ($data['fetch']['auditor'] as $key => $au) {
                                                if (isset($au['nip18']) && $au['nip18'] != "1") {
                                                  $val = $au['nama'] . '__' . $au['jabatan'];
                                                  echo '<option value="' . $val . '">' . $au['nama'] . ' - ' . $au['jabatan'] . '</option>';
                                                }
                                              } ?>
                                           </select>
                                         </div>
                                       </div>
                                       <div class="form-group">
                                         <label for="nama_auditor" class="control-label col-md-3 col-sm-3 col-xs-12">Nama Auditor</label>
                                         <div class="col-md-6 col-sm-6 col-xs-12">
                                           <input class="form-control col-md-7 col-xs-12" type="text" name="nama_auditor[<?php echo $auditors['id_jadwal_pelaksanaan_opd']; ?>]" id="nama_<?= $modal ?>">
                                         </div>
                                       </div>
                                       <div class="form-group">
                                         <label for="jabatan" class="control-label col-md-3 col-sm-3 col-xs-12">Jabatan</label>
                                         <div class="col-md-6 col-sm-6 col-xs-12">
                                           <input class="form-control col-md-7 col-xs-12" type="text" name="jabatan[<?php echo $auditors['id_jadwal_pelaksanaan_opd']; ?>]" id="jabatan_<?= $modal ?>">
                                         </div>
                                       </div>

                                     </div>
                                     <div class="modal-footer">
                                       <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                       <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Tambah Auditor</button>
                                     </div>
                                 </form>
                               </div>
                             </div>
                           </div>
                         <?php }
                        } ?>
                     </div>
                     <!-- selesai modal form -->

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

 <script>
   var opd = "</div>\
        <div class='col-md-12 col-sm-12 col-xs-12' style='border: 2px solid black; padding:10px;'>\
        <div class='form-group'>\
        <label for='opd' class='control-label col-md-3 col-sm-3 col-xs-12'>Nama OPD</label>\
        <div class='col-md-6 col-sm-6 col-xs-12'>\
        <select class='form-control' name='new[id_opd][]'>\
      <?php
      foreach ($data['opsi_opd'] as $opd) {
        echo "<option value='$opd[id_opd]'>$opd[nama_opd]</option>";
      }
      ?>\
    </select></div></div>\
    <br/>\
    <div class='form-group'>\
      <label for='jenis_pengawasan' class='control-label col-md-3 col-sm-3 col-xs-12'>Jenis Pengawasan</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
          <input  class='form-control col-md-7 col-xs-12' type='text' name='new[jenis_pengawasan][]'  >\
      </div>\
      </div>\
      <div class='form-group'>\
      <label for='rmp' class='control-label col-md-3 col-sm-3 col-xs-12'>RMP</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
          <input  class='form-control col-md-7 col-xs-12' type='text' name='new[rmp][]'  >\
      </div>\
      </div>\
      <div class='form-group'>\
      <label for='rpl' class='control-label col-md-3 col-sm-3 col-xs-12'>RPL</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
          <input  class='form-control col-md-7 col-xs-12' type='text' name='new[rpl][]'  >\
      </div>\
      </div>\
      <div class='form-group'>\
      <label for='output_lhp' class='control-label col-md-3 col-sm-3 col-xs-12'>Output LHP</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
          <input  class='form-control col-md-7 col-xs-12' type='text' name='new[output_lhp][]'  >\
      </div>\
      </div>\
      <div class='form-group'>\
      <label for='hari_pengawasan' class='control-label col-md-3 col-sm-3 col-xs-12'>Hari Pengawasan</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
          <input  class='form-control col-md-7 col-xs-12' type='text' name='new[hari_pengawasan][]'  >\
      </div>\
      </div>\
      <div class='form-group'>\
      <label for='keterangan' class='control-label col-md-3 col-sm-3 col-xs-12'>Keterangan</label>\
      <div class='col-md-6 col-sm-6 col-xs-12'>\
          <input  class='form-control col-md-7 col-xs-12' type='text' name='new[keterangan][]'  >\
      </div>\
      </div>\
      <div class='form-group'>\
        <div class='col-md-6 col-sm-6 col-xs-12 col-md-offset-3'>\
      <button type='button' onclick='delete_node(this)'>Hapus</button>\
      </div>\
      </div>\
    </div>\
    </div></div>";

   function add_field() {
     var cont = document.getElementById('container-opsi');
     console.log(cont);
     cont.innerHTML = opd + cont.innerHTML;
   }


   function delete_node(node) {
     var cont = document.getElementById('deleted');
     // console.log(node.parentNode.childNodes[1].nodeName);
     var id = node.parentNode.parentNode.parentNode.childNodes[1];
     console.log(node.parentNode.parentNode);
     if (id.nodeName == "INPUT") {
       id = id.value;
       console.log(id);
       cont.innerHTML += "<input type='hidden' value='" + id + "' name='to_del[]'>";
     }

     node.parentNode.parentNode.parentNode.parentNode.removeChild(node.parentNode.parentNode.parentNode);
   }

   function delete_auditor(node) {
     node.parentNode.parentNode.parentNode.parentNode.removeChild(node.parentNode.parentNode.parentNode);
   }

   <?php
    if (isset($modal)) {
      for ($i = 1; $i <= $modal; $i++) {
        echo '
          function auditorSelect' . $i . '(e) { 
            var val = e.target.value;
            var split = val.split("__");
            if (val == "") {
              document.getElementById("nama_' . $i . '").readOnly = false;
              document.getElementById("jabatan_' . $i . '").readOnly = false;
            }else{
              document.getElementById("nama_' . $i . '").value = split[0];
              document.getElementById("nama_' . $i . '").readOnly = true;
              document.getElementById("jabatan_' . $i . '").value = split[1];
              document.getElementById("jabatan_' . $i . '").readOnly = true;
            }
          }';
      }
    }
    ?>

   //  function auditorSelect(e) {
   //    document.getElementById("ajax").value = e.target.value;
   //  }
 </script>

 <!-- /page content -->