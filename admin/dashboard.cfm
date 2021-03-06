<cfinclude template="../admin/dash_header.cfm">
<div class="container-fluid">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>                       
    </div>
    <!-- Content Row -->
    <div class="row">        
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card  shadow h-100">
                <div class="card-body admin_dash">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-white  mb-1">
                                Theatres</div>
                            <cfset data=application.theatre.theatreDetails()>
                            <div class="h5 mb-0 font-weight-bold text-white"><cfoutput>#data.RecordCount#
                            </cfoutput></div>
                        </div>
                        <div class="col-auto">
                            <i class="fa-solid fa-building fa-2x text-gray-300"></i>
                        </div>
                    </div>                    
                </div>
                <a href="theatre_list.cfm" class="btn btn-dboard">More Info <i class="fa-solid fa-arrow-right"></i></a>
            </div>
        </div>        
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card  shadow h-100 ">
                <div class="card-body admin_dash">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-white  mb-1">
                                Movies</div>
                                <cfset movie=application.movie.movieDetails()>
                            <div class="h5 mb-0 font-weight-bold text-white"><cfoutput>#movie.RecordCount#
                            </cfoutput></div>
                        </div>
                        <div class="col-auto">
                            <i class="fa-solid fa-film fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
                <a href="movie_list.cfm" class="btn btn-dboard">More Info <i class="fa-solid fa-arrow-right"></i></a>
            </div>
        </div>        
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card  shadow h-100 ">
                <div class="card-body admin_dash">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-white  mb-1">User Registrations
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div class="h5 mb-0 mr-3 font-weight-bold text-white">0</div>
                                </div>                                
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fa-solid fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
                <a href="#" class="btn btn-dboard">More Info <i class="fa-solid fa-arrow-right"></i></a>
            </div>
        </div>        
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card  shadow h-100 ">
                <div class="card-body admin_dash">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-white  mb-1">Movie Bookings
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div class="h5 mb-0 mr-3 font-weight-bold text-white">0</div>
                                </div>                                                
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fa-solid fa-ticket fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
                <a href="#" class="btn btn-dboard">More Info <i class="fa-solid fa-arrow-right"></i></a>
            </div>
        </div>
        <div class="col-lg-6 mb-4 dash_content">                          
        </div>
    </div>
</div>
<cfinclude template="../admin/dash_footer.cfm">