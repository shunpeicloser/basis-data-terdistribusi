        <!-- footer content -->
        <!-- /footer content -->
        </div>
        </div>

        <!-- jQuery -->
        <script src="<?= base_url('assets/') ?>vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="<?= base_url('assets/') ?>vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="<?= base_url('assets/') ?>vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="<?= base_url('assets/') ?>vendors/nprogress/nprogress.js"></script>
        <!-- Chart.js -->
        <script src="<?= base_url('assets/') ?>vendors/Chart.js/dist/Chart.min.js"></script>
        <!-- gauge.js -->
        <script src="<?= base_url('assets/') ?>vendors/gauge.js/dist/gauge.min.js"></script>
        <!-- bootstrap-progressbar -->
        <script src="<?= base_url('assets/') ?>vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <!-- iCheck -->
        <script src="<?= base_url('assets/') ?>vendors/iCheck/icheck.min.js"></script>
        <!-- Skycons -->
        <script src="<?= base_url('assets/') ?>vendors/skycons/skycons.js"></script>
        <!-- Flot -->
        <script src="<?= base_url('assets/') ?>vendors/Flot/jquery.flot.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/Flot/jquery.flot.pie.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/Flot/jquery.flot.time.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/Flot/jquery.flot.stack.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/Flot/jquery.flot.resize.js"></script>
        <!-- Flot plugins -->
        <script src="<?= base_url('assets/') ?>vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/flot.curvedlines/curvedLines.js"></script>
        <!-- DateJS -->
        <script src="<?= base_url('assets/') ?>vendors/DateJS/build/date.js"></script>
        <!-- JQVMap -->
        <script src="<?= base_url('assets/') ?>vendors/jqvmap/dist/jquery.vmap.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
        <!-- bootstrap-daterangepicker -->
        <script src="<?= base_url('assets/') ?>vendors/moment/min/moment.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- Datatables -->
        <script src="<?= base_url('assets/') ?>vendors/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/jszip/dist/jszip.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/pdfmake/build/pdfmake.min.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/pdfmake/build/vfs_fonts.js"></script>

        <!-- PNotify -->
        <script src="<?= base_url('assets/') ?>vendors/pnotify/dist/pnotify.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/pnotify/dist/pnotify.buttons.js"></script>
        <script src="<?= base_url('assets/') ?>vendors/pnotify/dist/pnotify.nonblock.js"></script>

        <!-- CKeditor -->
        <script src="https://cdn.ckeditor.com/ckeditor5/11.1.1/classic/ckeditor.js"></script>

        <!-- Dropzone.js -->
        <script src="<?= base_url('assets/') ?>vendors/dropzone/dist/min/dropzone.min.js"></script>

        <!-- Custom Theme Scripts -->
        <script src="<?= base_url('assets/') ?>build/js/custom.min.js"></script>
        <script>
                // DOCUMENT READY
                $(document).ready(function() {
                        $('.ui-pnotify').remove();
                });

                // FUNCTION
                $('#rekapdisposisitable').dataTable({
                        "columnDefs": [{
                                "orderable": false,
                                "targets": 8
                        }]
                });
                $('#db').dataTable({});
                $("#success-alert").delay(4000).slideUp(500, function() {
                        $(this).remove();
                });

                $('.collapsed')
                        .css('height', 'auto')
                        .find('.collapse-link i').toggleClass('fa-chevron-up fa-chevron-down').end()
                        .find('.x_content').css('display', 'none');
                Dropzone.options.uploadlamdis = {
                        maxFilesize: 1, // MB
                        acceptedFiles: "application/pdf,application/force-download,application/x-download,binary/octet-stream,image/jpeg,image/pjpeg,image/png,image/x-png",
                        dictFileTooBig: "Ukuran file terlalu besar ({{filesize}}MiB). Batas ukuran file: {{maxFilesize}}MiB.",
                        dictDefaultMessage: "Drag file disini atau klik disini.",
                        dictFallbackMessage: "Browser anda tidak support, silahkan coba browser yang lain.",
                        dictInvalidFileType: "Tipe file tidak dapat untuk diupload.",
                        dictCancelUpload: "Cancel upload",
                        dictCancelUploadConfirmation: "Batalkan upload file?",
                        dictMaxFilesExceeded: "Tidak bisa menambahkan lagi, silahkan refresh dahulu."
                };
        </script>
        <script>
                var allEditors = document.querySelectorAll('#editor');
                for (var i = 0; i < allEditors.length; ++i) {
                        ClassicEditor
                                .create(allEditors[i], {
                                        toolbar: ['heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList']
                                })
                                .catch(error => {
                                        console.error(error);
                                });
                }
        </script>