<cfparam  name="status" default="v">
<cfparam  name="movie_id" default="v">
<cfparam  name="key" default="v">
<cfset movId=toString(toBinary(movie_id))>
<cfset movie_data=application.movie.getMovie(movId)>
<cfset cast_res=application.movie.castDetails(movId)> 
<cfset crew_res=application.movie.crewDetails(movId)>    
<!---<cfset movie_data=application.movie.movieDetails(theId)>--->
<cfinclude  template="dash_header.cfm">
<div class="container-fluid">    
    <!-- Page Heading -->
    <a href="movie_list.cfm" class="btn btn-outline-primary"><i class="fa-solid fa-arrow-left"></i> Back</a>
    
    <h4 class="h3 mb-2 text-gray-800 text-center">Manage Cast & Crew for <b><cfloop array="#movie_data#" index="i">
        <cfoutput>#i.movie_name#
        </cfoutput>
    </cfloop>   </b></h4>
    <cfif status EQ hash('1','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                 Cast Added Successfully !!
        </div>
    <cfelseif status EQ hash('2','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Crew Added Successfully !!
        </div>
    <cfelseif status EQ hash('3','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               Cast Deleted Successfully !!
        </div>
    <cfelseif status EQ hash('4','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Please fill all required fields !!
        </div>
    <cfelseif status EQ hash('5','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Cast Name Already Exists for the Movie!!
        </div>
    <cfelseif status EQ hash('6','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Please upload a file of size less than 1 MB!!
        </div>    
    <cfelseif status EQ hash('9','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Crew Deleted Successfully
        </div>       
    </cfif>
    <div class="row">
        <div class="col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <cfoutput>
                        <button type="button" class="btn btn-primary theatre_btn cast mb-3 " data-bs-toggle="modal" data-id="0" data-mid="#movId#" data-bs-target=".castModal"  >Add New Cast</button>
                    </cfoutput>
                </div>
                <div class="card-body">                    
                    <div class="table-responsive" id="tableList">
                        <table class="table table-bordered table-striped" id="cast_table" width="100%" cellspacing="0" >
                            <thead>
                                <tr>
                                    <th >Photo</th>
                                    <th >Cast</th>
                                    <th >Actor</th>                                
                                    <th >Delete</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th >Photo</th>
                                    <th >Cast</th>
                                    <th >Actor</th>                                
                                    <th >Delete</th>
                                </tr>
                            </tfoot>                                           
                            <tbody>
                            <cfoutput query='cast_res'>                            
                                <tr>                                    
                                    <td><img src="../uploads/#actor_photo#"class="img-fluid img-poster"></td>
                                    <td>#character_name#</td>
                                    <td>#actor_name#</td>                                   
                                    <td><a href="../components/movie.cfc?method=deleteCast&id=#id#&movie_id=#movId#" class="btn btn-outline-primary">Delete</a></td>
                                </tr>
                            </cfoutput>                   
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <cfoutput>
                        <button type="button" class="btn btn-primary theatre_btn crew mb-3 " data-bs-toggle="modal" data-id="0" data-mid="#movId#" data-bs-target=".crewModal"  >Add New Crew</button>
                    </cfoutput>
                </div>
                <div class="card-body">                    
                    <div class="table-responsive" id="tableList">
                        <table class="table table-bordered table-striped" id="crew_table" width="100%" cellspacing="0" >
                            <thead>
                                <tr>
                                    <th >Photo</th>
                                    <th >Crew Role</th>
                                    <th >Person Name</th>                                
                                    <th >Delete</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th >Photo</th>
                                    <th >Crew Role</th>
                                    <th >Person Name</th>                                
                                    <th >Delete</th>
                                </tr>
                            </tfoot>                                  
                            <tbody>
                            <cfif crew_res.RecordCount NEQ 0>
                                <cfoutput query='crew_res'>
                                    
                                    <tr>
                                        <td><img src="../uploads/#crew_photo#"class="img-fluid img-poster"></td>                                    
                                        <td>#role_name#</td>
                                        <td>#person_name#</td>                                        
                                        <td><a href="../components/movie.cfc?method=deleteCrew&id=#id#&movie_id=#movId#" class="btn btn-outline-primary">Delete</a></td>
                                    </tr>
                                </cfoutput>                    
                            </cfif>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<cfinclude  template="../modals/create_cast.cfm">
<cfinclude  template="../modals/create_crew.cfm">
<cfinclude  template="dash_footer.cfm">