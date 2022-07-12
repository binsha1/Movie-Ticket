<cfparam  name="status" default="v">
<cfinclude  template="dash_header.cfm">
<cfset res=application.obj.theatreDetails()> 
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Manage Booking</h1>    
    <div class="card shadow mb-4">
        <div class="card-header py-3">            
           <h6 class="font-weight-bold text-dark">All Bookings</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive" id="tableList">
                <table class="table table-bordered table-striped" id="book_table" width="100%" cellspacing="0" >
                    <thead>
                        <tr>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Movie</th>
                            <th>Booking Date</th>
                            <th>Show Time</th>
                            <th>Seats & Amount</th>
                            <th>TicketId</th>
                            <th>Theatre</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Movie</th>
                            <th>Booking Date</th>
                            <th>Show Time</th>
                            <th>Seats & Amount</th>
                            <th>TicketId</th>
                            <th>Theatre</th>
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

		
