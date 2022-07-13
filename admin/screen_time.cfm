<cfparam  name="status" default="v">
<cfparam  name="theatre_id" default="v">
<cfset theId=toString(toBinary(theatre_id))>
<cfset theatre_data=application.theatre.getTheatreName(theId)>
<cfset screen_data=application.theatre.screenDetails(theId)>
<cfset time_data=application.theatre.timeDetails(theId)> 
<cfinclude  template="dash_header.cfm">
<div class="container-fluid">    
    <!-- Page Heading -->
    <a href="theatre_list.cfm" class="btn btn-outline-primary"><i class="fa-solid fa-arrow-left"></i> Back</a>    
    <h5 class=" mb-2 text-gray-800 text-center pb-3">Manage Screen and Show Time for <b><cfoutput>#theatre_data.theatre_name#
    </cfoutput></b>Theatre</h5>
    <cfif status EQ hash('1','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Screen Added Successfully !!
        </div>
    <cfelseif status EQ hash('2','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               Screen Updated Successfully !!
        </div>
    <cfelseif status EQ hash('3','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Screen Deleted Successfully !!
        </div>
    <cfelseif status EQ hash('4','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Please fill all required fields !!
        </div>
    <cfelseif status EQ hash('5','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Screen Name Already Exists!!
        </div>
    <cfelseif status EQ hash('6','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Please upload a file of size less than 1 MB!!
        </div>
    <cfelseif status EQ hash('7','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Screen Time Added Successfully !!
        </div>
    <cfelseif status EQ hash('8','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Screen Time Updated Successfully !!
        </div> 
    <cfelseif status EQ hash('9','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Screen Time Exists for the show !!
        </div>
    <cfelseif status EQ hash('10','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Screen Time Deleted Successfully !!
        </div>        
    </cfif>
    <div class="row">
        <div class="col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <cfoutput>
                        <button type="button" class="btn btn-primary theatre_btn screen mb-3 " data-bs-toggle="modal" data-id="0" data-tid="#theId#" data-bs-target=".screenModal"  >Add New Screen</button>
                    </cfoutput>
                </div>
                <div class="card-body">                    
                    <div class="table-responsive" id="tableList">
                        <table class="table table-bordered table-striped" id="screen_table" width="100%" cellspacing="0" >
                            <thead>
                                <tr>
                                    <th >Screen Name</th>
                                    <th >Gold Ticket</th>
                                    <th >Silver Ticket</th>                                
                                    <th >Update</th>
                                    <th >Delete</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th >Screen Name</th>
                                    <th >Gold Ticket</th>
                                    <th >Silver Ticket</th>                                
                                    <th >Update</th>
                                    <th >Delete</th>
                                </tr>
                            </tfoot>                                             
                            <tbody>
                                <cfoutput>                           
                                    <cfloop array='#screen_data#' index="i">                        
                                        <tr>                                    
                                            <td>#i.screen_name#</td>
                                            <td>#i.gold_rate#</td>
                                            <td>#i.silver_rate#</td>                                   
                                            <td><button class="btn btn-outline-primary edit screen" id="edit" data-bs-toggle="modal" data-bs-target=".screenModal" data-id="#i.id#" data-tid="#theId#" >Edit</button></td>
                                            <td><a href="../components/theatre.cfc?method=deleteScreen&id=#i.id#&theatre_id=#theId#" class="btn btn-outline-primary">Delete</a></td>
                                        </tr>
                                    </cfloop>
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
                        <button type="button" class="btn btn-primary theatre_btn s_time mb-3 " data-bs-toggle="modal" data-id="0" data-tid="#theId#" data-bs-target=".timeModal"  >Add New ShowTime</button>
                    </cfoutput>
                </div>
                <div class="card-body">                    
                    <div class="table-responsive" id="tableList">
                        <table class="table table-bordered table-striped" id="show_time_table" width="100%" cellspacing="0" >
                            <thead>
                                <tr>
                                    <th >Show  Name</th>
                                    <th >Screen Name</th>
                                    <th >Start Time</th>                                
                                    <th >Update</th>
                                    <th >Delete</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th >Show  Name</th>
                                    <th >Screen Name</th>
                                    <th >Start Time</th>                                
                                    <th >Update</th>
                                    <th >Delete</th>
                                </tr>
                            </tfoot>                                     
                            <tbody>
                                <cfif ArrayLen(time_data) NEQ 0>
                                    <cfoutput >
                                        <cfloop array="#time_data#" index="i">   
                                            <tr>                                    
                                                <td>#i.show_name#</td>
                                                <td>#i.screen_name#</td>
                                                <td>#i.start_time#</td>                                   
                                                <td><button class="btn btn-outline-primary edit s_time" id="s_edit" data-bs-toggle="modal" data-bs-target=".timeModal" data-id="#i.id#" data-tid="#theId#" >Edit</button></td>
                                                <td><a href="../components/theatre.cfc?method=deleteScreenTime&id=#i.id#&theatre_id=#theId#" class="btn btn-outline-primary">Delete</a></td>
                                            </tr>
                                        </cfloop>
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
<cfinclude  template="../modals/create_screen.cfm">
<cfinclude  template="../modals/create_time.cfm">
<cfinclude  template="dash_footer.cfm">