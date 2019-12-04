<?php $this->load->view('template/header_admin') ?>

<body class="nav-md">
  <div class="container body">
    <div class="main_container">
      <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
          <div class="navbar nav_title" style="border: 0;">
            <a href="<?= base_url('home') ?>" class="site_title"></i><img src="<?= base_url('assets/production/images/icon.png') ?>" style="width:35px;"><span> E-Laporan</span></a>
          </div>

          <div class="clearfix"></div>

          <!-- menu profile quick info -->
          <div class="profile clearfix">
            <!-- <div class="profile_pic">
              <img src="<?= base_url('assets/') ?>production/images/img.jpg" alt="..." class="img-circle profile_img">
            </div> -->
          </div>
          <!-- /menu profile quick info -->

          <br />

          <!-- sidebar menu -->
          <?php $this->load->view('template/sidebar_opd') ?>
          <!-- /sidebar menu -->


        </div>
      </div>

      <!-- top navigation -->
      <div class="top_nav">
        <div class="nav_menu">
          <nav>
            <div class="nav toggle">
              <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
              <li class="">
                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                  <img src="<?= base_url('assets/') ?>production/images/img.jpg" alt=""><?= strtoupper($data['user']['nama_opd']); ?>
                  <span class=" fa fa-angle-down"></span>
                </a>
                <ul class="dropdown-menu dropdown-usermenu pull-right">
                  <li><a href="<?= base_url('auth/logout') ?>"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                </ul>
              </li>
            </ul>
          </nav>
        </div>
      </div>
      <!-- /top navigation -->

      <!-- page content -->
      <div class="right_col" role="main">
        <div class="col-md-12 col-sm-12 col-xs-12">
          <?= $this->session->flashdata('message'); ?>
        </div>
        <?php if (isset($data['contents'])) {
          require $data['contents'];
        } ?>
      </div>
      <!-- /page content -->

      <?php $this->load->view('template/footer_admin') ?>

</body>

</html>