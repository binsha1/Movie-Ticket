<!--Create Modal -->                        
<div class="modal screenModal" >
    <div class="modal-dialog modal-lg">
        <form method='post' action="" name="screen_form" id="screenForm" enctype='multipart/form-data' >
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h2 class="modal-title" id="screen_title"> </h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <!---<h3 class="text-left ">Add Theatre</h3>---->                    
                   <div class="form-group row">                        
                        <div class="col-lg-4">
                            <input type="hidden" name="theatre_id" value="" id="theatre_id">
                            <label class="form-label required control-label pt-3" >Screen Name:</label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Gold Rate:</label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Silver Rate:</label>
                        </div>                             
                        <div class="col-lg-4 ">
                            <input type="text" name="screen_name" class="form-control" id="screen_name" placeholder="Screen Name" value="" required onchange="checkScreen()">
                            <span class="screen_alert text-danger pt-3"></span>
                        </div>
                        <div class="col-lg-4 ">
                            <input type="text" name="gold_rate" class="form-control" id="gold_rate" placeholder="Gold Rate" value="" required onchange="checkGoldRate();">                            
                            <span class="gold_alert text-danger pt-3"></span>
                        </div>
                        <div class="col-lg-4 ">
                            <input type="text" name="silver_rate" class="form-control" placeholder="Silver Rate" id="silver_rate" required onchange="checkSilverRate();" >                            
                            <span class="silver_alert text-danger pt-3"></span>
                        </div>                          
                    </div>                                                                                                            
                </div>                                 
                <!-- Modal footer -->
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" name="submit" value="Save">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>            
            </div>
        </form>
    </div>
</div> 

<!---Screen Modal---->
<!--- Time Modal--->


<!--- Time Modal--->