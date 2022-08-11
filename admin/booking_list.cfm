<cfparam  name="status" default="v">
<cfset book_res=application.obj.getAllBookings()>
<cfinclude  template="dash_header.cfm">
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

                    <cfoutput query='book_res'> 
                                      
                        <tr>
                            <td>#user_name#</td>
                            <td>#email_id#</td>
                            <td>#movie_name#</td>
                            <td>#dateFormat(book_date,"dd-mm-yyyy")#</td>
                            <td>#screen_name# |#show_name#| #start_time# </td>
                            <td>#seat_num# Seat| #price#</td>
                            <td>#ticket_id#</td>
                            <td>#theatre_name# : #address#</td>
                        </tr>
                    </cfoutput>         
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

<cfinclude  template="dash_footer.cfm">

		
