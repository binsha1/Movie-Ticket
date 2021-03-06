<cfparam  name="status" default="v">
<cfinclude  template="dash_header.cfm">
<cfset theatre_res=application.theatre.getTheatreScreenTime()>
<cfset movie_res=application.movie.movieDetails()>
<cfset show_res=application.show.showDetails()>
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Manage Show</h1>
    <cfif status EQ hash('1','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Show Added Successfully !!
        </div>
    <cfelseif status EQ hash('2','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Show Updated Successfully !!
        </div>
    <cfelseif status EQ hash('3','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Show Time Already exists for the movie and theatre!!
        </div>
    <cfelseif status EQ hash('4','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Please fill all required fields !!
        </div>
    <cfelseif status EQ hash('5','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Show Deleted Successfully!!
        </div>
    <cfelseif status EQ hash('6','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                End Date should not be earlier than release date!!
        </div>    
    </cfif>                    
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">            
            <button type="button" class="btn btn-primary theatre_btn show" data-bs-toggle="modal" data-id="0" data-bs-target=".showModal"  >Add New Show Time</button>
        </div>
        <div class="card-body">
            <div class="table-responsive" id="tableList">
                <table class="table table-bordered table-striped" id="show_table" width="100%" cellspacing="0" >
                    <thead>
                        <tr>
                            <th >Poster</th>
                            <th >Movie Name</th>
                            <th >Theatre</th>
                            <th >Screen</th>
                            <th >Show Time</th>
                            <th >Start Date</th>
                            <th >Starting Time</th>
                            <th >Duration</th>
                            <th >Ending Time</th>
                            <th >Show End Date</th>
                            <th >Show Status</th>
                            <th >Show Priority</th>
                            <th >Update</th>
                            <th >Delete</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th >Poster</th>
                            <th >Movie Name</th>
                            <th >Theatre</th>
                            <th >Screen</th>
                            <th >Show Time</th>
                            <th >Start Date</th>
                            <th >Starting Time</th>
                            <th >Duration</th>
                            <th >Ending Time</th>
                            <th >Show End Date</th>
                            <th >Show Status</th>
                            <th >Show Priority</th>
                            <th >Update</th>
                            <th >Delete</th>
                        </tr>
                    </tfoot>                                       
                    <tbody>
                        <cfoutput query='show_res'>                                            
                            <tr>
                                <td><img src="../uploads/#poster#" class="img-fluid img-poster"></td>                           
                                <td>#movie_name#</td>
                                <td>#theatre_name#</td>
                                <td>#screen_name#</td>
                                <td>#show_name#</td>
                                <td>#dateFormat('#release_date#','dd-mm-yyyy')#</td>
                                <cfset st_time=timeFormat(start_time,'hh:mm:ss tt')>
                                <td>#st_time#</td>
                                <td>#duration#</td>
                                <cfset s_d=listToArray(duration,":")>
                                <cfset hours=s_d[1]*60*60>
                                <cfset min=s_d[2]*60>
                                <cfset sec=s_d[3]>
                                <cfset dtn=hours+min+sec>                            
                                <cfset new_time = timeFormat(DateAdd("s",dtn,start_time),'hh:mm:ss tt')>
                                <td>#new_time#</td>
                                <td>#dateFormat('#end_date#','dd-mm-yyyy')#</td>
                                <cfif dateCompare(end_date, now()) EQ -1>
                                    <td class="bg-danger text-white">Inactive</td>
                                <cfelseif dateCompare(release_date, now()) EQ 1>
                                    <td class="bg-warning"> Pending</td>
                                <cfelseif dateCompare(end_date, now()) EQ 1>
                                    <td class="bg-success text-white ">Active</td>

                                </cfif>
                                <!---<td>#show_status#</td>---->
                                <td>#priority#</td>
                                <td><button class="btn btn-outline-primary edit show" id="edit" data-bs-toggle="modal" data-bs-target=".showModal" data-id="#id#" >Edit</button></td>
                                <td><a href="../components/show.cfc?method=deleteShow&id=#id#" class="btn btn-outline-primary">Delete</a></td>
                            </tr>
                        </cfoutput>                
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<cfinclude  template="../modals/create_show.cfm">
<cfinclude  template="dash_footer.cfm">

		

