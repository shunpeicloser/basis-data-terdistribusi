<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
  <div class="menu_section">
    <ul class="nav side-menu">
      <!-- <li><a href="<?php echo base_url('admin/riwayatlaporan') ?>"><i class="fa fa-edit"></i> Riwayat laporan </a></li> -->
      <li><a><i class="fa fa-database"></i> Database <span class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
          <li><a href="<?= base_url('database/opd') ?>">OPD</a></li>
          <li><a href="<?= base_url('database/user') ?>">User</a></li>
          <li><a href="<?= base_url('database/opdtipe') ?>">Tipe OPD</a></li>
        </ul>
      </li>
      <li><a><i class="fa fa-search"></i> Query Log <span class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
          <li><a href="<?= base_url('database/cudlog') ?>"> Query Log</a></li>
        </ul>
      </li>
    </ul>
  </div>


</div>