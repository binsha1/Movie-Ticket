<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Admin Dashboard</title>
    <!-- Custom fonts for this template-->
    <link href="../assets/admin_template/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../assets/fontawesome/css/all.css">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" >
    <link href="../assets/css/jquery-ui.css" rel="stylesheet" >
    <link rel="stylesheet" href="../assets/css/style.css">
    <!-- Custom styles for this template-->
    <!---<link href="../assets/admin_template/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">--->
    <link href="../assets/admin_template/vendor/tabledata/DataTables-1.12.1/css/jquery.dataTables.min.css" rel="stylesheet">
    <!---<link href="../assets/admin_template/vendor/tabledata/DataTable/css/datatables.css" rel="stylesheet">
    <link href="../assets/admin_template/vendor/tabledata/DataTable/css/datatables.min.css" rel="stylesheet">--->
    <link href="../assets/admin_template/vendor/tabledata/buttons/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="../assets/admin_template/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - Brand -->
            <!---<h3 class="text-white py-3">Book My Ticket</h3>--->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="dashboard.cfm">
                <div class="sidebar-brand-icon ">
                    <i class="fa-solid fa-film"></i>
                </div>
                <div class="sidebar-brand-text mx-3 book_heading">BookMyTicket</div>
            </a>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="dashboard.cfm">
                    <i class="fa-solid fa-grid"></i>
                    <span>Admin Dashboard</span></a>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">         
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="theatre_list.cfm" >
                    <i class="fa-solid fa-building"></i>
                    <span>Manage Theatres</span>
                </a>                
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="movie_list.cfm"  >
                    <i class="fa-solid fa-film"></i>
                    <span>Manage Movies</span>
                </a>                
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="show_list.cfm" >
                    <i class="fa-solid fa-video"></i>
                    <span>Manage Shows</span>
                </a>                
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="user_list.cfm"  >
                    <i class="fa-solid fa-users"></i>
                    <span>Manage Users</span>
                </a>                
            </li> 
            <li class="nav-item">
                <a class="nav-link collapsed" href="booking_list.cfm"  >
                    <i class="fa-solid fa-ticket"></i>
                    <span>Manage Bookings</span>
                </a>                
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="contact_list.cfm" >
                   <i class="fa-solid fa-address-card"></i>
                    <span>View Contact Info</span>
                </a>                
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="update_password.cfm">
                    <i class="fa-solid fa-key"></i>
                    <span>Update Password</span>
                </a>                
            </li>           
            <!-- Divider -->
            <hr class="sidebar-divider">
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!-- End of Sidebar -->
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <!-- Topbar Search -->
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>                     
                        <div class="topbar-divider d-none d-sm-block"></div>
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a href="../components/controller.cfc?method=doAdminLogout" class="btn btn-light">Logout <i class="fa-solid fa-right-from-bracket"></i></a>
                        </li>
                    </ul>
                </nav>              
            </div>
            <!-- End of Main Content -->
