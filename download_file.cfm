<cfparam  name="id" default="0">
<cfset ticket_res=application.obj.getBookDetails(id)>
<cfoutput query="ticket_res">
    <section class="container text-dark">
        <div class="order-container">
            <div class="order pt-3">
                <img class="order__images" alt='' src="assets/user_template/images/logo.jpg">
                <p class="order__title text-white">Thank you <br><span class="order__descript">you have successfully purchased tickets</span></p>
            </div>
            <cfdocument  format="pdf" filename="ticket.pdf" overwrite="Yes">
                <div class="ticket">
                    <div class="ticket-position bg-white">
                        <div class="ticket__indecator indecator--pre"><div class="indecator-text pre--text">online ticket</div> </div>
                            <div class="ticket__inner">
                                <div class="ticket-secondary">
                                    <h1 class="text-center text-uppercase">#theatre_name#</h1>
                                    <p class="ticket__item">Ticket number : <strong class="ticket__number">#ticket_id#</strong></p>
                                    <p class="ticket__item ">Show date: <strong>#dateFormat(select_date,"full")#</strong></p>
                                    <p class="ticket__item ">Show Time: <strong>#timeFormat(start_time)#</strong></p>
                                    <p class="ticket__item">Language: <strong><span class="ticket__hall">#language#-#movie_format#</strong></span></p>
                                    <p class="ticket__item">Screen: <strong><span class="ticket__hall">#screen_name#</strong></span></p>
                                    <p class="ticket__item ">Price: <strong class="ticket__cost">Rs #price#</strong></p>
                                </div>
                                <div class="ticket-primery">
                                    <span class="ticket__item ticket__item--primery ticket__film">Movie: <strong class="ticket__movie">#movie_name#</strong></span>
                                    <p class="ticket__item ticket__item--primery">Seats:<strong> <span class="ticket__place">#seats#</span></strong></p>
                                    <p class="ticket__item ">Number of Tickets: <strong> <span class="ticket__place">#seat_num#</span></strong></p>
                                    <p class="ticket__item ">Printed On:  <strong><span class="ticket__place">#dateFormat(book_date)# #timeformat(book_time,"hh:mm:ss ")#</span></strong></p>
                                    <h3>Confirmed</h3>
                                </div>
                            </div>                       
                        </div>
                    </div>
                </div>
            </cfdocument>
            <cfheader name="Content-Disposition" value="attachment;filename=ticket.pdf">
            <cfcontent type="application/octet-stream" file="#expandPath('.')#\ticket.pdf" deletefile="Yes">
        </div>
<<<<<<< HEAD

=======
<<<<<<< HEAD
=======

>>>>>>> c9ce06c53972e8969fa44048facbc5f308484a78
>>>>>>> ca26044de6296187d7ed7381a77c5f7ad804b358
    </section>
</cfoutput>
<cfinclude  template="user_footer.cfm">