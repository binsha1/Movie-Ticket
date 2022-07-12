<cfparam  name="status" default="v">
<cfinclude  template="dash_header.cfm">
<cfset res=application.obj.theatreDetails()> 
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Manage Users</h1>
    <cfif status EQ hash('1','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Theatre Added Successfully !!
        </div>
    <cfelseif status EQ hash('2','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Email Already Exists !!
        </div>
    <cfelseif status EQ hash('3','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Phone Number Already Exists !!
        </div>
    <cfelseif status EQ hash('4','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Please fill all required fields !!
        </div>
    <cfelseif status EQ hash('5','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Theatre Deleted Successfully!!
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
    </cfif>                    
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">            
           <h6 class="font-weight-bold text-dark">All Users</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive" id="tableList">
                <table class="table table-bordered table-striped" id="user_table" width="100%" cellspacing="0" >
                    <thead>
                        <tr>
                            <th >User Name</th>
                            <th >Email</th>
                            <th >Registered On</th>
                            <th >Delete</th>
                            
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th >User Name</th>
                            <th >Email</th>
                            <th >Registered On</th>
                            <th >Delete</th>
                        </tr>
                    </tfoot>                                       
                    <tbody>
                    <!---<cfoutput query='res'>
                        <cfset addr=address & ", " & street_name & ", " & pincode &" .">                        
                        <cfset local.theatre_id=toBase64(id)>
                        <tr>
                            <td><img src="../uploads/#photo#" class="img-fluid img-poster"></td>
                            <td>#theatre_name#</td>
                            <td>#email_id#</td>
                            <td>#phone#</td>
                            <td>#addr#</td>
                            <td><a href="screen_time.cfm?theatre_id=#local.theatre_id#" class="btn btn-outline-primary">Manage Screen & Time</a></td>
                            <td><button class="btn btn-outline-primary edit title" id="edit" data-bs-toggle="modal" data-bs-target=".myModal" data-id="#id#" >Edit</button></td>
                            <td><a href="../components/controller.cfc?method=deleteTheatre&id=#id#" class="btn btn-outline-primary">Delete</a></td>
                        </tr>
                    </cfoutput>   --->                 
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

<cfinclude  template="dash_footer.cfm">

		
