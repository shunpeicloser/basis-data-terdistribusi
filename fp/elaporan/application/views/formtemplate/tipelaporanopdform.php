<div class="row">
  <!-- Start to do list -->
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>To Do List <small>Sample tasks</small></h2>
        <div class="clearfix"></div>
      </div>
      <div class="col-md-6 col-sm-6 col-xs-12">

      </div>
      <div class="x_content">
        <form action="<?php echo base_url('admin/submit'); ?>" method="post">
          <input type="hidden" name="tipe_opsi" value="<?php echo $data['tipe_opsi']; ?>">
          <div class="form-group">
            <div class="">
              <select class="form-control" id="opd" name="id_opd" onchange="window.open('<?php echo base_url('admin/f/tipelaporanopdform/'); ?>'+this.value, '_self')">
                <?php
                foreach ($data['opsi_opd'] as $opd) {
                  $selected = '';
                  if ($opd['id_opd'] == $data['selected']) $selected = 'selected=selected';
                  echo "<option value='" . $opd['id_opd'] . "' $selected>" . strtoupper($opd['nama_opd']) . "</option>";
                }
                ?>
              </select>
            </div>
          </div>
          <br>
          <div class="form-group">
            <?php
            foreach ($data['opsi_tipelaporan'] as $opsi_tipe) {
              $flag = '';
              if (isset($data['tipelaporan_on'][$opsi_tipe['id_tipe']])) $flag = "checked";
              echo '<ul class="to_do"><li><p><input type="checkbox" name="id_tipe[]" value="' . $opsi_tipe['id_tipe'] . '" class="flat" $flag> ' . $opsi_tipe['nama_laporan'] . '</p></li></ul>';
            }
            ?>
          </div>
          <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
            <button type="submit" class="btn btn-success">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- End to do list -->
</div>