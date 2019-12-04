<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2><?= $data['title'] ?></h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <?php
                $logs_root = './application/logs/';
                if ($handle = opendir($logs_root)) {

                    while (false !== ($entry = readdir($handle))) {

                        if ($entry != "." && $entry != ".." && $entry != "index.html") {
                            $filepath = $logs_root . $entry;
                            echo '<a href="' . base_url('admin/querylog/' . $entry) . '">' . $entry . '</a><br>';
                        }
                    }

                    closedir($handle);
                } ?>
            </div>
        </div>
    </div>
</div>