<cfparam  name="status" default="v">
<cfinclude  template="dash_header.cfm">
<cfset contact_res=application.obj.contactList()>
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Manage Contact Info</h1>    
    <div class="card shadow mb-4">
        <div class="card-header py-3">            
           <h6 class="font-weight-bold text-dark">All Contact Info</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive" id="tableList">
                <table class="table table-bordered table-striped" id="contact_table" width="100%" cellspacing="0" >
                    <thead>
                        <tr>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Subject</th>
                            <th>Message</th>
                            <th>Dated</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Subject</th>
                            <th>Message</th>
                            <th>Dated</th>
                        </tr>
                    </tfoot>                                       
                    <tbody>
                        <cfoutput query='contact_res'>                                    
                            <tr>                            
                                <td>#name#</td>
                                <td>#email_id#</td>
                                <td>#subject#</td>
                                <td>#message#</td>
                                <td>#dateformat(ondate,"dd-mm-yyyy")# #ontime#</td>                                                           
                            </tr>
                        </cfoutput>                   
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<cfinclude  template="dash_footer.cfm">

		
