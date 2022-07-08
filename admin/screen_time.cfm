<cfparam  name="status" default="v">
<cfparam  name="theatre_id" default="v">
<cfparam  name="key" default="v">
<cfset theId=toString(toBinary(theatre_id))>
<cfset theatre_data=application.obj.getTheatreName(theId)>
<cfset screen_data=application.obj.screenDetails(theId)>
<cfset time_data=application.obj.timeDetails(theId)> 
<cfinclude  template="dash_header.cfm">
<div class="container-fluid">    
    <!-- Page Heading -->
    <a href="theatre_list.cfm" class="btn btn-outline-primary"><i class="fa-solid fa-arrow-left"></i> Back</a>
    
    <h4 class="h3 mb-2 text-gray-800 text-center">Manage Screen and Show Time for <b><cfoutput>#theatre_data.theatre_name#
    </cfoutput></b></h4>
    <cfif status EQ hash('1','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                 Added Successfully !!
        </div>
    <cfelseif status EQ hash('2','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Updated Successfully !!
        </div>
    <cfelseif status EQ hash('3','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Deleted Successfully !!
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
                Theatre Updated Successfully !!
        </div> 
    <cfelseif status EQ hash('9','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Screen Time Exists for the show !!
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
                            <cfoutput query='screen_data'>                            
                                <tr>                                    
                                    <td>#screen_name#</td>
                                    <td>#gold_rate#</td>
                                    <td>#silver_rate#</td>                                   
                                    <td><button class="btn btn-outline-primary edit screen" id="edit" data-bs-toggle="modal" data-bs-target=".screenModal" data-id="#id#" data-tid="#theId#" >Edit</button></td>
                                    <td><a href="../components/controller.cfc?method=deleteScreen&id=#id#&theatre_id=#theId#" class="btn btn-outline-primary">Delete</a></td>
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
                            <cfif time_data.RecordCount NEQ 0>
                                <cfoutput query='time_data'>
                                    
                                    <tr>                                    
                                        <td>#show_name#</td>
                                        <td>#screen_name#</td>
                                        <td>#start_time#</td>                                   
                                        <td><button class="btn btn-outline-primary edit s_time" id="s_edit" data-bs-toggle="modal" data-bs-target=".timeModal" data-id="#id#" data-tid="#theId#" >Edit</button></td>
                                        <td><a href="../components/controller.cfc?method=deleteScreenTime&id=#id#&theatre_id=#theId#" class="btn btn-outline-primary">Delete</a></td>
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
<cfinclude  template="../modals/create_screen.cfm">
<cfinclude  template="../modals/create_time.cfm">
<cfinclude  template="dash_footer.cfm">