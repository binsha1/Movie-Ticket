<!--Create Modal -->                        
<div class="modal confirmModal" >
<form action="components/controller.cfc?method=proceedPayment" method="post">
    <div class="modal-dialog modal-xs">
        <form method='post' action="" name="confirm_form" id="timeForm" enctype='multipart/form-data' >
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h2 class="modal-title" id="time_title">Confirm Seats </h2>
                    
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="text-center text-success">                       
                        <h6 id="confirm_alert" ><h6>  
                        <h6 id='t_price' ></h6>
                        <div class="time_data">
                            <h6 id="time_s" class="text-center text-success">
                            <cfloop array="#show_res#" index="i">
                            <cfoutput>#timeFormat(i.start_time)# (#i.show_name#)</cfoutput>
                            </cfloop></h6>
                        </div>
                    </div>
                    
                        <input type="hidden" name="seats" id="seat_labels" value="">
                        <input type="hidden" name="tprice"  id="tprice" value="">
                        <cfoutput>
                            <cfloop array="#show_res#" index="i">
                                <input type="hidden" name="time_sl"  id="time_sl" value="#i.st_id#">
                                <input type="hidden" name="show_id"  id="show_id" value="#i.id#">
                            </cfloop>
                        </cfoutput>

                                                                                                  
                </div>                                 
                <!-- Modal footer -->
                <div class="modal-footer">
                 <!---<a id="seat_link"><button type="button" class="btn btn-primary" id="proceed_btn" data-bs-dismiss="modal">Proceed</button>
                 </a> --->
                  <input type="submit" class="btn btn-primary" name="submit" value="Proceed" id="proceed_btn" >
                    
                   
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>            
            </div>
       
    </div>
     </form>
</div> 



