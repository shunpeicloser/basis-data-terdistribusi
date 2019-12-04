<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
  <div class="menu_section">
    <ul class="nav side-menu">
      <li><a><i class="fa fa-home"></i> Laporan <span class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
          <?php
          if ($data['sidebar'] !=  NULL) {
            foreach ($data['sidebar'] as $type) {
              echo "<li><a href='" . base_url() . "opd/f/$type[kode_tipe]'>$type[nama_laporan]</a></li>";
            }
          } else {
            echo "Tidak ada tipe laporan yang dimiliki.<br/> Hubungi Admin.";
          }
          ?>
        </ul>
      </li>
      <!-- <li><a href="<?php echo base_url('opd/riwayatlaporan') ?>"><i class="fa fa-edit"></i> Riwayat laporan </a>
      </li>
      <li><a><i class="fa fa-envelope-square"></i>Disposisi<span class="fa fa-chevron-down"></span></a>
        <ul class="nav child_menu">
          <li><a href="<?= base_url('opd/show_disposisi') ?>"><i class="fa fa-plus"></i>Input</a></li>
          <li><a href="<?= base_url('opd/rekap_disposisi') ?>"><i class="fa fa-navicon"></i>Rekap Disposisi</a></li>
          <li><a href="<?= base_url('opd/show_lampiran_disposisi') ?>"><i class="fa fa-image"></i>Lampiran Disposisi</a></li>
        </ul>
      </li> -->
    </ul>
  </div>


</div>