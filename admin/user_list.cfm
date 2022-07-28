<cfparam  name="status" default="v">
<cfinclude  template="dash_header.cfm">
<cfset user_res=application.obj.allUsers()>
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Manage Users</h1>
    <cfif status EQ hash('1','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                User Deleted Successfully !!
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
                    <cfoutput query='user_res'>                        
                        <tr>
                            <td>#user_name#</td>
                            <td>#email_id#</td>
                            <td>#registered_on#</td>
                            <td><a href="../components/controller.cfc?method=deleteUser&id=#id#" class="btn btn-outline-primary">Delete</a></td>
                        </tr>
                    </cfoutput>              
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<cfinclude  template="dash_footer.cfm">

		
