<!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Book My Ticket 2022</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/custom.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../assets/admin_template/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../assets/admin_template/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../assets/admin_template/vendor/chart.js/Chart.min.js"></script>
    <!---<script src="../assets/admin_template/vendor/datatables/jquery.dataTables.min.js"></script>
     <script src="../assets/admin_template/vendor/datatables/jquery-3.5.1.js"></script>--->
     <script src="../assets/admin_template/vendor/tabledata/jquery-3.5.1.js"></script>
     <script src="../assets/admin_template/vendor/tabledata/DataTables-1.12.1/js/jquery.dataTables.min.js"></script>
     <script src="../assets/admin_template/vendor/tabledata/buttons/js/dataTables.buttons.min.js"></script>
    <script src="../assets/admin_template/vendor/tabledata/JSZip-2.5.0/jszip.min.js"></script>
    <script src="../assets/admin_template/vendor/tabledata/pdfmake/pdfmake.min.js"></script>
     <script src="../assets/admin_template/vendor/tabledata/pdfmake/vfs_fonts.js"></script>
    <script src="../assets/admin_template/vendor/tabledata/buttons/js/buttons.html5.min.js"></script>
    <script src="../assets/admin_template/vendor/tabledata/buttons/js/buttons.print.min.js"></script>
    <script src="../assets/admin_template/vendor/tabledata/buttons/js/buttons.colVis.min.js"></script>
    <!----
     <script src="../assets/admin_template/vendor/tabledata/DataTables-1.12/js/dataTables.boostrap.min.js"></script>
     
    
       
   
    
    <script src="../assets/admin_template/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    
    <script src="../assets/admin_template/vendor/tabledata/datatables.min.js"></script>
   <script src="../assets/admin_template/vendor/datatables/datatables.min.js"></script>--->
    <!-- Page level custom scripts -->
    <script src="../assets/admin_template/js/demo/chart-area-demo.js"></script>
    <script src="../assets/admin_template/js/demo/chart-pie-demo.js"></script>
    <script src="../assets/admin_template/js/demo/datatables-demo.js"></script>
    <script>
     document.querySelector('.custom-file-input').addEventListener('change', function (e) {
    var name = document.getElementById("posterInput").files[0].name;
    var nextSibling = e.target.nextElementSibling
    nextSibling.innerText = name
  });
  document.querySelector('.wall-input').addEventListener('change', function (e) {
    var name = document.getElementById("wallInput").files[0].name;
    var nextSibling = e.target.nextElementSibling
    nextSibling.innerText = name
  });
</script>
</body>    

</html>