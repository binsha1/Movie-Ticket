<cfinclude  template="user_header.cfm">
<cfset book_res=application.obj.getBookings()>
<section class="p-5">
    <div class="container bg-white p-5">
        <h3 class="pb-3" >My Bookings</h3>
        <table class="table table-bordered pt-3">
            <thead>
                <tr>
                    <th>Ticket Id</th>
                    <th>Movie</th>
                    <th>Total Seats</th>
                    <th>Theatre</th>
                    <th>Booking Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <cfif book_res.RecordCount NEQ 0>
                    <cfoutput query="book_res">
                    <tr>
                        <td>#ticket_id#</td>
                        <td>#movie_name#</td>
                        <td>#seat_num#</td>
                        <td>#theatre_name#</td>
                        <td>#dateformat(book_date,"dd-mm-yyyy")#</td>
                        <td>Confirmed</td>
                    </tr>
                    </cfoutput>
                <cfelse>
                    <td colspan="6" class="text-center">No Listings</td>
                </cfif>
            </tbody>
        </table>
    </div>
</section>
<cfinclude  template="user_footer.cfm">

