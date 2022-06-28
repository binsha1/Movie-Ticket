<cfinclude  template="dash_header.cfm">
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Manage Theatre</h1>                    
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark table_links">  
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                    <li class="nav-item" >
                        <a class="nav-link table_nav" href="#">Copy <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link table_nav" href="#">CSV</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link table_nav" href="#">Excel</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link table_nav" href="#">PDF</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link table_nav" href="#">Print</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Column Visibilty</a>
                    </li>
                    </ul>                    
                </div>
            </nav>
            <button type="button" class="btn btn-primary theatre_btn title" data-bs-toggle="modal" data-bs-target=".myModal"  >Add New Theatre</button>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Photo</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>View</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Photo</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>View</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </tfoot>
                    
                    <tbody>
                    
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<cfinclude  template="../modals/create_theatre.cfm">
<cfinclude  template="dash_footer.cfm">