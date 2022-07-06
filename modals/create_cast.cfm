<!--Create Modal -->                        
<div class="modal castModal" >
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
                            <input type="hidden" name="movie_id" value="" id="movie_id">
                            <label class="form-label required control-label pt-3" >Character Name:</label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Actor Name:</label>
                        </div>
                        <div class="col-lg-4">
                            <label class="form-label required control-label pt-3" >Actor Photo:</label>
                        </div>                             
                        <div class="col-lg-4 ">
                            <input type="text" name="character_name" class="form-control" id="character_name" placeholder="Character Name" value="" required onchange="checkScreen()">
                            <span class="screen_alert text-danger pt-3"></span>
                        </div>
                        <div class="col-lg-4 ">
                            <input type="text" name="actor_name" class="form-control" id="actor_name" placeholder="Actor Name" value="" required onchange="checkGoldRate();">                            
                            <span class="gold_alert text-danger pt-3"></span>
                        </div>
                        <div class="col-lg-4 ">
                            <input type="file" name="actor_photo" class="form-control"  id="actor_photo" required onchange="checkSilverRate();" >                            
                            <span class="silver_alert text-danger pt-3"></span>
                        </div>                          
                    </div>                                                                                                            
                </div>                                 
                <!-- Modal footer -->
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" name="submit" value="Save" id="screen_btn" onclick="validateCreate();">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>            
            </div>
        </form>
    </div>
</div> 

<!---Screen Modal---->
<!--- Time Modal--->


<!--- Time Modal--->