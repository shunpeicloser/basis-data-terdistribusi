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
          <h2>Reset Password</h2>
       
          <div class="clearfix"></div>
        </div>
        <div class="x_content">
          <br />
          <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action='<?php echo base_url('admin/submit'); ?>' method="post">
            <input type='hidden' name='tipe_opsi' value='<?php echo $data['tipe_opsi'] ?>'>
            <div class="form-group">
              <label for="username" class="control-label col-md-3 col-sm-3 col-xs-12">Username</label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <select id="user" name="id" >
                  <?php
                    foreach($data['opsi_user'] as $user){
                      echo "<option value='" . $user['id'] . "'>" . strtoupper($user['username']) . "</option>";
                    }
                  ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label for="password" class="control-label col-md-3 col-sm-3 col-xs-12">Password</label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input id="password" class="form-control col-md-7 col-xs-12" type="password" name="password" required="required">
              </div>
            </div>
            <div class="ln_solid"></div>
            <div class="form-group">
              <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                <button type="submit" class="btn btn-success">Submit</button>
              </div>
            </div>

          </form>
        </div>
      </div>
    </div>
  </div>



  <!-- /page content -->